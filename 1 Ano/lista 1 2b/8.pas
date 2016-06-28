Program oito;
uses crt;
type
    arranjo1 = array[1..10] of integer;
    arranjo2 = array[1..10] of integer;
var
    a:arranjo1;
    b:arranjo2;
    soma,subtracao:integer;
    x,y,z:integer;
Begin
    clrscr;
    z:=10;
    for x:=1 to 10 do
    begin
        write(x,': ');
        read(a[x]);
        writeln;    
    end;
    
    for x:=1 to 10 do
    begin
        write(x,': ');
        read(b[x]);
        writeln;    
    end;
    
    for y:=1 to 10 do
    begin
        subtracao:=b[z]-a[y];
        soma:=soma+subtracao;
        writeln('Subtracao de ',a[y],' e ',b[z],' é: ',abs(subtracao));
        z:=z-1;    
    end;
    writeln;
    textcolor(white);
    writeln('Soma: ',soma);
    
    readkey;
end.