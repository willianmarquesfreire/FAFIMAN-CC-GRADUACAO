Program dois;
uses crt;
type
  arranjo = array[1..100] of integer;
var
  numero:arranjo;
  media:real;
  soma,qtd_par,qtd_neg,qtd_primo,primo,x,y,cont:integer;
Begin
    clrscr;
    media:=0;
    soma:=0;
    qtd_par:=0;
    qtd_neg:=0;
    qtd_primo:=0;
    primo:=0;
    x:=0;
    y:=0;
    cont:=0;
    
    for x:=1 to 100 do
    begin
        readln(numero[x]);
        soma:=soma+numero[x];
        cont:=cont+1;
        if numero[x] mod 2 = 0 then
        qtd_par:=qtd_par+1;
        if numero[x] < 0 then
        qtd_neg:=qtd_neg+1;
        for y:=2 to numero[x]-1 do
        begin
            if numero[x] mod y = 0 then
            primo:=1;
        end;
        if (primo <> 1) or (primo = 0) then
        qtd_primo:=qtd_primo+1;
    end;
    media:=soma/cont;
    writeln('Media : ',media:2:2);
    writeln('Soma : ',soma);
    writeln('Qtd de Pares : ',qtd_par);
    writeln('Qtd de Negativos : ',qtd_neg);
    writeln('Qtd de Primos : ',qtd_primo);
    
    readkey;
    
End.