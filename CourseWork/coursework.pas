program MKR;
uses crt;
label mainmenu,learning,teoria,praktika,perevod,10,z,ending;

var 
sn,nuser,result,s1,s2:string;
ss,cel,regim,code,n1,j:integer;
n,ost,resultuser,rresult:real;
minus:boolean;

const
    abc:string[16]='0123456789ABCDEF';//��������� ������� ��� ������ ���������

//////////�������� ����� ����� ��������� ����� �������
    function enter_label(n:integer):integer;
    var prov:string;
    code,r:integer;
    begin
        if (n=3) then
            repeat
                readln(prov);
                if (prov<>'1')and(prov<>'2')and(prov<>'3') then  
                    writeln('����������� �������! ��������� ����.');
            until (prov='1')or(prov='2')or(prov='3');
        if (n=2) then
            repeat
                readln(prov);
                if (prov<>'1')and(prov<>'2') then 
                    writeln('����������� �������! ��������� ����.');
            until (prov='1')or(prov='2');
        val(prov,r,code);//������� ������ � �����
        enter_label:=r
    end;

//////////������ �����
    procedure read_file(filename:string);
    var theory:text;
    s:char;
    begin
        assign(theory,filename);
        reset(theory);
        while not Eof(theory) do 
            begin
            read(theory, s);     
            write(s) 
            end;
        close(theory);
        readln()
    end;

//////////�������� ������� ���������
    procedure check_ss(var ss:integer);
    var prov:string;
    code:integer;
    begin
        repeat
            readln(prov);
            val(prov,ss,code);
            if (code<>0)or(ss<2)or(ss>16) then //�������� ����� ��������� ��
                writeln('�������� ������� ���������.');
        until (code=0)and(ss>=2)and(ss<=16)
    end;

//////////�������� �����
    procedure check_n(var n:real);
    var prov:string;
    code:integer;
    begin
        repeat
            readln(prov);
            code:=pos(',',prov);
            if code<>0 then //���� ������������ ���� ������� � ������� �����
                begin
                delete(prov,code,1);
                insert('.',prov,code)//��������� ������ ������� �����
                end;
            val(prov,n,code); //��������� ������ � �����
            if (code<>0) then //���� ������ ����� ������ �� ������������� - �������� ����
                writeln('�������� ����, ���������.');
        until (code=0)
    end;

//////////�������, ������� � �����
    procedure part(n:real; var ost:real; var cel:integer);
    begin
    if (n=trunc(n)) then //����� ����� ����� ��� �����
        cel:=round(n) //����������
    else //���� ���� ������� �����
        begin
        cel:=trunc(n); //����� �����
        ost:=frac(n);//����� �������
        if (n<0) then //���� �������������
            ost:=ost*(-1)
        end
    end;

///////////����� ����� �� 10 � �����
    function fract(cel, ss:integer):string;
    var s:string;
    begin
        s:='';//������ ������
        if (cel<0) then //���� ������������� ����� �����
            cel:=cel*(-1); //������ �� �������������
        repeat
            s:=abc[(cel mod ss)+1]+s;//��������� � ������ ��������� ������ ������� �� ������� ����� ����� �� ��������� ��, ������������, � ������������ � "���������"
            cel:=cel div ss;//����� �����, ������� �� ����� ������ - ����� ����� �� �������
        until cel=0;//���� ����� �� ������ �����
        if n<0 then //���� ����� �������������
            s:=concat('-',s);//��������� � ������ �����
        fract:=s//��������� ��������
    end;

//////////������� �� 10 � �����
    function whole(ost:real; ss:integer):string;
    var s:string;
    k:real;
    begin
        s:='';//������ ������
        repeat
            k:=ost*ss;//������� �������� �� ������� ���������
            s:=s+abc[trunc(k)+1];//��������� � ����� ������ ����� ����� ����, ��� �����
            ost:=frac(k);//����� ������� - ������� ������������� k ��� ����� �����
        until(frac(ost)=0)or(length(s)>4); //���� ������� �� ������ ����� ��� ����� ������ �� ������ ������� �������
        whole:=s//��������� ��������
    end;

//////////�������� �����
    procedure check_sn(var sn: string; var minus:boolean;ss:integer);
    var kol,t,j,i:integer;
    f:boolean;
    begin
        repeat 
            readln(sn);//���� ������
        	minus:=false;
            if (sn[1]='-') then //���� � ������ �����
                begin
                minus:=true;//�������� ��������
                delete(sn,1,1) //������� �����
                end;
            kol:=0;//���������� ��������
            t:=0;//���������� �����/�������      
            for j:=1 to length(sn) do //���� �� ������
                begin
                if ((sn[j]='.')or (sn[j]=',')) then  //���� ��������� ����� ��� �������
                    begin
                    inc(t); //���������� ����� �����������
                    inc(kol) //���������� �������� �����������
                    end;        
                for i:=1 to ss do 
                    if (sn[j]=abc[i]) then //���������� � "���������"
                        inc(kol)//���� �������������, �� ��������� ������
                end;
            if (kol=length(sn)) and (t<2) then //���� ��� ��������� ������� ����� � �����/������� ������ ���� ��� ���
                f:=true
            else 
                f:=false;
            if not f then //�������� ����
                writeln('�������� �����. ��������� ����.');
        until f
    end;

//////////������� �� ����� � 10
    function fromssto10(var sn:string; ss:integer; minus:boolean):real;
    var sum:real;
    num,i,j:integer;
    begin
        sum:=0;//�����, ��������� ��������
        num:=length(sn)+1;//�������, ��� ����� ����� ����� ������, �� ���� ����� �����
        for i:=1 to length(sn) do //���� �� ������
            if (sn[i]='.')or(sn[i]=',') then //���� ��������� ����� ��� �������
                num:=i;//��������� �������
        i:=num-2;//������� ������� �����=������� �����-2
        j:=1;//������� �������
        while (i>=0) and (j<=(num-1)) do //���� �������>=0 � ������� �� ����� �� ���������� ����� ����� �����
            begin
            sum:=sum+((pos(sn[j], abc)-1)*(exp(ln(ss)*i))); //���������� � ����� ��������������� �������� �����(�����)�� ��������*������� ��������� � ������� i
            dec(i);//����������� ��������
            inc(j)
            end;
        if (num<(length(sn)+1)) then //���� ����� ��������� �������
            begin
            i:=1;//�������
            j:=num+1;//������� �������
            while (i<=(length(sn)-num)) and (j<=length(sn)) do //���� �������<=����� ����� �����-������� ����� � ������� �� ����� �� �����
                begin
                    i:=i*(-1);//������ i �������������
                    sum:=sum+((pos(sn[j], abc)-1)*(exp(ln(ss)*i)));//����������� ���������� � ���, ��� ���� ����
                    i:=i*(-1);//������ ����� �������������
                    inc(i);//���������� �������� ������� � �������
                    inc(j)
                end
            end;
        if minus then //���� �������������
            sum:=sum*(-1);//������ �� ������������ ����� �������������
        fromssto10:=sum
    end;


//////////�������� ���������
begin
textbackground (1);//���� ����
clrscr;//�������� �����
textcolor (15);//���� ������
writeln('������������!');
writeln('');
writeln('����� ���������� � ��������� ��������� �� �������� ���������!');
writeln('������ ��������� ����� ����� ��������, � ��� �� ����������� �������� �����');
writeln('�� ���������� ������� ��������� � ����� � ��������.');
writeln('');
//////////������� ����//////////
mainmenu:
writeln('�� ���������� � ������� ����.');
writeln('');
writeln('�������� ������ ��� �����:');
writeln('');
writeln('������� 1, ���� ������ ����� � ����� ��������.');
writeln('������� 2, ���� ������ ��������� �������.');
writeln('������� 3, ���� ������ ����� �� ���������.');
case enter_label(3) of
1: goto learning;
2: goto perevod;
3: goto ending
end;
//////////��������//////////
learning:
clrscr;
writeln('�� � ������ ��������.');
writeln('');
writeln('������ �� �� ������ � ������ ��������, ��� �� ��������� ����� � ��������?');
writeln('');
writeln('������� 1, ���� ������ ������ ������.');
writeln('������� 2, ���� ������ ����������������.');
writeln('������� 3, ���� ������ ����� � ������� ����.');
case enter_label(3) of
1: goto teoria;
2: goto praktika;
3: begin 
    clrscr; //����� ��������� � ������� ���� ���������� �������� �����, ��� ��� � ����� ����� ��� ������� ������ � ���������� �����
    goto mainmenu 
    end
end;
//////////������//////////
teoria:
clrscr;
writeln('�� ������� ����� ������.');
writeln('');
read_file('theory1.txt');
read_file('theory2.txt');
read_file('theory3.txt');
writeln('');
writeln('������� �� �� ���������������� � ���������� �������,');
writeln('��� ��� �������� ������, ��� ����� � ������� ����?');
writeln('');
writeln('������� 1, ���� ������ ���������� � ��������.');
writeln('������� 2, ���� ������ ��� ��� ������������ � �������.');
writeln('������� 3, ���� ������ ����� � ������� ����.');
case enter_label(3) of
1: goto praktika;
2: goto teoria;
3: begin 
    clrscr; 
    goto mainmenu
    end
end;
//////////��������//////////
praktika:
writeln('');
randomize;
repeat    
    ss:=random(17);//���������������� ��
until (ss>=2)and(ss<=16)and(ss<>10);
regim:=random(2);//���������������� ���� ����������
if (regim=0) then//�� ����������
    begin
    cel:=random(1001);//���������������� ������
    ost:=random(1001);//���������������� ��������
    repeat
        ost:=ost/10;//���������� �������� � ��������
    until (trunc(ost)=0);
    n:=ost+cel;//�������� �����
    writeln('��������� ������� ����� ',n,' �� ���������� ������� ��������� � ',ss,'-����');
    writeln('������� ��������� ��������, 5 ������ ����� �������/�����');
    minus:=false; //���������� ����� �� ������������
    check_sn(nuser,minus,ss);//�������� ����� nuser
    code:=pos(',',nuser);
    if code<>0 then //���� ������������ ���� ������� � ������� �����
        begin
        delete(nuser,code,1);
        insert('.',nuser,code)//��������� ������ ������� �����
        end;
    if (n=trunc(n)) then  //���� ����� ����� �������� ��������������� �������
        if (nuser=fract(cel,ss)) then
            writeln('�������� � ������ ���������, �������!')
        else
            writeln('�������! ���������� �����: ',fract(cel,ss))
    else
        begin
        s1:=fract(cel,ss);
        s2:=whole(ost,ss);
        result:=concat(s1,'.',s2);//��������� ������
        if (nuser=result) then
            writeln('�������� � ������ ���������, �������!')
        else
            writeln('�������! ���������� �����: ',result)
        end;
    end;
if (regim=1) then//� ����������
    begin
    sn:='         ';
    j:=1;
    repeat
        repeat
            n1:=random(ss+1);
        until (n1<>0);
        sn[j]:=abc[n1];
        inc(j);
    until (j=5);
    sn[j]:='.';
    inc(j);
    repeat
        repeat
            n1:=random(ss+1);
        until (n1<>0);
        sn[j]:=abc[n1];
        inc(j);
    until (j=10);
    writeln('��������� ������� ����� ',sn,' �� ',ss,'-���� ������� ��������� � ����������');
    writeln('������� ��������� ��������, 5 ������ ����� �������/�����');
    check_n(resultuser);
    minus:=false;
    str(fromssto10(sn, ss, minus),s1);    
    code:=pos('.',s1);
    if ((length(s1)-code)>5) then
        setlength(s1,code+5);//�������� ����� ���� ���� ����� �������,���� ��� ���� ������ ��� ����
    val(s1,rresult,code);
    if (resultuser=rresult) then
        writeln('�������� � ������ ���������, �������!')
    else
        writeln('�������! ���������� �����: ',rresult)
    end;
writeln('');
writeln('������ ��� ��������, ��������� ������ ��� ����� � ������� ����?');
writeln('');
writeln('������� 1, ���� ������ ��� ����������������.');
writeln('������� 2, ���� ������ ��� ��� ������������ � �������.');
writeln('������� 3, ����� ������� � ������� ����.');
case enter_label(3) of
1: goto praktika;
2: goto teoria;
3: begin 
    clrscr; 
    goto mainmenu 
    end
end;
//////////�������//////////
perevod:
clrscr;
writeln('�� � ������ ��������.');
writeln('');
writeln('�������� ��� ��������:');
writeln('');
writeln('������� 1, ���� ������� �� ���������� � ��������.');
writeln('������� 2, ���� ������� �� �������� � ����������.');
case enter_label(2) of
    1: goto 10;
    2: goto z
end;
//////////�� 10 � ��������//////////
10:
clrscr;
writeln('������� �� ���������� ������� ��������� � ��������.');
writeln('');
writeln('������� ������� ���������, � ����� ����� ����������� �������(�� 2 �� 16):');
check_ss(ss);
writeln('������� ����� ���������� ������� ���������.');
check_n(n);
writeln('');
//����������
part(n,ost,cel); //����������� ����� � ������� �����
if (n=trunc(n)) then  //���� ����� ����� �������� ��������������� �������
    writeln('������� ����������� ����� ',n,' � ',ss,'-���� �� = ',fract(cel,ss)) 
else
    writeln('������� ����������� ����� ',n,' � ',ss,'-���� �� = ',fract(cel,ss),'.',whole(ost,ss));
writeln('');
writeln('������ ��������� ��� ����� � ������� ����?');
writeln('');
writeln('������� 1, ����� ������� ����� ���� ��������.');
writeln('������� 2, ��� ������ � ������� ����.');
case enter_label(2) of
    1: goto perevod;
    2: begin 
        clrscr; 
        goto mainmenu 
        end
end;
//////////�� �������� � 10//////////
z:
clrscr;
writeln('������� �� �������� ������� ��������� � ����������.');
writeln('');
writeln('������� ������� ���������, �� ������� ����� ����������� �������(�� 2 �� 16):');
check_ss(ss);
writeln('������� ����� ',ss,'-���� ������� ���������.');
minus:=false; //���������� ����� �� ������������
check_sn(sn,minus,ss);
writeln('');
//����������
if minus then
    writeln('������� ����� -',sn,' ',ss,'-���� �� = ',fromssto10(sn, ss, minus))
else
    writeln('������� ����� ',sn,' ',ss,'-���� �� = ',fromssto10(sn, ss, minus));
writeln('');
writeln('������ ��������� ��� ����� � ������� ����?');
writeln('');
writeln('������� 1, ����� ������� ����� ���� ��������.');
writeln('������� 2, ��� ������ � ������� ����.');
case enter_label(2) of
    1: goto perevod;
    2: begin 
        clrscr; 
        goto mainmenu 
        end
end;
//////////�����//////////
ending:
clrscr
end.