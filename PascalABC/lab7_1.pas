program lab71;
var f:file of real;
//////
procedure make(var f:file of real); //�������� �����
var s:string; c:real; code:integer;
begin
     writeln('������� ����� � �������');
     writeln ('������� ��������� ����� - �����/������');
     assign(f,'f.txt');    //��������� ��� ���������� � ������
     rewrite(f);     //������� ����
     repeat
           readln(s);   //��������� ������
           val(s,c,code);   //�������� �� ������� ������ � �����
           if code=0 then
              write(f,c);    //���� ������ ���, �� ���������
     until code<>0;   //���� ������ ����, �� ���� ���������
     close(f);
     writeln('���� �����������');
end;
//////
procedure print(var f:file of real);   //����� �����������
var c:real;
begin
     reset(f);   //��������� ����
     writeln('���� �������� �����:');
     while not eof(f) do  //���� ��������� �� � ����� �����
           begin
           read(f,c);  //���������� ����� �� �����
           write(c:10:2);
           end;
     writeln;
     close(f);  //��������� ����
end;
//////
procedure find(var f:file of real);  //����� ������������� ��������������
var c,min,rez:real;
begin
     min:=1e308;  //�������������� �������
     rez:=0; //��������� ������
     reset(f); //��������� ����
     if not eof(f) then
     begin
     repeat
           read (f,c); //������ ����
           if c<0 then  //���� ����� �������������
                  if (abs(c)<abs(min)) then
                  begin
                       min:=c;
                       rez:=c;
                  end;    //���� �� ����������� �� ������,�� ����������
     until eof(f); //���� �� ������ �� ����� �����
     end;
     close(f); //��������� ����
     if rez=0 then
        writeln('������������� ����� ���')
     else
         Writeln('������������ ����� ������������� ����� = ',rez);
end;
begin    //�������� ���������
     make(f);
     reset(f);
     if eof(f) then begin close(f); writeln('������ ����'); end
     else begin
     print(f);
     find(f)
     end;
end.