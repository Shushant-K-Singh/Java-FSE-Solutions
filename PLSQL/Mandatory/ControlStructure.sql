
CREATE TABLE Customers(
    Customer_iD NUMBER PRIMARY KEY,
    Name VARCHAR(50),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR(5) DEFAULT 'FALSE'
);

CREATE TABLE Loans(
    Loan_iD NUMBER PRIMARY KEY,
    Customer_iD NUMBER,
    InterestRate NUMBER(5,2),
    Due_date DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(Customer_iD)
);

INSERT INTO customers(customer_id, Name, age, balance, is_vip)
VALUES (1, 'Rajesh', 65, 5000, 'FALSE'),
       (2, 'Priya', 45, 12000, 'FALSE'),
       (3, 'Amit', 70, 8000, 'FALSE'),
       (4, 'Sneha', 30, 15000, 'FALSE'),
       (5, 'Vikram', 55, 3000, 'FALSE');

INSERT INTO loans(loan_id, customer_id, interest_rate, due_date)
VALUES (101, 1, 8.5, DATE '2026-07-10'),
       (102, 2, 9.0, DATE '2026-08-15'),
       (103, 3, 7.5, DATE '2026-07-05'),
       (104, 4, 10.0, DATE '2026-09-20'),
       (105, 5, 8.0, DATE '2026-06-25');

COMMIT;

DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, age FROM customers;
    
    customer_id NUMBER;
    age NUMBER;
    current_rate NUMBER;
    new_rate NUMBER;
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        customer_id := customer_rec.customer_id;
        age := customer_rec.age;
        
        IF age > 60 THEN
            SELECT interest_rate INTO current_rate
            FROM loans
            WHERE customer_id = customer_id;
            
            new_rate := current_rate - 1;
            
            UPDATE loans
            SET interest_rate = new_rate
            WHERE customer_id = customer_id;
            
            DBMS_OUTPUT.PUT_LINE('Discount applied for customer ID: ' || customer_id || 
                               ', Age: ' || age || 
                               ', Old Rate: ' || current_rate || 
                               ', New Rate: ' || new_rate);
        END IF;
    END LOOP;
    
    COMMIT;
END;
/



DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, balance FROM customers;
    
    customer_id NUMBER;
    balance NUMBER;
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        customer_id := customer_rec.customer_id;
        balance := customer_rec.balance;
        
        IF balance > 10000 THEN
            UPDATE customers
            SET is_vip = 'TRUE'
            WHERE customer_id = customer_id;
            
            DBMS_OUTPUT.PUT_LINE('VIP status assigned for customer ID: ' || customer_id || 
                               ', Balance: ' || balance);
        END IF;
    END LOOP;
    
    COMMIT;
END;
/




DECLARE
    CURSOR loan_cursor IS
        SELECT loan_id, customer_id, due_date, loan_amount
        FROM loans
        WHERE due_date <= ADD_MONTHS(SYSDATE, 1)
        AND due_date >= SYSDATE
        ORDER BY due_date;
    
    loan_id NUMBER;
    customer_id NUMBER;
    due_date DATE;
    loan_amount NUMBER;
    customer_name VARCHAR2(100);
BEGIN
    FOR loan_rec IN loan_cursor LOOP
        loan_id := loan_rec.loan_id;
        customer_id := loan_rec.customer_id;
        due_date := loan_rec.due_date;
        loan_amount := loan_rec.loan_amount;
        
        SELECT first_name || ' ' || last_name INTO customer_name
        FROM customers
        WHERE customer_id = customer_id;
        
        DBMS_OUTPUT.PUT_LINE('========================================');
        DBMS_OUTPUT.PUT_LINE('LOAN REMINDER');
        DBMS_OUTPUT.PUT_LINE('========================================');
        DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_name);
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_id);
        DBMS_OUTPUT.PUT_LINE('Loan ID: ' || loan_id);
        DBMS_OUTPUT.PUT_LINE('Loan Amount: $' || loan_amount);
        DBMS_OUTPUT.PUT_LINE('Due Date: ' || TO_CHAR(due_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Please pay your loan before the due date!');
        DBMS_OUTPUT.PUT_LINE('========================================');
    END LOOP;
END;
/



-- =====================================================
-- STEP 1: Create Tables
-- =====================================================

-- Customers Table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    age NUMBER,
    balance NUMBER,
    is_vip VARCHAR2(5) DEFAULT 'FALSE',
    email VARCHAR2(100)
);

-- Loans Table
CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    loan_amount NUMBER,
    interest_rate NUMBER,
    due_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =====================================================
-- STEP 2: Insert ALL Data in ONE Go (Multi-Row Insert)
-- =====================================================

INSERT ALL INTO customers (customer_id, first_name, last_name, age, balance, is_vip, email)
VALUES (1, 'Rajesh', 'Kumar', 65, 5000, 'FALSE', 'rajesh@example.com')
INTO customers (customer_id, first_name, last_name, age, balance, is_vip, email)
VALUES (2, 'Priya', 'Sharma', 45, 12000, 'FALSE', 'priya@example.com')
INTO customers (customer_id, first_name, last_name, age, balance, is_vip, email)
VALUES (3, 'Amit', 'Patel', 70, 8000, 'FALSE', 'amit@example.com')
INTO customers (customer_id, first_name, last_name, age, balance, is_vip, email)
VALUES (4, 'Sneha', 'Reddy', 30, 15000, 'FALSE', 'sneha@example.com')
INTO customers (customer_id, first_name, last_name, age, balance, is_vip, email)
VALUES (5, 'Vikram', 'Singh', 55, 3000, 'FALSE', 'vikram@example.com');

INSERT ALL INTO loans (loan_id, customer_id, loan_amount, interest_rate, due_date)
VALUES (101, 1, 50000, 8.5, DATE '2026-07-10')
INTO loans (loan_id, customer_id, loan_amount, interest_rate, due_date)
VALUES (102, 2, 100000, 9.0, DATE '2026-08-15')
INTO loans (loan_id, customer_id, loan_amount, interest_rate, due_date)
VALUES (103, 3, 75000, 7.5, DATE '2026-07-05')
INTO loans (loan_id, customer_id, loan_amount, interest_rate, due_date)
VALUES (104, 4, 200000, 10.0, DATE '2026-09-20')
INTO loans (loan_id, customer_id, loan_amount, interest_rate, due_date)
VALUES (105, 5, 30000, 8.0, DATE '2026-06-25');

COMMIT;

-- =====================================================
-- SCENARIO 1: Discount for customers above 60 years old (1% discount)
-- =====================================================

DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, age FROM customers;
    
    customer_id NUMBER;
    age NUMBER;
    current_rate NUMBER;
    new_rate NUMBER;
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        customer_id := customer_rec.customer_id;
        age := customer_rec.age;
        
        IF age > 60 THEN
            SELECT interest_rate INTO current_rate
            FROM loans
            WHERE customer_id = customer_id;
            
            new_rate := current_rate - 1;
            
            UPDATE loans
            SET interest_rate = new_rate
            WHERE customer_id = customer_id;
            
            DBMS_OUTPUT.PUT_LINE('Discount applied for customer ID: ' || customer_id || 
                               ', Age: ' || age || 
                               ', Old Rate: ' || current_rate || 
                               ', New Rate: ' || new_rate);
        END IF;
    END LOOP;
    
    COMMIT;
END;
/

-- =====================================================
-- SCENARIO 2: Promote customers to VIP if balance > $10,000
-- =====================================================

DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, balance FROM customers;
    
    customer_id NUMBER;
    balance NUMBER;
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        customer_id := customer_rec.customer_id;
        balance := customer_rec.balance;
        
        IF balance > 10000 THEN
            UPDATE customers
            SET is_vip = 'TRUE'
            WHERE customer_id = customer_id;
            
            DBMS_OUTPUT.PUT_LINE('VIP status assigned for customer ID: ' || customer_id || 
                               ', Balance: ' || balance);
        END IF;
    END LOOP;
    
    COMMIT;
END;
/

-- =====================================================
-- SCENARIO 3: Send reminders for loans due within next 30 days
-- =====================================================

DECLARE
    CURSOR loan_cursor IS
        SELECT loan_id, customer_id, due_date, loan_amount
        FROM loans
        WHERE due_date <= ADD_MONTHS(SYSDATE, 1)
        AND due_date >= SYSDATE
        ORDER BY due_date;
    
    loan_id NUMBER;
    customer_id NUMBER;
    due_date DATE;
    loan_amount NUMBER;
    customer_name VARCHAR2(100);
BEGIN
    FOR loan_rec IN loan_cursor LOOP
        loan_id := loan_rec.loan_id;
        customer_id := loan_rec.customer_id;
        due_date := loan_rec.due_date;
        loan_amount := loan_rec.loan_amount;
        
        SELECT first_name || ' ' || last_name INTO customer_name
        FROM customers
        WHERE customer_id = customer_id;
        
        DBMS_OUTPUT.PUT_LINE('========================================');
        DBMS_OUTPUT.PUT_LINE('LOAN REMINDER');
        DBMS_OUTPUT.PUT_LINE('========================================');
        DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_name);
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_id);
        DBMS_OUTPUT.PUT_LINE('Loan ID: ' || loan_id);
        DBMS_OUTPUT.PUT_LINE('Loan Amount: $' || loan_amount);
        DBMS_OUTPUT.PUT_LINE('Due Date: ' || TO_CHAR(due_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Please pay your loan before the due date!');
        DBMS_OUTPUT.PUT_LINE('========================================');
    END LOOP;
END;
/

-- =====================================================
-- Verify Results
-- =====================================================

-- Check updated interest rates (Scenario 1)
SELECT c.customer_id, c.first_name, c.age, l.loan_id, l.interest_rate 
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
WHERE c.age > 60;

-- Check VIP status (Scenario 2)
SELECT customer_id, first_name, last_name, balance, is_vip 
FROM customers 
ORDER BY is_vip DESC;

-- Check loans due within 30 days (Scenario 3)
SELECT l.loan_id, c.first_name, c.last_name, l.due_date, l.loan_amount
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
WHERE l.due_date <= ADD_MONTHS(SYSDATE, 1)
AND l.due_date >= SYSDATE
ORDER BY l.due_date;