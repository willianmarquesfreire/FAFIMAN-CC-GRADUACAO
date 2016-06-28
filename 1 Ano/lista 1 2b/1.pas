Program um;
uses crt;
type
  arranjo = array[1..100] of integer;
var
  numeros:arranjo;
  x:integer;
Begin
    clrscr;
    x:=0;
    for x:=1 to 100 do
    readln(numeros[x]);
    x:=0;
    for x:=100 downto 1 do
    writeln(numeros[x]);
    readkey;
End.
