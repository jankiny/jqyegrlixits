/****** Object:  Table [dbo].[S_User]    Script Date: 2020/10/25 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[StudentId] [nvarchar](450) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_S_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_Deliver]    Script Date: 2020/10/25 22:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Deliver]
AS
SELECT   dbo.S_Deliver.Id, dbo.C_Job.Name AS JobName, dbo.S_ResumeSubmitted.Title, 
                dbo.Dir_DeliverStatus.Text AS DeliverStatus, dbo.S_Deliver.DeliverDateTime, dbo.S_ResumeSubmitted.StudentId
FROM      dbo.S_Deliver INNER JOIN
                dbo.C_Job ON dbo.S_Deliver.JobId = dbo.C_Job.Id INNER JOIN
                dbo.S_ResumeSubmitted ON dbo.S_Deliver.ResumeSubmittedId = dbo.S_ResumeSubmitted.Id INNER JOIN
                dbo.Dir_DeliverStatus ON dbo.S_Deliver.DeliverStatusId = dbo.Dir_DeliverStatus.DeliverStatusId

GO
/****** Object:  View [dbo].[View_InterviewNotifyList]    Script Date: 2020/10/25 22:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_InterviewNotifyList]
AS
SELECT   dbo.C_InterviewNotify.Id, dbo.C_Job.Name AS JobName, dbo.C_InterviewNotify.Title, 
                dbo.C_InterviewNotify.InterviewDate, dbo.C_InterviewNotify.InterviewLocation, dbo.C_InterviewNotify.Note, 
                dbo.S_ResumeSubmitted.StudentId
FROM      dbo.C_InterviewNotify INNER JOIN
                dbo.S_Deliver ON dbo.C_InterviewNotify.DeliverId = dbo.S_Deliver.Id INNER JOIN
                dbo.C_Job ON dbo.S_Deliver.JobId = dbo.C_Job.Id INNER JOIN
                dbo.S_ResumeSubmitted ON dbo.S_Deliver.ResumeSubmittedId = dbo.S_ResumeSubmitted.Id

GO
/****** Object:  View [dbo].[View_Job]    Script Date: 2020/10/25 22:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Job]
AS
SELECT   dbo.C_Job.Name, dbo.C_Job.JobCharacterId, dbo.C_Job.JobKindId, dbo.C_Job.JobPayId, dbo.C_Job.LocationId, 
                dbo.C_Job.DegreeId, dbo.C_Job.RecruitNumber, dbo.Dir_Degree.Text AS Degree, dbo.Dir_Location.Text AS Location, 
                dbo.Dir_JobCharacter.Text AS JobCharacter, dbo.Dir_JobPay.Text AS JobPay, dbo.C_Job.Description, dbo.C_Job.Id, 
                dbo.Dir_JobKind.Text AS JobKind
FROM      dbo.C_Job INNER JOIN
                dbo.Dir_JobKind ON dbo.C_Job.JobKindId = dbo.Dir_JobKind.JobKindId INNER JOIN
                dbo.Dir_JobCharacter ON dbo.C_Job.JobCharacterId = dbo.Dir_JobCharacter.JobCharacterId INNER JOIN
                dbo.Dir_JobPay ON dbo.C_Job.JobPayId = dbo.Dir_JobPay.JobPayId INNER JOIN
                dbo.Dir_JobStatus ON dbo.C_Job.JobStatusId = dbo.Dir_JobStatus.JobStatusId INNER JOIN
                dbo.Dir_Location ON dbo.C_Job.LocationId = dbo.Dir_Location.LocationId INNER JOIN
                dbo.Dir_Degree ON dbo.C_Job.DegreeId = dbo.Dir_Degree.DegreeId

GO

/* [dbo].[Dir_CompanyField] */
GO
SET IDENTITY_INSERT [dbo].[Dir_CompanyField] ON 
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (1, N'广告')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (2, N'航天航空与国防')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (3, N'农产品')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (4, N'服装零售')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (5, N'应用软件')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (6, N'汽车制造')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (7, N'通信设备')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (8, N'综合性银行')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (9, N'药品零售')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (10, N'教育服务')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (11, N'系统软件')
INSERT [dbo].[Dir_CompanyField] ([CompanyFieldId], [Text]) VALUES (12, N'出版')
SET IDENTITY_INSERT [dbo].[Dir_CompanyField] OFF 
GO


/* [dbo].[Dir_CompanyScale] */
GO
SET IDENTITY_INSERT [dbo].[Dir_CompanyScale] ON 
INSERT [dbo].[Dir_CompanyScale] ([CompanyScaleId], [Text]) VALUES (1, N'20人以下')
INSERT [dbo].[Dir_CompanyScale] ([CompanyScaleId], [Text]) VALUES (2, N'20-99人')
INSERT [dbo].[Dir_CompanyScale] ([CompanyScaleId], [Text]) VALUES (3, N'100-499人')
INSERT [dbo].[Dir_CompanyScale] ([CompanyScaleId], [Text]) VALUES (4, N'50-999人')
INSERT [dbo].[Dir_CompanyScale] ([CompanyScaleId], [Text]) VALUES (5, N'1000-9999人')
INSERT [dbo].[Dir_CompanyScale] ([CompanyScaleId], [Text]) VALUES (6, N'10000人以上')
SET IDENTITY_INSERT [dbo].[Dir_CompanyScale] OFF 
GO

/* [dbo].[Dir_Degree] */
GO
SET IDENTITY_INSERT [dbo].[Dir_Degree] ON 
INSERT [dbo].[Dir_Degree] ([DegreeId], [Text]) VALUES (1, N'博士')
INSERT [dbo].[Dir_Degree] ([DegreeId], [Text]) VALUES (2, N'硕士')
INSERT [dbo].[Dir_Degree] ([DegreeId], [Text]) VALUES (3, N'本科')
INSERT [dbo].[Dir_Degree] ([DegreeId], [Text]) VALUES (4, N'专科')
INSERT [dbo].[Dir_Degree] ([DegreeId], [Text]) VALUES (5, N'中专')
INSERT [dbo].[Dir_Degree] ([DegreeId], [Text]) VALUES (6, N'高职')
SET IDENTITY_INSERT [dbo].[Dir_Degree] OFF 
GO

/* [dbo].[Dir_DeliverStatus] */
GO
SET IDENTITY_INSERT [dbo].[Dir_DeliverStatus] ON 
INSERT [dbo].[Dir_DeliverStatus] ([DeliverStatusId], [Text]) VALUES (1, N'待审核')
INSERT [dbo].[Dir_DeliverStatus] ([DeliverStatusId], [Text]) VALUES (2, N'审核通过')
INSERT [dbo].[Dir_DeliverStatus] ([DeliverStatusId], [Text]) VALUES (3, N'审核未通过')
SET IDENTITY_INSERT [dbo].[Dir_DeliverStatus] OFF 
GO

/* [dbo].[Dir_JobCharacter] */
GO
SET IDENTITY_INSERT [dbo].[Dir_JobCharacter] ON 
INSERT [dbo].[Dir_JobCharacter] ([JobCharacterId], [Text]) VALUES (1, N'全职')
INSERT [dbo].[Dir_JobCharacter] ([JobCharacterId], [Text]) VALUES (2, N'临时')
INSERT [dbo].[Dir_JobCharacter] ([JobCharacterId], [Text]) VALUES (3, N'实习')
INSERT [dbo].[Dir_JobCharacter] ([JobCharacterId], [Text]) VALUES (4, N'兼职')
SET IDENTITY_INSERT [dbo].[Dir_JobCharacter] OFF 
GO

/* [dbo].[Dir_JobKind] */
GO
SET IDENTITY_INSERT [dbo].[Dir_JobKind] ON 
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (0, N'不限')
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (1, N'不限')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10000, N'计算机类')
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10001, N'系统分析员')
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10002, N'软件（测试）工程师')
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10003, N'硬件（测试）工程师')
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10004, N'系统工程师/网管')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10005, N'网站策划/信息编辑')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10006, N'网页设计/电脑美工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10007, N'Internet/Web/电子商')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10008, N'软件测试')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10009, N'网络工程')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10010, N'网站策划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10011, N'多媒体设计与开发')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10012, N'计算机辅助设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10013, N'数据库开发管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10014, N'系统集成与支持')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10015, N'系统安全管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10016, N'网络设备维护')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10017, N'游戏开发策划与设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (10018, N'软件开发项目管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20000, N'经营/管理类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20001, N'(正/副)总裁/总经理/C')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20002, N'企业策划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20003, N'投资管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20004, N'企管部经理/企业管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20005, N'企业管理人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20006, N'质管部经理/质量管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20007, N'质管人员/质量工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20008, N'技术经理/项目经理/CT')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20009, N'信息主管/CIO')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20010, N'宣传主管')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20011, N'超市经营管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20012, N'专业招商人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20013, N'管理咨询顾问')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (20014, N'产品经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30000, N'财务类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30001, N'财务总监/经理/副经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30002, N'会计师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30003, N'会计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30004, N'出纳/收银')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30005, N'统计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30006, N'审计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (30007, N'预算师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40000, N'销售/业务类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40001, N'销售经理/副经理/主任')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40002, N'商务/贸易/国际贸易')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40003, N'销售工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40004, N'业务员/业务代表')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40005, N'报关')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40006, N'医药代表')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40007, N'跟单')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40008, N'电话销售')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40009, N'单证员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40010, N'大客户经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40011, N'售前支持工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40012, N'售后支持工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40013, N'渠道')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40014, N'促销员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (40015, N'区域经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50000, N'市场类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50001, N'市场部经理/副经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50002, N'市场/行销策划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50003, N'市场调研/业务分析')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50004, N'公关、促销、礼仪')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50005, N'信息员/联络员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50006, N'超市促销员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50007, N'市场总监')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50008, N'渠道经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50009, N'策划部经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (50010, N'产品推广')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60000, N'秘书类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60001, N'商业秘书')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60002, N'生活秘书')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60003, N'钟点秘书')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60004, N'大学生秘书')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60005, N'网络钟点秘书')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (60006, N'企业秘书')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70000, N'设计类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70001, N'美术/图形设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70002, N'广告设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70003, N'文案策划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70004, N'工业设计/产品设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70005, N'多媒体设计与制作')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70006, N'装潢设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70007, N'工艺品设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70008, N'纺织品设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70009, N'家具/珠宝设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70010, N'电脑绘图人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70011, N'室内设计师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70012, N'建筑设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70013, N'机械设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70014, N'制冷暖通设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70015, N'展览设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70016, N'平面设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70017, N'电路设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70018, N'服装设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70019, N'包装设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70020, N'电气设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70021, N'CAD制图')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70022, N'3D设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70023, N'景观设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70024, N'模具设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (70025, N'软件界面设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (80000, N'客户服务类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (80001, N'客服部经理/副经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (80002, N'技术支持/客户培训')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (80003, N'客服/热线咨询')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (80004, N'前台/接待')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (80005, N'售后服务')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90000, N'行政/人事/培训类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90001, N'行政/人力资源经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90002, N'行政/人事人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90003, N'员工培训人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90004, N'企业文化/工会')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90005, N'培训部经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90006, N'总经理助理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90007, N'培训师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90008, N'内勤')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90009, N'办公室主任')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (90010, N'职业顾问')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100000, N'文职类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100001, N'英语翻译')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100002, N'其他外语翻译')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100003, N'图书情报/资料档案管')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100004, N'技术资料编写')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100005, N'文秘/高级文员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100006, N'文员/电脑打字员/操作')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100007, N'编辑记者')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100008, N'日语翻译')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (100009, N'文案策划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110000, N'工业/工厂类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110001, N'厂长/副厂长')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110002, N'生产管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110003, N'工程管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110004, N'品质管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110005, N'物料管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110006, N'设备管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110007, N'采购管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110008, N'仓库管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110009, N'计划员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110010, N'化验工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110011, N'技术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110012, N'普工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110013, N'人事劳资管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110014, N'安全管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110015, N'施工管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110016, N'检验员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110017, N'生产调度')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (110018, N'PE工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120000, N'后勤/服务类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120001, N'司机/驾驶员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120002, N'保安/厨师/清洁工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120003, N'服务员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120004, N'营业员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120005, N'后勤管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (120006, N'导购员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130000, N'电子/通讯类专业人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130001, N'电子工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130002, N'电子元器件工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130003, N'自动控制')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130004, N'智能大厦/综合布线/弱')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130005, N'仪器仪表/计量')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130006, N'电气工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130007, N'电力工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130008, N'通讯工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130009, N'单片机/DSP/低层软件')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130010, N'通讯产品维修')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130011, N'电机工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130012, N'自动化仪表')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130013, N'电子仪表')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130014, N'半导体工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130015, N'汽车电子')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130016, N'机电一体化工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (130017, N'无线电')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140000, N'机械专业人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140001, N'机械工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140002, N'模具工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140003, N'机电工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140004, N'各种车辆/飞行器设计')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140005, N'设备机械维修')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140006, N'机修工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140007, N'冶金机械')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140008, N'化工机械')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140009, N'医疗器械工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140010, N'机械制图')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (140011, N'机械加工工艺')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150000, N'房地产/建筑专业人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150001, N'房地产开发/策划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150002, N'房地产评估/交易')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150003, N'建筑/结构工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150004, N'工程监理师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150005, N'工程预决算')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150006, N'给排水/水电工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150007, N'制冷暖通')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150008, N'物业管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150009, N'房地产营销策划师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150010, N'房地产经纪人')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150011, N'桥梁道路')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150012, N'土建工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150013, N'装饰装修工程')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150014, N'土木工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150015, N'责任工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150016, N'注册造价工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150017, N'市政')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (150018, N'工程主管')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160000, N'金融/经济专业人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160001, N'金融业')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160002, N'证券期货')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160003, N'保险业')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160004, N'税务人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160005, N'其他金融/经济人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160006, N'资产评估')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160007, N'文教体卫/法律专业人')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160008, N'新闻/出版')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160009, N'广播电视/文化艺术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160010, N'高等教育')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160011, N'中等教育')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160012, N'小学/幼儿教育')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160013, N'职业教育/培训/家教')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160014, N'体育类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160015, N'卫生医疗')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160016, N'律师/法律顾问')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160017, N'医师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160018, N'护理/护士')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160019, N'编剧')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160020, N'培训讲师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160021, N'临床医学')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160022, N'歌手/乐手')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (160023, N'影视演员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170000, N'服务业专业人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170001, N'旅游/导游')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170002, N'酒店/餐饮')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170003, N'寻呼/声讯')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170004, N'其他服务行业')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170005, N'大堂经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170006, N'店面管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170007, N'客房部经理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170008, N'家政')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170009, N'模特')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (170010, N'经纪人')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180000, N'其他专业人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180001, N'动力/能源')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180002, N'声光学技术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180003, N'化工技术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180004, N'制药')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180005, N'测绘技术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180006, N'道桥技术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180007, N'环境/城市规划')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180008, N'地质/矿产')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180009, N'粮食/食品/糖酒')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180010, N'纺织服装技术')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180011, N'包装/印刷/造纸')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180012, N'冶金/喷涂/金属材料')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180013, N'安全消防')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180014, N'农林渔牧/园林/园艺')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180015, N'交通运输（海陆空）')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180016, N'畜牧/兽医')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180017, N'物流管理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180018, N'电化学')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180019, N'办公设备')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180020, N'分子生物学')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180021, N'免疫学')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180022, N'强电/弱电')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180023, N'灯光音响师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180024, N'玩具产品工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180025, N'光机电一体化工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180026, N'营养师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180027, N'摄像师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180028, N'美容师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180029, N'船员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180030, N'腐蚀防护')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180031, N'热处理工程师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180032, N'摄影师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180033, N'化妆师')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180034, N'水处理')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180035, N'石油化工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180036, N'铸造')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (180037, N'橡胶')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190000, N'技工类')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190001, N'钳工/机修工/钣金工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190002, N'电焊工/铆焊工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190003, N'车/磨/铣/冲/锣工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190004, N'模具工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190005, N'水工/木工/油漆工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190006, N'电工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190007, N'空调/电梯/锅炉工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190008, N'叉车工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190009, N'裁剪车缝熨烫')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190010, N'普通工人')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190011, N'派送员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190012, N'保洁工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190013, N'操作工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190014, N'铸造')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190015, N'电镀')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190016, N'汽车修理工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190017, N'电器维修工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190018, N'机械操作工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190019, N'印刷工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190020, N'营业员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190021, N'安装/调试人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190022, N'手工艺品制作工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190023, N'报验员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190024, N'话务员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190025, N'投递员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (190026, N'装卸工')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (200000, N'其他人员')
GO
INSERT [dbo].[Dir_JobKind] ([JobKindId], [Text]) VALUES (200001, N'其他人员')
SET IDENTITY_INSERT [dbo].[Dir_JobKind] OFF 
GO

/* [dbo].[Dir_JobPay] */
GO
SET IDENTITY_INSERT [dbo].[Dir_JobPay] ON 
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (1, N'1000以下', 0, 1000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (2, N'1k~2k', 1000, 2000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (3, N'2k~3k', 2000, 3000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (4, N'3k~4k', 3000, 4000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (5, N'4k~6k', 4000, 6000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (6, N'6k~8k', 6000, 8000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (7, N'8k~1k', 8000, 10000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (8, N'10k~15k', 10000, 15000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (9, N'15k~20k', 15000, 20000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (10, N'20k~30k', 20000, 30000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (11, N'30k~50k', 30000, 50000)
INSERT [dbo].[Dir_JobPay] ([JobPayId], [Text], [PayFrom], [PayTo]) VALUES (12, N'50k以上', 50000, 10000000)
SET IDENTITY_INSERT [dbo].[Dir_JobPay] OFF 
GO

/* [dbo].[Dir_JobStatus] */
GO
SET IDENTITY_INSERT [dbo].[Dir_JobStatus] ON 
INSERT [dbo].[Dir_JobStatus] ([JobStatusId], [Text]) VALUES (1, N'招聘中')
INSERT [dbo].[Dir_JobStatus] ([JobStatusId], [Text]) VALUES (2, N'招聘结束')
SET IDENTITY_INSERT [dbo].[Dir_JobStatus] OFF 
GO

/* [dbo].[Dir_Nation] */
GO
SET IDENTITY_INSERT [dbo].[Dir_Nation] ON 
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'01', N'汉族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'02', N'蒙古族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'03', N'回族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'04', N'藏族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'05', N'维吾尔族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'06', N'苗族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'07', N'彝族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'08', N'壮族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'09', N'布依族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'10', N'朝鲜族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'11', N'满族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'12', N'侗族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'13', N'瑶族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'14', N'白族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'15', N'土家族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'16', N'哈尼族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'17', N'哈萨克族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'18', N'傣族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'19', N'黎族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'20', N'傈傈族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'21', N'佤族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'22', N'畲族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'23', N'高山族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'24', N'拉祜族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'25', N'水族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'26', N'东乡族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'27', N'纳西族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'28', N'景颇族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'29', N'柯尔族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'30', N'土族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'31', N'达斡尔族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'32', N'仫佬族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'33', N'羌族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'34', N'布朗族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'35', N'撒拉族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'36', N'毛难族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'37', N'仡佬族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'38', N'锡伯族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'39', N'阿昌族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'40', N'普米族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'41', N'塔吉克族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'42', N'怒族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'43', N'乌孜别克族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'44', N'俄罗斯族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'45', N'鄂温克族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'46', N'崩龙族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'47', N'保安族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'48', N'裕固族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'49', N'京族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'50', N'塔塔尔族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'51', N'独龙族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'52', N'鄂伦春族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'53', N'赫哲族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'54', N'门巴族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'55', N'珞巴族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'56', N'基诺族')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'97', N'其他')
INSERT [dbo].[Dir_Nation] ([NationId], [Text]) VALUES (N'98', N'外国血统中国籍人士')
SET IDENTITY_INSERT [dbo].[Dir_Nation] OFF 
GO

/* [dbo].[Dir_PoliticalOutlook] */
GO
SET IDENTITY_INSERT [dbo].[Dir_PoliticalOutlook] ON 
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (1, N'中共党员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (2, N'中共预备党员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (3, N'共青团员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (4, N'民革会员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (5, N'民盟盟员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (6, N'民建会员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (7, N'民进会员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (8, N'农工党党员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (9, N'致公党党员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (10, N'九三学社社员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (11, N'台盟盟员')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (12, N'无党派民主人士')
INSERT [dbo].[Dir_PoliticalOutlook] ([PoliticalOutlookId], [Text]) VALUES (13, N'群众')
SET IDENTITY_INSERT [dbo].[Dir_PoliticalOutlook] OFF 
GO



/* [dbo].[Dir_Location] */
GO
SET IDENTITY_INSERT [dbo].[Dir_Location] ON 
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110000', N'北京市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110100', N'北京市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110101', N'北京市东城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110102', N'北京市西城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110103', N'北京市崇文区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110104', N'北京市宣武区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110105', N'北京市朝阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110106', N'北京市丰台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110107', N'北京市石景山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110108', N'北京市海淀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110109', N'北京市门头沟区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110111', N'北京市房山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110112', N'北京市通州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110113', N'北京市顺义区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110114', N'北京市昌平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110115', N'北京市大兴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110116', N'北京市怀柔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110117', N'北京市平谷区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110200', N'北京市县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110228', N'北京市密云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'110229', N'北京市延庆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120000', N'天津市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120100', N'天津市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120101', N'天津市和平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120102', N'天津市河东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120103', N'天津市河西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120104', N'天津市南开区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120105', N'天津市河北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120106', N'天津市红桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120107', N'天津市塘沽区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120108', N'天津市汉沽区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120109', N'天津市大港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120110', N'天津市东丽区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120111', N'天津市西青区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120112', N'天津市津南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120113', N'天津市北辰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120114', N'天津市武清区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120115', N'天津市宝坻区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120200', N'天津市县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120221', N'天津市宁河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120223', N'天津市静海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'120225', N'天津市蓟县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130000', N'河北省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130100', N'河北省石家庄市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130101', N'河北省石家庄市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130102', N'河北省石家庄市长安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130103', N'河北省石家庄市桥东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130104', N'河北省石家庄市桥西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130105', N'河北省石家庄市新华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130107', N'河北省石家庄市井陉矿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130108', N'河北省石家庄市裕华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130121', N'河北省石家庄市井陉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130123', N'河北省石家庄市正定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130124', N'河北省石家庄市栾城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130125', N'河北省石家庄市行唐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130126', N'河北省石家庄市灵寿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130127', N'河北省石家庄市高邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130128', N'河北省石家庄市深泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130129', N'河北省石家庄市赞皇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130130', N'河北省石家庄市无极县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130131', N'河北省石家庄市平山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130132', N'河北省石家庄市元氏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130133', N'河北省石家庄市赵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130181', N'河北省石家庄市辛集市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130182', N'河北省石家庄市藁城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130183', N'河北省石家庄市晋州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130184', N'河北省石家庄市新乐市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130185', N'河北省石家庄市鹿泉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130200', N'河北省唐山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130201', N'河北省唐山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130202', N'河北省唐山市路南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130203', N'河北省唐山市路北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130204', N'河北省唐山市古冶区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130205', N'河北省唐山市开平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130207', N'河北省唐山市丰南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130208', N'河北省唐山市丰润区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130223', N'河北省唐山市滦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130224', N'河北省唐山市滦南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130225', N'河北省唐山市乐亭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130227', N'河北省唐山市迁西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130229', N'河北省唐山市玉田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130230', N'河北省唐山市唐海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130281', N'河北省唐山市遵化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130283', N'河北省唐山市迁安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130300', N'河北省秦皇岛市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130301', N'河北省秦皇岛市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130302', N'河北省秦皇岛市海港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130303', N'河北省秦皇岛市山海关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130304', N'河北省秦皇岛市北戴河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130321', N'河北省秦皇岛市青龙满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130322', N'河北省秦皇岛市昌黎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130323', N'河北省秦皇岛市抚宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130324', N'河北省秦皇岛市卢龙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130400', N'河北省邯郸市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130401', N'河北省邯郸市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130402', N'河北省邯郸市邯山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130403', N'河北省邯郸市丛台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130404', N'河北省邯郸市复兴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130406', N'河北省邯郸市峰峰矿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130421', N'河北省邯郸市邯郸县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130423', N'河北省邯郸市临漳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130424', N'河北省邯郸市成安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130425', N'河北省邯郸市大名县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130426', N'河北省邯郸市涉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130427', N'河北省邯郸市磁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130428', N'河北省邯郸市肥乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130429', N'河北省邯郸市永年县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130430', N'河北省邯郸市邱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130431', N'河北省邯郸市鸡泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130432', N'河北省邯郸市广平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130433', N'河北省邯郸市馆陶县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130434', N'河北省邯郸市魏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130435', N'河北省邯郸市曲周县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130481', N'河北省邯郸市武安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130500', N'河北省邢台市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130501', N'河北省邢台市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130502', N'河北省邢台市桥东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130503', N'河北省邢台市桥西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130521', N'河北省邢台市邢台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130522', N'河北省邢台市临城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130523', N'河北省邢台市内丘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130524', N'河北省邢台市柏乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130525', N'河北省邢台市隆尧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130526', N'河北省邢台市任县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130527', N'河北省邢台市南和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130528', N'河北省邢台市宁晋县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130529', N'河北省邢台市巨鹿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130530', N'河北省邢台市新河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130531', N'河北省邢台市广宗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130532', N'河北省邢台市平乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130533', N'河北省邢台市威县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130534', N'河北省邢台市清河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130535', N'河北省邢台市临西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130581', N'河北省邢台市南宫市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130582', N'河北省邢台市沙河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130600', N'河北省保定市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130601', N'河北省保定市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130602', N'河北省保定市新市区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130603', N'河北省保定市北市区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130604', N'河北省保定市南市区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130621', N'河北省保定市满城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130622', N'河北省保定市清苑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130623', N'河北省保定市涞水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130624', N'河北省保定市阜平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130625', N'河北省保定市徐水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130626', N'河北省保定市定兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130627', N'河北省保定市唐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130628', N'河北省保定市高阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130629', N'河北省保定市容城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130630', N'河北省保定市涞源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130631', N'河北省保定市望都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130632', N'河北省保定市安新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130633', N'河北省保定市易县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130634', N'河北省保定市曲阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130635', N'河北省保定市蠡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130636', N'河北省保定市顺平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130637', N'河北省保定市博野县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130638', N'河北省保定市雄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130681', N'河北省保定市涿州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130682', N'河北省保定市定州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130683', N'河北省保定市安国市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130684', N'河北省保定市高碑店市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130700', N'河北省张家口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130701', N'河北省张家口市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130702', N'河北省张家口市桥东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130703', N'河北省张家口市桥西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130705', N'河北省张家口市宣化区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130706', N'河北省张家口市下花园区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130721', N'河北省张家口市宣化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130722', N'河北省张家口市张北县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130723', N'河北省张家口市康保县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130724', N'河北省张家口市沽源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130725', N'河北省张家口市尚义县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130726', N'河北省张家口市蔚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130727', N'河北省张家口市阳原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130728', N'河北省张家口市怀安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130729', N'河北省张家口市万全县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130730', N'河北省张家口市怀来县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130731', N'河北省张家口市涿鹿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130732', N'河北省张家口市赤城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130733', N'河北省张家口市崇礼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130800', N'河北省承德市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130801', N'河北省承德市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130802', N'河北省承德市双桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130803', N'河北省承德市双滦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130804', N'河北省承德市鹰手营子矿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130821', N'河北省承德市承德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130822', N'河北省承德市兴隆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130823', N'河北省承德市平泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130824', N'河北省承德市滦平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130825', N'河北省承德市隆化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130826', N'河北省承德市丰宁满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130827', N'河北省承德市宽城满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130828', N'河北省承德市围场满族蒙古族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130900', N'河北省沧州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130901', N'河北省沧州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130902', N'河北省沧州市新华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130903', N'河北省沧州市运河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130921', N'河北省沧州市沧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130922', N'河北省沧州市青县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130923', N'河北省沧州市东光县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130924', N'河北省沧州市海兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130925', N'河北省沧州市盐山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130926', N'河北省沧州市肃宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130927', N'河北省沧州市南皮县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130928', N'河北省沧州市吴桥县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130929', N'河北省沧州市献县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130930', N'河北省沧州市孟村回族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130981', N'河北省沧州市泊头市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130982', N'河北省沧州市任丘市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130983', N'河北省沧州市黄骅市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'130984', N'河北省沧州市河间市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131000', N'河北省廊坊市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131001', N'河北省廊坊市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131002', N'河北省廊坊市安次区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131003', N'河北省廊坊市广阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131022', N'河北省廊坊市固安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131023', N'河北省廊坊市永清县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131024', N'河北省廊坊市香河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131025', N'河北省廊坊市大城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131026', N'河北省廊坊市文安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131028', N'河北省廊坊市大厂回族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131081', N'河北省廊坊市霸州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131082', N'河北省廊坊市三河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131100', N'河北省衡水市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131101', N'河北省衡水市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131102', N'河北省衡水市桃城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131121', N'河北省衡水市枣强县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131122', N'河北省衡水市武邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131123', N'河北省衡水市武强县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131124', N'河北省衡水市饶阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131125', N'河北省衡水市安平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131126', N'河北省衡水市故城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131127', N'河北省衡水市景县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131128', N'河北省衡水市阜城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131181', N'河北省衡水市冀州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'131182', N'河北省衡水市深州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140000', N'山西省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140100', N'山西省太原市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140101', N'山西省太原市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140105', N'山西省太原市小店区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140106', N'山西省太原市迎泽区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140107', N'山西省太原市杏花岭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140108', N'山西省太原市尖草坪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140109', N'山西省太原市万柏林区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140110', N'山西省太原市晋源区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140121', N'山西省太原市清徐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140122', N'山西省太原市阳曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140123', N'山西省太原市娄烦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140181', N'山西省太原市古交市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140200', N'山西省大同市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140201', N'山西省大同市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140202', N'山西省大同市城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140203', N'山西省大同市矿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140211', N'山西省大同市南郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140212', N'山西省大同市新荣区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140221', N'山西省大同市阳高县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140222', N'山西省大同市天镇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140223', N'山西省大同市广灵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140224', N'山西省大同市灵丘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140225', N'山西省大同市浑源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140226', N'山西省大同市左云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140227', N'山西省大同市大同县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140300', N'山西省阳泉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140301', N'山西省阳泉市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140302', N'山西省阳泉市城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140303', N'山西省阳泉市矿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140311', N'山西省阳泉市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140321', N'山西省阳泉市平定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140322', N'山西省阳泉市盂县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140400', N'山西省长治市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140401', N'山西省长治市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140402', N'山西省长治市城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140411', N'山西省长治市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140421', N'山西省长治市长治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140423', N'山西省长治市襄垣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140424', N'山西省长治市屯留县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140425', N'山西省长治市平顺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140426', N'山西省长治市黎城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140427', N'山西省长治市壶关县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140428', N'山西省长治市长子县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140429', N'山西省长治市武乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140430', N'山西省长治市沁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140431', N'山西省长治市沁源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140481', N'山西省长治市潞城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140500', N'山西省晋城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140501', N'山西省晋城市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140502', N'山西省晋城市城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140521', N'山西省晋城市沁水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140522', N'山西省晋城市阳城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140524', N'山西省晋城市陵川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140525', N'山西省晋城市泽州县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140581', N'山西省晋城市高平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140600', N'山西省朔州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140601', N'山西省朔州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140602', N'山西省朔州市朔城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140603', N'山西省朔州市平鲁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140621', N'山西省朔州市山阴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140622', N'山西省朔州市应县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140623', N'山西省朔州市右玉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140624', N'山西省朔州市怀仁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140700', N'山西省晋中市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140701', N'山西省晋中市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140702', N'山西省晋中市榆次区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140721', N'山西省晋中市榆社县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140722', N'山西省晋中市左权县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140723', N'山西省晋中市和顺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140724', N'山西省晋中市昔阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140725', N'山西省晋中市寿阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140726', N'山西省晋中市太谷县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140727', N'山西省晋中市祁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140728', N'山西省晋中市平遥县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140729', N'山西省晋中市灵石县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140781', N'山西省晋中市介休市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140800', N'山西省运城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140801', N'山西省运城市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140802', N'山西省运城市盐湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140821', N'山西省运城市临猗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140822', N'山西省运城市万荣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140823', N'山西省运城市闻喜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140824', N'山西省运城市稷山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140825', N'山西省运城市新绛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140826', N'山西省运城市绛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140827', N'山西省运城市垣曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140828', N'山西省运城市夏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140829', N'山西省运城市平陆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140830', N'山西省运城市芮城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140881', N'山西省运城市永济市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140882', N'山西省运城市河津市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140900', N'山西省忻州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140901', N'山西省忻州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140902', N'山西省忻州市忻府区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140921', N'山西省忻州市定襄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140922', N'山西省忻州市五台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140923', N'山西省忻州市代县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140924', N'山西省忻州市繁峙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140925', N'山西省忻州市宁武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140926', N'山西省忻州市静乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140927', N'山西省忻州市神池县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140928', N'山西省忻州市五寨县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140929', N'山西省忻州市岢岚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140930', N'山西省忻州市河曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140931', N'山西省忻州市保德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140932', N'山西省忻州市偏关县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'140981', N'山西省忻州市原平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141000', N'山西省临汾市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141001', N'山西省临汾市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141002', N'山西省临汾市尧都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141021', N'山西省临汾市曲沃县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141022', N'山西省临汾市翼城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141023', N'山西省临汾市襄汾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141024', N'山西省临汾市洪洞县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141025', N'山西省临汾市古县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141026', N'山西省临汾市安泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141027', N'山西省临汾市浮山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141028', N'山西省临汾市吉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141029', N'山西省临汾市乡宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141030', N'山西省临汾市大宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141031', N'山西省临汾市隰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141032', N'山西省临汾市永和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141033', N'山西省临汾市蒲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141034', N'山西省临汾市汾西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141081', N'山西省临汾市侯马市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141082', N'山西省临汾市霍州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141100', N'山西省吕梁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141101', N'山西省吕梁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141102', N'山西省吕梁市离石区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141121', N'山西省吕梁市文水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141122', N'山西省吕梁市交城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141123', N'山西省吕梁市兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141124', N'山西省吕梁市临县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141125', N'山西省吕梁市柳林县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141126', N'山西省吕梁市石楼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141127', N'山西省吕梁市岚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141128', N'山西省吕梁市方山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141129', N'山西省吕梁市中阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141130', N'山西省吕梁市交口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141181', N'山西省吕梁市孝义市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'141182', N'山西省吕梁市汾阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150000', N'内蒙古自治区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150100', N'内蒙古自治区呼和浩特市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150101', N'内蒙古自治区呼和浩特市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150102', N'内蒙古自治区呼和浩特市新城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150103', N'内蒙古自治区呼和浩特市回民区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150104', N'内蒙古自治区呼和浩特市玉泉区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150105', N'内蒙古自治区呼和浩特市赛罕区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150121', N'内蒙古自治区呼和浩特市土默特左')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150122', N'内蒙古自治区呼和浩特市托克托县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150123', N'内蒙古自治区呼和浩特市和林格尔')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150124', N'内蒙古自治区呼和浩特市清水河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150125', N'内蒙古自治区呼和浩特市武川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150200', N'内蒙古自治区包头市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150201', N'内蒙古自治区包头市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150202', N'内蒙古自治区包头市东河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150203', N'内蒙古自治区包头市昆都仑区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150204', N'内蒙古自治区包头市青山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150205', N'内蒙古自治区包头市石拐区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150206', N'内蒙古自治区包头市白云矿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150207', N'内蒙古自治区包头市九原区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150221', N'内蒙古自治区包头市土默特右旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150222', N'内蒙古自治区包头市固阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150223', N'内蒙古自治区包头市达尔罕茂明安')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150300', N'内蒙古自治区乌海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150301', N'内蒙古自治区乌海市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150302', N'内蒙古自治区乌海市海勃湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150303', N'内蒙古自治区乌海市海南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150304', N'内蒙古自治区乌海市乌达区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150400', N'内蒙古自治区赤峰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150401', N'内蒙古自治区赤峰市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150402', N'内蒙古自治区赤峰市红山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150403', N'内蒙古自治区赤峰市元宝山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150404', N'内蒙古自治区赤峰市松山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150421', N'内蒙古自治区赤峰市阿鲁科尔沁旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150422', N'内蒙古自治区赤峰市巴林左旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150423', N'内蒙古自治区赤峰市巴林右旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150424', N'内蒙古自治区赤峰市林西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150425', N'内蒙古自治区赤峰市克什克腾旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150426', N'内蒙古自治区赤峰市翁牛特旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150428', N'内蒙古自治区赤峰市喀喇沁旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150429', N'内蒙古自治区赤峰市宁城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150430', N'内蒙古自治区赤峰市敖汉旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150500', N'内蒙古自治区通辽市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150501', N'内蒙古自治区通辽市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150502', N'内蒙古自治区通辽市科尔沁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150521', N'内蒙古自治区通辽市科尔沁左翼中')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150522', N'内蒙古自治区通辽市科尔沁左翼后')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150523', N'内蒙古自治区通辽市开鲁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150524', N'内蒙古自治区通辽市库伦旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150525', N'内蒙古自治区通辽市奈曼旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150526', N'内蒙古自治区通辽市扎鲁特旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150581', N'内蒙古自治区通辽市霍林郭勒市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150600', N'内蒙古自治区鄂尔多斯市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150602', N'内蒙古自治区鄂尔多斯市东胜区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150621', N'内蒙古自治区鄂尔多斯市达拉特旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150622', N'内蒙古自治区鄂尔多斯市准格尔旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150623', N'内蒙古自治区鄂尔多斯市鄂托克前')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150624', N'内蒙古自治区鄂尔多斯市鄂托克旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150625', N'内蒙古自治区鄂尔多斯市杭锦旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150626', N'内蒙古自治区鄂尔多斯市乌审旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150627', N'内蒙古自治区鄂尔多斯市伊金霍洛')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150700', N'内蒙古自治区呼伦贝尔市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150701', N'内蒙古自治区呼伦贝尔市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150702', N'内蒙古自治区呼伦贝尔市海拉尔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150721', N'内蒙古自治区呼伦贝尔市阿荣旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150722', N'内蒙古自治区呼伦贝尔市莫力达瓦')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150723', N'内蒙古自治区呼伦贝尔市鄂伦春自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150724', N'内蒙古自治区呼伦贝尔市鄂温克族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150725', N'内蒙古自治区呼伦贝尔市陈巴尔虎')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150726', N'内蒙古自治区呼伦贝尔市新巴尔虎')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150727', N'内蒙古自治区呼伦贝尔市新巴尔虎')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150781', N'内蒙古自治区呼伦贝尔市满洲里市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150782', N'内蒙古自治区呼伦贝尔市牙克石市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150783', N'内蒙古自治区呼伦贝尔市扎兰屯市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150784', N'内蒙古自治区呼伦贝尔市额尔古纳')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150785', N'内蒙古自治区呼伦贝尔市根河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150800', N'内蒙古自治区巴彦淖尔市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150801', N'内蒙古自治区巴彦淖尔市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150802', N'内蒙古自治区巴彦淖尔市临河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150821', N'内蒙古自治区巴彦淖尔市五原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150822', N'内蒙古自治区巴彦淖尔市磴口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150823', N'内蒙古自治区巴彦淖尔市乌拉特前')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150824', N'内蒙古自治区巴彦淖尔市乌拉特中')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150825', N'内蒙古自治区巴彦淖尔市乌拉特后')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150826', N'内蒙古自治区巴彦淖尔市杭锦后旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150900', N'内蒙古自治区乌兰察布市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150901', N'内蒙古自治区乌兰察布市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150902', N'内蒙古自治区乌兰察布市集宁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150921', N'内蒙古自治区乌兰察布市卓资县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150922', N'内蒙古自治区乌兰察布市化德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150923', N'内蒙古自治区乌兰察布市商都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150924', N'内蒙古自治区乌兰察布市兴和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150925', N'内蒙古自治区乌兰察布市凉城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150926', N'内蒙古自治区乌兰察布市察哈尔右')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150927', N'内蒙古自治区乌兰察布市察哈尔右')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150928', N'内蒙古自治区乌兰察布市察哈尔右')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150929', N'内蒙古自治区乌兰察布市四子王旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'150981', N'内蒙古自治区乌兰察布市丰镇市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152200', N'内蒙古自治区兴安盟')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152201', N'内蒙古自治区兴安盟乌兰浩特市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152202', N'内蒙古自治区兴安盟阿尔山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152221', N'内蒙古自治区兴安盟科尔沁右翼前')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152222', N'内蒙古自治区兴安盟科尔沁右翼中')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152223', N'内蒙古自治区兴安盟扎赉特旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152224', N'内蒙古自治区兴安盟突泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152500', N'内蒙古自治区锡林郭勒盟')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152501', N'内蒙古自治区锡林郭勒盟二连浩特')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152502', N'内蒙古自治区锡林郭勒盟锡林浩特')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152522', N'内蒙古自治区锡林郭勒盟阿巴嘎旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152523', N'内蒙古自治区锡林郭勒盟苏尼特左')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152524', N'内蒙古自治区锡林郭勒盟苏尼特右')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152525', N'内蒙古自治区锡林郭勒盟东乌珠穆')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152526', N'内蒙古自治区锡林郭勒盟西乌珠穆')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152527', N'内蒙古自治区锡林郭勒盟太仆寺旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152528', N'内蒙古自治区锡林郭勒盟镶黄旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152529', N'内蒙古自治区锡林郭勒盟正镶白旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152530', N'内蒙古自治区锡林郭勒盟正蓝旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152531', N'内蒙古自治区锡林郭勒盟多伦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152600', N'内蒙古自治区乌兰察布盟')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152900', N'内蒙古自治区阿拉善盟')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152921', N'内蒙古自治区阿拉善盟阿拉善左旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152922', N'内蒙古自治区阿拉善盟阿拉善右旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'152923', N'内蒙古自治区阿拉善盟额济纳旗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210000', N'辽宁省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210100', N'辽宁省沈阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210101', N'辽宁省沈阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210102', N'辽宁省沈阳市和平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210103', N'辽宁省沈阳市沈河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210104', N'辽宁省沈阳市大东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210105', N'辽宁省沈阳市皇姑区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210106', N'辽宁省沈阳市铁西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210111', N'辽宁省沈阳市苏家屯区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210112', N'辽宁省沈阳市东陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210113', N'辽宁省沈阳市新城子区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210114', N'辽宁省沈阳市于洪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210122', N'辽宁省沈阳市辽中县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210123', N'辽宁省沈阳市康平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210124', N'辽宁省沈阳市法库县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210181', N'辽宁省沈阳市新民市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210200', N'辽宁省大连市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210201', N'辽宁省大连市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210202', N'辽宁省大连市中山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210203', N'辽宁省大连市西岗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210204', N'辽宁省大连市沙河口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210211', N'辽宁省大连市甘井子区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210212', N'辽宁省大连市旅顺口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210213', N'辽宁省大连市金州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210224', N'辽宁省大连市长海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210281', N'辽宁省大连市瓦房店市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210282', N'辽宁省大连市普兰店市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210283', N'辽宁省大连市庄河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210300', N'辽宁省鞍山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210301', N'辽宁省鞍山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210302', N'辽宁省鞍山市铁东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210303', N'辽宁省鞍山市铁西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210304', N'辽宁省鞍山市立山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210311', N'辽宁省鞍山市千山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210321', N'辽宁省鞍山市台安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210323', N'辽宁省鞍山市岫岩满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210381', N'辽宁省鞍山市海城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210400', N'辽宁省抚顺市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210401', N'辽宁省抚顺市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210402', N'辽宁省抚顺市新抚区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210403', N'辽宁省抚顺市东洲区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210404', N'辽宁省抚顺市望花区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210411', N'辽宁省抚顺市顺城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210421', N'辽宁省抚顺市抚顺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210422', N'辽宁省抚顺市新宾满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210423', N'辽宁省抚顺市清原满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210500', N'辽宁省本溪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210501', N'辽宁省本溪市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210502', N'辽宁省本溪市平山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210503', N'辽宁省本溪市溪湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210504', N'辽宁省本溪市明山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210505', N'辽宁省本溪市南芬区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210521', N'辽宁省本溪市本溪满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210522', N'辽宁省本溪市桓仁满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210600', N'辽宁省丹东市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210601', N'辽宁省丹东市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210602', N'辽宁省丹东市元宝区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210603', N'辽宁省丹东市振兴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210604', N'辽宁省丹东市振安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210624', N'辽宁省丹东市宽甸满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210681', N'辽宁省丹东市东港市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210682', N'辽宁省丹东市凤城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210700', N'辽宁省锦州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210701', N'辽宁省锦州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210702', N'辽宁省锦州市古塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210703', N'辽宁省锦州市凌河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210711', N'辽宁省锦州市太和区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210726', N'辽宁省锦州市黑山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210727', N'辽宁省锦州市义县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210781', N'辽宁省锦州市凌海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210782', N'辽宁省锦州市北宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210800', N'辽宁省营口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210801', N'辽宁省营口市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210802', N'辽宁省营口市站前区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210803', N'辽宁省营口市西市区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210804', N'辽宁省营口市鲅鱼圈区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210811', N'辽宁省营口市老边区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210881', N'辽宁省营口市盖州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210882', N'辽宁省营口市大石桥市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210900', N'辽宁省阜新市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210901', N'辽宁省阜新市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210902', N'辽宁省阜新市海州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210903', N'辽宁省阜新市新邱区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210904', N'辽宁省阜新市太平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210905', N'辽宁省阜新市清河门区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210911', N'辽宁省阜新市细河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210921', N'辽宁省阜新市阜新蒙古族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'210922', N'辽宁省阜新市彰武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211000', N'辽宁省辽阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211001', N'辽宁省辽阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211002', N'辽宁省辽阳市白塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211003', N'辽宁省辽阳市文圣区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211004', N'辽宁省辽阳市宏伟区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211005', N'辽宁省辽阳市弓长岭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211011', N'辽宁省辽阳市太子河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211021', N'辽宁省辽阳市辽阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211081', N'辽宁省辽阳市灯塔市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211100', N'辽宁省盘锦市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211101', N'辽宁省盘锦市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211102', N'辽宁省盘锦市双台子区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211103', N'辽宁省盘锦市兴隆台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211121', N'辽宁省盘锦市大洼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211122', N'辽宁省盘锦市盘山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211200', N'辽宁省铁岭市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211201', N'辽宁省铁岭市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211202', N'辽宁省铁岭市银州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211204', N'辽宁省铁岭市清河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211221', N'辽宁省铁岭市铁岭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211223', N'辽宁省铁岭市西丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211224', N'辽宁省铁岭市昌图县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211281', N'辽宁省铁岭市调兵山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211282', N'辽宁省铁岭市开原市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211300', N'辽宁省朝阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211301', N'辽宁省朝阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211302', N'辽宁省朝阳市双塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211303', N'辽宁省朝阳市龙城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211321', N'辽宁省朝阳市朝阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211322', N'辽宁省朝阳市建平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211324', N'辽宁省朝阳市喀喇沁左翼蒙古族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211381', N'辽宁省朝阳市北票市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211382', N'辽宁省朝阳市凌源市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211400', N'辽宁省葫芦岛市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211401', N'辽宁省葫芦岛市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211402', N'辽宁省葫芦岛市连山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211403', N'辽宁省葫芦岛市龙港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211404', N'辽宁省葫芦岛市南票区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211421', N'辽宁省葫芦岛市绥中县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211422', N'辽宁省葫芦岛市建昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'211481', N'辽宁省葫芦岛市兴城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220000', N'吉林省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220100', N'吉林省长春市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220101', N'吉林省长春市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220102', N'吉林省长春市南关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220103', N'吉林省长春市宽城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220104', N'吉林省长春市朝阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220105', N'吉林省长春市二道区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220106', N'吉林省长春市绿园区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220112', N'吉林省长春市双阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220122', N'吉林省长春市农安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220181', N'吉林省长春市九台市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220182', N'吉林省长春市榆树市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220183', N'吉林省长春市德惠市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220200', N'吉林省吉林市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220201', N'吉林省吉林市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220202', N'吉林省吉林市昌邑区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220203', N'吉林省吉林市龙潭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220204', N'吉林省吉林市船营区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220211', N'吉林省吉林市丰满区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220221', N'吉林省吉林市永吉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220281', N'吉林省吉林市蛟河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220282', N'吉林省吉林市桦甸市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220283', N'吉林省吉林市舒兰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220284', N'吉林省吉林市磐石市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220300', N'吉林省四平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220301', N'吉林省四平市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220302', N'吉林省四平市铁西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220303', N'吉林省四平市铁东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220322', N'吉林省四平市梨树县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220323', N'吉林省四平市伊通满族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220381', N'吉林省四平市公主岭市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220382', N'吉林省四平市双辽市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220400', N'吉林省辽源市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220401', N'吉林省辽源市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220402', N'吉林省辽源市龙山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220403', N'吉林省辽源市西安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220421', N'吉林省辽源市东丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220422', N'吉林省辽源市东辽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220500', N'吉林省通化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220501', N'吉林省通化市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220502', N'吉林省通化市东昌区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220503', N'吉林省通化市二道江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220521', N'吉林省通化市通化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220523', N'吉林省通化市辉南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220524', N'吉林省通化市柳河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220581', N'吉林省通化市梅河口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220582', N'吉林省通化市集安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220600', N'吉林省白山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220601', N'吉林省白山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220602', N'吉林省白山市八道江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220621', N'吉林省白山市抚松县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220622', N'吉林省白山市靖宇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220623', N'吉林省白山市长白朝鲜族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220625', N'吉林省白山市江源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220681', N'吉林省白山市临江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220700', N'吉林省松原市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220701', N'吉林省松原市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220702', N'吉林省松原市宁江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220721', N'吉林省松原市前郭尔罗斯蒙古族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220722', N'吉林省松原市长岭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220723', N'吉林省松原市乾安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220724', N'吉林省松原市扶余县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220800', N'吉林省白城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220801', N'吉林省白城市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220802', N'吉林省白城市洮北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220821', N'吉林省白城市镇赉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220822', N'吉林省白城市通榆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220881', N'吉林省白城市洮南市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'220882', N'吉林省白城市大安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222400', N'吉林省延边朝鲜族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222401', N'吉林省延边朝鲜族自治州延吉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222402', N'吉林省延边朝鲜族自治州图们市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222403', N'吉林省延边朝鲜族自治州敦化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222404', N'吉林省延边朝鲜族自治州珲春市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222405', N'吉林省延边朝鲜族自治州龙井市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222406', N'吉林省延边朝鲜族自治州和龙市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222424', N'吉林省延边朝鲜族自治州汪清县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'222426', N'吉林省延边朝鲜族自治州安图县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230000', N'黑龙江省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230100', N'黑龙江省哈尔滨市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230101', N'黑龙江省哈尔滨市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230102', N'黑龙江省哈尔滨市道里区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230103', N'黑龙江省哈尔滨市南岗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230104', N'黑龙江省哈尔滨市道外区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230106', N'黑龙江省哈尔滨市香坊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230107', N'黑龙江省哈尔滨市动力区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230108', N'黑龙江省哈尔滨市平房区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230109', N'黑龙江省哈尔滨市松北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230111', N'黑龙江省哈尔滨市呼兰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230123', N'黑龙江省哈尔滨市依兰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230124', N'黑龙江省哈尔滨市方正县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230125', N'黑龙江省哈尔滨市宾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230126', N'黑龙江省哈尔滨市巴彦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230127', N'黑龙江省哈尔滨市木兰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230128', N'黑龙江省哈尔滨市通河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230129', N'黑龙江省哈尔滨市延寿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230181', N'黑龙江省哈尔滨市阿城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230182', N'黑龙江省哈尔滨市双城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230183', N'黑龙江省哈尔滨市尚志市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230184', N'黑龙江省哈尔滨市五常市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230200', N'黑龙江省齐齐哈尔市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230201', N'黑龙江省齐齐哈尔市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230202', N'黑龙江省齐齐哈尔市龙沙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230203', N'黑龙江省齐齐哈尔市建华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230204', N'黑龙江省齐齐哈尔市铁锋区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230205', N'黑龙江省齐齐哈尔市昂昂溪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230206', N'黑龙江省齐齐哈尔市富拉尔基区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230207', N'黑龙江省齐齐哈尔市碾子山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230208', N'黑龙江省齐齐哈尔市梅里斯达斡尔')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230221', N'黑龙江省齐齐哈尔市龙江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230223', N'黑龙江省齐齐哈尔市依安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230224', N'黑龙江省齐齐哈尔市泰来县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230225', N'黑龙江省齐齐哈尔市甘南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230227', N'黑龙江省齐齐哈尔市富裕县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230229', N'黑龙江省齐齐哈尔市克山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230230', N'黑龙江省齐齐哈尔市克东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230231', N'黑龙江省齐齐哈尔市拜泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230281', N'黑龙江省齐齐哈尔市讷河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230300', N'黑龙江省鸡西市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230301', N'黑龙江省鸡西市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230302', N'黑龙江省鸡西市鸡冠区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230303', N'黑龙江省鸡西市恒山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230304', N'黑龙江省鸡西市滴道区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230305', N'黑龙江省鸡西市梨树区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230306', N'黑龙江省鸡西市城子河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230307', N'黑龙江省鸡西市麻山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230321', N'黑龙江省鸡西市鸡东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230381', N'黑龙江省鸡西市虎林市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230382', N'黑龙江省鸡西市密山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230400', N'黑龙江省鹤岗市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230401', N'黑龙江省鹤岗市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230402', N'黑龙江省鹤岗市向阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230403', N'黑龙江省鹤岗市工农区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230404', N'黑龙江省鹤岗市南山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230405', N'黑龙江省鹤岗市兴安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230406', N'黑龙江省鹤岗市东山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230407', N'黑龙江省鹤岗市兴山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230421', N'黑龙江省鹤岗市萝北县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230422', N'黑龙江省鹤岗市绥滨县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230500', N'黑龙江省双鸭山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230501', N'黑龙江省双鸭山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230502', N'黑龙江省双鸭山市尖山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230503', N'黑龙江省双鸭山市岭东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230505', N'黑龙江省双鸭山市四方台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230506', N'黑龙江省双鸭山市宝山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230521', N'黑龙江省双鸭山市集贤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230522', N'黑龙江省双鸭山市友谊县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230523', N'黑龙江省双鸭山市宝清县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230524', N'黑龙江省双鸭山市饶河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230600', N'黑龙江省大庆市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230601', N'黑龙江省大庆市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230602', N'黑龙江省大庆市萨尔图区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230603', N'黑龙江省大庆市龙凤区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230604', N'黑龙江省大庆市让胡路区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230605', N'黑龙江省大庆市红岗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230606', N'黑龙江省大庆市大同区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230621', N'黑龙江省大庆市肇州县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230622', N'黑龙江省大庆市肇源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230623', N'黑龙江省大庆市林甸县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230624', N'黑龙江省大庆市杜尔伯特蒙古族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230700', N'黑龙江省伊春市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230701', N'黑龙江省伊春市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230702', N'黑龙江省伊春市伊春区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230703', N'黑龙江省伊春市南岔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230704', N'黑龙江省伊春市友好区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230705', N'黑龙江省伊春市西林区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230706', N'黑龙江省伊春市翠峦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230707', N'黑龙江省伊春市新青区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230708', N'黑龙江省伊春市美溪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230709', N'黑龙江省伊春市金山屯区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230710', N'黑龙江省伊春市五营区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230711', N'黑龙江省伊春市乌马河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230712', N'黑龙江省伊春市汤旺河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230713', N'黑龙江省伊春市带岭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230714', N'黑龙江省伊春市乌伊岭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230715', N'黑龙江省伊春市红星区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230716', N'黑龙江省伊春市上甘岭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230722', N'黑龙江省伊春市嘉荫县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230781', N'黑龙江省伊春市铁力市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230800', N'黑龙江省佳木斯市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230801', N'黑龙江省佳木斯市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230802', N'黑龙江省佳木斯市永红区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230803', N'黑龙江省佳木斯市向阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230804', N'黑龙江省佳木斯市前进区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230805', N'黑龙江省佳木斯市东风区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230811', N'黑龙江省佳木斯市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230822', N'黑龙江省佳木斯市桦南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230826', N'黑龙江省佳木斯市桦川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230828', N'黑龙江省佳木斯市汤原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230833', N'黑龙江省佳木斯市抚远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230881', N'黑龙江省佳木斯市同江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230882', N'黑龙江省佳木斯市富锦市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230900', N'黑龙江省七台河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230901', N'黑龙江省七台河市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230902', N'黑龙江省七台河市新兴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230903', N'黑龙江省七台河市桃山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230904', N'黑龙江省七台河市茄子河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'230921', N'黑龙江省七台河市勃利县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231000', N'黑龙江省牡丹江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231001', N'黑龙江省牡丹江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231002', N'黑龙江省牡丹江市东安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231003', N'黑龙江省牡丹江市阳明区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231004', N'黑龙江省牡丹江市爱民区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231005', N'黑龙江省牡丹江市西安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231024', N'黑龙江省牡丹江市东宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231025', N'黑龙江省牡丹江市林口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231081', N'黑龙江省牡丹江市绥芬河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231083', N'黑龙江省牡丹江市海林市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231084', N'黑龙江省牡丹江市宁安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231085', N'黑龙江省牡丹江市穆棱市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231100', N'黑龙江省黑河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231101', N'黑龙江省黑河市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231102', N'黑龙江省黑河市爱辉区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231121', N'黑龙江省黑河市嫩江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231123', N'黑龙江省黑河市逊克县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231124', N'黑龙江省黑河市孙吴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231181', N'黑龙江省黑河市北安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231182', N'黑龙江省黑河市五大连池市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231200', N'黑龙江省绥化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231201', N'黑龙江省绥化市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231202', N'黑龙江省绥化市北林区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231221', N'黑龙江省绥化市望奎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231222', N'黑龙江省绥化市兰西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231223', N'黑龙江省绥化市青冈县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231224', N'黑龙江省绥化市庆安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231225', N'黑龙江省绥化市明水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231226', N'黑龙江省绥化市绥棱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231281', N'黑龙江省绥化市安达市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231282', N'黑龙江省绥化市肇东市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'231283', N'黑龙江省绥化市海伦市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'232700', N'黑龙江省大兴安岭地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'232721', N'黑龙江省大兴安岭地区呼玛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'232722', N'黑龙江省大兴安岭地区塔河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'232723', N'黑龙江省大兴安岭地区漠河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310000', N'上海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310100', N'上海市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310101', N'上海市黄浦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310103', N'上海市卢湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310104', N'上海市徐汇区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310105', N'上海市长宁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310106', N'上海市静安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310107', N'上海市普陀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310108', N'上海市闸北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310109', N'上海市虹口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310110', N'上海市杨浦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310112', N'上海市闵行区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310113', N'上海市宝山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310114', N'上海市嘉定区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310115', N'上海市浦东新区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310116', N'上海市金山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310117', N'上海市松江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310118', N'上海市青浦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310119', N'上海市南汇区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310120', N'上海市奉贤区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310200', N'上海市县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'310230', N'上海市崇明县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320000', N'江苏省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320100', N'江苏省南京市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320101', N'江苏省南京市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320102', N'江苏省南京市玄武区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320103', N'江苏省南京市白下区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320104', N'江苏省南京市秦淮区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320105', N'江苏省南京市建邺区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320106', N'江苏省南京市鼓楼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320107', N'江苏省南京市下关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320111', N'江苏省南京市浦口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320113', N'江苏省南京市栖霞区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320114', N'江苏省南京市雨花台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320115', N'江苏省南京市江宁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320116', N'江苏省南京市六合区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320124', N'江苏省南京市溧水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320125', N'江苏省南京市高淳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320200', N'江苏省无锡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320201', N'江苏省无锡市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320202', N'江苏省无锡市崇安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320203', N'江苏省无锡市南长区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320204', N'江苏省无锡市北塘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320205', N'江苏省无锡市锡山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320206', N'江苏省无锡市惠山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320211', N'江苏省无锡市滨湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320281', N'江苏省无锡市江阴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320282', N'江苏省无锡市宜兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320300', N'江苏省徐州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320301', N'江苏省徐州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320302', N'江苏省徐州市鼓楼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320303', N'江苏省徐州市云龙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320304', N'江苏省徐州市九里区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320305', N'江苏省徐州市贾汪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320311', N'江苏省徐州市泉山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320321', N'江苏省徐州市丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320322', N'江苏省徐州市沛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320323', N'江苏省徐州市铜山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320324', N'江苏省徐州市睢宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320381', N'江苏省徐州市新沂市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320382', N'江苏省徐州市邳州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320400', N'江苏省常州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320401', N'江苏省常州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320402', N'江苏省常州市天宁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320404', N'江苏省常州市钟楼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320405', N'江苏省常州市戚墅堰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320411', N'江苏省常州市新北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320412', N'江苏省常州市武进区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320481', N'江苏省常州市溧阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320482', N'江苏省常州市金坛市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320500', N'江苏省苏州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320501', N'江苏省苏州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320502', N'江苏省苏州市沧浪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320503', N'江苏省苏州市平江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320504', N'江苏省苏州市金阊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320505', N'江苏省苏州市虎丘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320506', N'江苏省苏州市吴中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320507', N'江苏省苏州市相城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320581', N'江苏省苏州市常熟市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320582', N'江苏省苏州市张家港市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320583', N'江苏省苏州市昆山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320584', N'江苏省苏州市吴江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320585', N'江苏省苏州市太仓市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320600', N'江苏省南通市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320601', N'江苏省南通市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320602', N'江苏省南通市崇川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320611', N'江苏省南通市港闸区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320621', N'江苏省南通市海安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320623', N'江苏省南通市如东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320681', N'江苏省南通市启东市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320682', N'江苏省南通市如皋市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320683', N'江苏省南通市通州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320684', N'江苏省南通市海门市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320700', N'江苏省连云港市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320701', N'江苏省连云港市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320703', N'江苏省连云港市连云区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320705', N'江苏省连云港市新浦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320706', N'江苏省连云港市海州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320721', N'江苏省连云港市赣榆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320722', N'江苏省连云港市东海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320723', N'江苏省连云港市灌云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320724', N'江苏省连云港市灌南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320800', N'江苏省淮安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320801', N'江苏省淮安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320802', N'江苏省淮安市清河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320803', N'江苏省淮安市楚州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320804', N'江苏省淮安市淮阴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320811', N'江苏省淮安市清浦区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320826', N'江苏省淮安市涟水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320829', N'江苏省淮安市洪泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320830', N'江苏省淮安市盱眙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320831', N'江苏省淮安市金湖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320900', N'江苏省盐城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320901', N'江苏省盐城市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320902', N'江苏省盐城市亭湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320903', N'江苏省盐城市盐都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320921', N'江苏省盐城市响水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320922', N'江苏省盐城市滨海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320923', N'江苏省盐城市阜宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320924', N'江苏省盐城市射阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320925', N'江苏省盐城市建湖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320981', N'江苏省盐城市东台市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'320982', N'江苏省盐城市大丰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321000', N'江苏省扬州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321001', N'江苏省扬州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321002', N'江苏省扬州市广陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321003', N'江苏省扬州市邗江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321011', N'江苏省扬州市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321023', N'江苏省扬州市宝应县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321081', N'江苏省扬州市仪征市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321084', N'江苏省扬州市高邮市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321088', N'江苏省扬州市江都市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321100', N'江苏省镇江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321101', N'江苏省镇江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321102', N'江苏省镇江市京口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321111', N'江苏省镇江市润州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321112', N'江苏省镇江市丹徒区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321181', N'江苏省镇江市丹阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321182', N'江苏省镇江市扬中市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321183', N'江苏省镇江市句容市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321200', N'江苏省泰州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321201', N'江苏省泰州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321202', N'江苏省泰州市海陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321203', N'江苏省泰州市高港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321281', N'江苏省泰州市兴化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321282', N'江苏省泰州市靖江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321283', N'江苏省泰州市泰兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321284', N'江苏省泰州市姜堰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321300', N'江苏省宿迁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321301', N'江苏省宿迁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321302', N'江苏省宿迁市宿城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321311', N'江苏省宿迁市宿豫区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321322', N'江苏省宿迁市沭阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321323', N'江苏省宿迁市泗阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'321324', N'江苏省宿迁市泗洪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330000', N'浙江省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330100', N'浙江省杭州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330101', N'浙江省杭州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330102', N'浙江省杭州市上城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330103', N'浙江省杭州市下城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330104', N'浙江省杭州市江干区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330105', N'浙江省杭州市拱墅区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330106', N'浙江省杭州市西湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330108', N'浙江省杭州市滨江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330109', N'浙江省杭州市萧山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330110', N'浙江省杭州市余杭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330122', N'浙江省杭州市桐庐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330127', N'浙江省杭州市淳安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330182', N'浙江省杭州市建德市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330183', N'浙江省杭州市富阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330185', N'浙江省杭州市临安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330200', N'浙江省宁波市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330201', N'浙江省宁波市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330203', N'浙江省宁波市海曙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330204', N'浙江省宁波市江东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330205', N'浙江省宁波市江北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330206', N'浙江省宁波市北仑区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330211', N'浙江省宁波市镇海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330212', N'浙江省宁波市鄞州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330225', N'浙江省宁波市象山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330226', N'浙江省宁波市宁海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330281', N'浙江省宁波市余姚市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330282', N'浙江省宁波市慈溪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330283', N'浙江省宁波市奉化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330300', N'浙江省温州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330301', N'浙江省温州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330302', N'浙江省温州市鹿城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330303', N'浙江省温州市龙湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330304', N'浙江省温州市瓯海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330322', N'浙江省温州市洞头县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330324', N'浙江省温州市永嘉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330326', N'浙江省温州市平阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330327', N'浙江省温州市苍南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330328', N'浙江省温州市文成县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330329', N'浙江省温州市泰顺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330381', N'浙江省温州市瑞安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330382', N'浙江省温州市乐清市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330400', N'浙江省嘉兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330401', N'浙江省嘉兴市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330402', N'浙江省嘉兴市秀城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330411', N'浙江省嘉兴市秀洲区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330421', N'浙江省嘉兴市嘉善县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330424', N'浙江省嘉兴市海盐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330481', N'浙江省嘉兴市海宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330482', N'浙江省嘉兴市平湖市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330483', N'浙江省嘉兴市桐乡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330500', N'浙江省湖州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330501', N'浙江省湖州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330502', N'浙江省湖州市吴兴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330503', N'浙江省湖州市南浔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330521', N'浙江省湖州市德清县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330522', N'浙江省湖州市长兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330523', N'浙江省湖州市安吉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330600', N'浙江省绍兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330601', N'浙江省绍兴市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330602', N'浙江省绍兴市越城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330621', N'浙江省绍兴市绍兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330624', N'浙江省绍兴市新昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330681', N'浙江省绍兴市诸暨市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330682', N'浙江省绍兴市上虞市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330683', N'浙江省绍兴市嵊州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330700', N'浙江省金华市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330701', N'浙江省金华市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330702', N'浙江省金华市婺城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330703', N'浙江省金华市金东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330723', N'浙江省金华市武义县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330726', N'浙江省金华市浦江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330727', N'浙江省金华市磐安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330781', N'浙江省金华市兰溪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330782', N'浙江省金华市义乌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330783', N'浙江省金华市东阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330784', N'浙江省金华市永康市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330800', N'浙江省衢州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330801', N'浙江省衢州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330802', N'浙江省衢州市柯城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330803', N'浙江省衢州市衢江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330822', N'浙江省衢州市常山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330824', N'浙江省衢州市开化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330825', N'浙江省衢州市龙游县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330881', N'浙江省衢州市江山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330900', N'浙江省舟山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330901', N'浙江省舟山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330902', N'浙江省舟山市定海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330903', N'浙江省舟山市普陀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330921', N'浙江省舟山市岱山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'330922', N'浙江省舟山市嵊泗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331000', N'浙江省台州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331001', N'浙江省台州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331002', N'浙江省台州市椒江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331003', N'浙江省台州市黄岩区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331004', N'浙江省台州市路桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331021', N'浙江省台州市玉环县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331022', N'浙江省台州市三门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331023', N'浙江省台州市天台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331024', N'浙江省台州市仙居县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331081', N'浙江省台州市温岭市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331082', N'浙江省台州市临海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331100', N'浙江省丽水市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331101', N'浙江省丽水市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331102', N'浙江省丽水市莲都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331121', N'浙江省丽水市青田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331122', N'浙江省丽水市缙云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331123', N'浙江省丽水市遂昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331124', N'浙江省丽水市松阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331125', N'浙江省丽水市云和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331126', N'浙江省丽水市庆元县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331127', N'浙江省丽水市景宁畲族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'331181', N'浙江省丽水市龙泉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340000', N'安徽省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340100', N'安徽省合肥市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340101', N'安徽省合肥市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340102', N'安徽省合肥市瑶海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340103', N'安徽省合肥市庐阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340104', N'安徽省合肥市蜀山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340111', N'安徽省合肥市包河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340121', N'安徽省合肥市长丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340122', N'安徽省合肥市肥东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340123', N'安徽省合肥市肥西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340200', N'安徽省芜湖市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340201', N'安徽省芜湖市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340202', N'安徽省芜湖市镜湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340203', N'安徽省芜湖市马塘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340204', N'安徽省芜湖市新芜区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340207', N'安徽省芜湖市鸠江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340221', N'安徽省芜湖市芜湖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340222', N'安徽省芜湖市繁昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340223', N'安徽省芜湖市南陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340300', N'安徽省蚌埠市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340301', N'安徽省蚌埠市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340302', N'安徽省蚌埠市龙子湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340303', N'安徽省蚌埠市蚌山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340304', N'安徽省蚌埠市禹会区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340311', N'安徽省蚌埠市淮上区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340321', N'安徽省蚌埠市怀远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340322', N'安徽省蚌埠市五河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340323', N'安徽省蚌埠市固镇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340400', N'安徽省淮南市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340401', N'安徽省淮南市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340402', N'安徽省淮南市大通区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340403', N'安徽省淮南市田家庵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340404', N'安徽省淮南市谢家集区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340405', N'安徽省淮南市八公山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340406', N'安徽省淮南市潘集区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340421', N'安徽省淮南市凤台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340500', N'安徽省马鞍山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340501', N'安徽省马鞍山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340502', N'安徽省马鞍山市金家庄区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340503', N'安徽省马鞍山市花山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340504', N'安徽省马鞍山市雨山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340521', N'安徽省马鞍山市当涂县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340600', N'安徽省淮北市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340601', N'安徽省淮北市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340602', N'安徽省淮北市杜集区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340603', N'安徽省淮北市相山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340604', N'安徽省淮北市烈山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340621', N'安徽省淮北市濉溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340700', N'安徽省铜陵市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340701', N'安徽省铜陵市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340702', N'安徽省铜陵市铜官山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340703', N'安徽省铜陵市狮子山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340711', N'安徽省铜陵市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340721', N'安徽省铜陵市铜陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340800', N'安徽省安庆市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340801', N'安徽省安庆市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340802', N'安徽省安庆市迎江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340803', N'安徽省安庆市大观区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340811', N'安徽省安庆市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340822', N'安徽省安庆市怀宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340823', N'安徽省安庆市枞阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340824', N'安徽省安庆市潜山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340825', N'安徽省安庆市太湖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340826', N'安徽省安庆市宿松县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340827', N'安徽省安庆市望江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340828', N'安徽省安庆市岳西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'340881', N'安徽省安庆市桐城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341000', N'安徽省黄山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341001', N'安徽省黄山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341002', N'安徽省黄山市屯溪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341003', N'安徽省黄山市黄山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341004', N'安徽省黄山市徽州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341021', N'安徽省黄山市歙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341022', N'安徽省黄山市休宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341023', N'安徽省黄山市黟县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341024', N'安徽省黄山市祁门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341100', N'安徽省滁州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341101', N'安徽省滁州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341102', N'安徽省滁州市琅琊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341103', N'安徽省滁州市南谯区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341122', N'安徽省滁州市来安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341124', N'安徽省滁州市全椒县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341125', N'安徽省滁州市定远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341126', N'安徽省滁州市凤阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341181', N'安徽省滁州市天长市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341182', N'安徽省滁州市明光市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341200', N'安徽省阜阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341201', N'安徽省阜阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341202', N'安徽省阜阳市颍州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341203', N'安徽省阜阳市颍东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341204', N'安徽省阜阳市颍泉区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341221', N'安徽省阜阳市临泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341222', N'安徽省阜阳市太和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341225', N'安徽省阜阳市阜南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341226', N'安徽省阜阳市颍上县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341282', N'安徽省阜阳市界首市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341300', N'安徽省宿州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341301', N'安徽省宿州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341302', N'安徽省宿州市墉桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341321', N'安徽省宿州市砀山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341322', N'安徽省宿州市萧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341323', N'安徽省宿州市灵璧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341324', N'安徽省宿州市泗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341400', N'安徽省巢湖市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341401', N'安徽省巢湖市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341402', N'安徽省巢湖市居巢区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341421', N'安徽省巢湖市庐江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341422', N'安徽省巢湖市无为县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341423', N'安徽省巢湖市含山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341424', N'安徽省巢湖市和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341500', N'安徽省六安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341501', N'安徽省六安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341502', N'安徽省六安市金安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341503', N'安徽省六安市裕安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341521', N'安徽省六安市寿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341522', N'安徽省六安市霍邱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341523', N'安徽省六安市舒城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341524', N'安徽省六安市金寨县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341525', N'安徽省六安市霍山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341600', N'安徽省亳州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341601', N'安徽省亳州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341602', N'安徽省亳州市谯城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341621', N'安徽省亳州市涡阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341622', N'安徽省亳州市蒙城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341623', N'安徽省亳州市利辛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341700', N'安徽省池州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341701', N'安徽省池州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341702', N'安徽省池州市贵池区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341721', N'安徽省池州市东至县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341722', N'安徽省池州市石台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341723', N'安徽省池州市青阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341800', N'安徽省宣城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341801', N'安徽省宣城市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341802', N'安徽省宣城市宣州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341821', N'安徽省宣城市郎溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341822', N'安徽省宣城市广德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341823', N'安徽省宣城市泾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341824', N'安徽省宣城市绩溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341825', N'安徽省宣城市旌德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'341881', N'安徽省宣城市宁国市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350000', N'福建省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350100', N'福建省福州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350101', N'福建省福州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350102', N'福建省福州市鼓楼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350103', N'福建省福州市台江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350104', N'福建省福州市仓山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350105', N'福建省福州市马尾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350111', N'福建省福州市晋安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350121', N'福建省福州市闽侯县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350122', N'福建省福州市连江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350123', N'福建省福州市罗源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350124', N'福建省福州市闽清县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350125', N'福建省福州市永泰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350128', N'福建省福州市平潭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350181', N'福建省福州市福清市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350182', N'福建省福州市长乐市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350200', N'福建省厦门市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350201', N'福建省厦门市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350203', N'福建省厦门市思明区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350205', N'福建省厦门市海沧区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350206', N'福建省厦门市湖里区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350211', N'福建省厦门市集美区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350212', N'福建省厦门市同安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350213', N'福建省厦门市翔安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350300', N'福建省莆田市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350301', N'福建省莆田市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350302', N'福建省莆田市城厢区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350303', N'福建省莆田市涵江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350304', N'福建省莆田市荔城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350305', N'福建省莆田市秀屿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350322', N'福建省莆田市仙游县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350400', N'福建省三明市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350401', N'福建省三明市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350402', N'福建省三明市梅列区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350403', N'福建省三明市三元区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350421', N'福建省三明市明溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350423', N'福建省三明市清流县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350424', N'福建省三明市宁化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350425', N'福建省三明市大田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350426', N'福建省三明市尤溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350427', N'福建省三明市沙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350428', N'福建省三明市将乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350429', N'福建省三明市泰宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350430', N'福建省三明市建宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350481', N'福建省三明市永安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350500', N'福建省泉州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350501', N'福建省泉州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350502', N'福建省泉州市鲤城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350503', N'福建省泉州市丰泽区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350504', N'福建省泉州市洛江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350505', N'福建省泉州市泉港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350521', N'福建省泉州市惠安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350524', N'福建省泉州市安溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350525', N'福建省泉州市永春县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350526', N'福建省泉州市德化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350527', N'福建省泉州市金门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350581', N'福建省泉州市石狮市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350582', N'福建省泉州市晋江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350583', N'福建省泉州市南安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350600', N'福建省漳州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350601', N'福建省漳州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350602', N'福建省漳州市芗城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350603', N'福建省漳州市龙文区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350622', N'福建省漳州市云霄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350623', N'福建省漳州市漳浦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350624', N'福建省漳州市诏安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350625', N'福建省漳州市长泰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350626', N'福建省漳州市东山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350627', N'福建省漳州市南靖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350628', N'福建省漳州市平和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350629', N'福建省漳州市华安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350681', N'福建省漳州市龙海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350700', N'福建省南平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350701', N'福建省南平市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350702', N'福建省南平市延平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350721', N'福建省南平市顺昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350722', N'福建省南平市浦城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350723', N'福建省南平市光泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350724', N'福建省南平市松溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350725', N'福建省南平市政和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350781', N'福建省南平市邵武市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350782', N'福建省南平市武夷山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350783', N'福建省南平市建瓯市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350784', N'福建省南平市建阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350800', N'福建省龙岩市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350801', N'福建省龙岩市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350802', N'福建省龙岩市新罗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350821', N'福建省龙岩市长汀县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350822', N'福建省龙岩市永定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350823', N'福建省龙岩市上杭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350824', N'福建省龙岩市武平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350825', N'福建省龙岩市连城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350881', N'福建省龙岩市漳平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350900', N'福建省宁德市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350901', N'福建省宁德市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350902', N'福建省宁德市蕉城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350921', N'福建省宁德市霞浦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350922', N'福建省宁德市古田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350923', N'福建省宁德市屏南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350924', N'福建省宁德市寿宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350925', N'福建省宁德市周宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350926', N'福建省宁德市柘荣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350981', N'福建省宁德市福安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'350982', N'福建省宁德市福鼎市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360000', N'江西省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360100', N'江西省南昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360101', N'江西省南昌市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360102', N'江西省南昌市东湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360103', N'江西省南昌市西湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360104', N'江西省南昌市青云谱区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360105', N'江西省南昌市湾里区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360111', N'江西省南昌市青山湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360121', N'江西省南昌市南昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360122', N'江西省南昌市新建县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360123', N'江西省南昌市安义县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360124', N'江西省南昌市进贤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360200', N'江西省景德镇市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360201', N'江西省景德镇市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360202', N'江西省景德镇市昌江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360203', N'江西省景德镇市珠山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360222', N'江西省景德镇市浮梁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360281', N'江西省景德镇市乐平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360300', N'江西省萍乡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360301', N'江西省萍乡市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360302', N'江西省萍乡市安源区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360313', N'江西省萍乡市湘东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360321', N'江西省萍乡市莲花县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360322', N'江西省萍乡市上栗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360323', N'江西省萍乡市芦溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360400', N'江西省九江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360401', N'江西省九江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360402', N'江西省九江市庐山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360403', N'江西省九江市浔阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360421', N'江西省九江市九江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360423', N'江西省九江市武宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360424', N'江西省九江市修水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360425', N'江西省九江市永修县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360426', N'江西省九江市德安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360427', N'江西省九江市星子县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360428', N'江西省九江市都昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360429', N'江西省九江市湖口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360430', N'江西省九江市彭泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360481', N'江西省九江市瑞昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360500', N'江西省新余市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360501', N'江西省新余市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360502', N'江西省新余市渝水区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360521', N'江西省新余市分宜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360600', N'江西省鹰潭市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360601', N'江西省鹰潭市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360602', N'江西省鹰潭市月湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360622', N'江西省鹰潭市余江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360681', N'江西省鹰潭市贵溪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360700', N'江西省赣州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360701', N'江西省赣州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360702', N'江西省赣州市章贡区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360721', N'江西省赣州市赣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360722', N'江西省赣州市信丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360723', N'江西省赣州市大余县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360724', N'江西省赣州市上犹县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360725', N'江西省赣州市崇义县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360726', N'江西省赣州市安远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360727', N'江西省赣州市龙南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360728', N'江西省赣州市定南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360729', N'江西省赣州市全南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360730', N'江西省赣州市宁都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360731', N'江西省赣州市于都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360732', N'江西省赣州市兴国县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360733', N'江西省赣州市会昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360734', N'江西省赣州市寻乌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360735', N'江西省赣州市石城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360781', N'江西省赣州市瑞金市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360782', N'江西省赣州市南康市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360800', N'江西省吉安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360801', N'江西省吉安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360802', N'江西省吉安市吉州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360803', N'江西省吉安市青原区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360821', N'江西省吉安市吉安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360822', N'江西省吉安市吉水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360823', N'江西省吉安市峡江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360824', N'江西省吉安市新干县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360825', N'江西省吉安市永丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360826', N'江西省吉安市泰和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360827', N'江西省吉安市遂川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360828', N'江西省吉安市万安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360829', N'江西省吉安市安福县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360830', N'江西省吉安市永新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360881', N'江西省吉安市井冈山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360900', N'江西省宜春市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360901', N'江西省宜春市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360902', N'江西省宜春市袁州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360921', N'江西省宜春市奉新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360922', N'江西省宜春市万载县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360923', N'江西省宜春市上高县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360924', N'江西省宜春市宜丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360925', N'江西省宜春市靖安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360926', N'江西省宜春市铜鼓县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360981', N'江西省宜春市丰城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360982', N'江西省宜春市樟树市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'360983', N'江西省宜春市高安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361000', N'江西省抚州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361001', N'江西省抚州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361002', N'江西省抚州市临川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361021', N'江西省抚州市南城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361022', N'江西省抚州市黎川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361023', N'江西省抚州市南丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361024', N'江西省抚州市崇仁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361025', N'江西省抚州市乐安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361026', N'江西省抚州市宜黄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361027', N'江西省抚州市金溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361028', N'江西省抚州市资溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361029', N'江西省抚州市东乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361030', N'江西省抚州市广昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361100', N'江西省上饶市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361101', N'江西省上饶市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361102', N'江西省上饶市信州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361121', N'江西省上饶市上饶县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361122', N'江西省上饶市广丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361123', N'江西省上饶市玉山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361124', N'江西省上饶市铅山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361125', N'江西省上饶市横峰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361126', N'江西省上饶市弋阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361127', N'江西省上饶市余干县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361128', N'江西省上饶市鄱阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361129', N'江西省上饶市万年县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361130', N'江西省上饶市婺源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'361181', N'江西省上饶市德兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370000', N'山东省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370100', N'山东省济南市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370101', N'山东省济南市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370102', N'山东省济南市历下区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370103', N'山东省济南市市中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370104', N'山东省济南市槐荫区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370105', N'山东省济南市天桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370112', N'山东省济南市历城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370113', N'山东省济南市长清区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370124', N'山东省济南市平阴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370125', N'山东省济南市济阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370126', N'山东省济南市商河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370181', N'山东省济南市章丘市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370200', N'山东省青岛市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370201', N'山东省青岛市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370202', N'山东省青岛市市南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370203', N'山东省青岛市市北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370205', N'山东省青岛市四方区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370211', N'山东省青岛市黄岛区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370212', N'山东省青岛市崂山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370213', N'山东省青岛市李沧区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370214', N'山东省青岛市城阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370281', N'山东省青岛市胶州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370282', N'山东省青岛市即墨市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370283', N'山东省青岛市平度市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370284', N'山东省青岛市胶南市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370285', N'山东省青岛市莱西市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370300', N'山东省淄博市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370301', N'山东省淄博市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370302', N'山东省淄博市淄川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370303', N'山东省淄博市张店区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370304', N'山东省淄博市博山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370305', N'山东省淄博市临淄区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370306', N'山东省淄博市周村区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370321', N'山东省淄博市桓台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370322', N'山东省淄博市高青县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370323', N'山东省淄博市沂源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370400', N'山东省枣庄市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370401', N'山东省枣庄市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370402', N'山东省枣庄市市中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370403', N'山东省枣庄市薛城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370404', N'山东省枣庄市峄城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370405', N'山东省枣庄市台儿庄区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370406', N'山东省枣庄市山亭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370481', N'山东省枣庄市滕州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370500', N'山东省东营市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370501', N'山东省东营市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370502', N'山东省东营市东营区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370503', N'山东省东营市河口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370521', N'山东省东营市垦利县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370522', N'山东省东营市利津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370523', N'山东省东营市广饶县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370600', N'山东省烟台市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370601', N'山东省烟台市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370602', N'山东省烟台市芝罘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370611', N'山东省烟台市福山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370612', N'山东省烟台市牟平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370613', N'山东省烟台市莱山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370634', N'山东省烟台市长岛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370681', N'山东省烟台市龙口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370682', N'山东省烟台市莱阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370683', N'山东省烟台市莱州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370684', N'山东省烟台市蓬莱市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370685', N'山东省烟台市招远市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370686', N'山东省烟台市栖霞市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370687', N'山东省烟台市海阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370700', N'山东省潍坊市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370701', N'山东省潍坊市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370702', N'山东省潍坊市潍城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370703', N'山东省潍坊市寒亭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370704', N'山东省潍坊市坊子区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370705', N'山东省潍坊市奎文区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370724', N'山东省潍坊市临朐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370725', N'山东省潍坊市昌乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370781', N'山东省潍坊市青州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370782', N'山东省潍坊市诸城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370783', N'山东省潍坊市寿光市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370784', N'山东省潍坊市安丘市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370785', N'山东省潍坊市高密市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370786', N'山东省潍坊市昌邑市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370800', N'山东省济宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370801', N'山东省济宁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370802', N'山东省济宁市市中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370811', N'山东省济宁市任城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370826', N'山东省济宁市微山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370827', N'山东省济宁市鱼台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370828', N'山东省济宁市金乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370829', N'山东省济宁市嘉祥县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370830', N'山东省济宁市汶上县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370831', N'山东省济宁市泗水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370832', N'山东省济宁市梁山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370881', N'山东省济宁市曲阜市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370882', N'山东省济宁市兖州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370883', N'山东省济宁市邹城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370900', N'山东省泰安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370901', N'山东省泰安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370902', N'山东省泰安市泰山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370903', N'山东省泰安市岱岳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370921', N'山东省泰安市宁阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370923', N'山东省泰安市东平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370982', N'山东省泰安市新泰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'370983', N'山东省泰安市肥城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371000', N'山东省威海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371001', N'山东省威海市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371002', N'山东省威海市环翠区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371081', N'山东省威海市文登市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371082', N'山东省威海市荣成市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371083', N'山东省威海市乳山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371100', N'山东省日照市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371101', N'山东省日照市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371102', N'山东省日照市东港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371121', N'山东省日照市五莲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371122', N'山东省日照市莒县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371200', N'山东省莱芜市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371201', N'山东省莱芜市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371202', N'山东省莱芜市莱城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371203', N'山东省莱芜市钢城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371300', N'山东省临沂市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371301', N'山东省临沂市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371302', N'山东省临沂市兰山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371311', N'山东省临沂市罗庄区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371312', N'山东省临沂市河东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371321', N'山东省临沂市沂南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371322', N'山东省临沂市郯城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371323', N'山东省临沂市沂水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371324', N'山东省临沂市苍山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371325', N'山东省临沂市费县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371326', N'山东省临沂市平邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371327', N'山东省临沂市莒南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371328', N'山东省临沂市蒙阴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371329', N'山东省临沂市临沭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371400', N'山东省德州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371401', N'山东省德州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371402', N'山东省德州市德城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371421', N'山东省德州市陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371422', N'山东省德州市宁津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371423', N'山东省德州市庆云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371424', N'山东省德州市临邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371425', N'山东省德州市齐河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371426', N'山东省德州市平原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371427', N'山东省德州市夏津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371428', N'山东省德州市武城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371481', N'山东省德州市乐陵市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371482', N'山东省德州市禹城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371500', N'山东省聊城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371501', N'山东省聊城市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371502', N'山东省聊城市东昌府区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371521', N'山东省聊城市阳谷县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371522', N'山东省聊城市莘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371523', N'山东省聊城市茌平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371524', N'山东省聊城市东阿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371525', N'山东省聊城市冠县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371526', N'山东省聊城市高唐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371581', N'山东省聊城市临清市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371600', N'山东省滨州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371601', N'山东省滨州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371602', N'山东省滨州市滨城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371621', N'山东省滨州市惠民县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371622', N'山东省滨州市阳信县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371623', N'山东省滨州市无棣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371624', N'山东省滨州市沾化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371625', N'山东省滨州市博兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371626', N'山东省滨州市邹平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371700', N'山东省荷泽市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371701', N'山东省荷泽市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371702', N'山东省荷泽市牡丹区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371721', N'山东省荷泽市曹县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371722', N'山东省荷泽市单县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371723', N'山东省荷泽市成武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371724', N'山东省荷泽市巨野县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371725', N'山东省荷泽市郓城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371726', N'山东省荷泽市鄄城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371727', N'山东省荷泽市定陶县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'371728', N'山东省荷泽市东明县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410000', N'河南省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410100', N'河南省郑州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410101', N'河南省郑州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410102', N'河南省郑州市中原区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410103', N'河南省郑州市二七区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410104', N'河南省郑州市管城回族区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410105', N'河南省郑州市金水区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410106', N'河南省郑州市上街区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410108', N'河南省郑州市邙山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410122', N'河南省郑州市中牟县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410181', N'河南省郑州市巩义市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410182', N'河南省郑州市荥阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410183', N'河南省郑州市新密市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410184', N'河南省郑州市新郑市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410185', N'河南省郑州市登封市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410200', N'河南省开封市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410201', N'河南省开封市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410202', N'河南省开封市龙亭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410203', N'河南省开封市顺河回族区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410204', N'河南省开封市鼓楼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410205', N'河南省开封市南关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410211', N'河南省开封市郊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410221', N'河南省开封市杞县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410222', N'河南省开封市通许县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410223', N'河南省开封市尉氏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410224', N'河南省开封市开封县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410225', N'河南省开封市兰考县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410300', N'河南省洛阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410301', N'河南省洛阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410302', N'河南省洛阳市老城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410303', N'河南省洛阳市西工区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410304', N'河南省洛阳市廛河回族区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410305', N'河南省洛阳市涧西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410306', N'河南省洛阳市吉利区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410307', N'河南省洛阳市洛龙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410322', N'河南省洛阳市孟津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410323', N'河南省洛阳市新安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410324', N'河南省洛阳市栾川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410325', N'河南省洛阳市嵩县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410326', N'河南省洛阳市汝阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410327', N'河南省洛阳市宜阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410328', N'河南省洛阳市洛宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410329', N'河南省洛阳市伊川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410381', N'河南省洛阳市偃师市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410400', N'河南省平顶山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410401', N'河南省平顶山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410402', N'河南省平顶山市新华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410403', N'河南省平顶山市卫东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410404', N'河南省平顶山市石龙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410411', N'河南省平顶山市湛河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410421', N'河南省平顶山市宝丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410422', N'河南省平顶山市叶县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410423', N'河南省平顶山市鲁山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410425', N'河南省平顶山市郏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410481', N'河南省平顶山市舞钢市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410482', N'河南省平顶山市汝州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410500', N'河南省安阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410501', N'河南省安阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410502', N'河南省安阳市文峰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410503', N'河南省安阳市北关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410505', N'河南省安阳市殷都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410506', N'河南省安阳市龙安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410522', N'河南省安阳市安阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410523', N'河南省安阳市汤阴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410526', N'河南省安阳市滑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410527', N'河南省安阳市内黄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410581', N'河南省安阳市林州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410600', N'河南省鹤壁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410601', N'河南省鹤壁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410602', N'河南省鹤壁市鹤山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410603', N'河南省鹤壁市山城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410611', N'河南省鹤壁市淇滨区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410621', N'河南省鹤壁市浚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410622', N'河南省鹤壁市淇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410700', N'河南省新乡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410701', N'河南省新乡市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410702', N'河南省新乡市红旗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410703', N'河南省新乡市卫滨区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410704', N'河南省新乡市凤泉区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410711', N'河南省新乡市牧野区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410721', N'河南省新乡市新乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410724', N'河南省新乡市获嘉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410725', N'河南省新乡市原阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410726', N'河南省新乡市延津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410727', N'河南省新乡市封丘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410728', N'河南省新乡市长垣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410781', N'河南省新乡市卫辉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410782', N'河南省新乡市辉县市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410800', N'河南省焦作市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410801', N'河南省焦作市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410802', N'河南省焦作市解放区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410803', N'河南省焦作市中站区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410804', N'河南省焦作市马村区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410811', N'河南省焦作市山阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410821', N'河南省焦作市修武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410822', N'河南省焦作市博爱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410823', N'河南省焦作市武陟县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410825', N'河南省焦作市温县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410881', N'河南省焦作市济源市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410882', N'河南省焦作市沁阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410883', N'河南省焦作市孟州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410900', N'河南省濮阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410901', N'河南省濮阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410902', N'河南省濮阳市华龙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410922', N'河南省濮阳市清丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410923', N'河南省濮阳市南乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410926', N'河南省濮阳市范县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410927', N'河南省濮阳市台前县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'410928', N'河南省濮阳市濮阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411000', N'河南省许昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411001', N'河南省许昌市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411002', N'河南省许昌市魏都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411023', N'河南省许昌市许昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411024', N'河南省许昌市鄢陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411025', N'河南省许昌市襄城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411081', N'河南省许昌市禹州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411082', N'河南省许昌市长葛市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411100', N'河南省漯河市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411101', N'河南省漯河市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411102', N'河南省漯河市源汇区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411121', N'河南省漯河市舞阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411122', N'河南省漯河市临颍县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411123', N'河南省漯河市郾城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411200', N'河南省三门峡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411201', N'河南省三门峡市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411202', N'河南省三门峡市湖滨区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411221', N'河南省三门峡市渑池县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411222', N'河南省三门峡市陕县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411224', N'河南省三门峡市卢氏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411281', N'河南省三门峡市义马市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411282', N'河南省三门峡市灵宝市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411300', N'河南省南阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411301', N'河南省南阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411302', N'河南省南阳市宛城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411303', N'河南省南阳市卧龙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411321', N'河南省南阳市南召县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411322', N'河南省南阳市方城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411323', N'河南省南阳市西峡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411324', N'河南省南阳市镇平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411325', N'河南省南阳市内乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411326', N'河南省南阳市淅川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411327', N'河南省南阳市社旗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411328', N'河南省南阳市唐河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411329', N'河南省南阳市新野县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411330', N'河南省南阳市桐柏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411381', N'河南省南阳市邓州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411400', N'河南省商丘市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411401', N'河南省商丘市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411402', N'河南省商丘市梁园区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411403', N'河南省商丘市睢阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411421', N'河南省商丘市民权县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411422', N'河南省商丘市睢县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411423', N'河南省商丘市宁陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411424', N'河南省商丘市柘城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411425', N'河南省商丘市虞城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411426', N'河南省商丘市夏邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411481', N'河南省商丘市永城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411500', N'河南省信阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411501', N'河南省信阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411502', N'河南省信阳市师河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411503', N'河南省信阳市平桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411521', N'河南省信阳市罗山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411522', N'河南省信阳市光山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411523', N'河南省信阳市新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411524', N'河南省信阳市商城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411525', N'河南省信阳市固始县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411526', N'河南省信阳市潢川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411527', N'河南省信阳市淮滨县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411528', N'河南省信阳市息县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411600', N'河南省周口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411601', N'河南省周口市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411602', N'河南省周口市川汇区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411621', N'河南省周口市扶沟县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411622', N'河南省周口市西华县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411623', N'河南省周口市商水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411624', N'河南省周口市沈丘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411625', N'河南省周口市郸城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411626', N'河南省周口市淮阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411627', N'河南省周口市太康县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411628', N'河南省周口市鹿邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411681', N'河南省周口市项城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411700', N'河南省驻马店市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411701', N'河南省驻马店市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411702', N'河南省驻马店市驿城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411721', N'河南省驻马店市西平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411722', N'河南省驻马店市上蔡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411723', N'河南省驻马店市平舆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411724', N'河南省驻马店市正阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411725', N'河南省驻马店市确山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411726', N'河南省驻马店市泌阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411727', N'河南省驻马店市汝南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411728', N'河南省驻马店市遂平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'411729', N'河南省驻马店市新蔡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420000', N'湖北省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420100', N'湖北省武汉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420101', N'湖北省武汉市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420102', N'湖北省武汉市江岸区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420103', N'湖北省武汉市江汉区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420104', N'湖北省武汉市乔口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420105', N'湖北省武汉市汉阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420106', N'湖北省武汉市武昌区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420107', N'湖北省武汉市青山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420111', N'湖北省武汉市洪山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420112', N'湖北省武汉市东西湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420113', N'湖北省武汉市汉南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420114', N'湖北省武汉市蔡甸区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420115', N'湖北省武汉市江夏区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420116', N'湖北省武汉市黄陂区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420117', N'湖北省武汉市新洲区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420200', N'湖北省黄石市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420201', N'湖北省黄石市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420202', N'湖北省黄石市黄石港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420203', N'湖北省黄石市西塞山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420204', N'湖北省黄石市下陆区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420205', N'湖北省黄石市铁山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420222', N'湖北省黄石市阳新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420281', N'湖北省黄石市大冶市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420300', N'湖北省十堰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420301', N'湖北省十堰市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420302', N'湖北省十堰市茅箭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420303', N'湖北省十堰市张湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420321', N'湖北省十堰市郧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420322', N'湖北省十堰市郧西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420323', N'湖北省十堰市竹山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420324', N'湖北省十堰市竹溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420325', N'湖北省十堰市房县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420381', N'湖北省十堰市丹江口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420500', N'湖北省宜昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420501', N'湖北省宜昌市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420502', N'湖北省宜昌市西陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420503', N'湖北省宜昌市伍家岗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420504', N'湖北省宜昌市点军区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420505', N'湖北省宜昌市虎亭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420506', N'湖北省宜昌市夷陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420525', N'湖北省宜昌市远安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420526', N'湖北省宜昌市兴山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420527', N'湖北省宜昌市秭归县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420528', N'湖北省宜昌市长阳土家族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420529', N'湖北省宜昌市五峰土家族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420581', N'湖北省宜昌市宜都市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420582', N'湖北省宜昌市当阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420583', N'湖北省宜昌市枝江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420600', N'湖北省襄樊市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420601', N'湖北省襄樊市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420602', N'湖北省襄樊市襄城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420606', N'湖北省襄樊市樊城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420607', N'湖北省襄樊市襄阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420624', N'湖北省襄樊市南漳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420625', N'湖北省襄樊市谷城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420626', N'湖北省襄樊市保康县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420682', N'湖北省襄樊市老河口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420683', N'湖北省襄樊市枣阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420684', N'湖北省襄樊市宜城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420700', N'湖北省鄂州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420701', N'湖北省鄂州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420702', N'湖北省鄂州市梁子湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420703', N'湖北省鄂州市华容区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420704', N'湖北省鄂州市鄂城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420800', N'湖北省荆门市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420801', N'湖北省荆门市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420802', N'湖北省荆门市东宝区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420804', N'湖北省荆门市掇刀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420821', N'湖北省荆门市京山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420822', N'湖北省荆门市沙洋县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420881', N'湖北省荆门市钟祥市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420900', N'湖北省孝感市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420901', N'湖北省孝感市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420902', N'湖北省孝感市孝南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420921', N'湖北省孝感市孝昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420922', N'湖北省孝感市大悟县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420923', N'湖北省孝感市云梦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420981', N'湖北省孝感市应城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420982', N'湖北省孝感市安陆市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'420984', N'湖北省孝感市汉川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421000', N'湖北省荆州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421001', N'湖北省荆州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421002', N'湖北省荆州市沙市区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421003', N'湖北省荆州市荆州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421022', N'湖北省荆州市公安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421023', N'湖北省荆州市监利县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421024', N'湖北省荆州市江陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421081', N'湖北省荆州市石首市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421083', N'湖北省荆州市洪湖市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421087', N'湖北省荆州市松滋市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421100', N'湖北省黄冈市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421101', N'湖北省黄冈市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421102', N'湖北省黄冈市黄州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421121', N'湖北省黄冈市团风县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421122', N'湖北省黄冈市红安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421123', N'湖北省黄冈市罗田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421124', N'湖北省黄冈市英山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421125', N'湖北省黄冈市浠水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421126', N'湖北省黄冈市蕲春县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421127', N'湖北省黄冈市黄梅县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421181', N'湖北省黄冈市麻城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421182', N'湖北省黄冈市武穴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421200', N'湖北省咸宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421201', N'湖北省咸宁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421202', N'湖北省咸宁市咸安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421221', N'湖北省咸宁市嘉鱼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421222', N'湖北省咸宁市通城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421223', N'湖北省咸宁市崇阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421224', N'湖北省咸宁市通山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421281', N'湖北省咸宁市赤壁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421300', N'湖北省随州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421301', N'湖北省随州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421302', N'湖北省随州市曾都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'421381', N'湖北省随州市广水市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422800', N'湖北省恩施土家族苗族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422801', N'湖北省恩施土家族苗族自治州恩施')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422802', N'湖北省恩施土家族苗族自治州利川')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422822', N'湖北省恩施土家族苗族自治州建始')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422823', N'湖北省恩施土家族苗族自治州巴东')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422825', N'湖北省恩施土家族苗族自治州宣恩')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422826', N'湖北省恩施土家族苗族自治州咸丰')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422827', N'湖北省恩施土家族苗族自治州来凤')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'422828', N'湖北省恩施土家族苗族自治州鹤峰')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'429000', N'湖北省省直辖行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'429004', N'湖北省省直辖行政单位仙桃市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'429005', N'湖北省省直辖行政单位潜江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'429006', N'湖北省省直辖行政单位天门市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'429021', N'湖北省省直辖行政单位神农架林区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430000', N'湖南省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430100', N'湖南省长沙市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430101', N'湖南省长沙市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430102', N'湖南省长沙市芙蓉区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430103', N'湖南省长沙市天心区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430104', N'湖南省长沙市岳麓区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430105', N'湖南省长沙市开福区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430111', N'湖南省长沙市雨花区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430121', N'湖南省长沙市长沙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430122', N'湖南省长沙市望城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430124', N'湖南省长沙市宁乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430181', N'湖南省长沙市浏阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430200', N'湖南省株洲市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430201', N'湖南省株洲市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430202', N'湖南省株洲市荷塘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430203', N'湖南省株洲市芦淞区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430204', N'湖南省株洲市石峰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430211', N'湖南省株洲市天元区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430221', N'湖南省株洲市株洲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430223', N'湖南省株洲市攸县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430224', N'湖南省株洲市茶陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430225', N'湖南省株洲市炎陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430281', N'湖南省株洲市醴陵市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430300', N'湖南省湘潭市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430301', N'湖南省湘潭市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430302', N'湖南省湘潭市雨湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430304', N'湖南省湘潭市岳塘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430321', N'湖南省湘潭市湘潭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430381', N'湖南省湘潭市湘乡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430382', N'湖南省湘潭市韶山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430400', N'湖南省衡阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430401', N'湖南省衡阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430405', N'湖南省衡阳市珠晖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430406', N'湖南省衡阳市雁峰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430407', N'湖南省衡阳市石鼓区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430408', N'湖南省衡阳市蒸湘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430412', N'湖南省衡阳市南岳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430421', N'湖南省衡阳市衡阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430422', N'湖南省衡阳市衡南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430423', N'湖南省衡阳市衡山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430424', N'湖南省衡阳市衡东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430426', N'湖南省衡阳市祁东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430481', N'湖南省衡阳市耒阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430482', N'湖南省衡阳市常宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430500', N'湖南省邵阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430501', N'湖南省邵阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430502', N'湖南省邵阳市双清区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430503', N'湖南省邵阳市大祥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430511', N'湖南省邵阳市北塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430521', N'湖南省邵阳市邵东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430522', N'湖南省邵阳市新邵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430523', N'湖南省邵阳市邵阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430524', N'湖南省邵阳市隆回县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430525', N'湖南省邵阳市洞口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430527', N'湖南省邵阳市绥宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430528', N'湖南省邵阳市新宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430529', N'湖南省邵阳市城步苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430581', N'湖南省邵阳市武冈市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430600', N'湖南省岳阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430601', N'湖南省岳阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430602', N'湖南省岳阳市岳阳楼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430603', N'湖南省岳阳市云溪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430611', N'湖南省岳阳市君山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430621', N'湖南省岳阳市岳阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430623', N'湖南省岳阳市华容县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430624', N'湖南省岳阳市湘阴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430626', N'湖南省岳阳市平江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430681', N'湖南省岳阳市汨罗市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430682', N'湖南省岳阳市临湘市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430700', N'湖南省常德市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430701', N'湖南省常德市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430702', N'湖南省常德市武陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430703', N'湖南省常德市鼎城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430721', N'湖南省常德市安乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430722', N'湖南省常德市汉寿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430723', N'湖南省常德市澧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430724', N'湖南省常德市临澧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430725', N'湖南省常德市桃源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430726', N'湖南省常德市石门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430781', N'湖南省常德市津市市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430800', N'湖南省张家界市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430801', N'湖南省张家界市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430802', N'湖南省张家界市永定区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430811', N'湖南省张家界市武陵源区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430821', N'湖南省张家界市慈利县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430822', N'湖南省张家界市桑植县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430900', N'湖南省益阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430901', N'湖南省益阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430902', N'湖南省益阳市资阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430903', N'湖南省益阳市赫山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430921', N'湖南省益阳市南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430922', N'湖南省益阳市桃江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430923', N'湖南省益阳市安化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'430981', N'湖南省益阳市沅江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431000', N'湖南省郴州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431001', N'湖南省郴州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431002', N'湖南省郴州市北湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431003', N'湖南省郴州市苏仙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431021', N'湖南省郴州市桂阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431022', N'湖南省郴州市宜章县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431023', N'湖南省郴州市永兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431024', N'湖南省郴州市嘉禾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431025', N'湖南省郴州市临武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431026', N'湖南省郴州市汝城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431027', N'湖南省郴州市桂东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431028', N'湖南省郴州市安仁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431081', N'湖南省郴州市资兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431100', N'湖南省永州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431101', N'湖南省永州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431102', N'湖南省永州市芝山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431103', N'湖南省永州市冷水滩区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431121', N'湖南省永州市祁阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431122', N'湖南省永州市东安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431123', N'湖南省永州市双牌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431124', N'湖南省永州市道县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431125', N'湖南省永州市江永县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431126', N'湖南省永州市宁远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431127', N'湖南省永州市蓝山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431128', N'湖南省永州市新田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431129', N'湖南省永州市江华瑶族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431200', N'湖南省怀化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431201', N'湖南省怀化市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431202', N'湖南省怀化市鹤城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431221', N'湖南省怀化市中方县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431222', N'湖南省怀化市沅陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431223', N'湖南省怀化市辰溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431224', N'湖南省怀化市溆浦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431225', N'湖南省怀化市会同县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431226', N'湖南省怀化市麻阳苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431227', N'湖南省怀化市新晃侗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431228', N'湖南省怀化市芷江侗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431229', N'湖南省怀化市靖州苗族侗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431230', N'湖南省怀化市通道侗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431281', N'湖南省怀化市洪江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431300', N'湖南省娄底市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431301', N'湖南省娄底市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431302', N'湖南省娄底市娄星区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431321', N'湖南省娄底市双峰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431322', N'湖南省娄底市新化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431381', N'湖南省娄底市冷水江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'431382', N'湖南省娄底市涟源市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433100', N'湖南省湘西土家族苗族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433101', N'湖南省湘西土家族苗族自治州吉首')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433122', N'湖南省湘西土家族苗族自治州泸溪')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433123', N'湖南省湘西土家族苗族自治州凤凰')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433124', N'湖南省湘西土家族苗族自治州花垣')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433125', N'湖南省湘西土家族苗族自治州保靖')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433126', N'湖南省湘西土家族苗族自治州古丈')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433127', N'湖南省湘西土家族苗族自治州永顺')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'433130', N'湖南省湘西土家族苗族自治州龙山')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440000', N'广东省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440100', N'广东省广州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440101', N'广东省广州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440102', N'广东省广州市东山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440103', N'广东省广州市荔湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440104', N'广东省广州市越秀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440105', N'广东省广州市海珠区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440106', N'广东省广州市天河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440107', N'广东省广州市芳村区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440111', N'广东省广州市白云区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440112', N'广东省广州市黄埔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440113', N'广东省广州市番禺区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440114', N'广东省广州市花都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440183', N'广东省广州市增城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440184', N'广东省广州市从化市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440200', N'广东省韶关市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440201', N'广东省韶关市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440202', N'广东省韶关市北江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440203', N'广东省韶关市武江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440204', N'广东省韶关市浈江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440221', N'广东省韶关市曲江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440222', N'广东省韶关市始兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440224', N'广东省韶关市仁化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440229', N'广东省韶关市翁源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440232', N'广东省韶关市乳源瑶族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440233', N'广东省韶关市新丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440281', N'广东省韶关市乐昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440282', N'广东省韶关市南雄市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440300', N'广东省深圳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440301', N'广东省深圳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440303', N'广东省深圳市罗湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440304', N'广东省深圳市福田区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440305', N'广东省深圳市南山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440306', N'广东省深圳市宝安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440307', N'广东省深圳市龙岗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440308', N'广东省深圳市盐田区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440400', N'广东省珠海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440401', N'广东省珠海市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440402', N'广东省珠海市香洲区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440403', N'广东省珠海市斗门区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440404', N'广东省珠海市金湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440500', N'广东省汕头市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440501', N'广东省汕头市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440507', N'广东省汕头市龙湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440511', N'广东省汕头市金平区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440512', N'广东省汕头市濠江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440513', N'广东省汕头市潮阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440514', N'广东省汕头市潮南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440515', N'广东省汕头市澄海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440523', N'广东省汕头市南澳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440600', N'广东省佛山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440601', N'广东省佛山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440604', N'广东省佛山市禅城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440605', N'广东省佛山市南海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440606', N'广东省佛山市顺德区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440607', N'广东省佛山市三水区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440608', N'广东省佛山市高明区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440700', N'广东省江门市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440701', N'广东省江门市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440703', N'广东省江门市蓬江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440704', N'广东省江门市江海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440705', N'广东省江门市新会区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440781', N'广东省江门市台山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440783', N'广东省江门市开平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440784', N'广东省江门市鹤山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440785', N'广东省江门市恩平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440800', N'广东省湛江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440801', N'广东省湛江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440802', N'广东省湛江市赤坎区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440803', N'广东省湛江市霞山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440804', N'广东省湛江市坡头区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440811', N'广东省湛江市麻章区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440823', N'广东省湛江市遂溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440825', N'广东省湛江市徐闻县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440881', N'广东省湛江市廉江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440882', N'广东省湛江市雷州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440883', N'广东省湛江市吴川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440900', N'广东省茂名市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440901', N'广东省茂名市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440902', N'广东省茂名市茂南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440903', N'广东省茂名市茂港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440923', N'广东省茂名市电白县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440981', N'广东省茂名市高州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440982', N'广东省茂名市化州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'440983', N'广东省茂名市信宜市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441200', N'广东省肇庆市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441201', N'广东省肇庆市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441202', N'广东省肇庆市端州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441203', N'广东省肇庆市鼎湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441223', N'广东省肇庆市广宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441224', N'广东省肇庆市怀集县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441225', N'广东省肇庆市封开县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441226', N'广东省肇庆市德庆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441283', N'广东省肇庆市高要市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441284', N'广东省肇庆市四会市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441300', N'广东省惠州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441301', N'广东省惠州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441302', N'广东省惠州市惠城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441303', N'广东省惠州市惠阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441322', N'广东省惠州市博罗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441323', N'广东省惠州市惠东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441324', N'广东省惠州市龙门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441400', N'广东省梅州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441401', N'广东省梅州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441402', N'广东省梅州市梅江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441421', N'广东省梅州市梅县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441422', N'广东省梅州市大埔县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441423', N'广东省梅州市丰顺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441424', N'广东省梅州市五华县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441426', N'广东省梅州市平远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441427', N'广东省梅州市蕉岭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441481', N'广东省梅州市兴宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441500', N'广东省汕尾市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441501', N'广东省汕尾市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441502', N'广东省汕尾市城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441521', N'广东省汕尾市海丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441523', N'广东省汕尾市陆河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441581', N'广东省汕尾市陆丰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441600', N'广东省河源市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441601', N'广东省河源市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441602', N'广东省河源市源城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441621', N'广东省河源市紫金县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441622', N'广东省河源市龙川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441623', N'广东省河源市连平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441624', N'广东省河源市和平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441625', N'广东省河源市东源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441700', N'广东省阳江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441701', N'广东省阳江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441702', N'广东省阳江市江城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441721', N'广东省阳江市阳西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441723', N'广东省阳江市阳东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441781', N'广东省阳江市阳春市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441800', N'广东省清远市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441801', N'广东省清远市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441802', N'广东省清远市清城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441821', N'广东省清远市佛冈县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441823', N'广东省清远市阳山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441825', N'广东省清远市连山壮族瑶族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441826', N'广东省清远市连南瑶族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441827', N'广东省清远市清新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441881', N'广东省清远市英德市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441882', N'广东省清远市连州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'441900', N'广东省东莞市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'442000', N'广东省中山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445100', N'广东省潮州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445101', N'广东省潮州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445102', N'广东省潮州市湘桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445121', N'广东省潮州市潮安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445122', N'广东省潮州市饶平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445200', N'广东省揭阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445201', N'广东省揭阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445202', N'广东省揭阳市榕城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445221', N'广东省揭阳市揭东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445222', N'广东省揭阳市揭西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445224', N'广东省揭阳市惠来县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445281', N'广东省揭阳市普宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445300', N'广东省云浮市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445301', N'广东省云浮市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445302', N'广东省云浮市云城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445321', N'广东省云浮市新兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445322', N'广东省云浮市郁南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445323', N'广东省云浮市云安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'445381', N'广东省云浮市罗定市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450000', N'广西壮族自治区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450100', N'广西壮族自治区南宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450101', N'广西壮族自治区南宁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450102', N'广西壮族自治区南宁市兴宁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450103', N'广西壮族自治区南宁市新城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450104', N'广西壮族自治区南宁市城北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450105', N'广西壮族自治区南宁市江南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450106', N'广西壮族自治区南宁市永新区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450121', N'广西壮族自治区南宁市邕宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450122', N'广西壮族自治区南宁市武鸣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450123', N'广西壮族自治区南宁市隆安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450124', N'广西壮族自治区南宁市马山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450125', N'广西壮族自治区南宁市上林县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450126', N'广西壮族自治区南宁市宾阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450127', N'广西壮族自治区南宁市横县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450200', N'广西壮族自治区柳州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450201', N'广西壮族自治区柳州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450202', N'广西壮族自治区柳州市城中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450203', N'广西壮族自治区柳州市鱼峰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450204', N'广西壮族自治区柳州市柳南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450205', N'广西壮族自治区柳州市柳北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450221', N'广西壮族自治区柳州市柳江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450222', N'广西壮族自治区柳州市柳城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450223', N'广西壮族自治区柳州市鹿寨县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450224', N'广西壮族自治区柳州市融安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450225', N'广西壮族自治区柳州市融水苗族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450226', N'广西壮族自治区柳州市三江侗族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450300', N'广西壮族自治区桂林市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450301', N'广西壮族自治区桂林市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450302', N'广西壮族自治区桂林市秀峰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450303', N'广西壮族自治区桂林市叠彩区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450304', N'广西壮族自治区桂林市象山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450305', N'广西壮族自治区桂林市七星区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450311', N'广西壮族自治区桂林市雁山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450321', N'广西壮族自治区桂林市阳朔县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450322', N'广西壮族自治区桂林市临桂县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450323', N'广西壮族自治区桂林市灵川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450324', N'广西壮族自治区桂林市全州县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450325', N'广西壮族自治区桂林市兴安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450326', N'广西壮族自治区桂林市永福县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450327', N'广西壮族自治区桂林市灌阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450328', N'广西壮族自治区桂林市龙胜各族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450329', N'广西壮族自治区桂林市资源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450330', N'广西壮族自治区桂林市平乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450331', N'广西壮族自治区桂林市荔蒲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450332', N'广西壮族自治区桂林市恭城瑶族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450400', N'广西壮族自治区梧州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450401', N'广西壮族自治区梧州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450403', N'广西壮族自治区梧州市万秀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450404', N'广西壮族自治区梧州市蝶山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450405', N'广西壮族自治区梧州市长洲区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450421', N'广西壮族自治区梧州市苍梧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450422', N'广西壮族自治区梧州市藤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450423', N'广西壮族自治区梧州市蒙山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450481', N'广西壮族自治区梧州市岑溪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450500', N'广西壮族自治区北海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450501', N'广西壮族自治区北海市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450502', N'广西壮族自治区北海市海城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450503', N'广西壮族自治区北海市银海区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450512', N'广西壮族自治区北海市铁山港区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450521', N'广西壮族自治区北海市合浦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450600', N'广西壮族自治区防城港市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450601', N'广西壮族自治区防城港市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450602', N'广西壮族自治区防城港市港口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450603', N'广西壮族自治区防城港市防城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450621', N'广西壮族自治区防城港市上思县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450681', N'广西壮族自治区防城港市东兴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450700', N'广西壮族自治区钦州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450701', N'广西壮族自治区钦州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450702', N'广西壮族自治区钦州市钦南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450703', N'广西壮族自治区钦州市钦北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450721', N'广西壮族自治区钦州市灵山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450722', N'广西壮族自治区钦州市浦北县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450800', N'广西壮族自治区贵港市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450801', N'广西壮族自治区贵港市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450802', N'广西壮族自治区贵港市港北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450803', N'广西壮族自治区贵港市港南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450804', N'广西壮族自治区贵港市覃塘区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450821', N'广西壮族自治区贵港市平南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450881', N'广西壮族自治区贵港市桂平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450900', N'广西壮族自治区玉林市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450901', N'广西壮族自治区玉林市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450902', N'广西壮族自治区玉林市玉州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450921', N'广西壮族自治区玉林市容县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450922', N'广西壮族自治区玉林市陆川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450923', N'广西壮族自治区玉林市博白县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450924', N'广西壮族自治区玉林市兴业县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'450981', N'广西壮族自治区玉林市北流市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451000', N'广西壮族自治区百色市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451001', N'广西壮族自治区百色市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451002', N'广西壮族自治区百色市右江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451021', N'广西壮族自治区百色市田阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451022', N'广西壮族自治区百色市田东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451023', N'广西壮族自治区百色市平果县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451024', N'广西壮族自治区百色市德保县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451025', N'广西壮族自治区百色市靖西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451026', N'广西壮族自治区百色市那坡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451027', N'广西壮族自治区百色市凌云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451028', N'广西壮族自治区百色市乐业县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451029', N'广西壮族自治区百色市田林县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451030', N'广西壮族自治区百色市西林县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451031', N'广西壮族自治区百色市隆林各族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451100', N'广西壮族自治区贺州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451101', N'广西壮族自治区贺州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451102', N'广西壮族自治区贺州市八步区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451121', N'广西壮族自治区贺州市昭平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451122', N'广西壮族自治区贺州市钟山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451123', N'广西壮族自治区贺州市富川瑶族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451200', N'广西壮族自治区河池市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451201', N'广西壮族自治区河池市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451202', N'广西壮族自治区河池市金城江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451221', N'广西壮族自治区河池市南丹县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451222', N'广西壮族自治区河池市天峨县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451223', N'广西壮族自治区河池市凤山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451224', N'广西壮族自治区河池市东兰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451225', N'广西壮族自治区河池市罗城仫佬族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451226', N'广西壮族自治区河池市环江毛南族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451227', N'广西壮族自治区河池市巴马瑶族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451228', N'广西壮族自治区河池市都安瑶族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451229', N'广西壮族自治区河池市大化瑶族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451281', N'广西壮族自治区河池市宜州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451300', N'广西壮族自治区来宾市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451301', N'广西壮族自治区来宾市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451302', N'广西壮族自治区来宾市兴宾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451321', N'广西壮族自治区来宾市忻城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451322', N'广西壮族自治区来宾市象州县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451323', N'广西壮族自治区来宾市武宣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451324', N'广西壮族自治区来宾市金秀瑶族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451381', N'广西壮族自治区来宾市合山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451400', N'广西壮族自治区崇左市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451401', N'广西壮族自治区崇左市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451402', N'广西壮族自治区崇左市江洲区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451421', N'广西壮族自治区崇左市扶绥县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451422', N'广西壮族自治区崇左市宁明县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451423', N'广西壮族自治区崇左市龙州县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451424', N'广西壮族自治区崇左市大新县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451425', N'广西壮族自治区崇左市天等县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'451481', N'广西壮族自治区崇左市凭祥市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460000', N'海南省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460100', N'海南省海口市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460101', N'海南省海口市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460105', N'海南省海口市秀英区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460106', N'海南省海口市龙华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460107', N'海南省海口市琼山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460108', N'海南省海口市美兰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460200', N'海南省三亚市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'460201', N'海南省三亚市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469000', N'海南省省直辖县级行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469001', N'海南省五指山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469002', N'海南省琼海市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469003', N'海南省儋州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469005', N'海南省文昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469006', N'海南省万宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469007', N'海南省东方市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469025', N'海南省定安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469026', N'海南省屯昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469027', N'海南省澄迈县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469028', N'海南省临高县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469030', N'海南省白沙黎族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469031', N'海南省昌江黎族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469033', N'海南省东黎族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469034', N'海南省陵水黎族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469035', N'海南省保亭黎族苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469036', N'海南省琼中黎族苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469037', N'海南省西沙群岛')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469038', N'海南省南沙群岛')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'469039', N'海南省中沙群岛的岛礁及其海域')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500000', N'重庆市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500100', N'重庆市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500101', N'重庆市万州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500102', N'重庆市涪陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500103', N'重庆市渝中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500104', N'重庆市大渡口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500105', N'重庆市江北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500106', N'重庆市沙坪坝区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500107', N'重庆市九龙坡区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500108', N'重庆市南岸区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500109', N'重庆市北碚区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500110', N'重庆市万盛区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500111', N'重庆市双桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500112', N'重庆市渝北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500113', N'重庆市巴南区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500114', N'重庆市黔江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500115', N'重庆市长寿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500200', N'重庆市县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500222', N'重庆市綦江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500223', N'重庆市潼南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500224', N'重庆市铜梁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500225', N'重庆市大足县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500226', N'重庆市荣昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500227', N'重庆市璧山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500228', N'重庆市梁平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500229', N'重庆市城口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500230', N'重庆市丰都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500231', N'重庆市垫江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500232', N'重庆市武隆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500233', N'重庆市忠县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500234', N'重庆市开县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500235', N'重庆市云阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500236', N'重庆市奉节县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500237', N'重庆市巫山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500238', N'重庆市巫溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500240', N'重庆市石柱土家族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500241', N'重庆市秀山土家族苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500242', N'重庆市酉阳土家族苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500243', N'重庆市彭水苗族土家族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500300', N'重庆市市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500381', N'重庆市江津市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500382', N'重庆市合川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500383', N'重庆市永川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'500384', N'重庆市南川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510000', N'四川省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510100', N'四川省成都市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510101', N'四川省成都市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510104', N'四川省成都市锦江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510105', N'四川省成都市青羊区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510106', N'四川省成都市金牛区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510107', N'四川省成都市武侯区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510108', N'四川省成都市成华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510112', N'四川省成都市龙泉驿区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510113', N'四川省成都市青白江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510114', N'四川省成都市新都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510115', N'四川省成都市温江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510121', N'四川省成都市金堂县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510122', N'四川省成都市双流县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510124', N'四川省成都市郫县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510129', N'四川省成都市大邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510131', N'四川省成都市蒲江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510132', N'四川省成都市新津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510181', N'四川省成都市都江堰市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510182', N'四川省成都市彭州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510183', N'四川省成都市邛崃市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510184', N'四川省成都市崇州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510300', N'四川省自贡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510301', N'四川省自贡市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510302', N'四川省自贡市自流井区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510303', N'四川省自贡市贡井区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510304', N'四川省自贡市大安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510311', N'四川省自贡市沿滩区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510321', N'四川省自贡市荣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510322', N'四川省自贡市富顺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510400', N'四川省攀枝花市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510401', N'四川省攀枝花市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510402', N'四川省攀枝花市东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510403', N'四川省攀枝花市西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510411', N'四川省攀枝花市仁和区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510421', N'四川省攀枝花市米易县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510422', N'四川省攀枝花市盐边县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510500', N'四川省泸州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510501', N'四川省泸州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510502', N'四川省泸州市江阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510503', N'四川省泸州市纳溪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510504', N'四川省泸州市龙马潭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510521', N'四川省泸州市泸县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510522', N'四川省泸州市合江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510524', N'四川省泸州市叙永县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510525', N'四川省泸州市古蔺县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510600', N'四川省德阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510601', N'四川省德阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510603', N'四川省德阳市旌阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510623', N'四川省德阳市中江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510626', N'四川省德阳市罗江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510681', N'四川省德阳市广汉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510682', N'四川省德阳市什邡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510683', N'四川省德阳市绵竹市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510700', N'四川省绵阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510701', N'四川省绵阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510703', N'四川省绵阳市涪城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510704', N'四川省绵阳市游仙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510722', N'四川省绵阳市三台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510723', N'四川省绵阳市盐亭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510724', N'四川省绵阳市安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510725', N'四川省绵阳市梓潼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510726', N'四川省绵阳市北川羌族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510727', N'四川省绵阳市平武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510781', N'四川省绵阳市江油市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510800', N'四川省广元市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510801', N'四川省广元市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510802', N'四川省广元市市中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510811', N'四川省广元市元坝区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510812', N'四川省广元市朝天区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510821', N'四川省广元市旺苍县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510822', N'四川省广元市青川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510823', N'四川省广元市剑阁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510824', N'四川省广元市苍溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510900', N'四川省遂宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510901', N'四川省遂宁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510903', N'四川省遂宁市船山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510904', N'四川省遂宁市安居区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510921', N'四川省遂宁市蓬溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510922', N'四川省遂宁市射洪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'510923', N'四川省遂宁市大英县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511000', N'四川省内江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511001', N'四川省内江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511002', N'四川省内江市市中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511011', N'四川省内江市东兴区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511024', N'四川省内江市威远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511025', N'四川省内江市资中县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511028', N'四川省内江市隆昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511100', N'四川省乐山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511101', N'四川省乐山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511102', N'四川省乐山市市中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511111', N'四川省乐山市沙湾区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511112', N'四川省乐山市五通桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511113', N'四川省乐山市金口河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511123', N'四川省乐山市犍为县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511124', N'四川省乐山市井研县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511126', N'四川省乐山市夹江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511129', N'四川省乐山市沐川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511132', N'四川省乐山市峨边彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511133', N'四川省乐山市马边彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511181', N'四川省乐山市峨眉山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511300', N'四川省南充市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511301', N'四川省南充市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511302', N'四川省南充市顺庆区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511303', N'四川省南充市高坪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511304', N'四川省南充市嘉陵区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511321', N'四川省南充市南部县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511322', N'四川省南充市营山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511323', N'四川省南充市蓬安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511324', N'四川省南充市仪陇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511325', N'四川省南充市西充县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511381', N'四川省南充市阆中市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511400', N'四川省眉山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511401', N'四川省眉山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511402', N'四川省眉山市东坡区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511421', N'四川省眉山市仁寿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511422', N'四川省眉山市彭山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511423', N'四川省眉山市洪雅县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511424', N'四川省眉山市丹棱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511425', N'四川省眉山市青神县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511500', N'四川省宜宾市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511501', N'四川省宜宾市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511502', N'四川省宜宾市翠屏区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511521', N'四川省宜宾市宜宾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511522', N'四川省宜宾市南溪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511523', N'四川省宜宾市江安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511524', N'四川省宜宾市长宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511525', N'四川省宜宾市高县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511526', N'四川省宜宾市珙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511527', N'四川省宜宾市筠连县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511528', N'四川省宜宾市兴文县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511529', N'四川省宜宾市屏山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511600', N'四川省广安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511601', N'四川省广安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511602', N'四川省广安市广安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511621', N'四川省广安市岳池县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511622', N'四川省广安市武胜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511623', N'四川省广安市邻水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511681', N'四川省广安市华莹市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511700', N'四川省达州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511701', N'四川省达州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511702', N'四川省达州市通川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511721', N'四川省达州市达县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511722', N'四川省达州市宣汉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511723', N'四川省达州市开江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511724', N'四川省达州市大竹县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511725', N'四川省达州市渠县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511781', N'四川省达州市万源市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511800', N'四川省雅安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511801', N'四川省雅安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511802', N'四川省雅安市雨城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511821', N'四川省雅安市名山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511822', N'四川省雅安市荥经县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511823', N'四川省雅安市汉源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511824', N'四川省雅安市石棉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511825', N'四川省雅安市天全县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511826', N'四川省雅安市芦山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511827', N'四川省雅安市宝兴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511900', N'四川省巴中市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511901', N'四川省巴中市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511902', N'四川省巴中市巴州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511921', N'四川省巴中市通江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511922', N'四川省巴中市南江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'511923', N'四川省巴中市平昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'512000', N'四川省资阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'512001', N'四川省资阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'512002', N'四川省资阳市雁江区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'512021', N'四川省资阳市安岳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'512022', N'四川省资阳市乐至县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'512081', N'四川省资阳市简阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513200', N'四川省阿坝藏族羌族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513221', N'四川省阿坝藏族羌族自治州汶川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513222', N'四川省阿坝藏族羌族自治州理县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513223', N'四川省阿坝藏族羌族自治州茂县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513224', N'四川省阿坝藏族羌族自治州松潘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513225', N'四川省阿坝藏族羌族自治州九寨沟')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513226', N'四川省阿坝藏族羌族自治州金川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513227', N'四川省阿坝藏族羌族自治州小金县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513228', N'四川省阿坝藏族羌族自治州黑水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513229', N'四川省阿坝藏族羌族自治州马尔康')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513230', N'四川省阿坝藏族羌族自治州壤塘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513231', N'四川省阿坝藏族羌族自治州阿坝县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513232', N'四川省阿坝藏族羌族自治州若尔盖')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513233', N'四川省阿坝藏族羌族自治州红原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513300', N'四川省甘孜藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513321', N'四川省甘孜藏族自治州康定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513322', N'四川省甘孜藏族自治州泸定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513323', N'四川省甘孜藏族自治州丹巴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513324', N'四川省甘孜藏族自治州九龙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513325', N'四川省甘孜藏族自治州雅江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513326', N'四川省甘孜藏族自治州道孚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513327', N'四川省甘孜藏族自治州炉霍县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513328', N'四川省甘孜藏族自治州甘孜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513329', N'四川省甘孜藏族自治州新龙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513330', N'四川省甘孜藏族自治州德格县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513331', N'四川省甘孜藏族自治州白玉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513332', N'四川省甘孜藏族自治州石渠县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513333', N'四川省甘孜藏族自治州色达县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513334', N'四川省甘孜藏族自治州理塘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513335', N'四川省甘孜藏族自治州巴塘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513336', N'四川省甘孜藏族自治州乡城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513337', N'四川省甘孜藏族自治州稻城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513338', N'四川省甘孜藏族自治州得荣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513400', N'四川省凉山彝族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513401', N'四川省凉山彝族自治州西昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513422', N'四川省凉山彝族自治州木里藏族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513423', N'四川省凉山彝族自治州盐源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513424', N'四川省凉山彝族自治州德昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513425', N'四川省凉山彝族自治州会理县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513426', N'四川省凉山彝族自治州会东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513427', N'四川省凉山彝族自治州宁南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513428', N'四川省凉山彝族自治州普格县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513429', N'四川省凉山彝族自治州布拖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513430', N'四川省凉山彝族自治州金阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513431', N'四川省凉山彝族自治州昭觉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513432', N'四川省凉山彝族自治州喜德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513433', N'四川省凉山彝族自治州冕宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513434', N'四川省凉山彝族自治州越西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513435', N'四川省凉山彝族自治州甘洛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513436', N'四川省凉山彝族自治州美姑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'513437', N'四川省凉山彝族自治州雷波县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520000', N'贵州省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520100', N'贵州省贵阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520101', N'贵州省贵阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520102', N'贵州省贵阳市南明区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520103', N'贵州省贵阳市云岩区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520111', N'贵州省贵阳市花溪区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520112', N'贵州省贵阳市乌当区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520113', N'贵州省贵阳市白云区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520114', N'贵州省贵阳市小河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520121', N'贵州省贵阳市开阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520122', N'贵州省贵阳市息烽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520123', N'贵州省贵阳市修文县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520181', N'贵州省贵阳市清镇市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520200', N'贵州省六盘水市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520201', N'贵州省六盘水市钟山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520203', N'贵州省六盘水市六枝特区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520221', N'贵州省六盘水市水城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520222', N'贵州省六盘水市盘县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520300', N'贵州省遵义市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520301', N'贵州省遵义市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520302', N'贵州省遵义市红花岗区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520303', N'贵州省遵义市汇川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520321', N'贵州省遵义市遵义县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520322', N'贵州省遵义市桐梓县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520323', N'贵州省遵义市绥阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520324', N'贵州省遵义市正安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520325', N'贵州省遵义市道真仡佬族苗族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520326', N'贵州省遵义市务川仡佬族苗族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520327', N'贵州省遵义市凤冈县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520328', N'贵州省遵义市湄潭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520329', N'贵州省遵义市余庆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520330', N'贵州省遵义市习水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520381', N'贵州省遵义市赤水市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520382', N'贵州省遵义市仁怀市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520400', N'贵州省安顺市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520401', N'贵州省安顺市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520402', N'贵州省安顺市西秀区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520421', N'贵州省安顺市平坝县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520422', N'贵州省安顺市普定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520423', N'贵州省安顺市镇宁布依族苗族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520424', N'贵州省安顺市关岭布依族苗族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'520425', N'贵州省安顺市紫云苗族布依族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522200', N'贵州省铜仁地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522201', N'贵州省铜仁地区铜仁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522222', N'贵州省铜仁地区江口县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522223', N'贵州省铜仁地区玉屏侗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522224', N'贵州省铜仁地区石阡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522225', N'贵州省铜仁地区思南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522226', N'贵州省铜仁地区印江土家族苗族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522227', N'贵州省铜仁地区德江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522228', N'贵州省铜仁地区沿河土家族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522229', N'贵州省铜仁地区松桃苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522230', N'贵州省铜仁地区万山特区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522300', N'贵州省黔西南布依族苗族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522301', N'贵州省黔西南布依族苗族自治州兴')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522322', N'贵州省黔西南布依族苗族自治州兴')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522323', N'贵州省黔西南布依族苗族自治州普')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522324', N'贵州省黔西南布依族苗族自治州晴')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522325', N'贵州省黔西南布依族苗族自治州贞')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522326', N'贵州省黔西南布依族苗族自治州望')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522327', N'贵州省黔西南布依族苗族自治州册')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522328', N'贵州省黔西南布依族苗族自治州安')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522400', N'贵州省毕节地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522401', N'贵州省毕节地区毕节市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522422', N'贵州省毕节地区大方县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522423', N'贵州省毕节地区黔西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522424', N'贵州省毕节地区金沙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522425', N'贵州省毕节地区织金县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522426', N'贵州省毕节地区纳雍县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522427', N'贵州省毕节地区威宁彝族回族苗族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522428', N'贵州省毕节地区赫章县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522600', N'贵州省黔东南苗族侗族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522601', N'贵州省黔东南苗族侗族自治州凯里')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522622', N'贵州省黔东南苗族侗族自治州黄平')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522623', N'贵州省黔东南苗族侗族自治州施秉')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522624', N'贵州省黔东南苗族侗族自治州三穗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522625', N'贵州省黔东南苗族侗族自治州镇远')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522626', N'贵州省黔东南苗族侗族自治州岑巩')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522627', N'贵州省黔东南苗族侗族自治州天柱')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522628', N'贵州省黔东南苗族侗族自治州锦屏')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522629', N'贵州省黔东南苗族侗族自治州剑河')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522630', N'贵州省黔东南苗族侗族自治州台江')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522631', N'贵州省黔东南苗族侗族自治州黎平')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522632', N'贵州省黔东南苗族侗族自治州榕江')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522633', N'贵州省黔东南苗族侗族自治州从江')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522634', N'贵州省黔东南苗族侗族自治州雷山')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522635', N'贵州省黔东南苗族侗族自治州麻江')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522636', N'贵州省黔东南苗族侗族自治州丹寨')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522700', N'贵州省黔南布依族苗族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522701', N'贵州省黔南布依族苗族自治州都匀')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522702', N'贵州省黔南布依族苗族自治州福泉')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522722', N'贵州省黔南布依族苗族自治州荔波')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522723', N'贵州省黔南布依族苗族自治州贵定')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522725', N'贵州省黔南布依族苗族自治州瓮安')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522726', N'贵州省黔南布依族苗族自治州独山')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522727', N'贵州省黔南布依族苗族自治州平塘')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522728', N'贵州省黔南布依族苗族自治州罗甸')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522729', N'贵州省黔南布依族苗族自治州长顺')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522730', N'贵州省黔南布依族苗族自治州龙里')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522731', N'贵州省黔南布依族苗族自治州惠水')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'522732', N'贵州省黔南布依族苗族自治州三都')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530000', N'云南省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530100', N'云南省昆明市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530101', N'云南省昆明市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530102', N'云南省昆明市五华区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530103', N'云南省昆明市盘龙区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530111', N'云南省昆明市官渡区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530112', N'云南省昆明市西山区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530113', N'云南省昆明市东川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530121', N'云南省昆明市呈贡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530122', N'云南省昆明市晋宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530124', N'云南省昆明市富民县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530125', N'云南省昆明市宜良县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530126', N'云南省昆明市石林彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530127', N'云南省昆明市嵩明县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530128', N'云南省昆明市禄劝彝族苗族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530129', N'云南省昆明市寻甸回族彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530181', N'云南省昆明市安宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530300', N'云南省曲靖市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530301', N'云南省曲靖市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530302', N'云南省曲靖市麒麟区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530321', N'云南省曲靖市马龙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530322', N'云南省曲靖市陆良县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530323', N'云南省曲靖市师宗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530324', N'云南省曲靖市罗平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530325', N'云南省曲靖市富源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530326', N'云南省曲靖市会泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530328', N'云南省曲靖市沾益县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530381', N'云南省曲靖市宣威市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530400', N'云南省玉溪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530401', N'云南省玉溪市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530402', N'云南省玉溪市红塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530421', N'云南省玉溪市江川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530422', N'云南省玉溪市澄江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530423', N'云南省玉溪市通海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530424', N'云南省玉溪市华宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530425', N'云南省玉溪市易门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530426', N'云南省玉溪市峨山彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530427', N'云南省玉溪市新平彝族傣族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530428', N'云南省玉溪市元江哈尼族彝族傣族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530500', N'云南省保山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530501', N'云南省保山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530502', N'云南省保山市隆阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530521', N'云南省保山市施甸县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530522', N'云南省保山市腾冲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530523', N'云南省保山市龙陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530524', N'云南省保山市昌宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530600', N'云南省昭通市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530601', N'云南省昭通市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530602', N'云南省昭通市昭阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530621', N'云南省昭通市鲁甸县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530622', N'云南省昭通市巧家县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530623', N'云南省昭通市盐津县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530624', N'云南省昭通市大关县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530625', N'云南省昭通市永善县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530626', N'云南省昭通市绥江县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530627', N'云南省昭通市镇雄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530628', N'云南省昭通市彝良县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530629', N'云南省昭通市威信县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530630', N'云南省昭通市水富县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530700', N'云南省丽江市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530701', N'云南省丽江市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530702', N'云南省丽江市古城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530721', N'云南省丽江市玉龙纳西族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530722', N'云南省丽江市永胜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530723', N'云南省丽江市华坪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530724', N'云南省丽江市宁蒗彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530800', N'云南省思茅市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530801', N'云南省思茅市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530802', N'云南省思茅市翠云区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530821', N'云南省思茅市普洱哈尼族彝族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530822', N'云南省思茅市墨江哈尼族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530823', N'云南省思茅市景东彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530824', N'云南省思茅市景谷傣族彝族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530825', N'云南省思茅市镇沅彝族哈尼族拉祜')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530826', N'云南省思茅市江城哈尼族彝族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530827', N'云南省思茅市孟连傣族拉祜族佤族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530828', N'云南省思茅市澜沧拉祜族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530829', N'云南省思茅市西盟佤族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530900', N'云南省临沧市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530901', N'云南省临沧市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530902', N'云南省临沧市临翔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530921', N'云南省临沧市凤庆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530922', N'云南省临沧市云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530923', N'云南省临沧市永德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530924', N'云南省临沧市镇康县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530925', N'云南省临沧市双江拉祜族佤族布朗')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530926', N'云南省临沧市耿马傣族佤族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'530927', N'云南省临沧市沧源佤族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532300', N'云南省楚雄彝族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532301', N'云南省楚雄彝族自治州楚雄市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532322', N'云南省楚雄彝族自治州双柏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532323', N'云南省楚雄彝族自治州牟定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532324', N'云南省楚雄彝族自治州南华县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532325', N'云南省楚雄彝族自治州姚安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532326', N'云南省楚雄彝族自治州大姚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532327', N'云南省楚雄彝族自治州永仁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532328', N'云南省楚雄彝族自治州元谋县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532329', N'云南省楚雄彝族自治州武定县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532331', N'云南省楚雄彝族自治州禄丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532500', N'云南省红河哈尼族彝族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532501', N'云南省红河哈尼族彝族自治州个旧')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532502', N'云南省红河哈尼族彝族自治州开远')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532522', N'云南省红河哈尼族彝族自治州蒙自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532523', N'云南省红河哈尼族彝族自治州屏边')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532524', N'云南省红河哈尼族彝族自治州建水')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532525', N'云南省红河哈尼族彝族自治州石屏')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532526', N'云南省红河哈尼族彝族自治州弥勒')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532527', N'云南省红河哈尼族彝族自治州泸西')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532528', N'云南省红河哈尼族彝族自治州元阳')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532529', N'云南省红河哈尼族彝族自治州红河')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532530', N'云南省红河哈尼族彝族自治州金平')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532531', N'云南省红河哈尼族彝族自治州绿春')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532532', N'云南省红河哈尼族彝族自治州河口')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532600', N'云南省文山壮族苗族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532621', N'云南省文山壮族苗族自治州文山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532622', N'云南省文山壮族苗族自治州砚山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532623', N'云南省文山壮族苗族自治州西畴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532624', N'云南省文山壮族苗族自治州麻栗坡')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532625', N'云南省文山壮族苗族自治州马关县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532626', N'云南省文山壮族苗族自治州丘北县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532627', N'云南省文山壮族苗族自治州广南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532628', N'云南省文山壮族苗族自治州富宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532800', N'云南省西双版纳傣族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532801', N'云南省西双版纳傣族自治州景洪市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532822', N'云南省西双版纳傣族自治州勐海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532823', N'云南省西双版纳傣族自治州勐腊县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532900', N'云南省大理白族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532901', N'云南省大理白族自治州大理市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532922', N'云南省大理白族自治州漾濞彝族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532923', N'云南省大理白族自治州祥云县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532924', N'云南省大理白族自治州宾川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532925', N'云南省大理白族自治州弥渡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532926', N'云南省大理白族自治州南涧彝族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532927', N'云南省大理白族自治州巍山彝族回')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532928', N'云南省大理白族自治州永平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532929', N'云南省大理白族自治州云龙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532930', N'云南省大理白族自治州洱源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532931', N'云南省大理白族自治州剑川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'532932', N'云南省大理白族自治州鹤庆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533100', N'云南省德宏傣族景颇族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533102', N'云南省德宏傣族景颇族自治州瑞丽')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533103', N'云南省德宏傣族景颇族自治州潞西')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533122', N'云南省德宏傣族景颇族自治州梁河')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533123', N'云南省德宏傣族景颇族自治州盈江')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533124', N'云南省德宏傣族景颇族自治州陇川')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533300', N'云南省怒江傈僳族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533321', N'云南省怒江傈僳族自治州泸水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533323', N'云南省怒江傈僳族自治州福贡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533324', N'云南省怒江傈僳族自治州贡山独龙')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533325', N'云南省怒江傈僳族自治州兰坪白族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533400', N'云南省迪庆藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533421', N'云南省迪庆藏族自治州香格里拉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533422', N'云南省迪庆藏族自治州德钦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'533423', N'云南省迪庆藏族自治州维西傈僳族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540000', N'西藏自治区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540100', N'西藏自治区拉萨市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540101', N'西藏自治区拉萨市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540102', N'西藏自治区拉萨市城关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540121', N'西藏自治区拉萨市林周县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540122', N'西藏自治区拉萨市当雄县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540123', N'西藏自治区拉萨市尼木县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540124', N'西藏自治区拉萨市曲水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540125', N'西藏自治区拉萨市堆龙德庆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540126', N'西藏自治区拉萨市达孜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'540127', N'西藏自治区拉萨市墨竹工卡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542100', N'西藏自治区昌都地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542121', N'西藏自治区昌都地区昌都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542122', N'西藏自治区昌都地区江达县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542123', N'西藏自治区昌都地区贡觉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542124', N'西藏自治区昌都地区类乌齐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542125', N'西藏自治区昌都地区丁青县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542126', N'西藏自治区昌都地区察雅县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542127', N'西藏自治区昌都地区八宿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542128', N'西藏自治区昌都地区左贡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542129', N'西藏自治区昌都地区芒康县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542132', N'西藏自治区昌都地区洛隆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542133', N'西藏自治区昌都地区边坝县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542200', N'西藏自治区山南地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542221', N'西藏自治区山南地区乃东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542222', N'西藏自治区山南地区扎囊县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542223', N'西藏自治区山南地区贡嘎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542224', N'西藏自治区山南地区桑日县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542225', N'西藏自治区山南地区琼结县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542226', N'西藏自治区山南地区曲松县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542227', N'西藏自治区山南地区措美县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542228', N'西藏自治区山南地区洛扎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542229', N'西藏自治区山南地区加查县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542231', N'西藏自治区山南地区隆子县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542232', N'西藏自治区山南地区错那县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542233', N'西藏自治区山南地区浪卡子县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542300', N'西藏自治区日喀则地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542301', N'西藏自治区日喀则地区日喀则市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542322', N'西藏自治区日喀则地区南木林县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542323', N'西藏自治区日喀则地区江孜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542324', N'西藏自治区日喀则地区定日县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542325', N'西藏自治区日喀则地区萨迦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542326', N'西藏自治区日喀则地区拉孜县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542327', N'西藏自治区日喀则地区昂仁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542328', N'西藏自治区日喀则地区谢通门县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542329', N'西藏自治区日喀则地区白朗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542330', N'西藏自治区日喀则地区仁布县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542331', N'西藏自治区日喀则地区康马县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542332', N'西藏自治区日喀则地区定结县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542333', N'西藏自治区日喀则地区仲巴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542334', N'西藏自治区日喀则地区亚东县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542335', N'西藏自治区日喀则地区吉隆县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542336', N'西藏自治区日喀则地区聂拉木县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542337', N'西藏自治区日喀则地区萨嘎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542338', N'西藏自治区日喀则地区岗巴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542400', N'西藏自治区那曲地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542421', N'西藏自治区那曲地区那曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542422', N'西藏自治区那曲地区嘉黎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542423', N'西藏自治区那曲地区比如县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542424', N'西藏自治区那曲地区聂荣县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542425', N'西藏自治区那曲地区安多县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542426', N'西藏自治区那曲地区申扎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542427', N'西藏自治区那曲地区索县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542428', N'西藏自治区那曲地区班戈县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542429', N'西藏自治区那曲地区巴青县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542430', N'西藏自治区那曲地区尼玛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542500', N'西藏自治区阿里地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542521', N'西藏自治区阿里地区普兰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542522', N'西藏自治区阿里地区札达县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542523', N'西藏自治区阿里地区噶尔县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542524', N'西藏自治区阿里地区日土县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542525', N'西藏自治区阿里地区革吉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542526', N'西藏自治区阿里地区改则县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542527', N'西藏自治区阿里地区措勤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542600', N'西藏自治区林芝地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542621', N'西藏自治区林芝地区林芝县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542622', N'西藏自治区林芝地区工布江达县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542623', N'西藏自治区林芝地区米林县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542624', N'西藏自治区林芝地区墨脱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542625', N'西藏自治区林芝地区波密县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542626', N'西藏自治区林芝地区察隅县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'542627', N'西藏自治区林芝地区朗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610000', N'陕西省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610100', N'陕西省西安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610101', N'陕西省西安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610102', N'陕西省西安市新城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610103', N'陕西省西安市碑林区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610104', N'陕西省西安市莲湖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610111', N'陕西省西安市灞桥区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610112', N'陕西省西安市未央区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610113', N'陕西省西安市雁塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610114', N'陕西省西安市阎良区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610115', N'陕西省西安市临潼区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610116', N'陕西省西安市长安区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610122', N'陕西省西安市蓝田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610124', N'陕西省西安市周至县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610125', N'陕西省西安市户县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610126', N'陕西省西安市高陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610200', N'陕西省铜川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610201', N'陕西省铜川市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610202', N'陕西省铜川市王益区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610203', N'陕西省铜川市印台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610204', N'陕西省铜川市耀州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610222', N'陕西省铜川市宜君县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610300', N'陕西省宝鸡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610301', N'陕西省宝鸡市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610302', N'陕西省宝鸡市渭滨区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610303', N'陕西省宝鸡市金台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610304', N'陕西省宝鸡市陈仓区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610322', N'陕西省宝鸡市凤翔县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610323', N'陕西省宝鸡市岐山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610324', N'陕西省宝鸡市扶风县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610326', N'陕西省宝鸡市眉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610327', N'陕西省宝鸡市陇县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610328', N'陕西省宝鸡市千阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610329', N'陕西省宝鸡市麟游县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610330', N'陕西省宝鸡市凤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610331', N'陕西省宝鸡市太白县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610400', N'陕西省咸阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610401', N'陕西省咸阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610402', N'陕西省咸阳市秦都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610403', N'陕西省咸阳市杨凌区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610404', N'陕西省咸阳市渭城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610422', N'陕西省咸阳市三原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610423', N'陕西省咸阳市泾阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610424', N'陕西省咸阳市乾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610425', N'陕西省咸阳市礼泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610426', N'陕西省咸阳市永寿县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610427', N'陕西省咸阳市彬县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610428', N'陕西省咸阳市长武县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610429', N'陕西省咸阳市旬邑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610430', N'陕西省咸阳市淳化县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610431', N'陕西省咸阳市武功县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610481', N'陕西省咸阳市兴平市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610500', N'陕西省渭南市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610501', N'陕西省渭南市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610502', N'陕西省渭南市临渭区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610521', N'陕西省渭南市华县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610522', N'陕西省渭南市潼关县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610523', N'陕西省渭南市大荔县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610524', N'陕西省渭南市合阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610525', N'陕西省渭南市澄城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610526', N'陕西省渭南市蒲城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610527', N'陕西省渭南市白水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610528', N'陕西省渭南市富平县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610581', N'陕西省渭南市韩城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610582', N'陕西省渭南市华阴市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610600', N'陕西省延安市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610601', N'陕西省延安市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610602', N'陕西省延安市宝塔区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610621', N'陕西省延安市延长县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610622', N'陕西省延安市延川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610623', N'陕西省延安市子长县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610624', N'陕西省延安市安塞县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610625', N'陕西省延安市志丹县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610626', N'陕西省延安市吴旗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610627', N'陕西省延安市甘泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610628', N'陕西省延安市富县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610629', N'陕西省延安市洛川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610630', N'陕西省延安市宜川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610631', N'陕西省延安市黄龙县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610632', N'陕西省延安市黄陵县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610700', N'陕西省汉中市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610701', N'陕西省汉中市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610702', N'陕西省汉中市汉台区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610721', N'陕西省汉中市南郑县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610722', N'陕西省汉中市城固县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610723', N'陕西省汉中市洋县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610724', N'陕西省汉中市西乡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610725', N'陕西省汉中市勉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610726', N'陕西省汉中市宁强县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610727', N'陕西省汉中市略阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610728', N'陕西省汉中市镇巴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610729', N'陕西省汉中市留坝县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610730', N'陕西省汉中市佛坪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610800', N'陕西省榆林市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610801', N'陕西省榆林市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610802', N'陕西省榆林市榆阳区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610821', N'陕西省榆林市神木县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610822', N'陕西省榆林市府谷县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610823', N'陕西省榆林市横山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610824', N'陕西省榆林市靖边县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610825', N'陕西省榆林市定边县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610826', N'陕西省榆林市绥德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610827', N'陕西省榆林市米脂县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610828', N'陕西省榆林市佳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610829', N'陕西省榆林市吴堡县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610830', N'陕西省榆林市清涧县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610831', N'陕西省榆林市子洲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610900', N'陕西省安康市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610901', N'陕西省安康市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610902', N'陕西省安康市汉滨区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610921', N'陕西省安康市汉阴县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610922', N'陕西省安康市石泉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610923', N'陕西省安康市宁陕县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610924', N'陕西省安康市紫阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610925', N'陕西省安康市岚皋县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610926', N'陕西省安康市平利县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610927', N'陕西省安康市镇坪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610928', N'陕西省安康市旬阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'610929', N'陕西省安康市白河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611000', N'陕西省商洛市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611001', N'陕西省商洛市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611002', N'陕西省商洛市商州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611021', N'陕西省商洛市洛南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611022', N'陕西省商洛市丹凤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611023', N'陕西省商洛市商南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611024', N'陕西省商洛市山阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611025', N'陕西省商洛市镇安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'611026', N'陕西省商洛市柞水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620000', N'甘肃省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620100', N'甘肃省兰州市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620101', N'甘肃省兰州市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620102', N'甘肃省兰州市城关区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620103', N'甘肃省兰州市七里河区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620104', N'甘肃省兰州市西固区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620105', N'甘肃省兰州市安宁区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620111', N'甘肃省兰州市红古区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620121', N'甘肃省兰州市永登县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620122', N'甘肃省兰州市皋兰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620123', N'甘肃省兰州市榆中县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620200', N'甘肃省嘉峪关市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620201', N'甘肃省嘉峪关市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620300', N'甘肃省金昌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620301', N'甘肃省金昌市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620302', N'甘肃省金昌市金川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620321', N'甘肃省金昌市永昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620400', N'甘肃省白银市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620401', N'甘肃省白银市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620402', N'甘肃省白银市白银区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620403', N'甘肃省白银市平川区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620421', N'甘肃省白银市靖远县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620422', N'甘肃省白银市会宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620423', N'甘肃省白银市景泰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620500', N'甘肃省天水市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620501', N'甘肃省天水市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620502', N'甘肃省天水市秦城区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620503', N'甘肃省天水市北道区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620521', N'甘肃省天水市清水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620522', N'甘肃省天水市秦安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620523', N'甘肃省天水市甘谷县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620524', N'甘肃省天水市武山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620525', N'甘肃省天水市张家川回族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620600', N'甘肃省武威市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620601', N'甘肃省武威市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620602', N'甘肃省武威市凉州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620621', N'甘肃省武威市民勤县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620622', N'甘肃省武威市古浪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620623', N'甘肃省武威市天祝藏族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620700', N'甘肃省张掖市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620701', N'甘肃省张掖市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620702', N'甘肃省张掖市甘州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620721', N'甘肃省张掖市肃南裕固族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620722', N'甘肃省张掖市民乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620723', N'甘肃省张掖市临泽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620724', N'甘肃省张掖市高台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620725', N'甘肃省张掖市山丹县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620800', N'甘肃省平凉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620801', N'甘肃省平凉市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620802', N'甘肃省平凉市崆峒区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620821', N'甘肃省平凉市泾川县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620822', N'甘肃省平凉市灵台县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620823', N'甘肃省平凉市崇信县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620824', N'甘肃省平凉市华亭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620825', N'甘肃省平凉市庄浪县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620826', N'甘肃省平凉市静宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620900', N'甘肃省酒泉市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620901', N'甘肃省酒泉市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620902', N'甘肃省酒泉市肃州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620921', N'甘肃省酒泉市金塔县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620922', N'甘肃省酒泉市安西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620923', N'甘肃省酒泉市肃北蒙古族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620924', N'甘肃省酒泉市阿克塞哈萨克族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620981', N'甘肃省酒泉市玉门市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'620982', N'甘肃省酒泉市敦煌市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621000', N'甘肃省庆阳市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621001', N'甘肃省庆阳市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621002', N'甘肃省庆阳市西峰区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621021', N'甘肃省庆阳市庆城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621022', N'甘肃省庆阳市环县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621023', N'甘肃省庆阳市华池县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621024', N'甘肃省庆阳市合水县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621025', N'甘肃省庆阳市正宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621026', N'甘肃省庆阳市宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621027', N'甘肃省庆阳市镇原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621100', N'甘肃省定西市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621101', N'甘肃省定西市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621102', N'甘肃省定西市安定区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621121', N'甘肃省定西市通渭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621122', N'甘肃省定西市陇西县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621123', N'甘肃省定西市渭源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621124', N'甘肃省定西市临洮县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621125', N'甘肃省定西市漳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621126', N'甘肃省定西市岷县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621200', N'甘肃省陇南市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621201', N'甘肃省陇南市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621202', N'甘肃省陇南市武都区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621221', N'甘肃省陇南市成县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621222', N'甘肃省陇南市文县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621223', N'甘肃省陇南市宕昌县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621224', N'甘肃省陇南市康县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621225', N'甘肃省陇南市西和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621226', N'甘肃省陇南市礼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621227', N'甘肃省陇南市徽县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'621228', N'甘肃省陇南市两当县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622900', N'甘肃省临夏回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622901', N'甘肃省临夏回族自治州临夏市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622921', N'甘肃省临夏回族自治州临夏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622922', N'甘肃省临夏回族自治州康乐县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622923', N'甘肃省临夏回族自治州永靖县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622924', N'甘肃省临夏回族自治州广河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622925', N'甘肃省临夏回族自治州和政县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622926', N'甘肃省临夏回族自治州东乡族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'622927', N'甘肃省临夏回族自治州积石山保安')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623000', N'甘肃省甘南藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623001', N'甘肃省甘南藏族自治州合作市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623021', N'甘肃省甘南藏族自治州临潭县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623022', N'甘肃省甘南藏族自治州卓尼县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623023', N'甘肃省甘南藏族自治州舟曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623024', N'甘肃省甘南藏族自治州迭部县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623025', N'甘肃省甘南藏族自治州玛曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623026', N'甘肃省甘南藏族自治州碌曲县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'623027', N'甘肃省甘南藏族自治州夏河县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630000', N'青海省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630100', N'青海省西宁市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630101', N'青海省西宁市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630102', N'青海省西宁市城东区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630103', N'青海省西宁市城中区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630104', N'青海省西宁市城西区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630105', N'青海省西宁市城北区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630121', N'青海省西宁市大通回族土族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630122', N'青海省西宁市湟中县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'630123', N'青海省西宁市湟源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632100', N'青海省海东地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632121', N'青海省海东地区平安县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632122', N'青海省海东地区民和回族土族自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632123', N'青海省海东地区乐都县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632126', N'青海省海东地区互助土族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632127', N'青海省海东地区化隆回族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632128', N'青海省海东地区循化撒拉族自治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632200', N'青海省海北藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632221', N'青海省海北藏族自治州门源回族自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632222', N'青海省海北藏族自治州祁连县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632223', N'青海省海北藏族自治州海晏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632224', N'青海省海北藏族自治州刚察县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632300', N'青海省黄南藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632321', N'青海省黄南藏族自治州同仁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632322', N'青海省黄南藏族自治州尖扎县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632323', N'青海省黄南藏族自治州泽库县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632324', N'青海省黄南藏族自治州河南蒙古族')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632500', N'青海省海南藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632521', N'青海省海南藏族自治州共和县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632522', N'青海省海南藏族自治州同德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632523', N'青海省海南藏族自治州贵德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632524', N'青海省海南藏族自治州兴海县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632525', N'青海省海南藏族自治州贵南县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632600', N'青海省果洛藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632621', N'青海省果洛藏族自治州玛沁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632622', N'青海省果洛藏族自治州班玛县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632623', N'青海省果洛藏族自治州甘德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632624', N'青海省果洛藏族自治州达日县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632625', N'青海省果洛藏族自治州久治县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632626', N'青海省果洛藏族自治州玛多县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632700', N'青海省玉树藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632721', N'青海省玉树藏族自治州玉树县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632722', N'青海省玉树藏族自治州杂多县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632723', N'青海省玉树藏族自治州称多县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632724', N'青海省玉树藏族自治州治多县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632725', N'青海省玉树藏族自治州囊谦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632726', N'青海省玉树藏族自治州曲麻莱县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632800', N'青海省海西蒙古族藏族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632801', N'青海省海西蒙古族藏族自治州格尔')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632802', N'青海省海西蒙古族藏族自治州德令')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632821', N'青海省海西蒙古族藏族自治州乌兰')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632822', N'青海省海西蒙古族藏族自治州都兰')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'632823', N'青海省海西蒙古族藏族自治州天峻')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640000', N'宁夏回族自治区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640100', N'宁夏回族自治区银川市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640101', N'宁夏回族自治区银川市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640104', N'宁夏回族自治区银川市兴庆区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640105', N'宁夏回族自治区银川市西夏区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640106', N'宁夏回族自治区银川市金凤区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640121', N'宁夏回族自治区银川市永宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640122', N'宁夏回族自治区银川市贺兰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640181', N'宁夏回族自治区银川市灵武市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640200', N'宁夏回族自治区石嘴山市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640201', N'宁夏回族自治区石嘴山市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640202', N'宁夏回族自治区石嘴山市大武口区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640205', N'宁夏回族自治区石嘴山市惠农区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640221', N'宁夏回族自治区石嘴山市平罗县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640300', N'宁夏回族自治区吴忠市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640301', N'宁夏回族自治区吴忠市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640302', N'宁夏回族自治区吴忠市利通区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640323', N'宁夏回族自治区吴忠市盐池县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640324', N'宁夏回族自治区吴忠市同心县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640381', N'宁夏回族自治区吴忠市青铜峡市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640400', N'宁夏回族自治区固原市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640401', N'宁夏回族自治区固原市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640402', N'宁夏回族自治区固原市原州区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640422', N'宁夏回族自治区固原市西吉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640423', N'宁夏回族自治区固原市隆德县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640424', N'宁夏回族自治区固原市泾源县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640425', N'宁夏回族自治区固原市彭阳县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640500', N'宁夏回族自治区中卫市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640501', N'宁夏回族自治区中卫市市辖区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640502', N'宁夏回族自治区中卫市沙坡头区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640521', N'宁夏回族自治区中卫市中宁县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'640522', N'宁夏回族自治区中卫市海原县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650000', N'新疆维吾尔自治区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650100', N'新疆维吾尔自治区乌鲁木齐市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650101', N'新疆维吾尔自治区乌鲁木齐市市辖')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650102', N'新疆维吾尔自治区乌鲁木齐市天山')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650103', N'新疆维吾尔自治区乌鲁木齐市沙依')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650104', N'新疆维吾尔自治区乌鲁木齐市新市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650105', N'新疆维吾尔自治区乌鲁木齐市水磨')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650106', N'新疆维吾尔自治区乌鲁木齐市头屯')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650107', N'新疆维吾尔自治区乌鲁木齐市达坂')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650108', N'新疆维吾尔自治区乌鲁木齐市东山')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650121', N'新疆维吾尔自治区乌鲁木齐市乌鲁')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650200', N'新疆维吾尔自治区克拉玛依市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650201', N'新疆维吾尔自治区克拉玛依市市辖')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650202', N'新疆维吾尔自治区克拉玛依市独山')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650203', N'新疆维吾尔自治区克拉玛依市克拉')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650204', N'新疆维吾尔自治区克拉玛依市白碱')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'650205', N'新疆维吾尔自治区克拉玛依市乌尔')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652100', N'新疆维吾尔自治区吐鲁番地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652101', N'新疆维吾尔自治区吐鲁番地区吐鲁')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652122', N'新疆维吾尔自治区吐鲁番地区鄯善')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652123', N'新疆维吾尔自治区吐鲁番地区托克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652200', N'新疆维吾尔自治区哈密地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652201', N'新疆维吾尔自治区哈密地区哈密市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652222', N'新疆维吾尔自治区哈密地区巴里坤')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652223', N'新疆维吾尔自治区哈密地区伊吾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652300', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652301', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652302', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652303', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652323', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652324', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652325', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652327', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652328', N'新疆维吾尔自治区昌吉回族自治州')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652700', N'新疆维吾尔自治区博尔塔拉蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652701', N'新疆维吾尔自治区博尔塔拉蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652722', N'新疆维吾尔自治区博尔塔拉蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652723', N'新疆维吾尔自治区博尔塔拉蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652800', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652801', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652822', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652823', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652824', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652825', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652826', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652827', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652828', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652829', N'新疆维吾尔自治区巴音郭楞蒙古自')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652900', N'新疆维吾尔自治区阿克苏地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652901', N'新疆维吾尔自治区阿克苏地区阿克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652922', N'新疆维吾尔自治区阿克苏地区温宿')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652923', N'新疆维吾尔自治区阿克苏地区库车')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652924', N'新疆维吾尔自治区阿克苏地区沙雅')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652925', N'新疆维吾尔自治区阿克苏地区新和')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652926', N'新疆维吾尔自治区阿克苏地区拜城')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652927', N'新疆维吾尔自治区阿克苏地区乌什')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652928', N'新疆维吾尔自治区阿克苏地区阿瓦')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'652929', N'新疆维吾尔自治区阿克苏地区柯坪')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653000', N'新疆维吾尔自治区克孜勒苏柯尔克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653001', N'新疆维吾尔自治区克孜勒苏柯尔克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653022', N'新疆维吾尔自治区克孜勒苏柯尔克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653023', N'新疆维吾尔自治区克孜勒苏柯尔克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653024', N'新疆维吾尔自治区克孜勒苏柯尔克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653100', N'新疆维吾尔自治区喀什地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653101', N'新疆维吾尔自治区喀什地区喀什市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653121', N'新疆维吾尔自治区喀什地区疏附县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653122', N'新疆维吾尔自治区喀什地区疏勒县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653123', N'新疆维吾尔自治区喀什地区英吉沙')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653124', N'新疆维吾尔自治区喀什地区泽普县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653125', N'新疆维吾尔自治区喀什地区莎车县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653126', N'新疆维吾尔自治区喀什地区叶城县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653127', N'新疆维吾尔自治区喀什地区麦盖提')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653128', N'新疆维吾尔自治区喀什地区岳普湖')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653129', N'新疆维吾尔自治区喀什地区伽师县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653130', N'新疆维吾尔自治区喀什地区巴楚县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653131', N'新疆维吾尔自治区喀什地区塔什库')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653200', N'新疆维吾尔自治区和田地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653201', N'新疆维吾尔自治区和田地区和田市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653221', N'新疆维吾尔自治区和田地区和田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653222', N'新疆维吾尔自治区和田地区墨玉县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653223', N'新疆维吾尔自治区和田地区皮山县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653224', N'新疆维吾尔自治区和田地区洛浦县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653225', N'新疆维吾尔自治区和田地区策勒县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653226', N'新疆维吾尔自治区和田地区于田县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'653227', N'新疆维吾尔自治区和田地区民丰县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654000', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654002', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654003', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654021', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654022', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654023', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654024', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654025', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654026', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654027', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654028', N'新疆维吾尔自治区伊犁哈萨克自治')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654200', N'新疆维吾尔自治区塔城地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654201', N'新疆维吾尔自治区塔城地区塔城市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654202', N'新疆维吾尔自治区塔城地区乌苏市')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654221', N'新疆维吾尔自治区塔城地区额敏县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654223', N'新疆维吾尔自治区塔城地区沙湾县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654224', N'新疆维吾尔自治区塔城地区托里县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654225', N'新疆维吾尔自治区塔城地区裕民县')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654226', N'新疆维吾尔自治区塔城地区和布克')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654300', N'新疆维吾尔自治区阿勒泰地区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654301', N'新疆维吾尔自治区阿勒泰地区阿勒')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654321', N'新疆维吾尔自治区阿勒泰地区布尔')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654322', N'新疆维吾尔自治区阿勒泰地区富蕴')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654323', N'新疆维吾尔自治区阿勒泰地区福海')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654324', N'新疆维吾尔自治区阿勒泰地区哈巴')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654325', N'新疆维吾尔自治区阿勒泰地区青河')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'654326', N'新疆维吾尔自治区阿勒泰地区吉木')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'659000', N'新疆维吾尔自治区省直辖行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'659001', N'新疆维吾尔自治区省直辖行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'659002', N'新疆维吾尔自治区省直辖行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'659003', N'新疆维吾尔自治区省直辖行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'659004', N'新疆维吾尔自治区省直辖行政单位')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'710000', N'台湾省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'710100', N'台湾省')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'810000', N'香港特别行政区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'810100', N'香港特别行政区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'820000', N'澳门特别行政区')
GO
INSERT [dbo].[Dir_Location] ([LocationId], [Text]) VALUES (N'820100', N'澳门特别行政区')
SET IDENTITY_INSERT [dbo].[Dir_Location] OFF 
GO

