program lab73;
const lmax=50;
type tv = record
     name:string;   //���
     izg: record         //������������
         gor,zav:string;               //�����, �����
         end;
     par: record        //���������
          god,price:integer;       //���, ����
          h: string;               //������ ������
          end;
     end;
var
nabor: array [1..lmax] of tv;   //������ �������
n,i1,i,k,max,min:integer;  //���������� �������, ����� ��������� ������,��� �����, ����� ����������� �������,����.���,���.����
fname:string;   //������ � ������ �����
f:text;  //���������� ���������� �����
t:tv;   //������� �����
////////////��������
procedure petr(var t:integer);
var s: string; code: integer;
begin
     repeat
     read(s);
     val(s,t,code);
     if code<>0 then writeln('������� ����� �����');   //���� ����� ������
     if t<0 then writeln('����� ������������, ��������� ����');
     until (code=0) and (t>0);
end;
////////////////
begin
     repeat
           writeln('������� ��� �����');
           readln(fname);
           fname:=fname+'.txt';
           assign(f, fname);
     until cancreatefile(fname);         //�������� �� ����������� �������� �����
     rewrite(f);   //�������� ����� ��� ������
     repeat
           writeln('������� ���������� �� �� ',lmax);
           petr(k);
     until (k>0) and (k<=lmax);    //��������
     for i:=1 to k do     //�����������
         with t do
         begin
              write('�������� ',i,' ���������� '); readln(name); writeln(f,name);
              writeln('�����, ����� ������������'); readln(izg.gor, izg.zav); writeln(f, izg.gor:20, izg.zav:20);
              writeln('��� �������, ����, ������ ������'); petr(par.god);petr(par.price); readln(par.h); writeln(f, par.god:10, par.price:10, par.h:10);
         end;
     close(f);
     reset(f); //������
     i:=0;
     while not eof(f) do
     begin
           i:=i+1;
           with nabor[i] do
           begin
                readln(f, name);
                readln(f, izg.gor, izg.zav);
                readln(f, par.god, par.price, par.h);
           end;
     end;
     k:=i;
     close(f);
     max:=0;
     min:=2147483647;
     for i:=1 to k do
         with nabor[i] do
              if (par.god>max) then          //����� ����.����
                 max:=par.god;
     for i:=1 to k do
         with nabor[i] do
              if (par.god=max)  and (par.price<min) then     //����� ���. ��� ���� ����
                 begin
                 min:=par.price;
                 i1:=i;
                 end;
     if i1=0 then writeln('����� �� ������')
     else
     begin
     writeln('����� ������ � ������������ ����� � ����������� ��� ����� ���� ����� - ',i1);
     writeln ('�������� : ',nabor[i1].name);
     writeln ('�����, ����� ������������ :',nabor[i1].izg.gor, nabor[i1].izg.zav);
     writeln ('��� �������, ����, ������ ������ :',nabor[i1].par.god:10, nabor[i1].par.price:10, nabor[i1].par.h:10);
     end;
end.