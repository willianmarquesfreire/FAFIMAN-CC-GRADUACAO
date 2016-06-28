Program tres_ponto_um;
uses crt;
type
    arranjo = array[1..10] of integer;
var
    vetor:arranjo;
    x,y,z:integer;
    primo:boolean;
Begin
    clrscr;
     x:=0;
     y:=0;
     z:=100;
     primo:=true;
     for x:=1 to 10 do
     begin
         primo:=true;
         while primo = true do
         begin
             z:=z+1;
             for y:=2 to z div 2 do
             begin
                 if z mod y = 0 then
                 primo:=false;
             end;
         end;
         vetor[x]:=z;     
     end;
     for x:=1 to 10 do
     writeln(vetor[x]);
     
     readkey;

end.