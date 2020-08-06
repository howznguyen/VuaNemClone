USE [master]
GO
/****** Object:  Database [dbQuanLiNem]    Script Date: 07/08/2020 06:21:58 ******/
CREATE DATABASE [dbQuanLiNem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbQuanLiNem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbQuanLiNem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbQuanLiNem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbQuanLiNem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbQuanLiNem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbQuanLiNem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbQuanLiNem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbQuanLiNem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbQuanLiNem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbQuanLiNem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbQuanLiNem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbQuanLiNem] SET  MULTI_USER 
GO
ALTER DATABASE [dbQuanLiNem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbQuanLiNem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbQuanLiNem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbQuanLiNem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbQuanLiNem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbQuanLiNem] SET QUERY_STORE = OFF
GO
USE [dbQuanLiNem]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
GO
/****** Object:  Table [dbo].[NEM_CHATLIEU]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEM_CHATLIEU](
	[MACHATLIEU] [char](5) NOT NULL,
	[TENCHATLIEU] [nvarchar](255) NULL,
 CONSTRAINT [PK__NEM_CHAT__80F939F88DE96A76] PRIMARY KEY CLUSTERED 
(
	[MACHATLIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEM_CHUNGLOAI]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEM_CHUNGLOAI](
	[MACHUNGLOAI] [char](5) NOT NULL,
	[TENCHUNGLOAI] [nvarchar](50) NULL,
 CONSTRAINT [PK__CHUNGLOA__125148AB7D758AE3] PRIMARY KEY CLUSTERED 
(
	[MACHUNGLOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEM_DACDIEM]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEM_DACDIEM](
	[MASANPHAM] [char](5) NOT NULL,
	[DACDIEM01] [nvarchar](255) NULL,
	[DACDIEM02] [nvarchar](255) NULL,
	[DACDIEM03] [nvarchar](255) NULL,
 CONSTRAINT [PK__NEM_DACD__9534C892C157046B] PRIMARY KEY CLUSTERED 
(
	[MASANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEM_DOCUNG]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEM_DOCUNG](
	[MADOCUNG] [char](5) NOT NULL,
	[TENDOCUNG] [nvarchar](255) NULL,
 CONSTRAINT [PK__CHUNGLOA__125148AB7D758AE3_copy1] PRIMARY KEY CLUSTERED 
(
	[MADOCUNG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEM_THIETKE]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEM_THIETKE](
	[MATHIETKE] [char](5) NOT NULL,
	[TENTHIETKE] [nvarchar](255) NULL,
 CONSTRAINT [PK__NEM_THIE__AF996DE4EFE52CF2] PRIMARY KEY CLUSTERED 
(
	[MATHIETKE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEM_THONGTINTHEM]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEM_THONGTINTHEM](
	[MASANPHAM] [char](5) NOT NULL,
	[MADOCUNG] [char](5) NULL,
	[MATHIETKE] [char](5) NULL,
	[MACHUNGLOAI] [char](5) NULL,
	[MACHATLIEU] [char](5) NULL,
 CONSTRAINT [PK__THONGTIN__9534C892CDDC1A3E] PRIMARY KEY CLUSTERED 
(
	[MASANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_NEM_TT]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GET_NEM_TT] (
)
RETURNS TABLE
AS
	RETURN(
		SELECT TT.MASANPHAM, TENCHUNGLOAI, TENDOCUNG, TENTHIETKE, TENCHATLIEU, DACDIEM01, DACDIEM02, DACDIEM03
		FROM NEM_THONGTINTHEM TT, NEM_DOCUNG DC,NEM_THIETKE TK, NEM_CHATLIEU CL, NEM_CHUNGLOAI CHL, NEM_DACDIEM DD
		WHERE TT.MACHUNGLOAI = CHL.MACHUNGLOAI
		AND TT.MATHIETKE = TK.MATHIETKE
		AND TT.MADOCUNG = DC.MADOCUNG
		AND TT.MACHATLIEU = CL.MACHATLIEU
		AND TT.MASANPHAM = DD.MASANPHAM
	)
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MASANPHAM] [char](5) NOT NULL,
	[TENSANPHAM] [nvarchar](50) NULL,
	[MALOAI] [char](5) NULL,
	[MATHUONGHIEU] [char](5) NULL,
	[MAKICHTHUOC] [char](5) NULL,
	[GIA] [float] NULL,
	[THONGTIN] [ntext] NULL,
	[HINHMINHHOA] [nvarchar](255) NULL,
 CONSTRAINT [PK__SANPHAM__9534C892E9F10A62] PRIMARY KEY CLUSTERED 
(
	[MASANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUONGHIEU]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUONGHIEU](
	[MATHUONGHIEU] [char](5) NOT NULL,
	[MALOAI] [char](5) NULL,
	[TENTHUONGHIEU] [nvarchar](50) NULL,
 CONSTRAINT [PK__THUONGHI__B319F638644C3102] PRIMARY KEY CLUSTERED 
(
	[MATHUONGHIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_LIST_NEM]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GET_LIST_NEM] (
)
RETURNS TABLE
AS
RETURN(
			SELECT SP.MASANPHAM, TENSANPHAM, TENTHUONGHIEU, GIA, HINHMINHHOA, TENCHUNGLOAI, TENDOCUNG, TENTHIETKE, TENCHATLIEU, DACDIEM01, DACDIEM02, DACDIEM03
			FROM SANPHAM SP, DBO.GET_NEM_TT() TT, THUONGHIEU TH
			WHERE SP.MASANPHAM = TT.MASANPHAM
			AND SP.MATHUONGHIEU = TH.MATHUONGHIEU
			)
GO
/****** Object:  UserDefinedFunction [dbo].[GET_NEM]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GET_NEM] (
@MASANPHAM CHAR(5)
)
RETURNS TABLE
AS
RETURN(
			SELECT SP.MASANPHAM, TENSANPHAM, TENTHUONGHIEU, GIA, HINHMINHHOA, TENCHUNGLOAI, TENDOCUNG, TENTHIETKE, TENCHATLIEU, DACDIEM01, DACDIEM02, DACDIEM03
			FROM SANPHAM SP, DBO.GET_NEM_TT() TT, THUONGHIEU TH
			WHERE SP.MASANPHAM = TT.MASANPHAM
			AND SP.MATHUONGHIEU = TH.MATHUONGHIEU
			AND SP.MASANPHAM = @MASANPHAM
			)
GO
/****** Object:  UserDefinedFunction [dbo].[GET_NEM_BY_TH]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GET_NEM_BY_TH] (
@MATHUONGHIEU CHAR(5)
)
RETURNS TABLE
AS
RETURN(
			SELECT SP.MASANPHAM, TENSANPHAM, TENTHUONGHIEU, GIA, HINHMINHHOA, TENCHUNGLOAI, TENDOCUNG, TENTHIETKE, TENCHATLIEU, DACDIEM01, DACDIEM02, DACDIEM03
			FROM SANPHAM SP, DBO.GET_NEM_TT() TT, THUONGHIEU TH
			WHERE SP.MASANPHAM = TT.MASANPHAM
			AND SP.MATHUONGHIEU = TH.MATHUONGHIEU
			AND SP.MATHUONGHIEU = @MATHUONGHIEU
			)
GO
/****** Object:  UserDefinedFunction [dbo].[GET_NEM_BY_TEN]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GET_NEM_BY_TEN] (
@TENSANPHAM CHAR(5)
)
RETURNS TABLE
AS
RETURN(
			SELECT SP.MASANPHAM, TENSANPHAM, TENTHUONGHIEU, GIA, HINHMINHHOA, TENCHUNGLOAI, TENDOCUNG, TENTHIETKE, TENCHATLIEU, DACDIEM01, DACDIEM02, DACDIEM03
			FROM SANPHAM SP, DBO.GET_NEM_TT() TT, THUONGHIEU TH
			WHERE SP.MASANPHAM = TT.MASANPHAM
			AND SP.MATHUONGHIEU = TH.MATHUONGHIEU
			AND TENSANPHAM LIKE '%' + @TENSANPHAM + '%'
			)
GO
/****** Object:  Table [dbo].[KICHTHUOC]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KICHTHUOC](
	[MAKICHTHUOC] [char](5) NOT NULL,
	[MALOAI] [char](5) NULL,
	[TENKICHTHUOC] [nvarchar](50) NULL,
 CONSTRAINT [PK__KICHTHUO__CACE02660E3D47BF] PRIMARY KEY CLUSTERED 
(
	[MAKICHTHUOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAI]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI](
	[MALOAI] [char](5) NOT NULL,
	[TENLOAI] [nvarchar](50) NULL,
 CONSTRAINT [PK__LOAI__2F633F23E9D56F38] PRIMARY KEY CLUSTERED 
(
	[MALOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KICHTHUOC]  WITH CHECK ADD  CONSTRAINT [FK__KICHTHUOC__MALOA__4BAC3F29] FOREIGN KEY([MALOAI])
REFERENCES [dbo].[LOAI] ([MALOAI])
GO
ALTER TABLE [dbo].[KICHTHUOC] CHECK CONSTRAINT [FK__KICHTHUOC__MALOA__4BAC3F29]
GO
ALTER TABLE [dbo].[NEM_DACDIEM]  WITH CHECK ADD  CONSTRAINT [FK__NEM_DACDI__MASAN__03F0984C] FOREIGN KEY([MASANPHAM])
REFERENCES [dbo].[SANPHAM] ([MASANPHAM])
GO
ALTER TABLE [dbo].[NEM_DACDIEM] CHECK CONSTRAINT [FK__NEM_DACDI__MASAN__03F0984C]
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM]  WITH CHECK ADD  CONSTRAINT [FK__NEM_THONG__MACHA__01142BA1] FOREIGN KEY([MACHATLIEU])
REFERENCES [dbo].[NEM_CHATLIEU] ([MACHATLIEU])
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM] CHECK CONSTRAINT [FK__NEM_THONG__MACHA__01142BA1]
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM]  WITH CHECK ADD  CONSTRAINT [FK__NEM_THONG__MACHU__797309D9] FOREIGN KEY([MACHUNGLOAI])
REFERENCES [dbo].[NEM_CHUNGLOAI] ([MACHUNGLOAI])
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM] CHECK CONSTRAINT [FK__NEM_THONG__MACHU__797309D9]
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM]  WITH CHECK ADD  CONSTRAINT [FK__NEM_THONG__MADOC__00200768] FOREIGN KEY([MADOCUNG])
REFERENCES [dbo].[NEM_DOCUNG] ([MADOCUNG])
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM] CHECK CONSTRAINT [FK__NEM_THONG__MADOC__00200768]
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM]  WITH CHECK ADD  CONSTRAINT [FK__NEM_THONG__MATHI__7A672E12] FOREIGN KEY([MATHIETKE])
REFERENCES [dbo].[NEM_THIETKE] ([MATHIETKE])
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM] CHECK CONSTRAINT [FK__NEM_THONG__MATHI__7A672E12]
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM]  WITH CHECK ADD  CONSTRAINT [FK__THONGTINN__MASAN__6FE99F9F] FOREIGN KEY([MASANPHAM])
REFERENCES [dbo].[SANPHAM] ([MASANPHAM])
GO
ALTER TABLE [dbo].[NEM_THONGTINTHEM] CHECK CONSTRAINT [FK__THONGTINN__MASAN__6FE99F9F]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK__SANPHAM__MAKICHT__5165187F] FOREIGN KEY([MAKICHTHUOC])
REFERENCES [dbo].[KICHTHUOC] ([MAKICHTHUOC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK__SANPHAM__MAKICHT__5165187F]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK__SANPHAM__MALOAI__5441852A] FOREIGN KEY([MALOAI])
REFERENCES [dbo].[LOAI] ([MALOAI])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK__SANPHAM__MALOAI__5441852A]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK__SANPHAM__MATHUON__52593CB8] FOREIGN KEY([MATHUONGHIEU])
REFERENCES [dbo].[THUONGHIEU] ([MATHUONGHIEU])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK__SANPHAM__MATHUON__52593CB8]
GO
ALTER TABLE [dbo].[THUONGHIEU]  WITH CHECK ADD  CONSTRAINT [FK__THUONGHIE__MALOA__4E88ABD4] FOREIGN KEY([MALOAI])
REFERENCES [dbo].[LOAI] ([MALOAI])
GO
ALTER TABLE [dbo].[THUONGHIEU] CHECK CONSTRAINT [FK__THUONGHIE__MALOA__4E88ABD4]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 07/08/2020 06:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
GO
USE [master]
GO
ALTER DATABASE [dbQuanLiNem] SET  READ_WRITE 
GO
