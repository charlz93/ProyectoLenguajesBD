create or replace view v_clientes
as
select c.id_cliente Id_Cliente, c.nombre Nombre, c.nombre_comercial Nombre_Comercial, c.nif Cedula, c.correo Correo, c.telefono Telefono, d.pais Pais, d.provincia Provincia
,d.ciudad Ciudad,d.descripcion Descripcion from cliente c left join direccion d
on c.id_cliente = d.id_cliente;

