program lab61;
const lmax=20;
type strok= array[1..lmax] of string;
nomer=array[1..lmax] of integer;
Var a,b: strok;  //b - ������ ��������
nom:nomer; //������ ������� �����, �� ������� ���������� ���������
rowr:real;
i, k, k2,maxi:integer;//k2 - ���-�� ��������
////////
procedure podstroki(k:integer; var a:strok; var k2:integer; var b: strok; var nom:nomer);
var i,j,j1: integer;
begin
k2:=0; //���������� �������� ���
for i:=1 to k do //���� �� �������
    begin
    j:=1;//����� �������
    j1:=0; //����� ���������� �����
    while j<=length(a[i]) do //���� �� ��������, ���� �� ����� �� ����� ������
          if (a[i][j]='.') then //���� �� ����� �����
          begin
             if (j1<>0) then  //����� ��� ����
                begin
                k2:=k2+1; //����������� ���-�� ��������
                nom[k2]:=i; //���������� ����� ������ ������ ����� ���������
                b[k2]:=copy(a[i],j1,j-j1);
                end;
             while (j<=length(a[i])) and (a[i][j]='.') do
                   j:=j+1; //�������� ������ �� �������
             j1:=j; //���������� ����� ������� ����� �����
          end
          else j:=j+1; //���� �� ����� �����
    end;
end;
//////
procedure cifr(k2:integer; var b:strok; var maxi:integer);
var i,j, max, k:integer;
begin
maxi:=0;
max:=0;
k:=0;
for i:=1 to k2 do    //��������� ���������
    begin
    if (b[i][1]>='0') and (b[i][1]<='9') then //���� ���������� � �����
         begin
         k:=1;//���������� ����
         j:=2;//����� �������
         while (b[i][j]>='0') and (b[i][j]<='9')  do  //���� ����� � ������ �� ����������
            begin;
            k:=k+1;
            j:=j+1;
            end;
         end;
    if k>max then   //������� �������� ���������� ����
       begin
       maxi:=i;
       max:=k;
       end;
    end;
end;
/////
procedure stars(var s:string);
var i,t:integer;
begin;
for i:=1 to length(s)do
    if (s[i]>='0')and (s[i]<='9') then
       t:=i; //����� ��������� �����
    insert('***',s,t); //��������� ����� ��� ��� ���������
    end;
//////////
begin
repeat
      writeln('������� ���������� ����� < ',lmax);
      readln(rowr);
until (rowr>0) and (rowr<=lmax) and (rowr=round(rowr));
k:=round(rowr);
writeln('������� ������:');
for i:=1 to k do
    readln(a[i]);
podstroki(k,a,k2,b,nom);
if (k2=0) then //���-�� ��������=0
   writeln('��� ��������')
else
    begin
    writeln('�������� ���������');
    for i:=1 to k2 do
        writeln(b[i]);
    cifr(k2,b,maxi);
    if maxi=0 then writeln('�� ���� ��������� �� ���������� � �����')
    else
        begin
        writeln('���������, ������������ � max ���-�� ����:');
        writeln(b[maxi]);
        writeln('���������� ������:');
        stars(a[nom[maxi]]);
        writeln(a[nom[maxi]]);
        end;
    end;
end.