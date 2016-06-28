unit GUIDOS;

interface
procedure new_button(texto:String;posX,posY:integer);
procedure new_button_press(texto:String;posX,posY:integer;t_color,b_color:integer);
Procedure new_text_file(name:String);
Procedure write_text_file(nome:String;texto:String);
Procedure read_text_file(nome:String);
procedure new_bin_file(nome:String;texto:String);
function  write_bin_file(nome:String;texto:String;retorno:integer):integer;
procedure read_bin_file(nome:String;posicao:integer);


implementation
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
    if (whereX = posX) and (whereY = posY) then
    new_button_press(texto,whereX,whereY,15,13); 
End;
{-------------------Button Selecionado-----------------}
procedure new_button_press(texto:String;posX,posY:integer;t_color,b_color:integer);
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
{------------Novo Arquivo de Texto---------}
Procedure new_text_file(name:String);
var
    arq:Text;
Begin
    assign(arq,name);
    rewrite(arq);
    close(arq)
End;
{------------Escreve em Arquivo de Texto---------}
Procedure write_text_file(nome:String;texto:String);
var
    arq:Text;
Begin
    assign(arq,nome);
    append(arq);
    write(texto);
    close(arq);
End;
{------------Lê Arquivo de Texto---------}
Procedure read_text_file(nome:String);
var
    arq:Text;
    texto:String;
Begin
   assign(arq,nome);
   reset(arq);
   readln(arq,texto);
   writeln(texto);   
   close(arq);
End;
{------------Novo Arquivo Binário---------}
Procedure new_bin_file(nome:String;texto:String);
type
   registro = record
                register:string;
             end;
var
   arq:file of registro;
   reg:registro;
Begin
   reg.register:=texto;
   assign(arq,nome);
   rewrite(arq);
   write(arq,reg);
   close(arq);
End;     
{------------Escreve em Arquivo Binário---------}
function write_bin_file(nome:String;texto:String;retorno:integer):integer;
type
   registro = record
                register:string;
             end;
var
   arq:file of registro;
   reg:registro;
Begin
   reg.register:=texto;
   assign(arq,nome);
   append(arq);
   write(arq,reg);
   if retorno=1 then
   write_bin_file:=filepos(arq)
   else if retorno=2 then
   write_bin_file:=filesize(arq)
   else if retorno=0 then
   write_bin_file:=0;
   
   close(arq);
End;
{------------Lê Arquivo Binário---------}
procedure read_bin_file(nome:String;posicao:integer);
type 
   registro=record
        register:string;
            end;
var
   arq:file of registro;
   reg:registro;
   texto:string;
   i:integer;
Begin
   assign(arq,nome);
   reset(arq);
   if posicao=0 then
   begin
   for i:=0 to filesize(arq)-1 do
   begin
   seek(arq,i);
   read(arq,reg);
   write(reg.register);
   end;
   end
   else
   begin
   seek(arq,posicao);
   read(arq,reg);
   write(reg.register);
   end;
   close(arq);
End;




end.