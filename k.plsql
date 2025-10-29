set serveroutput on;
create table bank(id int,money Number);
insert into bank values (1,200.20);
create or replace procedure send is
money Number :=100;
balance Number ;
begin
select money into balance from bank where id=1;
balance:=balance-money;
update bank
set money=balance
where id=1;
commit;
end;
/
create or replace procedure deposit is
money Number :=100;
balance Number ;
begin
select money into balance from bank where id=1;
balance:=balance+money;
update bank
set money=balance
where id=1;
commit;
end;
/
declare
money Number;
begin
select money into money from bank;
dbms_output.put_line('Before Performing tasks money :'||money);
deposit;
select money into money from bank;
dbms_output.put_line('After Performing Deposit tasks money:'||money);
send;
select money into money from bank;
dbms_output.put_line('After Performing Sending tasks money :'||money);
end;
/
