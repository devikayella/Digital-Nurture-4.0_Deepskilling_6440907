-- Exercise 3: Stored Procedures

-- 3.1: ProcessMonthlyInterest – Apply 1% interest to savings accounts

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR acc IN (SELECT AccountID, Balance FROM Accounts WHERE AccountType = 'Savings') LOOP
        UPDATE Accounts
        SET Balance = Balance + (acc.Balance * 0.01),
            LastModified = SYSDATE
        WHERE AccountID = acc.AccountID;

        DBMS_OUTPUT.PUT_LINE('3.1 → Interest added to Account ID: ' || acc.AccountID);
    END LOOP;

    COMMIT;
END;
/


-- 3.2: UpdateEmployeeBonus – Add bonus to all employees in given department

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_dept IN VARCHAR2,
    p_bonus_percent IN NUMBER
) IS
BEGIN
    FOR emp IN (SELECT EmployeeID, Salary FROM Employees WHERE Department = p_dept) LOOP
        UPDATE Employees
        SET Salary = Salary + (emp.Salary * p_bonus_percent / 100),
            HireDate = HireDate 
        WHERE EmployeeID = emp.EmployeeID;

        DBMS_OUTPUT.PUT_LINE('3.2 → Bonus added to Employee ID: ' || emp.EmployeeID);
    END LOOP;

    COMMIT;
END;
/


-- 3.3: TransferFunds – Move funds between accounts (with balance check)

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_acc IN NUMBER,
    p_to_acc IN NUMBER,
    p_amount IN NUMBER
) IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_from_acc;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20010, 'Insufficient funds in source account.');
    END IF;

    UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_acc;
    UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_acc;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('3.3 → Transferred ₹' || p_amount || ' from Account ' || p_from_acc || ' to ' || p_to_acc);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('3.3 → Error: ' || SQLERRM);
END;
/

-- Test 3.1: Monthly Interest
BEGIN
    ProcessMonthlyInterest;
END;
/

-- Test 3.2: Add 10% Bonus to HR Department
BEGIN
    UpdateEmployeeBonus('HR', 10);
END;
/

-- Test 3.3: Transfer ₹300 from Account 1 to Account 2
BEGIN
    TransferFunds(1, 2, 300);
END;
/
