-- 创建数据库
create database if not EXISTS design;

-- 切换数据库
use design;

-- 创建表

-- 创建用户表user
drop table if exists user;
create table if not exists user(
    uId int(5) unsigned not null auto_increment primary key,
    username varchar(20) not null,
    password varchar(20) not null,
    phone char(11),
    roleId int(5) unsigned not null unique,
    nickName varchar(20),
    updateTime date
) ENGINE=INNODB CHARACTER SET utf8;

-- 创建角色表role
drop table if exists role;
create table if not exists role(
    rId int(5) unsigned not null auto_increment primary key,
    roleName varchar(20) not null,
    updateTime date
) ENGINE=INNODB CHARACTER SET utf8;

-- 创建学生信息表student
drop table if exists student;
create table if not exists student(
    sId int(5) unsigned not null auto_increment primary key,
    realName varchar(10) not null,
    phone char(11),
    classId int(5) unsigned not null unique,
    sex enum('0','1')
) ENGINE=INNODB CHARACTER SET utf8;

-- 创建班级表class
drop table if exists class;
create table if not exists class(
    cId int(5) unsigned not null auto_increment primary key,
    className varchar(10) not null,
    memberNum int(2) unsigned,
    introduce varchar(200)
) ENGINE=INNODB CHARACTER SET utf8;

-- 创建老师表teacher
drop table if exists teacher;
create table if not exists teacher(
    tId int(5) unsigned not null auto_increment primary key,
    realName varchar(10) not null,
    phone char(11),
    sex enum('0','1'),
    classId int(5) unsigned not null unique,
    updateTime date
) ENGINE=INNODB CHARACTER SET utf8;

-- 创建毕业设计信息表designInfo
drop table if exists designInfo;
create table if not exists designInfo(
    dId int(5) unsigned not null auto_increment primary key,
    title varchar(10) not null,
    document varchar(50) not null,
    content varchar(1000) not null,
    auditState enum('0','1'),
    teacherId int(5) unsigned not null unique,
    studentId int(5) unsigned not null unique,
    uploadTime date not null
) ENGINE=INNODB CHARACTER SET utf8;

-- show create table table_name;

-- 外键约束

-- user-role约束
-- ALTER TABLE user 
-- drop foreign key userRole;

ALTER TABLE user 
add CONSTRAINT userRole foreign key(roleId) REFERENCES role (rId);

-- student-class约束
-- ALTER TABLE student 
-- drop foreign key studentClass;

ALTER TABLE student 
add CONSTRAINT studentClass foreign key(classId) REFERENCES class (cId);

-- teacher-class约束
-- ALTER TABLE teacher 
-- drop foreign key teacherClass;

ALTER TABLE teacher 
add CONSTRAINT teacherClass foreign key(classId) REFERENCES class (cId);

-- design-teacher约束
-- ALTER TABLE designInfo 
-- drop foreign key designTeacher;

ALTER TABLE designInfo 
add CONSTRAINT designTeacher foreign key(teacherId) REFERENCES teacher (tId);

-- design-student约束
-- ALTER TABLE designInfo 
-- drop foreign key designStudent;

ALTER TABLE designInfo 
add CONSTRAINT designStudent foreign key(studentId) REFERENCES student (tId);