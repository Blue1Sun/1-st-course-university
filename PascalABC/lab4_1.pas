program lab42;
const lmax=15;
var a:array[1..lmax,1..lmax] of integer;
    b:array[1..lmax] of integer;
    c: array[1..lmax,1..lmax] of integer;
    max, n, m, k, d, i, j, q:integer;
    mz,nz,jz, kz,bb:real;
    flag, p: boolean;
begin
writeln('������������ ������ 4');
writeln('������� 1');
max:=-maxint;
repeat
      writeln('������� ������ ������� A (N �����, M ��������). ������ �� ',lmax,':');
      read(nz,mz);
until (nz>0) and (mz>0) and (nz<=lmax) and (mz<=lmax)and(nz=round(nz))and(mz=round(mz));
n:=round(nz);
m:=round(mz);
writeln('������� ����� �������� ������� A (', n, ' �����,', m, ' ��������):');
for i:=1 to n do
    for j:=1 to m do
    begin
    repeat
    read(jz);
    if jz<>round(jz) then
    writeln('�������');
    until (jz=round(jz));
    a[i,j]:=round(jz);
    end;
writeln('���������� ������� A:');
for i:=1 to n do
    begin
    for j:=1 to m do
        write(a[i,j]:10);
        writeln;
    end;
repeat
      writeln('������� ����� ������� B. ������ �� ',lmax,':');
      read(kz);
until (kz>0) and (kz<=lmax) and (kz=round(kz));
k:=round(kz);
for i:=1 to k do
begin
repeat
    writeln('������� ',k,' ���� ����� ��������� ������� B');
    read(bb);
    if bb<>round(bb) then
    writeln('�����');
until (bb=round(bb));
b[i]:=round(bb);
end;

for i:=1 to k do //�������� �������
    begin
         if b[i]>=max then
         max:=b[i];
    end;
writeln('������������ ������� �������:', max);
p:=false; //�� ���� ��������
q:=n; //������� �����
for i:=1 to q do //�� 1 �� ��������� ������
      begin
      flag := true; //��� ����
      j := 1;
      while (j <= m) and (flag=true) do
            if a[i, j] = max then flag := false //���� ����
            else j := j + 1;
      if flag=false then
          begin
          q:=q-1;//������� ������
          for j:=i to n do  //�� ������ � max �� ������ ���-�� �����
                 for k :=1 to m do //�� ���������
                 a[j,k] := a[j+1,k];
          p:= true; //�������� ����
          end
      end;
if p=false then write('��� ��������')
else if q=0 then write('������ ��������')
else
 begin
  writeln('������ C');
  for i := 1 to q do
      begin
      for j := 1 to m do
          write(a[i, j]:10);
      writeln;
      end;
 end;
end.