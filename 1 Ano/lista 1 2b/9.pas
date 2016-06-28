Program nove;
uses crt;
type
    arranjo1 = array[1..50] of integer;
var
    vetor:arranjo1;
    cont:integer;
Begin
    clrscr;
    writeln('Vetor posicao 1: ');
    read(vetor[1]);
    writeln('Vetor posicao 2: ');
    read(vetor[2]);
    for cont:=1 to 48 do
    begin
        vetor[cont+2]:=abs(vetor[cont+1]+vetor[cont]);
    end; 
    writeln('Vetor com v[x+2]=v[x+1]+v[x]: ');
    for cont:=1 to 50 do
    begin
        write(vetor[cont],', ');
    end;

    readkey;
End.