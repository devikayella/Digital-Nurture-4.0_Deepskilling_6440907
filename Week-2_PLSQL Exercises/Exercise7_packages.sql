-- Exercise 7: Packages
-- Includes three packages:
-- 1. CustomerManagement
-- 2. EmployeeManagement
-- 3. AccountOperations

-- PACKAGE 1: CustomerManagement

-- Package Specification
CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER);
    PROCEDURE UpdateCustomerDetails(p_id NUMBER, p_name VARCHAR2);
    FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER;
END CustomerManagement;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER) IS
    BEGIN
        INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
        VALUES (p_id, p_name, p_dob, p_balance, SYSDATE);
        COMMIT;
    END;

    PROCEDURE UpdateCustomerDetails(p_id NUMBER, p_name VARCHAR2) IS
    BEGIN
        UPDATE Customers
        SET Name = p_name, LastModified = SYSDATE
        WHERE CustomerID = p_id;
        COMMIT;
    END;

    FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_id;
        RETURN v_balance;
    END;

END CustomerManagement;
/


-- PACKAGE 2: EmployeeManagement

-- Package Specification
CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hiredate DATE);
    PROCEDURE UpdateEmployeeDetails(p_id NUMBER, p_salary NUMBER);
    FUNCTION CalculateAnnualSalary(p_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hiredate DATE) IS
    BEGIN
        INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
        VALUES (p_id, p_name, p_position, p_salary, p_dept, p_hiredate);
        COMMIT;
    END;

    PROCEDURE UpdateEmployeeDetails(p_id NUMBER, p_salary NUMBER) IS
    BEGIN
        UPDATE Employees
        SET Salary = p_salary
        WHERE EmployeeID = p_id;
        COMMIT;
    END;

    FUNCTION CalculateAnnualSalary(p_id NUMBER) RETURN NUMBER IS
        v_salary NUMBER;
    BEGIN
        SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_id;
        RETURN v_salary * 12;
    END;

END EmployeeManagement;
/


-- PACKAGE 3: AccountOperations

-- Package Specification
CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(p_id NUMBER, p_cust_id NUMBER, p_type VARCHAR2, p_balance NUMBER);
    PROCEDURE CloseAccount(p_id NUMBER);
    FUNCTION GetTotalBalance(p_cust_id NUMBER) RETURN NUMBER;
END AccountOperations;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    PROCEDURE OpenAccount(p_id NUMBER, p_cust_id NUMBER, p_type VARCHAR2, p_balance NUMBER) IS
    BEGIN
        INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
        VALUES (p_id, p_cust_id, p_type, p_balance, SYSDATE);
        COMMIT;
    END;

    PROCEDURE CloseAccount(p_id NUMBER) IS
    BEGIN
        DELETE FROM Accounts WHERE AccountID = p_id;
        COMMIT;
    END;

    FUNCTION GetTotalBalance(p_cust_id NUMBER) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_total FROM Accounts WHERE CustomerID = p_cust_id;
        RETURN v_total;
    END;

END AccountOperations;
/
-- Output test for CustomerManagement
BEGIN
    CustomerManagement.AddCustomer(201, 'Swetha', TO_DATE('1990-08-08', 'YYYY-MM-DD'), 12000);
    DBMS_OUTPUT.PUT_LINE('Customer Balance: ₹' || CustomerManagement.GetCustomerBalance(201));
END;
/

--  Output test for EmployeeManagement
BEGIN
    EmployeeManagement.HireEmployee(21, 'Suresh', 'Tester', 40000, 'QA', SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Annual Salary: ₹' || EmployeeManagement.CalculateAnnualSalary(21));
END;
/

--  Output test for AccountOperations
BEGIN
    AccountOperations.OpenAccount(7001, 201, 'Checking', 15000);
    DBMS_OUTPUT.PUT_LINE('Total Balance: ₹' || AccountOperations.GetTotalBalance(201));
END;
/
