create or replace PROCEDURE print_company_profile  
(comp_id NUMBER)
IS
cmp company%ROWTYPE;
CURSOR cur IS SELECT * FROM managements 
INNER JOIN users_ ON users_.id_ = managements.user_ 
WHERE managements.company = comp_id;

BEGIN
  SELECT * 
  INTO cmp
  FROM company
  WHERE id_ = comp_id;
  
  DBMS_OUTPUT.PUT_LINE(cmp.name_);
  DBMS_OUTPUT.PUT_LINE(cmp.city);
  DBMS_OUTPUT.PUT_LINE(cmp.industry);
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Management:');
  
  FOR man IN cur LOOP
    DBMS_OUTPUT.PUT_LINE(man.position_ || ': ' || man.first_name || ' ' || man.last_name);
  END LOOP;

  
END print_company_profile;