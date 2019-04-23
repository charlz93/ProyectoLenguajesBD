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