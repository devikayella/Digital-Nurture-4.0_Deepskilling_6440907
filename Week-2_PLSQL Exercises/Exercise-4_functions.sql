-- Exercise 4: Functions

-- 4.1: CalculateAge – Return age in years from DOB

CREATE OR REPLACE FUNCTION CalculateAge(
    p_dob IN DATE
) RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);
    RETURN v_age;
END;
/
-- Test 4.1
BEGIN
    DBMS_OUTPUT.PUT_LINE('4.1 → Age: ' || CalculateAge(TO_DATE('1995-04-10', 'YYYY-MM-DD')));
END;
/


-- 4.2: CalculateMonthlyInstallment – Compute EMI from loan amount, rate, duration

CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_amount IN NUMBER,
    p_rate IN NUMBER,
    p_years IN NUMBER
) RETURN NUMBER IS
    v_monthly_rate NUMBER := p_rate / (12 * 100);
    v_months NUMBER := p_years * 12;
    v_emi NUMBER;
BEGIN
    v_emi := (p_amount * v_monthly_rate) / (1 - POWER(1 + v_monthly_rate, -v_months));
    RETURN ROUND(v_emi, 2);
END;
/
-- Test 4.2
BEGIN
    DBMS_OUTPUT.PUT_LINE('4.2 → EMI: ₹' || CalculateMonthlyInstallment(100000, 10, 5));
END;
/


-- 4.3: HasSufficientBalance – Return TRUE if account has enough balance

CREATE OR REPLACE FUNCTION HasSufficientBalance(
    p_account_id IN NUMBER,
    p_amount IN NUMBER
) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_account_id;

    IF v_balance >= p_amount THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/
-- Test 4.3
DECLARE
    result BOOLEAN;
BEGIN
    result := HasSufficientBalance(1, 500);
    IF result THEN
        DBMS_OUTPUT.PUT_LINE('4.3 → Sufficient balance.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('4.3 → Insufficient balance.');
    END IF;
END;
/


