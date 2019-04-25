CREATE SEQUENCE vendedor_seq
 START WITH     2
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 create or replace trigger insert_pk_vendedor
 BEFORE insert on vendedor
 for each row
    when (new.id_vendedor is null)
begin
 :new.id_vendedor := vendedor_seq.nextval;
 end;
 
CREATE SEQUENCE almacen_seq
 START WITH     2
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_almacen
 BEFORE insert on almacen
 for each row
    when (new.id_almacen is null)
begin
 :new.id_almacen := ALMACEN_SEQ.nextval;
 end;
 
 CREATE SEQUENCE cliente_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_cliente
 BEFORE insert on cliente
 for each row
    when (new.id_cliente is null)
begin
 :new.id_cliente := cliente_SEQ.nextval;
 end;
 
 CREATE SEQUENCE direccion_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_direccion
 BEFORE insert on direccion
 for each row
    when (new.id_direccion is null)
begin
 :new.id_direccion := direccion_SEQ.nextval;
 end;
 
 CREATE SEQUENCE factura_cab_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_factura_cab
 BEFORE insert on factura_cab
 for each row
    when (new.id_factura is null)
begin
 :new.id_factura := factura_cab_SEQ.nextval;
 end;
 
 CREATE SEQUENCE factura_lin_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_factura_lin
 BEFORE insert on factura_lin
 for each row
    when (new.id_factura_lin is null)
begin
 :new.id_factura_lin := factura_lin_SEQ.nextval;
 end;
 
CREATE SEQUENCE producto_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_producto
 BEFORE insert on producto
 for each row
    when (new.id_producto is null)
begin
 :new.id_producto := producto_SEQ.nextval;
 end;
 
 CREATE SEQUENCE stock_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 create or replace trigger insert_pk_stock
 BEFORE insert on stock
 for each row
    when (new.id_stock is null)
begin
 :new.id_stock := stock_SEQ.nextval;
 end;
 
 create or replace trigger manejo_stock
 after insert on factura_lin
 for each row
 begin
    if(:new.tipo in ('FV','CA')) then --FV = Factura de venta y CA = Compra abonada
        update stock s
        set s.cantidad = s.cantidad - :new.cantidad
        where s.id_producto = :new.id_producto and s.id_almacen = :new.id_almacen;
    elsif(:new.tipo in ('FC','NC')) then -- FC = Factura de compra, NC = Nota de Credito
        update stock s
        set s.cantidad = s.cantidad + :new.cantidad
        where s.id_producto = :new.id_producto and s.id_almacen = :new.id_almacen;
    end if;
 end;
 
 create or replace trigger anular_fComopra
 after update on factura_lin
 for each row
 begin
    if (:new.cantidad = :old.cantidad) then
        update stock s
        set s.cantidad = s.cantidad - :old.cantidad
        where s.id_producto = :old.id_producto and s.id_almacen = :old.id_almacen;
    end if;
end;

CREATE SEQUENCE SEQ_NOTA_CREDITO
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE SEQ_fact_compra
INCREMENT BY 1 
START WITH 1 
NOCACHE;

