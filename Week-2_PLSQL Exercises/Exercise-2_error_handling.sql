-- Exercise 2: Error Handling

-- 2.1: Safe Fund Transfer Between Two Accounts

CREATE OR REPLACE PROCEDURE SafeTransferFunds(
    p_from_acc IN NUMBER,
    p_to_acc IN NUMBER,
    p_amount IN NUMBER
) AS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_from_acc;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in source account.');
    END IF;

    UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_acc;
    UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_acc;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('2.1 → Funds transferred successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('2.1 → Transfer failed: ' || SQLERRM);
END;
/


-- 2.2: Update Salary With Employee ID Check

CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_emp_id IN NUMBER,
    p_percent IN NUMBER
) AS
    v_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_exists FROM Employees WHERE EmployeeID = p_emp_id;

    IF v_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found.');
    END IF;

    UPDATE Employees
    SET Salary = Salary + (Salary * p_percent / 100)
    WHERE EmployeeID = p_emp_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('2.2 → Salary updated for Employee ID: ' || p_emp_id);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('2.2 → Salary update failed: ' || SQLERRM);
END;
/

-- 2.3: Add New Customer With Duplicate ID Handling
CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
) AS
BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_id, p_name, p_dob, p_balance, SYSDATE);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('2.3 → Customer added successfully: ' || p_name);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('2.3 → Error: Customer ID ' || p_id || ' already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('2.3 → Error: ' || SQLERRM);
END;
/


-- Testing Scenario 2.1
BEGIN
    SafeTransferFunds(1, 2, 500);
END;
/

-- Testing Scenario 2.2
BEGIN
    UpdateSalary(1, 10);
END;
/

-- Testing Scenario 2.3
BEGIN
    AddNewCustomer(2, 'Meena Shah', TO_DATE('1992-12-12', 'YYYY-MM-DD'), 2500);
END;
/

