program lab32;
const lmax=15;
var a:array[1..lmax,1..lmax] of integer;
    x:integer;
    n,i,j,k,max,min,sum:integer;
begin
writeln('������������ ������ 3');
writeln('������� 2');
repeat
writeln('������ ������� �� 1 �� ',lmax);
readln(n);
until (n>0) and (n<=lmax);
writeln('������� ������� ������� ',n,' �� ',n);
for i:=1 to n do
  for j:=1 to n do
  read(a[i,j]);
writeln('���������� �������:');
for i:=1 to n do
begin
  for j:=1 to n do
    write(a[i,j]:10);
    writeln;
end;
for i:=1 to n-1 do
for j:=i+1 to n do
if abs(a[i,1])>abs(a[j,1])then
 begin
  x:=a[i,1];
  a[i,1]:=a[j,1];
  a[j,1]:=x
 end;
if n<3 then
writeln('������� ������� ����')
else
begin
writeln('3 ����������� �� ������ �������� ������� �������');
for i:=1 to 3 do
write(a[i,1]:10);
end;
writeln;
writeln('������� 3');
max:=A[n,1];
min:=A[n,1];
writeln('������������ �������');
     for i:=1 to n do
     begin
          for j:=1 to n do
              write(A[i,j]:10);
              writeln;
          end;
     j:=1;
     for i:=n downto 1 do
         begin
         if a[i,j]>max then max:=a[i,j];
         j:=j+1;
         end;
         j:=1;
     for i:=n downto 1 do
         begin
         if a[i,j]<min then min:=a[i,j];
         j:=j+1;
         end;
         writeln('������������ ������� = ',max);
         writeln('����������� ������� = ',min);
         sum:=max+min;
         writeln('����� = ',sum);
end.
