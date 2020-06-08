create or replace PROCEDURE print_profile
(user_id NUMBER)
IS
usr users_%ROWTYPE;
CURSOR cur IS SELECT * FROM experience WHERE user_ = user_id;
number_of_connections NUMBER;

BEGIN
  SELECT *
  INTO usr
  FROM users_
  WHERE id_ = user_id;
  
  DBMS_OUTPUT.PUT_LINE(usr.first_name);
  DBMS_OUTPUT.PUT_LINE(usr.last_name);
  DBMS_OUTPUT.PUT_LINE(usr.email);
  DBMS_OUTPUT.PUT_LINE(usr.website);
  DBMS_OUTPUT.PUT_LINE('');
  
  FOR exp_ IN cur LOOP
    IF exp_.end_ = NULL THEN
        DBMS_OUTPUT.PUT_LINE(exp_.position_ || ' at ' || exp_.company || ' (' ||
        exp_.start_ || ' - now)');
    ELSE
        DBMS_OUTPUT.PUT_LINE(exp_.position_ || ' at ' || exp_.company || ' (' ||
        exp_.start_ || ' - ' || exp_.end_ || ' )');
    END IF;
  END LOOP;
  
  SELECT COUNT(*)
  INTO number_of_connections
  FROM connections
  WHERE user1 = user_id OR user2 = user_id;
  
  DBMS_OUTPUT.PUT_LINE('Connections: ' || number_of_connections);
    
  
END print_profile;