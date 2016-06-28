unit unit1;

interface
{------------Tipos------------------}
type
    vetor=array[1..5] of integer;
{-----------------------------------}
    
procedure new_button(texto:String;posX,posY:integer);
procedure new_button_press(texto:String;posX,posY:integer;b_color,t_color:integer);
procedure vai_ate(posicaoX,posicaoY:vetor);
procedure senha2;
procedure Inicializar;
procedure tela1;
procedure tela2;
procedure principal;
procedure page1;
procedure page2;
procedure page3;
procedure novo_vendas;
procedure lista_vendas;
procedure novo_Cliente;
procedure lista_Cliente;
procedure novo_estoque;
procedure lista_estoque;


implementation
uses crt;
{-------------------Button normal-------------------}
procedure new_button(texto:String;posX,posY:integer);
Const
    CARAC_CANTO_NE = #191; CARAC_CANTO_NO = #218;	
    CARAC_CANTO_SE = #217; CARAC_CANTO_SO = #192;	
    CARAC_HORIZONT = #196; CARAC_VERTICAL = #179;
var
    cont:integer;
Begin
    gotoxy(posX,posY);
    write(CARAC_CANTO_NO);
    for cont:=1 to length(texto) do
    write(CARAC_HORIZONT);
    write(CARAC_CANTO_NE);
    gotoxy(posX,posY+1);
    write(CARAC_VERTICAL);
    write(texto);
    write(CARAC_VERTICAL);
    gotoxy(posX,posY+2);
    write(CARAC_CANTO_SO);
    for cont:=1 to length(texto) do
    write(CARAC_HORIZONT);
    write(CARAC_CANTO_SE);
    
End;
{-------------------botão Selecionado-----------------}
procedure new_button_press(texto:String;posX,posY:integer;b_color,t_color:integer);
Const
    CARAC_CANTO_NE = #191; CARAC_CANTO_NO = #218;	
    CARAC_CANTO_SE = #217; CARAC_CANTO_SO = #192;	
    CARAC_HORIZONT = #196; CARAC_VERTICAL = #179;
var
    cont:integer;
Begin
textcolor(b_color);
gotoxy(posX,posY);
write(CARAC_CANTO_NO);
for cont:=1 to length(texto) do
write(CARAC_HORIZONT);
write(CARAC_CANTO_NE);
gotoxy(posX,posY+1);
write(CARAC_VERTICAL);
textcolor(t_color);
write(texto);
textcolor(b_color);
write(CARAC_VERTICAL);
gotoxy(posX,posY+2);
write(CARAC_CANTO_SO);
for cont:=1 to length(texto) do
write(CARAC_HORIZONT);
write(CARAC_CANTO_SE);
textcolor(b_color);
End;

{-------Movimento de Cursor----------}

procedure vai_ate(posicaoX,posicaoY:vetor);

var
    tecla:char;
    cont:integer;
    leng:string;
begin   
repeat
  tecla := readkey;
  tecla := upcase(tecla);
    case tecla of
      #77:
      begin
        if cont >=3 then cont:=3
        else
        cont:=cont+1;
        gotoxy(posicaoX[cont],posicaoY[cont]);
      end;
      #75:
      begin
        if cont <=1 then cont:=1
        else
        begin
          cont:=cont-1;
          gotoxy(posicaoX[cont],posicaoY[cont]);
        end;
      end;
    end;
   until tecla = #13;
end;
{-----------1----------------------}
procedure Inicializar;
var control,cont:integer;

begin
    control:=10;
    Writeln('Inicializando');  
    for cont:=1 to 20 do
    begin
        write('-');
        delay(control);
    end; 
end;
procedure senha2;
  var
  senha,id:string;
Begin
    write('Id: ');
    read(id);
    writeln;
    write('Senha: ');
    read(senha);
    if (id='wmf') and (senha='123') then
    exit
    else
    begin
     clrscr;
     writeln('Tente Novamente:');
     senha2;
    end;
End;
{-----------2------------------}
procedure tela1;
var control:integer;
begin
    writeln;
    control:=20;
    delay(control);
    write('W');
    delay(control);
    write('m');
    delay(control);
    write('f');
    delay(control);
    write('S');
    delay(control);
    write('y');
    delay(control);
    write('s');
    delay(control);
    write('t');
    delay(control);
    write('e');
    delay(control);
    write('m');
    clrscr;
end;
{------------3-------------}
procedure tela2;
var
    cont:integer;
Begin
    writeln('-----------------------');
    new_Button('Cliente',3,3);
    new_Button('Vendas',3,6);
    new_Button('Estoque',3,9);
    writeln;writeln;
    writeln('-----------------------');
    for cont:=1 to 13 do
    begin
        gotoxy(24,cont);
        delay(10);
        write('-');
    end;
    gotoxy(1,1);

end;
{----------Principal-----------}

procedure principal;
var
    cont:integer;
    posicaoX:vetor;
    posicaoY:vetor;
Begin
      tela2;
      posicaoX[1]:=3;posicaoX[2]:=3;posicaoX[3]:=3;
      posicaoY[1]:=3;posicaoY[2]:=6;posicaoY[3]:=9;
      vai_ate(posicaoX,posicaoY);
      
      if (whereX=posicaoX[1]) and (whereY=posicaoY[1]) then
      begin
      clrscr;
      page1;
      
      end
      else if (whereX=posicaoX[2]) and (whereY=posicaoY[2]) then
      begin
      clrscr;
      page2;
      
      end
      else if (whereX=posicaoX[3]) and (whereY=posicaoY[3]) then
      begin
      clrscr;
      page3;
      
      end;


end;
{------------Pagina1------------}
procedure page1;
var
    cont:integer;
    posicaoX:array[1..5] of integer;
    posicaoY:array[1..5] of integer;
Begin
    posicaoX[1]:=5;posicaoX[2]:=5;posicaoX[3]:=5;
    posicaoY[1]:=3;posicaoY[2]:=6;posicaoY[3]:=9;
    for cont:=1 to 25 do
    begin
        write('-');
    end; 
    gotoxy(1,15);
    for cont:=1 to 25 do
    begin
        write('-');
    end;
    new_button('Novo Cliente',5,3);
    new_button('Listar Cadastros',5,6);
    new_button('voltar',5,9);
    gotoxy(1,1);
    vai_ate(posicaoX,posicaoY);
    
    if (whereX=posicaoX[1]) and (whereY=posicaoY[1]) then
      begin
      clrscr;
      gotoxy(1,1);
      novo_Cliente;
      end
      else if (whereX=posicaoX[2]) and (whereY=posicaoY[2]) then
      begin
      clrscr;
      gotoxy(1,1);
      lista_Cliente;
      end
      else if (whereX=posicaoX[3]) and (whereY=posicaoY[3]) then
      begin
      clrscr;
      gotoxy(1,1);
      principal;
      end;
End;
{------------------pagina2------------------------------}
procedure page2;
var
    cont:integer;
    posicaoX:array[1..5] of integer;
    posicaoY:array[1..5] of integer;
Begin
    posicaoX[1]:=5;posicaoX[2]:=5;posicaoX[3]:=5;
    posicaoY[1]:=3;posicaoY[2]:=6;posicaoY[3]:=9;
    for cont:=1 to 25 do
    begin
        write('-');
    end; 
    gotoxy(1,15);
    for cont:=1 to 25 do
    begin
        write('-');
    end;
    new_button('Nova Venda',5,3);
    new_button('Listar Vendas ',5,6);
    new_button('voltar',5,9);
    gotoxy(1,1);
    vai_ate(posicaoX,posicaoY);
    
    if (whereX=posicaoX[1]) and (whereY=posicaoY[1]) then
      begin
      clrscr;
      gotoxy(1,1);
      novo_vendas;
      end
      else if (whereX=posicaoX[2]) and (whereY=posicaoY[2]) then
      begin
      clrscr;
      gotoxy(1,1);
      lista_vendas;
      end
      else if (whereX=posicaoX[3]) and (whereY=posicaoY[3]) then
      begin
      clrscr;
      gotoxy(1,1);
      principal;
      end;
    
    

End;
{------------------------Pagina3------------------------}
procedure page3;
var
    cont:integer;
    posicaoX:array[1..5] of integer;
    posicaoY:array[1..5] of integer;
Begin
    posicaoX[1]:=5;posicaoX[2]:=5;posicaoX[3]:=5;
    posicaoY[1]:=3;posicaoY[2]:=6;posicaoY[3]:=9;
    for cont:=1 to 25 do
    begin
        write('-');
    end; 
    gotoxy(1,15);
    for cont:=1 to 25 do
    begin
        write('-');
    end;
    new_button('Novo Produto',5,3);
    new_button('Listar Estoque',5,6);
    new_button('voltar',5,9);
    gotoxy(1,1);
    vai_ate(posicaoX,posicaoY);
    
    if (whereX=posicaoX[1]) and (whereY=posicaoY[1]) then
      begin
      clrscr;
      gotoxy(1,1);
      novo_estoque;
      end
      else if (whereX=posicaoX[2]) and (whereY=posicaoY[2]) then
      begin
      clrscr;
      gotoxy(1,1);
      lista_estoque;
      end
      else if (whereX=posicaoX[3]) and (whereY=posicaoY[3]) then
      begin
      clrscr;
      gotoxy(1,1);
      principal;
      end;
End;
{----Declareção de variáveis------}
var
   produto:array[1..10] of string; 
   produto_estoque:array[1..10] of string;
   valor_estoque:array[1..10] of string;
   qtd_estoque:array[1..10] of string;
   fornecedor_estoque:array[1..10] of string;
   valor:array[1..10] of real;
   qtd:array[1..10] of integer; 
   fornecedor:array[1..10] of string;
   cliente:array[1..10] of string;
   cliente_venda:array[1..10] of string;
   cpf:array[1..10] of integer;
   cpf_venda:array[1..10] of integer;
   cont1,cont2,cont3,cont_cliente,cont_cpf:integer;
   cont_cliente2,cont_cpf2:integer;
   cont_produto,cont_qtd,cont_fornecedor,cont_valor:integer;
   cont_produto2,cont_qtd2,cont_fornecedor2,cont_valor2:integer;

   
procedure novo_Cliente;
begin
    Writeln('Nome:.');
    cont_cliente:=cont_cliente+1;
    read(cliente[cont_cliente]);
    writeln('Cpf:.');
    cont_cpf:=cont_cpf+1;
    read(cpf[cont_cpf]);
    writeln;
    new_button('Ok..',whereX,whereY);
    readkey;
    clrscr;
    page1;


end;
procedure lista_Cliente;
begin
    write('Nomes:');
    for cont1:=1 to 10 do
    begin
    gotoxy(2,cont1+1);
    write(cliente[cont1]);
    end;
    for cont1:=1 to 15 do
    begin
    gotoxy(10,cont1);
    write('-');
    end;
    gotoxy(12,1);
    write('Cpf:');
    for cont1:=1 to 10 do
    begin
    gotoxy(15,cont1+1);
    write(cpf[cont1]);
    end;
    gotoxy(1,11);
    writeln;
    new_button('Ok..',whereX,whereY);
    readkey;
    clrscr;
    page1;
    

end;   
   
procedure novo_vendas;
begin
    Writeln('Nome:.');
    cont_cliente2:=cont_cliente2+1;
    read(cliente_venda[cont_cliente2]);
    writeln('Cpf:.');
    cont_cpf2:=cont_cpf2+1;
    read(cpf_venda[cont_cpf2]);
    writeln('Produto:.');
    cont_produto:=cont_produto+1;
    read(produto[cont_produto]);
    writeln('Qtd:.');
    cont_qtd:=cont_qtd+1;
    read(qtd[cont_qtd]);
    writeln('Valor:.');
    cont_valor:=cont_valor+1;
    read(valor[cont_valor]);
    
    
    writeln;
    new_button('Ok..',whereX,whereY);
    readkey;
    clrscr;
    page2;
    

end;
procedure lista_vendas;
begin
write('Nome:');
    for cont1:=1 to 10 do
    begin
    gotoxy(2,cont1+1);
    write(cliente_venda[cont1]);
    end;
    for cont1:=1 to 15 do
    begin
    gotoxy(10,cont1);
    write('-');
    end;
    gotoxy(12,1);
    write('Produtos:');
    for cont1:=1 to 10 do
    begin
    gotoxy(15,cont1+1);
    write(produto[cont1]);
    end;
    for cont1:=1 to 15 do
    begin
    gotoxy(23,cont1);
    write('-');
    end;
    gotoxy(30,1);
    write('Qtd:');
    for cont1:=1 to 10 do
    begin
    gotoxy(30,cont1+1);
    write(qtd[cont1]);
    end;
    gotoxy(38,1);
    write('Valor:');
    for cont1:=1 to 10 do
    begin
    gotoxy(38,cont1+1);
    write(valor[cont1]);
    end;
    gotoxy(1,11);
    writeln;
    new_button('Ok..',whereX,whereY);
    readkey;
    clrscr;
    page2;


end;
procedure novo_estoque;
begin
    writeln('Produto:.');
    cont_produto2:=cont_produto2+1;
    read(produto_estoque[cont_produto2]);
    writeln('Fornecedor:.');
    cont_fornecedor2:=cont_fornecedor2+1;
    read(fornecedor_estoque[cont_fornecedor2]);
    writeln('Qtd:.');
    cont_qtd2:=cont_qtd2+1;
    read(qtd_estoque[cont_qtd2]);
    writeln('Valor:.');
    cont_valor2:=cont_valor2+1;
    read(valor_estoque[cont_valor2]);
    
    
    writeln;
    new_button('Ok..',whereX,whereY);
    readkey;
    clrscr;
    page3;

end;
procedure lista_estoque;
begin
    write('Produto:');
    for cont1:=1 to 10 do
    begin
    gotoxy(2,cont1+1);
    write(Produto_estoque[cont1]);
    end;
    for cont1:=1 to 15 do
    begin
    gotoxy(10,cont1);
    write('-');
    end;
    gotoxy(12,1);
    write('Fornecedor:');
    for cont1:=1 to 10 do
    begin
    gotoxy(15,cont1+1);
    write(fornecedor_estoque[cont1]);
    end;
    for cont1:=1 to 15 do
    begin
    gotoxy(23,cont1);
    write('-');
    end;
    gotoxy(30,1);
    write('Qtd:');
    for cont1:=1 to 10 do
    begin
    gotoxy(30,cont1+1);
    write(qtd_estoque[cont1]);
    end;
    gotoxy(38,1);
    write('Valor:');
    for cont1:=1 to 10 do
    begin
    gotoxy(38,cont1+1);
    write(valor_estoque[cont1]);
    end;
    gotoxy(1,11);
    writeln;
    new_button('Ok..',whereX,whereY);
    readkey;
    clrscr;
    page3;

end;




end.