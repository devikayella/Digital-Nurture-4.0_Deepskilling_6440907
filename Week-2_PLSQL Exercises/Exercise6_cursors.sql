-- Exercise 6: Cursors
-
-- 6.1: GenerateMonthlyStatements
-- Print all transactions for the current month, grouped by customer

DECLARE
    CURSOR txn_cursor IS
        SELECT C.CustomerID, C.Name, T.TransactionDate, T.Amount, T.TransactionType
        FROM Customers C
        JOIN Accounts A ON C.CustomerID = A.CustomerID
        JOIN Transactions T ON A.AccountID = T.AccountID
        WHERE EXTRACT(MONTH FROM T.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM T.TransactionDate) = EXTRACT(YEAR FROM SYSDATE)
        ORDER BY C.CustomerID;

    v_row txn_cursor%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('6.1 → Monthly Transaction Statements:');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');

    OPEN txn_cursor;
    LOOP
        FETCH txn_cursor INTO v_row;
        EXIT WHEN txn_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_row.Name || 
                             ' | Date: ' || TO_CHAR(v_row.TransactionDate, 'YYYY-MM-DD') ||
                             ' | ₹' || v_row.Amount || 
                             ' | Type: ' || v_row.TransactionType);
    END LOOP;
    CLOSE txn_cursor;
END;
/


-- 6.2: ApplyAnnualFee
-- Deduct annual fee (₹200) from all accounts
DECLARE
    CURSOR acc_cursor IS
        SELECT AccountID, Balance FROM Accounts;

    v_acc acc_cursor%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('6.2 → Deducting annual fee of ₹200 from each account');

    OPEN acc_cursor;
    LOOP
        FETCH acc_cursor INTO v_acc;
        EXIT WHEN acc_cursor%NOTFOUND;

        UPDATE Accounts
        SET Balance = Balance - 200,
            LastModified = SYSDATE
        WHERE AccountID = v_acc.AccountID;

        DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_acc.AccountID || ' → ₹200 deducted');
    END LOOP;
    CLOSE acc_cursor;

    COMMIT;
END;
/


-- 6.3: UpdateLoanInterestRates
-- Increase interest rate by 0.5% if rate < 7%, else 0.25%

DECLARE
    CURSOR loan_cursor IS
        SELECT LoanID, InterestRate FROM Loans;

    v_loan loan_cursor%ROWTYPE;
    v_new_rate NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('6.3 → Updating Loan Interest Rates');

    OPEN loan_cursor;
    LOOP
        FETCH loan_cursor INTO v_loan;
        EXIT WHEN loan_cursor%NOTFOUND;

        IF v_loan.InterestRate < 7 THEN
            v_new_rate := v_loan.InterestRate + 0.5;
        ELSE
            v_new_rate := v_loan.InterestRate + 0.25;
        END IF;

        UPDATE Loans
        SET InterestRate = v_new_rate
        WHERE LoanID = v_loan.LoanID;

        DBMS_OUTPUT.PUT_LINE('Loan ID: ' || v_loan.LoanID || ' → New Interest Rate: ' || v_new_rate);
    END LOOP;
    CLOSE loan_cursor;

    COMMIT;
END;
/
