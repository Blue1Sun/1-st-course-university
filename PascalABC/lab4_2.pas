program lab42;
const
lmax=15;
var
T,m:array[1..lmax]of integer;
z,r,i,q,n,ch,raz,razz:integer;
rz,zz,mz:real;
begin
writeln('������������ ������ 4');
writeln('������� 2');
raz:=0;
razz:=0;
repeat
      writeln('������� ����� ������� T �� ',lmax,':');
      read(rz);
until (rz>0) and (rz<=lmax) and (rz=round(rz));
r:=round(rz);
writeln('������� ',r,' ����� ������������� ��������� ������� T');
for i:=1 to r do
begin
repeat
    read(mz);
    if mz<=0 then
    writeln('�������������');
    if mz<>round(mz) then
    writeln('�����');
until (mz>0) and (mz=round(mz));
t[i]:=round(mz);
end;
repeat
      writeln('������� ����� ����� z');
      read(zz);
until (zz>=0) and (zz<9) and (zz=round(zz));
z:=round(zz);
for i:=1 to r do
begin
    ch:=t[i];
    while ch>0 do
          begin
          q:=ch mod 10;
          if q=z then
          raz:=raz+1;
          ch:=ch div 10;
          end;

    end;
for i:=1 to r do
    begin
    ch:=t[i];
    while (t[i] div 10)>0 do
          begin
           t[i]:=t[i] mod 10;
          if t[i]=z then
             begin
             razz:=razz+1;
             m[razz]:=ch;
             end;
             end;

    end;
writeln('');
writeln('����� ',z,' ����������� ',raz,' ���');
if raz=0 then
writeln('������ ������')
else
begin
writeln('����� ������');
for i:=1 to razz do
write(m[i]:5);
end;
end.