Program quatro;
uses crt;
type
   arranjo1 = array[1..10] of integer;
   arranjo2 = array[1..10] of integer;
   arranjo3 = array[1..20] of integer;

var
   v1:arranjo1;
   v2:arranjo2;
   v3:arranjo3;
   x,y,z,maior,aux1,aux2,cont:integer;
   i,j:integer;
   numero:integer; 

Begin
    clrscr;
    x:=0;
    writeln('Vetor 1: ');
    for x:=1 to 10 do
    begin
      readln(v1[x]);
    end;

    x:=0;
    writeln('Vetor 2: ');
    for x:=1 to 10 do
    begin
      readln(v2[x]);
    end;

    y:=0;
    writeln('Vetor 1: ');
    for y:=1 to 10 do
    begin
      write(v1[y],' ,');
    end;

    y:=0;
    writeln;
    writeln('Vetor 2: ');
    for y:=1 to 10 do
    begin
        write(v1[y],' ,');
    end;  

    z:=0;
    maior:=0;
    for z:=1 to 10 do
    begin    
     v3[z]:=v1[z];
    end;

    aux1:=11;
    for z:=1 to 10 do
    begin
     v3[aux1]:=v2[z];
     aux1:=aux1+1;
    end;
    
    writeln;
    writeln('vetor 3: ');
    for z:=1 to 20 do
    begin
    	write(v3[z],', ');
    end;
    
    writeln;
    for i:=20 downto 2 do
    begin
        for j:=1 to i-1 do
        begin
            if v3[j] > v3[j+1] then
            begin
                 aux1:=v3[j];
                 v3[j]:=v3[j+1];
                 v3[j+1]:=aux1;
            end;        
        end;
    end;
    
    writeln;
        write('Ordenado: ');
        for x:=1 to 20 do
        begin
          write(v3[x],', ');
        end;
      
      readkey;      
end.