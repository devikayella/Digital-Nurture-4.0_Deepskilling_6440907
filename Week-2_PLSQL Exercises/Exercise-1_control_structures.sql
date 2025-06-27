
-- Exercise 1: Control Structures
-- 1.1 Apply 1% discount to loan interest rate for customers over age 60
BEGIN
    FOR loan_rec IN (
        SELECT L.LoanID, L.InterestRate, C.DOB
        FROM Loans L
        JOIN Customers C ON L.CustomerID = C.CustomerID
    ) LOOP
        DECLARE
            v_age NUMBER;
            v_new_rate NUMBER;
        BEGIN
            v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, loan_rec.DOB) / 12);
            
            IF v_age > 60 THEN
                v_new_rate := loan_rec.InterestRate - (loan_rec.InterestRate * 0.01);

                UPDATE Loans
                SET InterestRate = v_new_rate
                WHERE LoanID = loan_rec.LoanID;

                DBMS_OUTPUT.PUT_LINE('1.1 → Interest rate updated for customer age ' || v_age || ', Loan ID: ' || loan_rec.LoanID);
            END IF;
        END;
    END LOOP;

    COMMIT;
END;
/

-- 1.2 Set IsVIP = 'TRUE' for customers with Balance > ₹10,000


BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE Customers ADD (IsVIP VARCHAR2(5))';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Now update IsVIP based on balance
BEGIN
    FOR cust IN (SELECT CustomerID, Balance FROM Customers) LOOP
        IF cust.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE',
                LastModified = SYSDATE
            WHERE CustomerID = cust.CustomerID;

            DBMS_OUTPUT.PUT_LINE('1.2 → VIP Assigned: Customer ID ' || cust.CustomerID);
        ELSE
            UPDATE Customers
            SET IsVIP = 'FALSE',
                LastModified = SYSDATE
            WHERE CustomerID = cust.CustomerID;

            DBMS_OUTPUT.PUT_LINE('1.2 → Not VIP: Customer ID ' || cust.CustomerID);
        END IF;
    END LOOP;

    COMMIT;
END;
/

-- 1.3 Reminder for Loans Due in the Next 30 Days
BEGIN
    FOR due_loan IN (
        SELECT L.LoanID, L.EndDate, C.Name
        FROM Loans L
        JOIN Customers C ON L.CustomerID = C.CustomerID
        WHERE L.EndDate BETWEEN SYSDATE AND (SYSDATE + 30)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('1.3 → Reminder: Loan for ' || due_loan.Name || ' (Loan ID: ' || due_loan.LoanID || ') is due on ' || TO_CHAR(due_loan.EndDate, 'YYYY-MM-DD'));
    END LOOP;
END;
/
