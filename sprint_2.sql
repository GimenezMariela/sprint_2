#2.1 Lista los paises que estan generando ventas
select distinct(c.country) 
from company c left join transaction t
on c.id = t.company_id;

#2.2 Desde cuántos paisos se generan las ventas
select count(c.country)
from company c left join transaction t
on c.id = t.company_id;

#2.3 Identifica la compañia con la mediana mas grande de ventas 
select c.company_name, avg(t.amount) as mediana_ventas
from company c left join transaction t 
on c.id = t.company_id
group by c.company_name
#having avg(t.amount);
order by mediana_ventas desc
limit 1;

#Ejercicio 3 

#Utiliza solo subconsultas(sin utilizar join) 
#Muestra todas las transacciones realizadas por empresas de Alemania                
select * 
from transaction t
where t.company_id in (select c.id from company c where c.id = t.company_id and c.country like "Germany"); 

#Lista las empresas que han realizar transacciones por una cantidad superior a la mediana de todas las transacciones 
select avg(t.amount)
from transaction t
where t.company_id in (select c.id from company c where c.id = t.company_id)
group by t.amount
order by t.amount desc 
;
# Eliminaran del sistema las empresas que no tienen transacciones registradas, entrega el listado de aquellas empresas
select t.declined
from transaction t 
where t.company_id in (select c.id from company c where c.id = t.company_id)
and t.declined = "0"
;

select c.company_name 
from company c
where c.id in (select t.company_id from transaction t where c.id = t.company_id 
and t.declined = "0");

#NIVEL 2
#EJERCICIO 1

#Identifica los cincos dias que se va a generar la cantidad mas grande de ingresos a la empresa por ventas.
#Muestra los datos de cada transaccion juntamente con el total de las ventas. 
select *#, sum(t.amount) as total_ingresos
from company c left join transaction t
on c.id = t.company_id
#group by t.timestamp
#order by total_ingresos Desc
;
