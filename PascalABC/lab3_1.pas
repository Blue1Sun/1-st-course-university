Program Lab31;
Var
   x, z, raz, eps, s, chx: real;
   i: integer;
begin
z:=1;
i:=1;
s:=z;
writeln('������������ ������ 3');
writeln('������� 1');
writeln('������� x');
read(x);
repeat
begin
writeln('������� Eps>0');
read(eps);
end;
until eps>0;
repeat
      begin
      z:=(z*x*x)/((2*i-1)*2*i);
      s:=z+s;
      i:=i+1;
      end;
until (abs(z)<=eps);
writeln('�����= ',s:3:2);
chx:=(Exp(x)+Exp(-x))/2;
raz:=abs(s-chx);
writeln('������ ��������= ',chx:3:2);
writeln('�������� ����� � ������� ��������= ',raz:3:2);
end.
