Program cinco;
uses crt;
type
    arranjo1 = array[1..10] of integer;
    arranjo2 = array[1..10] of integer;
    arranjo3 = array[1..20] of integer;
var
    x:arranjo1;
    y:arranjo2;
    z:arranjo3;
    numeros:integer;
    cont,cont1,cont2:integer;
Begin
    clrscr;
    writeln('Array1: ');
    for cont:=1 to 10 do
    begin
        write(cont,': ');
        readln(x[cont]);
    end;
    
    writeln('Array2: ');
    for cont:=1 to 10 do
    begin
        write(cont,': ');
        readln(y[cont]);
    end;
    
    writeln('Vetor x: ');
    for cont:=1 to 10 do
    begin
        writeln(x[cont]);
    end;
    
    writeln('Vetor y: ');
    for cont:=1 to 10 do
    begin
        writeln(y[cont]);
    end;

{----------------------------------Diferença--------------------------------------}    
    writeln;
    writeln('Diferenca entre x e y: ');
    for cont:=1 to 10 do
    begin
        z[cont]:=y[cont]-x[cont];
        textcolor(5);
        write(x[cont],' e ',y[cont],': ');
        textcolor(white);
        write(abs(z[cont]),'  |||  ');
    end;

{----------------------------------Soma--------------------------------------}    
    writeln;
    writeln('Soma de x e y: ');
    for cont:=1 to 10 do
    begin
        z[cont]:=y[cont]+x[cont];
        textcolor(5);
        write(x[cont],' e ',y[cont],': ');
        textcolor(white);
        write(abs(z[cont]),'  |||  ');
    end;
{----------------------------------Produto--------------------------------------}    
    writeln;
    writeln('Produto de x e y: ');
    for cont:=1 to 10 do
    begin
        z[cont]:=y[cont]*x[cont];
        textcolor(5);
        write(x[cont],' e ',y[cont],': ');
        textcolor(white);
        writeln(z[cont],'  |||  ');
    end;
 
    for cont1:=1 to 20 do
    begin
        z[cont1]:=0;
    end;
    
    
{----------------------------------Intersecção--------------------------------------}    
    writeln;writeln;
    writeln('intersecção: ');
    for cont1:=1 to 10 do
    begin
        for cont2:=1 to 10 do
        begin
            if x[cont1] = y[cont2] then
            z[cont1]:=x[cont1];
        end;
    end;
    for cont:=1 to 20 do
    begin
    if z[cont]<>0 then
    write('  ',z[cont],' , ');
    end;
    
    for cont:=1 to 20 do
    begin
        z[cont]:=0;
    end;
    
{----------------------------------União--------------------------------------}    
    writeln;writeln;
    writeln('União: ');
    for cont1:=1 to 10 do
    begin
        for cont2:=1 to 10 do
        begin
            if x[cont1] = y[cont2] then
            begin
                x[cont1]:=0;
                y[cont2]:=0;
            end;
        end;   
    end; 
    
    cont2:=10;
    for cont:=1 to 10 do
    begin
    z[cont]:=x[cont];
    cont2:=cont2+1;
    z[cont2]:=y[cont]; 
    end;
    
    for cont:=1 to 20 do
    begin
    if z[cont] <> 0 then
    write(z[cont],' , ');
    end;
    
    readkey;
    
End.