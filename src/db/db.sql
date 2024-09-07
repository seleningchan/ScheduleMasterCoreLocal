
create table `__efmigrationshistory`
(
	MigrationId varchar(95) not null
		primary key,
	ProductVersion varchar(32) not null
)
;

create table scheduledelayeds
(
  id                char(36)                      not null
    primary key,
  sourceapp         varchar(50) charset utf8mb4   not null,
  topic             varchar(100) charset utf8mb4  not null,
  contentkey        varchar(100) charset utf8mb4  not null,
  delaytimespan     int                           not null,
  delayabsolutetime datetime(6)                   not null,
  createtime        datetime(6)                   not null,
  createusername    varchar(50) charset utf8mb4   null,
  executetime       datetime(6)                   null,
  finishtime        datetime(6)                   null,
  status            int                           not null,
  failedretrys      int                           not null,
  remark            varchar(255) charset utf8mb4  null,
  notifyurl         varchar(255) charset utf8mb4  not null,
  notifydatatype    varchar(50) charset utf8mb4   not null,
  notifybody        varchar(1000) charset utf8mb4 not null
);


create table scheduleexecutors
(
	id int auto_increment
		primary key,
	scheduleid char(36) not null,
	workername varchar(100) charset utf8mb4 null
)
;

create table schedulehttpoptions
(
	scheduleid char(36) not null
		primary key,
	requesturl varchar(500) charset utf8mb4 not null,
	method varchar(10) charset utf8mb4 not null,
	contenttype varchar(50) charset utf8mb4 not null,
	headers longtext charset utf8mb4 null,
	body longtext charset utf8mb4 null
)
;

create table schedulekeepers
(
	id int auto_increment
		primary key,
	scheduleid char(36) not null,
	userid int not null
)
;

create table schedulelocks
(
	scheduleid char(36) not null
		primary key,
	status int not null,
	lockedtime datetime(6) null,
	lockednode varchar(100) charset utf8mb4 null
)
;

create table schedulereferences
(
	id int auto_increment
		primary key,
	scheduleid char(36) not null,
	childid char(36) not null
)
;

create table schedules
(
	id char(36) not null
		primary key,
	title varchar(100) charset utf8mb4 not null,
	metatype int not null,
	remark varchar(500) charset utf8mb4 null,
	runloop tinyint(1) not null,
	cronexpression varchar(50) charset utf8mb4 null,
	assemblyname varchar(200) charset utf8mb4 null,
	classname varchar(200) charset utf8mb4 null,
	customparamsjson longtext charset utf8mb4 null,
	status int not null,
	startdate datetime(6) null,
	enddate datetime(6) null,
	createtime datetime(6) not null,
	createuserid int not null,
	createusername varchar(50) charset utf8mb4 null,
	lastruntime datetime(6) null,
	nextruntime datetime(6) null,
	totalruncount int not null
)
;

create table scheduletraces
(
	traceid char(36) not null
		primary key,
	scheduleid char(36) not null,
	node varchar(100) charset utf8mb4 null,
	starttime datetime(6) not null,
	endtime datetime(6) not null,
	elapsedtime double not null,
	result int not null
)
;

create table servernodes
(
	nodename varchar(100) charset utf8mb4 not null
		primary key,
	nodetype varchar(20) charset utf8mb4 not null,
	machinename varchar(100) charset utf8mb4 null,
	accessprotocol varchar(20) charset utf8mb4 not null,
	host varchar(100) charset utf8mb4 not null,
	accesssecret varchar(50) charset utf8mb4 null,
	lastupdatetime datetime(6) null,
	status int not null,
	priority int not null
	maxconcurrency int not null
)
;

create table systemconfigs
(
	`key` varchar(50) charset utf8mb4 not null
		primary key,
	`group` varchar(50) charset utf8mb4 not null,
	name varchar(100) charset utf8mb4 not null,
	value varchar(1000) charset utf8mb4 null,
	sort int not null,
	isreuired tinyint(1) not null,
	remark varchar(500) charset utf8mb4 null,
	createtime datetime(6) not null,
	updatetime datetime(6) null,
	updateusername varchar(50) charset utf8mb4 null
)
;

create table systemlogs
(
	id int auto_increment
		primary key,
	category int not null,
	message longtext charset utf8mb4 not null,
	stacktrace longtext charset utf8mb4 null,
	scheduleid char(36) null,
	node varchar(100) charset utf8mb4 null,
	traceid char(36) null,
	createtime datetime(6) not null
)
;

create table systemusers
(
	id int auto_increment
		primary key,
	username varchar(50) charset utf8mb4 not null,
	password varchar(50) charset utf8mb4 not null,
	realname varchar(50) charset utf8mb4 not null,
	phone varchar(15) charset utf8mb4 null,
	email varchar(500) charset utf8mb4 null,
	status int not null,
	createtime datetime(6) not null,
	lastlogintime datetime(6) null
)
;




INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('Assembly_ImagePullPolicy', '��������', '�ļ�����ȡ����', 'IfNotPresent', 1, 1, 'Always-������ȡ��IfNotPresent-����û��ʱ��ȡ��Ĭ����Always', '2020-04-05 08:57:18.417000', '2020-04-05 17:12:09.487020', 'admin');
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('Email_FromAccount', '�ʼ�����', '�������˺�', '', 3, 1, 'seed by efcore auto migration', '2020-04-05 15:38:14.583060', '2020-04-05 17:12:09.492483', 'admin');
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('Email_FromAccountPwd', '�ʼ�����', '�������˺�����', '', 4, 1, 'seed by efcore auto migration', '2020-04-05 15:38:14.583060', '2020-04-05 17:12:09.493020', 'admin');
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('Email_SmtpPort', '�ʼ�����', '�ʼ��������˿�', '25', 2, 1, 'seed by efcore auto migration', '2020-04-05 15:38:14.583053', '2020-04-05 17:12:09.491849', 'admin');
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('Email_SmtpServer', '�ʼ�����', '�ʼ�������', '', 1, 1, 'seed by efcore auto migration', '2020-04-05 15:38:14.582863', '2020-04-05 17:12:09.491180', 'admin');
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('Http_RequestTimeout', 'HTTP����', '����ʱʱ��', '10', 1, 1, '��λ���룬Ĭ��ֵ��10', '2020-04-08 06:48:48.201000', null, null);
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('System_WorkerUnHealthTimes', 'ϵͳ����', 'Worker��������Ӧ����', '3', 1, 1, '�������ʧ�ܴﵽ�������ᱻ�����޳���Ĭ��ֵ��3', '2020-04-08 06:48:48.201000', null, null);
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('DelayTask_RetryTimes', '��ʱ��������', '�ص�ʧ�����Դ���', '3', 2, 1, '�ص�ʧ�����Դ�����Ĭ��ֵ��3', '2020-05-13 09:25:48.361080', null, null);
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('DelayTask_RetrySpans', '��ʱ��������', '�ص�ʧ�����Լ��', '10', 3, 1, '�ص�ʧ�����Լ��ʱ��(s)��Ĭ��ֵ��10��', '2020-05-13 09:25:48.361080', null, null);
INSERT INTO schedule_master.systemconfigs (`key`, `group`, name, value, sort, isreuired, remark, createtime, updatetime, updateusername) VALUES ('DelayTask_DelayPattern', '��ʱ��������', '�ӳ�ģʽ', 'Relative', 1, 1, 'Relative-���ʱ�䣬Absolute-����ʱ�䣬Ĭ��ֵ��Relative', '2020-05-13 09:25:48.361080', null, null);

