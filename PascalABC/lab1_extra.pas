Program Lab1;

Const
   lmax = 20;
Type
    mass=array[1..lmax] of real;
Var
   B, D, A:mass;
   i, k, j, nmax: integer;
   x,z,x1,max: real;

begin
     writeln('������������ ������ 1');
     writeln('������� 1');
     while ( ( k <= 0 ) or ( k > lmax) ) do
           begin
           writeln('������� ����� ������� � �� 1 �� ', lmax);
           read(k);
           end;
     writeln('������� ������ � �� ', k, ' ���������');
     for i:= 1 to k do
     read(b[i]);
     writeln('������� x');
     read(x);
     while (z < x) do
           begin
           writeln('������� z, z>x');
           read(z);
           end;
     nmax := 0;
     max := -1E308;
     for i := 1 to k do
     if (b[i] >= max) and (b[i] > x) and (b[i] < z) then
        begin
        max := b[i];
        nmax := i;
        end;
     if nmax = 0 then
        writeln('��� ���������')
     else
         begin
         writeln('max = ', max:10:3);
         writeln('nmax = ', nmax);
         end;
     j := 0;
     for i := 2 to k do
     if b[i] <= b[i-1] then
        begin
        j := j+1;
        d[j] := -b[i];
        end;
     if (j = 0) then
        begin
        writeln('������� 2,3');
        writeln('��� �������� D � A');
        end
     else
         begin
         writeln('������� 2');
         writeln ('������ D ������� �� ', j, ' ���������:');
         for i := 1 to j do
         writeln(d[i]:10:3);
         writeln('������� 3');
         writeln('������� �������� x1');
		     readln(x1);
		     for i := 1 to j do
			   if (d[i] <= x1) and (d[i] < 0) then
            begin
            a[i] :=0;
            writeln('������� ',i,' �� ���������');
            end
            else
                if (d[i] <= x1) then
				        a[i] := (1/2)*sqrt(d[i])
        else
				    a[i] := d[i];
	       write('������ � ������� �� ', j,'���������');
	       for i := 1 to j do
	       write(a[i]:10:3);
         end;

end.
