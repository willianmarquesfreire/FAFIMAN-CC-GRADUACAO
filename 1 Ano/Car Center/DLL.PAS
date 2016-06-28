unit dll;
{----------------------------------------------------------------------
*		Autor : Willian M. Freire                                         -
*		Ano : 2015                                                        -
*		Descrição : Programa que controla Carros                          -
----------------------------------------------------------------------}


interface

		uses crt;

		type
		carro = record 	
		    codigo : integer;
		    modelo : array[1..5,0..5] of string;
		    combustivel : array[1..4] of string;
		    ano_fabricacao : string;
		    preco_custo : real;
		    taxa_margem_venda : real;
		    valor_venda_veiculo : real;
		    vendido : boolean;
		    placa : String;
		    ativo : boolean;
		end;	
		
		gravCarro = record 	
		    codigo : integer;
		    modelo : string;
		    combustivel : string;
		    ano_fabricacao : string;
		    preco_custo : real;
		    taxa_margem_venda : real;
		    valor_venda_veiculo : real;
		    vendido : boolean;
		    placa : String;
		    ativo : boolean;
		end;	
		
		vetorCarro = array[1..1000] of gravCarro;
		
		tipo_arquivo = file of carro;
		
		var
			carros : carro;
			gravaCarros : gravCarro;
			leiaCarros : gravCarro;
			backupCarros : gravCarro;
			arquivo : file of gravCarro;
			arquivo1 : file of gravCarro;
			arquivo2 : file of gravCarro;
			codigo : integer;

		procedure atribui_valor_inicial;
		procedure insere;
		procedure altera;
		procedure exclui;
		procedure vende_carro;
		procedure consulta;
		procedure lista_disponiveis;
		procedure lista_vendidos;
		procedure lista_marca_modelo;
		procedure lista_complexa;
		
		procedure inicio;
		procedure finaliza;
		procedure desenha_tela(titulo,mensagem:string);
		
		procedure abre_arquivo;
		procedure fecha_arquivo;
		
		procedure backup;
		procedure restaura_backup;
		                                                                            
		procedure ordenaVetor(var v:vetorCarro);		                                                                            
		function pesquisaBinaria(v:vetorCarro; chave: string; ultN:integer): integer;
		

implementation

		procedure atribui_valor_inicial;
		begin
				carros.modelo[1,0]:= 'Wolksvagem . Fusca';
		    carros.modelo[1,1]:= 'Wolksvagem . Gol';
		    carros.modelo[1,2]:= 'Wolksvagem . Saveiro';       
		    carros.modelo[1,3]:= 'Wolksvagem . Up';
		    carros.modelo[1,4]:= 'Wolksvagem . Fox';
		    carros.modelo[1,5]:= 'Wolksvagem . Jetta';
		    
		    carros.modelo[2,0]:= 'Fiat . f250';
		    carros.modelo[2,1]:= 'Fiat . Ducato';
		    carros.modelo[2,2]:= 'Fiat . Duna';
		    carros.modelo[2,3]:= 'Fiat . Stilo';
		    carros.modelo[2,4]:= 'Fiat . Uno';
		    carros.modelo[2,5]:= 'Fiat . Furgão';
		    
		    carros.modelo[3,0]:= 'Ford . Camaro';
		    carros.modelo[3,1]:= 'Ford . Ka';
		    carros.modelo[3,2]:= 'Ford . Fiesta';
		    carros.modelo[3,3]:= 'Ford . Focus';
		    carros.modelo[3,4]:= 'Ford . Fusion';
		    carros.modelo[3,5]:= 'Ford . Novo Ka+';
		                          
		    carros.modelo[4,0]:= 'Chevrolet . Montana';		                          
		    carros.modelo[4,1]:= 'Chevrolet . Onix';
		    carros.modelo[4,2]:= 'Chevrolet . Prisma';
		    carros.modelo[4,3]:= 'Chevrolet . Cobalt';
		    carros.modelo[4,4]:= 'Chevrolet . Cruze';
		    carros.modelo[4,5]:= 'Chevrolet . Prisma';
		                          
		    carros.modelo[5,0]:= 'Renault . startat';		                          
		    carros.modelo[5,1]:= 'Renault . picape';
		    carros.modelo[5,2]:= 'Renault . Super Van';
		    carros.modelo[5,3]:= 'Renault . Logan';
		    carros.modelo[5,4]:= 'Renault . Clio';
		    carros.modelo[5,5]:= 'Renault . Sandero';
		    
		  	carros.combustivel[1]:= 'Gasolina';
		  	carros.combustivel[2]:= 'Alcool';
		  	carros.combustivel[3]:= 'Diesel';
		  	carros.combustivel[4]:= 'Flex';
		  	
		  	gravaCarros.vendido:=false;
		  	
		    codigo := 0;
		    
		end;
		{************ Insere Elementos ****************}
		procedure insere;
		var posic : array[1..9] of integer;  
				sair : boolean;		
				opcao2 : char;
				ch, vendidoTrue : char;	
				i, j : integer;		
		begin
				opcao2:='N';
				
				while opcao2 <> 'S' do
				begin
				
		    desenha_tela('Insere novo Carro','Gerenciador de Carros');
		                                          
		    posic[1]:= 7;
		    posic[2]:= 9;
		    posic[3]:= 11;
		    posic[4]:= 13;
		    posic[5]:= 15;
		    posic[6]:= 17;
		    posic[7]:= 19;
		    posic[8]:= 21;
		    posic[9]:= 23;
		  
		    gotoxy(4,7);
				write('Codigo:');
				
				gotoxy(4,9);
				write('Mod/Marca:');
				
				gotoxy(50,9);
				write('* Utilize Seta Direita');
				
				gotoxy(4,11);
				write('Ano de Fabricacao:');
				
				gotoxy(4,13);
				write('Combustivel:');
				
				gotoxy(50,13);
				write('* Utilize Seta Direita');
				
				gotoxy(4,15);
				write('Preco de Custo do Veiculo:');
				
				gotoxy(4,17);
				write('Taxa de Margem de Venda:');
				
				gotoxy(4,19);
				write('Valor de Venda do Veiculo:');
				
				gotoxy(4,21);
				write('Placa:');
				
				gotoxy(30,23);
				write('Finalizar! S - Sair ou N - Continuar');
				
				with gravaCarros do
				begin
						 gotoxy(35,7);   
				     readln(codigo);
				     
				     seek(arquivo,0);
						 while not eof(arquivo) do
						 begin
						     read(arquivo,leiaCarros);
						     if (leiaCarros.codigo = codigo) then
						     begin
						          gotoxy(35,7);
						          clreol;
						          write('Codigo ja existe!');
						          readkey;
						          gotoxy(35,7);
											clreol;   
				     					readln(codigo);
						     end;
						 end;
				     
				     gotoxy(35,9);
				     
				     i:=1;
		    		 j:=0;	
				     
				     repeat
						    ch:=ReadKey;
						    case ch of
						     #0 : begin
						            ch:=ReadKey; {Read ScanCode}
						            case ch of
						             {right}
						             #77 :
						             begin
						                 gotoxy(35,9);
						                 write(carros.modelo[i,j]);
						                 modelo:=carros.modelo[i,j];
						                 j:=j+1;
						                 
						                 if i >= 5 then
						                 begin
						                     i:=1;
						                     j:=0;
						                 end;
						                 if j>= 5 then
						                 begin
						                     i:=i+1;
						                     j:=0;
						                 end;
						             		 
						                 clreol;						             
						             end;											 												 												 						             
						            end;
						          end;
						    #27 : WriteLn('ESC');
						    end;
						until ch=#13; {Esc}

				    gotoxy(35,11);
				    readln(ano_fabricacao);
				     
				     gotoxy(35,13);
				     
				     i:=1;
		    		 j:=0;	
				     
				     repeat
						    ch:=ReadKey;
						    case ch of
						     #0 : begin
						            ch:=ReadKey; {Read ScanCode}
						            case ch of
						             {right}
						             #77 :
						             begin
						                 gotoxy(35,13);
						                 write(carros.combustivel[i]);
						                 combustivel:=carros.combustivel[i];
						                 
						                 i:=i+1;
						                 
						                 if i>=4 then
						                 		i:=1;   
																      
						                 clreol;						             
						             end;											 												 												 						             
						            end;
						          end;
						    #27 : WriteLn('ESC');
						    end;
						 until ch=#13; {Esc}
				     
				     gotoxy(35,15);
				     readln(preco_custo);
				     
				     gotoxy(35,17);
				     readln(taxa_margem_venda);
				     
				     gotoxy(35,19);
				     readln(valor_venda_veiculo);
				     
				     gotoxy(35,21);
				     readln(placa);
				     
				     gotoxy(70,23);
				     readln(opcao2);
				     opcao2:=upcase(opcao2);
				     
				end;
				
				write(arquivo,gravaCarros);
				
				end;
		
		    readkey;		
		    
		    inicio;
		end;
		
		{************ Altera Elementos ****************}
		procedure altera;
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=7;
				desenha_tela('Alterar Dados do Carro','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    
				    if leiaCarros.codigo <> 0 then
				    begin
				    
				    		i:=i+1;
				    		
				    		gotoxy(5,5);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,5);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,5);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,5);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,5);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,5);
				    		write('Placa');
						    gotoxy(70,i);
						    write(leiaCarros.placa);
				    end;
				end;
				
				gotoxy(5,20);
				write('Digite código para Alterar: ');
				readln(opcao);
				
				clrscr;
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    if leiaCarros.codigo = opcao then
						begin
						    
								desenha_tela('Insere novo Carro','Gerenciador de Carros');
						    
						    posic[1]:= 7;
						    posic[2]:= 9;
						    posic[3]:= 11;
						    posic[4]:= 13;
						    posic[5]:= 15;
						    posic[6]:= 17;
						    posic[7]:= 19;
						    posic[8]:= 21;
						    posic[9]:= 23;
						  
						    gotoxy(4,7);
								write('Codigo:');
								
								gotoxy(4,9);
								write('Mod/Marca:');
								
								gotoxy(4,11);
								write('Ano de Fabricacao:');
								
								gotoxy(4,13);
								write('Combustivel:');
								
								gotoxy(4,15);
								write('Preco de Custo do Veiculo:');
								
								gotoxy(4,17);
								write('Taxa de Margem de Venda:');
								
								gotoxy(4,19);
								write('Valor de Venda do Veiculo:');
								
								gotoxy(4,21);
								write('Placa:');
								
								gotoxy(30,23);
								write('Finalizar! S - Sair ou N - Continuar');
								
								with gravaCarros do
								begin
								     gotoxy(35,7);
								     write(leiaCarros.codigo);
								     
								     gotoxy(35,9);
								     
								     i:=1;
						    		 j:=0;	
								     
								     repeat
										    ch:=ReadKey;
										    case ch of
										     #0 : begin
										            ch:=ReadKey; {Read ScanCode}
										            case ch of
										            #77 :
										             begin
										                 gotoxy(35,9);
										                 write(carros.modelo[i,j]);
										                 modelo:=carros.modelo[i,j];
										                 j:=j+1;
										                 
										                 if i >= 5 then
										                 begin
										                     i:=1;
										                     j:=0;
										                 end;
										                 if j>= 5 then
										                 begin
										                     i:=i+1;
										                     j:=0;
										                 end;
										             		 
										                 clreol;						             
										             end;									 												 												 						             
										            end;
										          end;
										    #27 : WriteLn('ESC');
										    end;
										until ch=#13; {Esc}
										
								     gotoxy(35,11);
								     readln(ano_fabricacao);
								     
								     gotoxy(35,13);
								     
								     i:=1;
						    		 j:=0;	
								     
								     repeat
										    ch:=ReadKey;
										    case ch of
										     #0 : begin
										            ch:=ReadKey; {Read ScanCode}
										            case ch of
										             {right}
										             #77 :
										             begin
										                 gotoxy(35,13);
										                 write(carros.combustivel[i]);
										                 combustivel:=carros.combustivel[i];
										                 
										                 i:=i+1;
										                 
										                 if i>=4 then
										                 		i:=1;   
																				      
										                 clreol;						             
										             end;											 												 												 						             
										            end;
										          end;
										    #27 : WriteLn('ESC');
										    end;
										 until ch=#13; {Esc}
										 
								     gotoxy(35,15);
								     readln(preco_custo);
								     
								     gotoxy(35,17);
								     readln(taxa_margem_venda);
								     
								     gotoxy(35,19);
								     readln(valor_venda_veiculo);
								     
								     gotoxy(35,21);
								     readln(vendidoTrue);
								     
								     vendidoTrue:=upcase(vendidoTrue);
								     writeln(vendidoTrue);
								     
								     if (vendidoTrue='S') or (vendidoTrue='SIM') then
								     begin
								         vendido:=false;
								     end;
								end;
								
								seek(arquivo,filepos(arquivo)-1);
								write(arquivo,gravaCarros);
						
						    readkey;		
						    
						    inicio;

						end;                                   
				end;
		    readkey;
		    inicio;
		end;
		
		{************ Exclui Elementos ****************}
		procedure exclui;
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=7;
				desenha_tela('Excluir Carro','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    
				    if leiaCarros.codigo <> 0 then
				    begin      
				    		i:=i+1;
				    		
				    		gotoxy(5,5);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,5);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,5);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,5);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,5);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,5);
				    		write('Placa');
						    gotoxy(70,i);
						    write(leiaCarros.placa);
				    end;
				end;
				
				gotoxy(5,20);
				write('Digite código para excluir: ');
				readln(opcao);
				
				clrscr;

				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    if leiaCarros.codigo = opcao then
						begin
								seek(arquivo,filepos(arquivo)-1);

								with gravaCarros do
										begin
										codigo := 0;
								    modelo := '0';
								    combustivel := '0';
								    ano_fabricacao := '0';
								    preco_custo := 0;
								    taxa_margem_venda := 0;
								    valor_venda_veiculo := 0;
								    vendido := false;
								    ativo := false;
								end;
								
								write(arquivo,gravaCarros);
								
								clrscr;
						  	gotoxy(10,10);
						  	write('Excluido com Sucesso!');
						  	readkey;
						  	clrscr;		
						    
						    inicio;
						end;                                  
				end;
		    readkey;
		    inicio;
		end;
		
		{************ Vende Elementos ****************}
		procedure vende_carro;
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=7;
				desenha_tela('Vender Carro','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    
				    if leiaCarros.codigo <> 0 then
				    begin
				    		
				    		i:=i+1;
				    		
				    		gotoxy(5,5);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,5);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,5);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,5);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,5);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,5);
				    		write('Vendido');
						    gotoxy(70,i);
						    write(leiaCarros.vendido);
				    end;
				end;
				
				gotoxy(5,20);
				write('Digite código para Vender: ');
				readln(opcao);
				
				clrscr;
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    if leiaCarros.codigo = opcao then
						begin
								seek(arquivo,filepos(arquivo)-1);

								leiaCarros.vendido := true;
								write(arquivo,leiaCarros);	
						    clrscr;
						  	gotoxy(10,10);
						  	write(leiaCarros.modelo,' Vendido com Sucesso!');
						  	readkey;
						  	clrscr;
						    inicio;
						end;                                  
				end;
		    readkey;
		    inicio;
		end;
		{************ Consulta Elementos ****************}
		procedure consulta;    
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=7;
				desenha_tela('Consulta Carro','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				write('Digite um Codigo a pesquisar: ');
				readln(opcao);
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    i:=i+1;
				    if leiaCarros.codigo = opcao then
				    begin
						    gotoxy(5,i);
						    write(leiaCarros.codigo);
						    
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
				    end;
				end;

		    readkey;
		    inicio;
		end;
		{************ Lista Elementos disponíveis ****************}
		procedure lista_disponiveis;
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=7;
				desenha_tela('Carro Disponiveis','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    
				    if (leiaCarros.vendido = false) and (leiaCarros.codigo <> 0) then
				    begin
				    		i:=i+1;
				    		
				    		gotoxy(5,5);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,5);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,5);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,5);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,5);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,5);
				    		write('Vendido');
						    gotoxy(70,i);
						    write(leiaCarros.vendido);
				    end;
				end;
				
		
		    readkey;
		    inicio;
		end;
		{************ Lista Elementos vendidos ****************}
		procedure lista_vendidos;
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=7;
				desenha_tela('Carro Disponiveis','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    
				    if leiaCarros.vendido = true then
				    begin
				    		
				    		i:=i+1;
				    		
				    		gotoxy(5,5);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,5);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,5);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,5);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,5);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,5);
				    		write('Vendido');
						    gotoxy(70,i);
						    write(leiaCarros.vendido);
				    end;
				end;
				
		
		    readkey;
		    inicio;
		end;
		{************ Lista Elementos de Marca e Modelo ****************}
		procedure lista_marca_modelo;
		var 
				i, j:integer;
				opcao, modelo:String;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				
		begin
				i:=5;
				desenha_tela('Pesquisa por Modelo','Gerenciador de Carros');    
				
				write('Marca ou Modelo a procurar: ');
				
				 i:=1;
				 j:=0;

				repeat
				  ch:=ReadKey;
				  case ch of
				    #0 : begin
				      ch:=ReadKey; {Read ScanCode}
				      case ch of
				        #77 :
				        begin
				          gotoxy(40,5);
				          write(carros.modelo[i,j]);
				          modelo:=carros.modelo[i,j];
				          j:=j+1;
				          
				          if i >= 5 then
				          begin
				            i:=1;
				            j:=0;
				          end;
				          if j>= 5 then
				          begin
				            i:=i+1;
				            j:=0;
				          end;
				          
				          clreol;
				        end;
				      end;
				    end;
				    #27 : WriteLn('ESC');
				  end;
				until ch=#13; {Esc}
				
				seek(arquivo,0);    
				
				i:=9;
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);
				    
				    if leiaCarros.modelo = modelo then
				    begin
				    		
				    		i:=i+1;
				    		
				    		gotoxy(5,7);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,7);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,7);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,7);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,7);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,7);
				    		write('Vendido');
						    gotoxy(70,i);
						    write(leiaCarros.vendido);
				    end;
				end;
				
		    readkey;
		    inicio;
		end;                    
		{************ Lista Elementos com total, vlr custo, venda, diferenca e marg de lucro ****************}
		procedure lista_complexa;
		var 
				i, j:integer;
				opcao:integer;
				regAchado:gravCarro;
				posic : array[1..9] of integer;  
				sair : boolean;		
				ch, vendidoTrue : char;	
				vlr_custo, vlr_venda, diferenca, margem_lucro : real;
				qtd_carros:integer;       
				
		begin
				i:=7;            
				qtd_carros:=0;
				desenha_tela('Lista Complexa','Gerenciador de Carros');    
				
				seek(arquivo,0);    
				
				while not eof(arquivo) do
				begin
				    read(arquivo,leiaCarros);     
				    if leiaCarros.vendido = true then
				    begin          
				    		
				    		i:=i+1;
				    		
				    		gotoxy(5,5);
				    		write('Cod');
						    gotoxy(5,i);
						    write(leiaCarros.codigo);

                gotoxy(10,5);
				    		write('Modelos');
						    gotoxy(10,i);
						    write(leiaCarros.modelo);
						    
						    gotoxy(35,5);
				    		write('Combustivel');
						    gotoxy(35,i);
						    write(leiaCarros.combustivel);
						    
						    gotoxy(50,5);
				    		write('Ano Fabr.');         
						    gotoxy(50,i);
						    write(leiaCarros.ano_fabricacao);
						    
						    gotoxy(60,5);
				    		write('Custo');
						    gotoxy(60,i);
						    write(leiaCarros.preco_custo:3:3);
						    
						    gotoxy(70,5);
				    		write('Vendido');
						    gotoxy(70,i);
						    write(leiaCarros.vendido);
						    
						    vlr_custo := vlr_custo + leiaCarros.preco_custo;
						    vlr_venda := vlr_venda + leiaCarros.valor_venda_veiculo;
						    qtd_carros := qtd_carros + 1;
		     
				    end;
				end;
				if qtd_carros <> 0 then
						margem_lucro := vlr_venda/qtd_carros;
				diferenca:=vlr_venda-vlr_custo;
				
				gotoxy(5,20);
				write('Total de Valor de Custo: ',vlr_custo:3:3);
				gotoxy(5,21);
				write('Total de Valor de Venda: ',vlr_venda:3:3);
				gotoxy(5,22);
				write('Total de Diferenca: ',diferenca:3:3);
				gotoxy(5,23);
				write('Margem de Lucro: ',margem_lucro:3:3);
		
		    readkey;
		    inicio;
		end;
		{************ Fim Programa ****************}
		procedure finaliza;
		begin
				close(arquivo);
		    exit;
		
		end;
		{************ Inicio Programa ****************}
		procedure inicio;
		begin
		    desenha_tela('Carros','Gerenciador de Carros');
		    atribui_valor_inicial;
		    abre_arquivo;
		    
		    gotoxy(4,7);
				write('1 - Inserir um novo Carro!');
				
				gotoxy(4,9);
				write('2 - Alterar um Carro!');
				
				gotoxy(4,11);
				write('3 - Excluir um Carro!');
				
				gotoxy(4,13);
				write('4 - Vender um Carro!');
				
				gotoxy(4,15);
				write('5 - Listar Carros disponivel para venda!');
				
				gotoxy(4,17);
				write('6 - Listar Carros vendidos!');
				
				gotoxy(4,19);
				write('7 - Listar Dados de um Carro!');
				
				gotoxy(4,21);
				write('8 - Listar Carros de uma Marca/Modelo!');
				
				gotoxy(4,23);
				write('9 - Listar Carros vendidos em LISTA!');
				
				gotoxy(55,23);
				write('0 - Finalizar!');
				
				gotoxy(50,11);
				write('10 - Fazer Backup!');
				
				gotoxy(50,13);
				write('11 - Restaurar Backup!');
				
				gotoxy(4,5);
				write('digite o codigo: ');
				readln(codigo);
				
				case codigo of
						1:insere;
						2:altera;
						3:exclui;
						4:vende_carro;
						5:lista_disponiveis;
						6:lista_vendidos;
						7:consulta;
						8:lista_marca_modelo;
						9:lista_complexa;
						10:backup;
						11:restaura_backup;
						0:finaliza;
				end;
		
		end;
		
		{************ Desenha Programa ****************}
		procedure desenha_tela(titulo,mensagem:string);
		var
    i,j : integer;
		begin
		    clrscr;
		    gotoxy(1,3);
		    textcolor(11);
		    for i := 1 to 80 do
		        write(#220);
		
		    gotoxy(1,24);
		    textcolor(11);
		
		    for i := 1 to 80 do
		        write(#220);
		
		    textcolor(10);
		    gotoxy(2,2);
		    write('FAFIMAN');
		
		    gotoxy(70-15,2);
		    write('Algoritmos 2');
		
		    gotoxy((70 div 2)-(length(titulo) div 2),3);
		    write(' ',titulo,' ');
		
		    textcolor(12);
		    gotoxy(20,25);
		    write('MSG: ',mensagem);
		
		    textcolor(10);
		    gotoxy(4,5);
		end;
		
		{************ Tratamento de arquivos **********}
		procedure abre_arquivo;
		begin
				assign(arquivo,'carros.dat');

        {$I-}
				reset(arquivo);
				{$I+}

				seek(arquivo,filesize(arquivo));
		end;
		procedure fecha_arquivo;
		begin
				{$I-}
				reset(arquivo);
				{$I+}
		    close(arquivo);
		
		end;
		{************ Backup **********}
		procedure backup;
		var
				opcao:char;
		begin
				
				clrscr;
				gotoxy(10,10);
				write('Deseja Continuar? S/N :');
				readln(opcao);
				
				opcao := upcase(opcao);
				
				if(opcao = 'S') then
				begin
		    
		    assign(arquivo1,'carros.dat');
		     {$I-}
				 reset(arquivo1);
				 {$I+}
				 
				 assign(arquivo2,'carros_backup.dat');
				 rewrite(arquivo2);
				 
				 seek(arquivo1,0);
				 seek(arquivo2,0);
				 
				 
				 while not eof(arquivo1) do
				 begin
				     read(arquivo1,backupCarros);
				     write(arquivo2,backupCarros);
				 end;
				 
				 close(arquivo1);
				 close(arquivo2);
				 
				 gotoxy(10,12);
				 write('Realizado com Sucesso!');
				 
				 end;
				 
				 readkey;
				 
				 clrscr;
				 
				 inicio;   
				 
		end;
		{************ Restore Backup **********}
		procedure restaura_backup;
		var
				opcao:char;
		begin
				
				clrscr;
				gotoxy(10,10);
				write('Deseja Continuar? S/N :');
				readln(opcao);
				
				opcao := upcase(opcao);
				
				if(opcao = 'S') then
				begin
		    
		      assign(arquivo2,'carros_backup.dat');
		     {$I-}
				 reset(arquivo2);
				 {$I+}
				 
				 assign(arquivo1,'carros.dat');
				 rewrite(arquivo1);
				 
				 seek(arquivo1,0);
				 seek(arquivo2,0);
				 
				 
				 while not eof(arquivo2) do
				 begin
				     read(arquivo2,backupCarros);
				     write(arquivo1,backupCarros);
				 end;
				 
				 close(arquivo1);
				 close(arquivo2);
				 
				 gotoxy(10,12);
				 write('Realizado com Sucesso!');
				 
				 end;
				 
				 readkey;
				 
				 clrscr;
				 
				 inicio;   
		end;
		
		
		{************ Ordena Vetor **********}
		procedure ordenaVetor(var v:vetorCarro);
		var
				x,y:integer;
				aux:gravCarro;
				
		begin
				for x:= 20 downto 1 do
				begin
				    for y:= 1 to x-1 do
				    begin
				    		if v[y].modelo > v[y+1].modelo then
				    		begin
						    		aux:= v[y];
						    		v[y]:= v[y+1];
						    		v[y+1]:= aux;
				    		end;
				    end;
				end;
		
		end;
		
		{************ Pesquisa Binária **********}
		function pesquisaBinaria(v:vetorCarro; chave: string; ultN:integer): integer;
		var
				inicio,fim: integer;
				meio: integer;
		begin
				fim:= ultN;
				inicio:= 1;
				pesquisaBinaria:= -1;
				
				repeat  
						
						meio:= (inicio+fim) div 2;
						
						if(chave = v[meio].modelo) then
						begin
						    pesquisaBinaria:= meio;
						    inicio:= fim + 1;
						end;
						
						if(chave < v[meio].modelo) then
							fim:= (meio - 1);
						
						if(chave > v[meio].modelo) then
							inicio:= (meio + 1);
				
				until(inicio > fim);	
		end; 

end.