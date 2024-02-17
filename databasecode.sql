--�γ̱�
create table Course
(
    Cno char(6) not null Primary key,
    Cname char(20) not null,
    Credit float not null,
    Cnum int,
    Ctime varchar(50),
	Tno char(9),
    Ctype char(10),
    Croom char(3)
)
--ѧ����
create table Student(
Sno char(9) not null Primary Key,
Sname char(20) not null,
Ssex char(2) not null,
Sbirth char(10),
ClassNo char(6)
)
--��ʦ��
create table Teacher(
Tno char(9) not null Primary Key,
Tname char(20) not null,
Ttit char(10),
Ttel char(11),
Dno char(6)
)
--ѡ����Ϣ��
create table SC(
Sno char(9),
Cno char(6),
Grade int,
Credit char(4),
CType char(10),
Crank char(4),
CGPA Numeric(4,2),
CRG numeric(4,2),
NUM_GPA Numeric(5,2),
AVG_GPA Numeric(5,4),
Tno char(9)
)
--ѧ���û���Ϣ��
create table User_Stu(
Username char(9),
Password varchar(35)
)
--��ʦ�û���Ϣ��
create table User_Tea(
Username char(9),
Password varchar(35)
)
--Ժϵ��
create table Department
(
Dno char(6) Primary Key,
Dname char(20),
Dtel char(11)
)
--�༶��Ϣ��
create table ClassRoom(
Rno char(3) Primary Key,
Rce int,
Rcap int,
Plocation char(30)
)
--������Ϣ��
create table ClassInfo
(
    ClassNo char(6) Primary key,
    Dno char(6),
    Tno char(9)
)
--����Ա��Ϣ��
create table User_Admin
(
    Username char(9),
    Password varchar(35)
)
--Ϊ�������������
CREATE UNIQUE INDEX Stu_sno ON Student(Sno);
CREATE UNIQUE INDEX Cou_cno ON Course(Cno);
CREATE UNIQUE INDEX Tea_tno ON Teacher(Tno);
CREATE UNIQUE INDEX Class_no ON ClassInfo(ClassNo);
CREATE UNIQUE INDEX Dept_dno ON Department(Dno);
CREATE UNIQUE INDEX SCno ON SC(Sno,Cno); 
--�����Ա��Ϣ���������
INSERT INTO User_Admin SELECT '100000001','163033'UNION
SELECT '100000002','163033'
--��ѧ�����������
insert into Student 
select '229201901','����','Ů','2001.10.5','114201' UNION
select '229201902','�³�','Ů','2001.5.4','114202' UNION
select '229201903','�ż�','Ů','2000.4.8','114203' UNION
select '229201904','������','Ů','2001.4.21','114201' UNION
select '229201905','����','Ů','2001.6.1','114202' UNION
select '229201906','Ҷ��','Ů','2001.1.12','114203' UNION
select '229201907','����','��','2002.7.10','114203' UNION
select '229201908','ƤƤ','��','1998.10.5','114202' UNION
select '229201909','����','��','2000.12.12','114201' UNION
select '229201911','ͼͼ','��','1999.12.31','114202' 
--��༶��Ϣ���������
INSERT INTO ClassInfo SELECT '114201','122310','200120004'Union
SELECT '114202','122311','200120002'Union
SELECT '114203','122312','200120003'Union
SELECT '114204','122313','200120001'
--��Ժϵ��Ϣ���������
INSERT INTO Department
select '122310','�������ѧϵ','5635690' UNION
select '122311','ҩѧϵ','5635050' UNION
select '122312','��������̬ϵ','6688000' UNION
select '122313','������ѧϵ','5008777' UNION
select '122314','���ӿ�ѧϵ','5534211' UNION
select '122315','����ϵ','6632451' 
--��ѧ���û���Ϣ���������
INSERT INTO User_Stu SELECT '229201901','163033'UNION
SELECT '229201902','163033'UNION
SELECT '229201903','163033'UNION
SELECT '229201904','163033'UNION
SELECT '229201905','163033'
--���ʦ���������
insert into Teacher
select '200120001','����','����','13554214655','122310' union
select '200120002','����','������','15353312055','122312' union
select '200120003','����','�������','17555434655','122311' union
select '200120004','��ά','����','13533214895','122314' union
select '200120005','�ŵ�','������','15541394655','122315' union
select '200120006','����','�������','19134214677','122311' union
select '200120007','��ͩ','������','14637914628','122313' union
select '200120008','����','�������','19134214677','122315' union
select '200120009','л��','����','12233218977','122312' union
select '200120010','л��','������','15686218987','122314' union
select '200120011','����','������','13973214577','122312'
--���ʦ�û���Ϣ���������
INSERT INTO User_Tea SELECT '200120001','163033'UNION
SELECT '200120002','163033'UNION
SELECT '200120003','163033'UNION
SELECT '200120004','163033'UNION
SELECT '200120005','163033'UNION
SELECT '200120006','163033'UNION
SELECT '200120007','163033'UNION
SELECT '200120008','163033'UNION
SELECT '200120009','163033'UNION
SELECT '200120010','163033'
--��γ̱��������
INSERT INTO Course SELECT '00001','���ݿ�','3.0','30','��һһ����','200120001','����','101'Union
SELECT '00002','Java','2.5','90','�������Ľ�','200120002','����','103'UNION
SELECT '00003','�㷨','2.5','100','�������Ľ�','200120003','ѡ��','104'UNION
SELECT '00004','���������','2.5','120','����������','200120004','����','105'UNION
SELECT '00005','����ϵͳ','4','90','�ܶ����Ľ�','200120005','����','106'UNION
SELECT '00006','��ѧ����','2.5','70','��һ�߰˽�','200120006','ѡ��','108' UNION
SELECT '00007','Python','2.5','60','�������Ľ�','200120007','����','110'UNION
SELECT '00008','΢����','2.5','100','����һ����','200120008','����','109'UNION
SELECT '00009','����ԭ��','6.0','50','�����ʮ��','200120008','����','120'
--�ɼ��ȼ�������
create TRIGGER Update_CRank ON SC
AFTER Update,Insert
AS
IF UPDATE(Grade)
BEGIN
Update [SC]
SET Crank=
	CASE
	WHEN[SC].Grade>=95 and [SC].Grade<=100 Then 'A+'
	WHEN[SC].Grade>=90 and [SC].Grade<100 Then 'A'
	WHEN[SC].Grade>=85 and [SC].Grade<90 Then 'A-'
	WHEN[SC].Grade>=81 and [SC].Grade<85 Then 'B+'
	WHEN[SC].Grade>=78 and [SC].Grade<81 Then 'B'
	WHEN[SC].Grade>=75 and [SC].Grade<78 Then 'B-'
	WHEN[SC].Grade>=72 and [SC].Grade<75 Then 'C+'
	WHEN[SC].Grade>=68 and [SC].Grade<72 Then 'C'
	WHEN[SC].Grade>=64 and [SC].Grade<68 Then 'C-'
	WHEN[SC].Grade>=60 and [SC].Grade<64 Then 'D'
	WHEN[SC].Grade<60 Then 'F'
	END
FROM [SC] JOIN INSERTED ON [SC].Grade=INSERTED.Grade AND [SC].Cno=inserted.Cno
AND [SC].Sno=inserted.Sno
END
--�γ̼�����㴥����
create TRIGGER Update_CGPA ON SC
AFTER Update,Insert
AS
IF UPDATE(Grade)
BEGIN
Update [SC]
SET CGPA=
	CASE
	WHEN[SC].Grade>=90 and [SC].Grade<=100 Then 4.0
	WHEN[SC].Grade>=85 and [SC].Grade<90 Then 3.7
	WHEN[SC].Grade>=81 and [SC].Grade<85 Then 3.3
	WHEN[SC].Grade>=78 and [SC].Grade<81 Then 3.0
	WHEN[SC].Grade>=75 and [SC].Grade<78 Then 2.7
	WHEN[SC].Grade>=72 and [SC].Grade<75 Then 2.3
	WHEN[SC].Grade>=68 and [SC].Grade<72 Then 2.0
	WHEN[SC].Grade>=64 and [SC].Grade<68 Then 1.7
	WHEN[SC].Grade>=60 and [SC].Grade<64 Then 1.0
	WHEN[SC].Grade<60 Then 0.0
	END
FROM [SC] JOIN INSERTED ON [SC].Grade=INSERTED.Grade AND [SC].Cno=inserted.Cno
AND [SC].Sno=inserted.Sno
END
--�γ�ѧ�ּ�����㴥����
create trigger Update_CRG on SC
after Update,Insert
as
if update(Grade)
begin
update SC set CRG=
case
when SC.CType='����' then (1.2*SC.CGPA)
when SC.CType='ѡ��' then (1.0*SC.CGPA)
end
from SC join inserted on SC.Grade=inserted.Grade
and SC.Cno=inserted.Cno and SC.Sno=inserted.Sno
end
--�γ�ѧ��*�γ�ѧ�ּ��㴥����
create trigger Update_NUM_GPA on SC
after Update,Insert
as
if update(Grade)
begin
update SC set NUM_GPA=
case
when SC.CType='����' then (1.2*SC.CGPA*SC.Credit)
when SC.CType='ѡ��' then (1.0*SC.CGPA*SC.Credit)
end
from SC join inserted on SC.Grade=inserted.Grade
and SC.Cno=inserted.Cno and SC.Sno=inserted.Sno
end
--ƽ��������㴥����
create trigger Update_AVG_gpa on SC
after Update,Insert
as
if update(Grade)
begin
Update SC
set AVG_GPA=
(select sum(NUM_GPA) from SC where SC.Sno=inserted.Sno and SC.Grade is not null)/
(select sum(convert(float,Credit)) from SC where SC.Sno=inserted.Sno and SC.Grade is not null)
from SC join inserted on SC.Sno=inserted.Sno
end
--�������
select * from sc
ALTER TABLE Course ADD CONSTRAINT C_f
FOREIGN KEY(Tno) REFERENCES Teacher(Tno);

ALTER TABLE ClassInfo ADD CONSTRAINT Cl_f1
FOREIGN KEY(Tno) REFERENCES Teacher(Tno);

ALTER TABLE ClassInfo ADD CONSTRAINT Cl_f2
FOREIGN KEY(Dno) REFERENCES Department(Dno);

ALTER TABLE SC ADD CONSTRAINT SC_f1
FOREIGN KEY(Tno) REFERENCES Teacher(Tno);

ALTER TABLE SC ADD CONSTRAINT SC_f2
FOREIGN KEY(Sno) REFERENCES Student(Sno);

ALTER TABLE SC ADD CONSTRAINT SC_f3
FOREIGN KEY(Cno) REFERENCES Course(Cno);