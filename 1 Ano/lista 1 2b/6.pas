Program seis;
uses crt;
type
    arranjo1 = array[1..10] of real;
var
    v1:arranjo1;
    x,y,cont,numeros:integer;
    maior:real;
    
Begin
    clrscr;
    maior:=0;
    x:=0;
    y:=0;
    cont:=0;
    numeros:=0;
    
    for x:=1 to 10 do
    begin
        readln(v1[x]);
    end;
    
    for x:=1 to 10 do
    begin
        if v1[x] > maior then
        maior:=v1[x];
    end;
    
    writeln('Maior Número: ',maior);
    
    writeln('Divisao:');
    for x:=1 to 10 do
    begin
        v1[x]:=v1[x]/maior;
        write(v1[x]:2:2,', ');
    end;
    
    readkey;
end.