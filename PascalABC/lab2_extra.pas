
Program Lab2;
Const
lmax = 20;
Type
mass=array[1..lmax] of real;
Var
R:mass;
n, k, i, j, notr, nmin, c, min, max,t: integer;
a, h, x, sum, sr: real;
begin
writeln('������������ ������ 2');

writeln('������� 1');
while ( ( n <= 0 ) or ( n > lmax) ) do
begin
writeln('������� ����� ������� R �� 1 �� ', lmax);read(n);
end;
writeln('������� x');
read(x);
writeln('������� h');
read(h);
writeln('������� a');
read(a);
for i:= 1 to n do
	begin
		R[i]:= 0.8*cos(8*a*x-i*h);
		end;
	writeln('������ R ������� �� ',n,' ���������');
	for i := 1 to n do
write(R[i]:10:3);


writeln(' ');
writeln('������� 2');
	min:=1;
	max:=1;
	for i:=2 to n do
	begin
	if R[max]<R[i] then
    max:=i;
  if R[min]>R[i] then
     min:=i;
     end;
  if min>max then
     BEGIN
    t:=min;
    min:=max;
    max:=t;
    END;
    if min-max>1 then
    writeln('�������� ����������')
    else
    BEGIN
        for i:=max to n do
        R[min+i-max+1]:=R[i];
        n:=n-(max-min-1);
    for i:= 1 to n do
			writeln(R[i]:10:3);
     END;

			
			
	writeln(' ');
	writeln('������� 3');
nmin:=1;
notr:=0;
for i:=1 to n do
	begin
	if R[i]<0 then
notr:=I;
		if abs(R[nmin])>abs(R[i]) then
nmin:=I;
		end;
	if notr=0 then
		writeln('��������� ������������� �������')
	else
		begin
if notr>nmin then
begin
			c:=notr;
notr:=nmin;
 			nmin:=c;
			end;
		sum:=0;
		if nmin-notr>1 then
			begin
			for i:=notr to nmin do
			Sum:=sum+R[i];
		sr:=sum/(nmin-notr+1);
		writeln('������� ��������������= ',sr:10:3);
		end
		else
			writeln('�������� ��� ������� �����������')

	end;
end.
