/*creacion de todas las vistas*/

create view v_clients_accounts as select c.id as id_cliente,c.first_name as nombre,c.last_name as apellido,c.email,a.account_no as cuenta,a.balance as saldo 
from clients as c left join accounts as a  
on c.id = a.client_id;

create view v_accounts_types as select a.account_no as cuenta, c.id as id_cliente, act.name as tipo_cuenta
from clients as c right join accounts as a  
on c.id = a.client_id inner join account_types as act on a.type = act.id ;

create view v_transactions_detail as select t.id as transaccion,t.amount as monto,tt.name as tipo_de_transaccion
from transactions as t left join transactions_types as tt  
on t.transaction_type = tt.id;

create view v_transations_types_detail as select t.id as transaccion,t.amount as monto,tt.name as tipo_de_transaccion
from transactions as t right join transactions_types as tt  
on t.transaction_type = tt.id;


select * from v_clients_accounts;
select * from v_accounts_types;
select * from v_transactions_detail;
select * from v_transations_types_detail;