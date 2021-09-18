## oracle_simple_create_function
###### exec: 
```
declare
  v_valor_venda NUMBER := 0;
begin
  select fn_get_valor_venda(1)
    into v_valor_venda
    from dual;
  --
  dbms_output.put_line(v_valor_venda);
  --
end;
```