Program sete;
uses crt;
type 
    arranjo = array[1..10] of integer;
var
    vetor:arranjo;
    numeros,cont,x,y,menor:integer;
Begin
    clrscr;
    menor:=100000;
    for cont:=1 to 10 do
    begin
        readln(vetor[cont]);
        if vetor[cont]<menor then
        menor:=vetor[cont];
    end;
    
    writeln('Números: ');
    for cont:=1 to 10 do
    begin
        write(vetor[cont],', ');
    end;

    writeln('O maior número é: ',menor);
    
    readkey;
End.