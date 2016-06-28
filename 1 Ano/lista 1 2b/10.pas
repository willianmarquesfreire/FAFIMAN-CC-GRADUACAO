Program dez;
uses crt;
type
    arranjo1 = array[1..100] of string;
    arranjo2 = array[1..5] of string;
var
    v:arranjo1;
    cor:arranjo2;
    cont,x:integer;
    cor_enter:string;
Begin 
    clrscr;
    writeln('Contém 5 cores especiais : branco, vermelho, azul, azul claro e preto: ');
    cont:=0;
    x:=0;
    for x:=1 to 5 do
    begin
    write('cor ',x,': ');
    readln(cor_enter);
    cor[x]:=cor_enter;
    end;
    
    for x:=1 to 100 do
    begin
        cont:=cont+1;
        v[x]:=cor[cont];
        if cont=5 then
        cont:=0;
    
    end;
    for x:=1 to 100 do
    begin 
    if v[x] = 'branco' then
    begin
      textcolor(white);
      writeln('cor ',x,' : ',v[x]);
    end
    else if v[x] = 'vermelho' then
    begin
      textcolor(red);
      writeln('cor ',x,' : ',v[x]);
    end
    else if v[x] = 'azul' then
    begin
      textcolor(blue);
      writeln('cor ',x,' : ',v[x]);
    end
    else if v[x] = 'azul claro' then
    begin
      textcolor(lightblue);
      writeln('cor ',x,' : ',v[x]);
    end
    else if v[x] = 'preto' then
    begin
      textcolor(black);
      writeln('cor ',x,' : ',v[x]);
    end
    else
    begin
    textcolor(13);
    writeln('cor ',x,' : ',v[x]);
    end;
    
    end;
  
    readkey;
End.