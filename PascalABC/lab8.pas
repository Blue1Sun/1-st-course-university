program lab8;
type RecDyn = ^node;//��������� ���
     node = record
     next:RecDyn;
     info:integer;
     end;
var
queue1: RecDyn; //�������
phase,el,el1,itog: integer;  //���� ��������, ������� ������� ��-��, ������� ������
//////////////
procedure queue(var first:RecDyn);
//�������� �������
Var
code, N:integer;
s:string;
Last, Curr: RecDyn;
begin
writeln('������� ����� �����:');
repeat
read(s); //���� ������� �����
val(s,N,code);   //�������� �� ������� ������ � �����
if code<>0 then writeln('������� ����� �����');
if code=0 then
begin
 if N = 0 then
   First:= NIL //��������� �������� ������ �������
 else
    begin
    New(Curr);//��������� ������ ��� ������ ������
    First:=Curr; //����������� ������ ������ ������ �������
    repeat //���� ����� � ����������� �����
          Last:=Curr; //����������� ������ ��������� ������
          New(Curr); //��������� ������ ��� ��������� ������
          Last^.next:=curr; //��������� � ���� ��������� ��������� ������ ������� ������ ��������� ������, ������� ����� � �� ����
          Last^.Info := N; //��������� ���������� ����� � �������������� ���� ��������� ������
          repeat     //�������� �� ������� ������ � �����
          read(s);
          val(s,N,code);
          if code<>0 then writeln('������� ����� �����');
          if code=0 then
          until code=0;
    until N = 0; //������������ ������� ������������� ��� ����� 0
    Last^.next:= NIL; //��������� � ���� ��������� ��������� ������ �������� ����� �������
    Dispose(Curr);  //������������ ������ ��� ���������������� ������
    end;
end;
until code=0;
end;
//////////////
procedure print(first:RecDyn;var itog:integer);
//����� ������ �� �����
var curr:RecDyn;
begin
if first=nil then
   begin
   writeln('������ ����');
   itog:=0;
   end
else
    begin
    case (phase) of
    0:writeln('�������� ������:');
    1:writeln('���������� ������(�������� �������� ����� ����� ������� �������� � �������� �������):');
    2:writeln('��������� ������(����������� �� ����������� ��������� �� ������� ������� ��������):');
    end;
    curr:=first;
    while curr<>nil do
          begin
          write(curr^.info:8); //����� ���� ������
          curr:=curr^.next; //������� � ��������� ������ ������
          end;
    writeln;
    end;
end;
//////////////
procedure vstavka(var first:RecDyn);
var curr, ra1, lel,next:RecDyn;
a1, i, code:integer;
s: string;
//�������� �������� ����� ����� A1 ����� ������� �������� � �������� �������
//������ ���������
begin
phase:=1; //������� ���� ��� ������
curr:=first; //����� ������ ������� ��� �������
lel:=first; //������ - ��������, �������� � ����
writeln('������� ����� ����� �1');
repeat   //��������
     read(s);
     val(s,a1,code);
     if code<>0 then writeln('������� ����� �����');
     until (code=0);
i:=1; //������� ��������
while (curr<>NIL) do  //���� �� ����� �� �����
      begin
      if i=1 then
       begin
       New(ra1);
       ra1^.info:=a1;   //���������� A1
       lel:=curr;    //�������� - �������
       curr:=curr^.next; //��������� �� ���������
       ra1^.next:=lel^.next;   //��������� ����� ������� �����
       lel^.next:=ra1;
       i:=0; //��������
       end else begin
       curr:=curr^.next; //��������� �� ��������� ����� ����������
       i:=1; //�� ����� ������
       end;
      end;
end;
/////////////
procedure bubblesort(var first:RecDyn; var el:integer; var el1:integer);
//������ ���������
var curr,next:RecDyn;
flag:boolean; //������� ���������� ����������
c:integer; //���������� ��� ������������ ��������
begin
phase:=2; //���� ��� ������
repeat
curr:=first; //����� ������ �������
flag:=true;
if (curr^.info mod 2 = 0) then
   el1:=1;
while (curr^.next<>nil) and (curr^.info mod 2<>0) do //���� �� ����� �� ����� � �� ��������� ������
      begin
      next:=curr^.next;
      if (next^.info mod 2 = 0) or (curr^.info mod 2 = 0) then
         el:=1;   //������ ����� ���������
      if (curr^.info>next^.info) and (next^.info mod 2<>0) then  //���� ����� ���������� ���������� � ������� �� ������
         begin
         c:=curr^.info;
         curr^.info:=next^.info;  //������������
         next^.info:=c;
         flag:=false;
         end;
      curr:=next; //������� � ��������� ������
      end;
until flag; //���� ���������� �� ����������
end;
////////////////
begin
phase:=0;  //����������� ����
itog:=1;  //����������� ������� ������
el:=0;   //����������� ��������� �������
el1:=0;  //����������� ���������� ������� ��������
queue(queue1);
print(queue1,itog);
if itog<>0 then   //���� ������ �� ����
   begin
   vstavka(queue1);
   print(queue1,itog);
   bubblesort(queue1,el,el1);
   if (el=0) and (el1<>1) then
      writeln('��� ������ ���������')
   else
   if (el1=1) then
      writeln('������ ������� ������')
   else
       print(queue1,itog);
end;
//2 7 5 3 1 2 4 7 3 1 4 0
end.