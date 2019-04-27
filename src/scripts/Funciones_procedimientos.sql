create or replace function iniciosesion(v_usuario in varchar2, pass in varchar2, nombre out varchar2, id_v out number)
return char
is
v_nombre vendedor.nombre%TYPE;
v_id vendedor.id_vendedor%TYPE;
cursor c1 is
SELECT nombre,id_vendedor FROM vendedor where usuario = v_usuario and contrasenna = pass;

begin
    open c1;
    FETCH c1 INTO v_nombre,v_id;
    if(c1%notfound) then
    RETURN 'F';
    else
    nombre := v_nombre;
    id_v := v_id;
    RETURN 'T';
    end if; 
end;

create or replace package factura as
    procedure Abonar(id_fac in number,id_ven in number);
    procedure Anular(id_fac in number,id_ven in number);
end factura;

create or replace package body factura as
    procedure Abonar(id_fac in number, id_ven in number) is
    begin
        insert into factura_cab(id_factura,tipo,id_cliente,metodo_pago,total,total_impuesto,fecha,hora,id_vendedor,impuesto,referencia)
        select SEQ_NOTA_CREDITO.nextval, 'NC', id_cliente,metodo_pago,(total*-1), (total_impuesto*-1), to_char(sysdate,'DD-MM-YYYY'),to_char(sysdate,'HH:MM:SS'),id_ven,impuesto,id_fac
        from factura_cab
        where id_factura = id_fac;
        
        insert into factura_lin(id_factura_lin,id_factura,num_lin,id_producto,cantidad,precio,descuento,id_almacen,tipo)
        select null, id_fac,num_lin,id_producto,(cantidad*-1),(precio*-1),descuento,id_almacen,'NC'
        from factura_lin
        where id_factura = id_fac;
    end;
    procedure anular(id_fac in number,id_ven in number ) is
    begin
        insert into factura_cab(id_factura,tipo,id_cliente,metodo_pago,total,total_impuesto,fecha,hora,id_vendedor,impuesto,referencia)
        select SEQ_FACT_COMPRA.nextval, 'CA', id_cliente,metodo_pago,(total*-1), (total_impuesto*-1), to_char(sysdate,'DD-MM-YYYY'),to_char(sysdate,'HH:MM:SS'),id_ven,impuesto,id_fac
        from factura_cab
        where id_factura = id_fac;
        
        insert into factura_lin(id_factura_lin,id_factura,num_lin,id_producto,cantidad,precio,descuento,id_almacen,tipo)
        select null, SEQ_FACT_COMPRA.CURRVAL,num_lin,id_producto,(cantidad*-1),(precio*-1),descuento,id_almacen,'CA'
        from factura_lin
        where id_factura = id_fac;
    end;
end factura;


create or replace procedure sp_stock(id_producto in number) is
id_a almacen.id_almacen%TYPE;
Cursor c1 is 
    select id_almacen from proyecto.almacen;
begin
    OPEN c1;
    loop
    FETCH c1 INTO id_a;
    INSERT into stock(id_stock,id_producto,cantidad,id_almacen) values (null,id_producto,0,id_a);
    
    exit when c1%notfound;
    end loop;
    close c1;
end;    
