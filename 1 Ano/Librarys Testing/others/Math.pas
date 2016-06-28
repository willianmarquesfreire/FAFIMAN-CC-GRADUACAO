unit Math;

interface

function min(a,b:integer):integer;
function max(a,b:integer):integer;
function delta(a,b,c:real):real;
function baskara(a,b,c:real;var x1,x2:real):real;
function primo(numero:integer):boolean;

implementation
{Menor entre 2 números}
function min(a,b:integer):integer;
Begin
    if a<b then min:=a else min:=b;
End;
{Maior entre 2 números}
function max(a,b:integer):integer;
Begin
    if a>b then max:=a else max:=b;
End;
{Delta}
function delta(a,b,c:real):real;
Begin
    delta:=(b*b)-4*a*c;
End;
{Baskara}
function baskara(a,b,c:real;var x1,x2:real):real;
var
    delta:real;
Begin
    delta:=(b*b)-4*a*c;
    x1:=(-b+sqrt(delta))/2*a;
    x2:=(-b+sqrt(delta))/2*a;
End;
{Verifica se é Primo}
function primo(numero:integer):boolean;
var
    x:integer;
    Tprimo:boolean;
Begin
    Tprimo:=true;
    for x:=2 to numero div 2 do 
    begin
        if numero mod 2 = 0 then
        Tprimo:=false;
    end;
    if Tprimo = true then
    primo:=true; 
 End; 

End.