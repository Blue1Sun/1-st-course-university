program lab53;
const lmax=15;
var a: array [1..lmax] of integer; n,i,r:integer; n1:real;
/////////
procedure p1(n:integer; a:array [1..lmax] of integer);
var e:integer; b: array [1..lmax] of integer; count: array[1..lmax] of integer;
begin
e:=0; //����� ������� b � count
for i:=1 to n do
    begin
         r:=1;//������� ����� ��������
         while (a[i]<>b[r]) and (r<=e) do
         r:=r+1;
         if r>e then //a[i] ���������� � b
         begin
         e:=e+1;
         b[e]:=a[i];
         count[e]:=1
         end
         else
         count[r]:=count[r]+1;

    end;
    for i:=1 to e do
    writeln('����� ',b[i],' �������������� ',count[i],' ���')
end;
////////////
procedure p2(n:integer; a:array[1..lmax] of integer);
var c:array[1..lmax] of integer; t,j:integer;
begin
t:=0;
for i:=1 to n do
    begin
    j:=1;
    while ((a[i]<>a[j]) or (i=j)) and (j<=n) do
    j:=j+1;
    if j>n then
       begin
       t:=t+1;
       c[t]:=a[i];
       end;
    end;
if t=0 then
   writeln('������ ������')
else
    begin
    writeln('������ �');
    for i:=1 to t do
    write(c[i]:5);
    end;
end;
////////////
begin
repeat
writeln('������� ����� ������� A �� ',lmax);
read(n1);
until (n1>0) and (n1=round(n1)) and (n1<lmax);
n:=round(n1);
writeln('������� ����� �������� �������(',n,' ����)');
for i:=1 to n do
begin
     repeat
     read(n1);
     if (n1<>round(n1)) then
     writeln('������� �����');
     until (n1=round(n1));
     a[i]:=round(n1);
end;
p1(n,a);
p2(n,a);
end.