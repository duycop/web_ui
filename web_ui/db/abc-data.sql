USE [MonitorRoom]
GO
/****** Object:  Table [dbo].[History]    Script Date: 2024-09-19 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SensorID] [int] NULL,
	[status] [bit] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor]    Script Date: 2024-09-19 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[TypeID] [int] NULL,
	[status] [bit] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 2024-09-19 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History] ON 
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (1, 1, 1, CAST(N'2024-09-19T07:00:00.000' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (2, 1, 0, CAST(N'2024-09-19T07:20:00.000' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (3, 1, 1, CAST(N'2024-09-19T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (4, 101, 1, CAST(N'2024-09-19T08:53:02.977' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (5, 102, 0, CAST(N'2024-09-19T08:53:10.743' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (6, 11, 0, CAST(N'2024-09-19T08:53:44.457' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (7, 12, 0, CAST(N'2024-09-19T08:53:49.257' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (8, 13, 1, CAST(N'2024-09-19T08:53:53.390' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (9, 1, 0, CAST(N'2024-09-19T09:05:39.967' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (10, 1, 0, CAST(N'2024-09-19T09:05:42.907' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (11, 101, 0, CAST(N'2024-09-19T09:06:15.663' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (12, 102, 1, CAST(N'2024-09-19T09:06:18.750' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (13, 103, 0, CAST(N'2024-09-19T09:06:20.830' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (14, 104, 0, CAST(N'2024-09-19T09:06:23.180' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (15, 105, 0, CAST(N'2024-09-19T09:06:24.533' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (16, 106, 0, CAST(N'2024-09-19T09:06:26.100' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (17, 103, 1, CAST(N'2024-09-19T09:06:32.600' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (18, 1, 1, CAST(N'2024-09-19T09:11:00.757' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (19, 14, 1, CAST(N'2024-09-19T09:11:04.863' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (20, 1, 0, CAST(N'2024-09-19T09:12:19.103' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (21, 13, 0, CAST(N'2024-09-19T09:13:41.630' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (22, 13, 1, CAST(N'2024-09-19T09:13:44.987' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (23, 1, 1, CAST(N'2024-09-19T09:21:51.643' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (24, 14, 0, CAST(N'2024-09-19T09:21:55.990' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (25, 11, 1, CAST(N'2024-09-19T09:34:36.913' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (26, 1, 0, CAST(N'2024-09-19T09:34:45.250' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (27, 12, 1, CAST(N'2024-09-19T09:35:47.213' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (28, 12, 0, CAST(N'2024-09-19T09:36:23.310' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (29, 11, 0, CAST(N'2024-09-19T09:36:30.203' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (30, 14, 1, CAST(N'2024-09-19T09:36:36.863' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (31, 1, 1, CAST(N'2024-09-19T09:39:36.730' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (32, 1, 0, CAST(N'2024-09-19T09:39:42.333' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (33, 1, 1, CAST(N'2024-09-19T09:39:45.510' AS DateTime))
GO
INSERT [dbo].[History] ([id], [SensorID], [status], [time]) VALUES (34, 12, 1, CAST(N'2024-09-19T09:39:49.567' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[History] OFF
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (1, N'tivi Xiaomi 65Inch', 1, 1, CAST(N'2024-09-19T09:39:45.510' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (11, N'Q1', 2, 0, CAST(N'2024-09-19T09:36:30.203' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (12, N'Q2', 2, 1, CAST(N'2024-09-19T09:39:49.567' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (13, N'Q3', 2, 1, CAST(N'2024-09-19T09:13:44.987' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (14, N'Quạt treo tường GV', 2, 1, CAST(N'2024-09-19T09:36:36.863' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (101, N'Đèn1', 3, 0, CAST(N'2024-09-19T09:06:15.663' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (102, N'Đèn2', 3, 1, CAST(N'2024-09-19T09:06:18.750' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (103, N'Đèn3', 3, 1, CAST(N'2024-09-19T09:06:32.600' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (104, N'Đèn4', 3, 0, CAST(N'2024-09-19T09:06:23.180' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (105, N'Đèn5', 3, 0, CAST(N'2024-09-19T09:06:24.533' AS DateTime))
GO
INSERT [dbo].[Sensor] ([id], [name], [TypeID], [status], [time]) VALUES (106, N'Đèn6', 3, 0, CAST(N'2024-09-19T09:06:26.100' AS DateTime))
GO
INSERT [dbo].[Type] ([id], [name]) VALUES (1, N'TiVi')
GO
INSERT [dbo].[Type] ([id], [name]) VALUES (2, N'Quạt')
GO
INSERT [dbo].[Type] ([id], [name]) VALUES (3, N'Đèn')
GO
ALTER TABLE [dbo].[Sensor] ADD  CONSTRAINT [DF_Sensor_time]  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Sensor] FOREIGN KEY([SensorID])
REFERENCES [dbo].[Sensor] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Sensor]
GO
ALTER TABLE [dbo].[Sensor]  WITH CHECK ADD  CONSTRAINT [FK_Sensor_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sensor] CHECK CONSTRAINT [FK_Sensor_Type]
GO
/****** Object:  StoredProcedure [dbo].[SP_API]    Script Date: 2024-09-19 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		do duy cop
-- Create date: 19.9.2024
-- Description:	SP chuyên phục vụ api làm nhiều thứ
-- =============================================
CREATE PROCEDURE [dbo].[SP_API]
	@action varchar(50)='get_status',
	@idSensor int=null,
	@status bit=null
AS
BEGIN
	if(@action='get_status')
	begin
		--trả về json: hiện trạng của hệ thống:
		--json có dạng: {"ok":true,"msg":"ok","den":[1,0,1,0,1,0],"quat":[0,1,1,1],"tv":0}
		declare @json nvarchar(max)='{"ok":1,"msg":"ok from db"';
		SELECT @json+=',"den":['+STRING_AGG(CASE WHEN [status] = 1 THEN '1' ELSE '0' END, ',')+']'
		FROM Sensor 
		WHERE TypeID = 3;

		SELECT @json+=',"quat":['+STRING_AGG(CASE WHEN [status] = 1 THEN '1' ELSE '0' END, ',')+']'
		FROM Sensor 
		WHERE TypeID = 2;

		SELECT @json+=',"tv":'+STRING_AGG(CASE WHEN [status] = 1 THEN '1' ELSE '0' END, ',')+'}'
		FROM Sensor 
		WHERE TypeID = 1;

		select @json as [json];
	end
	else if(@action='control')
	begin
	--điều khiển thiết bị nào ? cần id
	--thành trạng thái mới là gì? on or off thì dùng 1 or 0
		declare @now datetime=getdate();

		update [Sensor] 
		set [status]=@status,[time]=@now
		where id=@idSensor;
		
		--lưu lịch sử
		insert into History([SensorID],[Status],[Time])
		values(@idSensor,@status, @now);

		select N'{"ok":1,"msg":"control ok nhé"}' as [json];

	end
	else if(@action='get_history')
	begin
	  -- mày cần lấy history của sensor nào? => cần idSensor
	  -- trả về json
	  select top 100 -- top để lấy 100 ls gần nhất, vì data sẽ rất lớn nếu dùng lâu
		case when [status]=1 then 1 else 0 end as [status],
		convert(varchar(19),[time],120) as [time]
	  from History
	  where SensorID=@idSensor
	  order by [time] desc
	  for json path;
	end
END
GO
