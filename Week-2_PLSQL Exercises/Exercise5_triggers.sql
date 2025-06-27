
-- Exercise 5: Triggers
-- Setup: Create AuditLog Table for Scenario 5.2

CREATE TABLE AuditLog (
    LogID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ActionType VARCHAR2(20),
    AccountID NUMBER,
    Amount NUMBER,
    TransactionType VARCHAR2(10),
    LoggedAt DATE DEFAULT SYSDATE
);
/


-- 5.1: UpdateCustomerLastModified Trigger
-- Update LastModified column whenever a customer's record is updated

CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

-- 5.2: LogTransaction Trigger
-- Logs new transactions into AuditLog table

CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (ActionType, AccountID, Amount, TransactionType)
    VALUES ('INSERT', :NEW.AccountID, :NEW.Amount, :NEW.TransactionType);
END;
/


-- 5.3: CheckTransactionRules Trigger
-- Prevents negative deposits or overdraft withdrawals

CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    -- Get current balance for the account
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = :NEW.AccountID;

    IF :NEW.TransactionType = 'Withdrawal' AND :NEW.Amount > v_balance THEN
        RAISE_APPLICATION_ERROR(-20020, 'Withdrawal exceeds available balance.');
    ELSIF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20021, 'Deposit amount must be greater than zero.');
    END IF;
END;
/


--  Test 5.1: Update customer to trigger LastModified change
UPDATE Customers SET Name = 'Updated Name' WHERE CustomerID = 1;

-- Test 5.2: Insert a transaction to trigger audit log
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (3, 1, SYSDATE, 1000, 'Deposit');

-- Test 5.3: Insert withdrawal exceeding balance → should throw error
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (4, 1, SYSDATE, 999999, 'Withdrawal'); -- Exceeds balance

-- View logs
SELECT * FROM AuditLog;


