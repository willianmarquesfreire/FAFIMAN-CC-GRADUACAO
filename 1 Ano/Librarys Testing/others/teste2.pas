Program teste2;
uses GUIDOS;
type
    registro = record
        name:string;
    end;
var
    arq:file of registro;
    reg:registro;
    pos1:integer;
Begin
    reg.name:='wmf';
    new_bin_file('wmf.bin','');
    


End.
