create table cliente(id_cliente number, nombre varchar2(50),correo varchar2(50), telefono number, nif varchar2(50),nombre_comercial varchar2(50));

create table direccion(id_direccion number, ciudad varchar2(30), provincia varchar2(30), pais varchar2(30), descripcion varchar2(100), id_cliente number);

create table factura_cab(id_factura number,tipo varchar2(2), id_cliente number, metodo_pago varchar2(10),total number(5,2),total_impuesto number(5,2),fecha date,hora date,id_vendedor number, impuesto number(5,2), referencia);

create table vendedor(id_vendedor number, nombre varchar2(50), usuario varchar2(20) not null unique, contrasenna varchar2(40) not null,max_descuento number);

create table factura_lin(id number, id_factura number, tipo varchar2(2), num_lin number, id_producto number,cantidad number, precio number, descuento number, id_almacen number);

create table producto(id_producto number, nombre varchar2(50), descripcion varchar2(60), tipo varchar2(50), precio number(5,2),impueto number(5,2));

create table almacen(id_almacen number, descripcion varchar2(30),direccion varchar(40));

create table stock(id_producto number, id_stock number, cantidad number, id_almacen number);

alter table cliente add constraint pk_cliente primary key (id_cliente);

alter table direccion add constraint pk_direccion primary key (id_direccion);

alter table factura_cab add constraint pk_factura_cab primary key (id_factura,tipo);

alter table vendedor add constraint pk_vendedor primary key (id_vendedor);

alter table factura_lin add constraint pk_factura_lin primary key(id);

alter table producto add constraint pk_producto primary key (id_producto);

alter table almacen add constraint pk_almacen primary key (id_almacen);

alter table stock add constraint pk_stock primary key (id_stock);

alter table direccion add constraint fk_cliente_direccion foreign key (id_cliente) references cliente(id_cliente);

alter table factura_cab add constraint fk_cliente_factura foreign key (id_cliente) references cliente(id_cliente);

alter table factura_cab add constraint fk_factura_vendedor foreign key (id_vendedor) references vendedor(id_vendedor);

alter table factura_lin add constraint fk_cab_lin foreign key (id_factura,tipo) references factura_cab(id_factura,tipo);

alter table factura_lin add constraint fk_factura_lin_producto foreign key (id_producto) references producto(id_producto);

alter table stock add constraint fk_stock_producto foreign key (id_producto) references producto(id_producto);