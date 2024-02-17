--课程表
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
--学生表
create table Student(
Sno char(9) not null Primary Key,
Sname char(20) not null,
Ssex char(2) not null,
Sbirth char(10),
ClassNo char(6)
)
--教师表
create table Teacher(
Tno char(9) not null Primary Key,
Tname char(20) not null,
Ttit char(10),
Ttel char(11),
Dno char(6)
)
--选课信息表
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
--学生用户信息表
create table User_Stu(
Username char(9),
Password varchar(35)
)
--教师用户信息表
create table User_Tea(
Username char(9),
Password varchar(35)
)
--院系表
create table Department
(
Dno char(6) Primary Key,
Dname char(20),
Dtel char(11)
)
--班级信息表
create table ClassRoom(
Rno char(3) Primary Key,
Rce int,
Rcap int,
Plocation char(30)
)
--教室信息表
create table ClassInfo
(
    ClassNo char(6) Primary key,
    Dno char(6),
    Tno char(9)
)
--管理员信息表
create table User_Admin
(
    Username char(9),
    Password varchar(35)
)
--为各表建立相关索引
CREATE UNIQUE INDEX Stu_sno ON Student(Sno);
CREATE UNIQUE INDEX Cou_cno ON Course(Cno);
CREATE UNIQUE INDEX Tea_tno ON Teacher(Tno);
CREATE UNIQUE INDEX Class_no ON ClassInfo(ClassNo);
CREATE UNIQUE INDEX Dept_dno ON Department(Dno);
CREATE UNIQUE INDEX SCno ON SC(Sno,Cno); 
--向管理员信息表插入数据
INSERT INTO User_Admin SELECT '100000001','163033'UNION
SELECT '100000002','163033'
--向学生表插入数据
insert into Student 
select '229201901','田甜','女','2001.10.5','114201' UNION
select '229201902','陈橙','女','2001.5.4','114202' UNION
select '229201903','张佳','女','2000.4.8','114203' UNION
select '229201904','曾婷婷','女','2001.4.21','114201' UNION
select '229201905','田雨','女','2001.6.1','114202' UNION
select '229201906','叶子','女','2001.1.12','114203' UNION
select '229201907','豆豆','男','2002.7.10','114203' UNION
select '229201908','皮皮','男','1998.10.5','114202' UNION
select '229201909','杨涛','男','2000.12.12','114201' UNION
select '229201911','图图','男','1999.12.31','114202' 
--向班级信息表插入数据
INSERT INTO ClassInfo SELECT '114201','122310','200120004'Union
SELECT '114202','122311','200120002'Union
SELECT '114203','122312','200120003'Union
SELECT '114204','122313','200120001'
--向院系信息表插入数据
INSERT INTO Department
select '122310','计算机科学系','5635690' UNION
select '122311','药学系','5635050' UNION
select '122312','环境与生态系','6688000' UNION
select '122313','生命科学系','5008777' UNION
select '122314','电子科学系','5534211' UNION
select '122315','海洋系','6632451' 
--向学生用户信息表插入数据
INSERT INTO User_Stu SELECT '229201901','163033'UNION
SELECT '229201902','163033'UNION
SELECT '229201903','163033'UNION
SELECT '229201904','163033'UNION
SELECT '229201905','163033'
--向教师表插入数据
insert into Teacher
select '200120001','陈坤','教授','13554214655','122310' union
select '200120002','陈涛','副教授','15353312055','122312' union
select '200120003','杨培','助理教授','17555434655','122311' union
select '200120004','杨维','教授','13533214895','122314' union
select '200120005','张迪','副教授','15541394655','122315' union
select '200120006','张泽','助理教授','19134214677','122311' union
select '200120007','吴桐','副教授','14637914628','122313' union
select '200120008','田欣','助理教授','19134214677','122315' union
select '200120009','谢西','教授','12233218977','122312' union
select '200120010','谢海','副教授','15686218987','122314' union
select '200120011','罗素','副教授','13973214577','122312'
--向教师用户信息表插入数据
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
--向课程表插入数据
INSERT INTO Course SELECT '00001','数据库','3.0','30','周一一二节','200120001','必修','101'Union
SELECT '00002','Java','2.5','90','周四三四节','200120002','必修','103'UNION
SELECT '00003','算法','2.5','100','周三三四节','200120003','选修','104'UNION
SELECT '00004','计算机网络','2.5','120','周四五六节','200120004','必修','105'UNION
SELECT '00005','操作系统','4','90','周二三四节','200120005','必修','106'UNION
SELECT '00006','大学物理','2.5','70','周一七八节','200120006','选修','108' UNION
SELECT '00007','Python','2.5','60','周五三四节','200120007','必修','110'UNION
SELECT '00008','微积分','2.5','100','周三一二节','200120008','必修','109'UNION
SELECT '00009','编译原理','6.0','50','周五九十节','200120008','必修','120'
--成绩等级触发器
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
--课程绩点计算触发器
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
--课程学分绩点计算触发器
create trigger Update_CRG on SC
after Update,Insert
as
if update(Grade)
begin
update SC set CRG=
case
when SC.CType='必修' then (1.2*SC.CGPA)
when SC.CType='选修' then (1.0*SC.CGPA)
end
from SC join inserted on SC.Grade=inserted.Grade
and SC.Cno=inserted.Cno and SC.Sno=inserted.Sno
end
--课程学分*课程学分绩点触发器
create trigger Update_NUM_GPA on SC
after Update,Insert
as
if update(Grade)
begin
update SC set NUM_GPA=
case
when SC.CType='必修' then (1.2*SC.CGPA*SC.Credit)
when SC.CType='选修' then (1.0*SC.CGPA*SC.Credit)
end
from SC join inserted on SC.Grade=inserted.Grade
and SC.Cno=inserted.Cno and SC.Sno=inserted.Sno
end
--平均绩点计算触发器
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
--设置外键
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