//�����������  ���  �����  ��  ��������  (��������,  ������  '1c2a3b' ������������� � ������ '3c2a1b')
program lab72;
var a, k, b, z, i,j:integer; c:char; name1,name2,s:string; f1,f2:text;  flag: boolean;
begin
     repeat
           writeln('������� ��� ��������������� �����');
           readln(name1);
           name1:=name1+'.txt';
           assign(f1, name1);
     until fileexists(name1);   //�������� �� �������� �����1
     repeat
           writeln('������� ��� ��������� �����');
           readln(name2);
           name2:=name2+'.txt';
           assign(f2, name2);
     until cancreatefile(name2);    //�������� �� �������� �����2
     reset(f1); //��������� ����1 ��� ������
     rewrite(f2); //������� ����2
     reset(f2);//��������� ����2 ��� ������
     writeln('���������:');
     while not eof(f1) do //���� �� ����� ������� �����1
           begin
           readln(f1,s);//��������� ������� �� �����1
           repeat
                 flag:=true;   //���� �� ���������
                 for i:=1 to (length(s)-1) do
                     if(s[i]>='0') and (s[i]<='9')then   //������ �����
                     for j:=i to (length(s)) do
                         if(s[j]>='0') and (s[j]<='9')then //������ �����
                         if s[j]>s[i] then  //���� ������ ������ ������
                            begin       //������ �������
                            c:=s[j];
                            s[j]:=s[i];
                            s[i]:=c;
                            flag:=false  //������������ ����
                            end;
           until flag=true; //���� ������������ �� ����������
           append(f2); //������������ ����2
           writeln(f2, s);
           writeln(s); //������� �� �����
           end;
     close(f1);//��������� ����1
     close(f2);//��������� ����2
end.
