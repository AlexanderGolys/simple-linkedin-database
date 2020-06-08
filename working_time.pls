CREATE OR REPLACE FUNCTION working_time
RETURN INT
IS
diff INT;
sum_ INT;
CURSOR cur IS SELECT * FROM users_;
BEGIN
sum_ := 0;
FOR usr IN cur LOOP
    SELECT SUM(NVL(end_, CURRENT_DATE) - start_)
    INTO diff
    FROM experience
    WHERE user_ = usr.id_;
    
    sum_ := sum_ + NVL(diff, 0);
    
    IF usr.id_ != 100 THEN
    DBMS_OUTPUT.PUT_LINE('User ' || usr.first_name || ' ' || usr.last_name || ' has worked for ' || diff || ' days.');
    END IF;
END LOOP;
RETURN sum_;
END working_time;

