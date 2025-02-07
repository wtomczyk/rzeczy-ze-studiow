USE [master]
GO
/****** Object:  Database [projektTomczyk]    Script Date: 1/13/2023 7:26:06 PM ******/
CREATE DATABASE [projektTomczyk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projektTomczyk', FILENAME = N'D:\sql\MSSQL15.MSSQLSERVER01\MSSQL\DATA\projektTomczyk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projektTomczyk_log', FILENAME = N'D:\sql\MSSQL15.MSSQLSERVER01\MSSQL\DATA\projektTomczyk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projektTomczyk] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projektTomczyk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projektTomczyk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projektTomczyk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projektTomczyk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projektTomczyk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projektTomczyk] SET ARITHABORT OFF 
GO
ALTER DATABASE [projektTomczyk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projektTomczyk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projektTomczyk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projektTomczyk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projektTomczyk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projektTomczyk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projektTomczyk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projektTomczyk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projektTomczyk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projektTomczyk] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projektTomczyk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projektTomczyk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projektTomczyk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projektTomczyk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projektTomczyk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projektTomczyk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projektTomczyk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projektTomczyk] SET RECOVERY FULL 
GO
ALTER DATABASE [projektTomczyk] SET  MULTI_USER 
GO
ALTER DATABASE [projektTomczyk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projektTomczyk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projektTomczyk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projektTomczyk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projektTomczyk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projektTomczyk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'projektTomczyk', N'ON'
GO
ALTER DATABASE [projektTomczyk] SET QUERY_STORE = OFF
GO
USE [projektTomczyk]
GO
/****** Object:  Table [dbo].[adres]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adres](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[panstwo] [varchar](30) NOT NULL,
	[wojewodztwo] [varchar](30) NOT NULL,
	[miejscowosc] [varchar](30) NOT NULL,
	[ulica] [varchar](30) NOT NULL,
	[numerDomu] [varchar](3) NOT NULL,
	[numerMieszkania] [varchar](3) NULL,
 CONSTRAINT [PK_adres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dodatkoweInformacje]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dodatkoweInformacje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numerSiedzenia] [int] NOT NULL,
	[wagaBagazu] [varchar](6) NOT NULL,
	[statusRezerwacji] [varchar](10) NOT NULL,
	[cena] [varchar](10) NOT NULL,
 CONSTRAINT [PK_dodatkoweInformacje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lot]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[celLotu] [varchar](20) NOT NULL,
	[dataLotu] [date] NOT NULL,
	[idSamolotu] [int] NOT NULL,
 CONSTRAINT [PK_lot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasazer]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasazer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](20) NOT NULL,
	[nazwisko] [varchar](20) NOT NULL,
	[pesel] [varchar](11) NULL,
	[telefon] [varchar](12) NOT NULL,
	[email] [varchar](30) NULL,
	[idAdresu] [int] NOT NULL,
 CONSTRAINT [PK_pasazer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rezerwacja]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rezerwacja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPasazera] [int] NOT NULL,
	[idLotu] [int] NOT NULL,
	[idInformacji] [int] NOT NULL,
 CONSTRAINT [PK_rezerwacja] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rezerwacjaArchiwum]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rezerwacjaArchiwum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPasazera] [int] NOT NULL,
	[idLotu] [int] NOT NULL,
	[idInformacji] [int] NOT NULL,
 CONSTRAINT [PK_rezerwacjaArchiwum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[samolot]    Script Date: 1/13/2023 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[samolot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](20) NOT NULL,
	[typ] [varchar](20) NOT NULL,
	[producent] [varchar](20) NOT NULL,
 CONSTRAINT [PK_samolot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[adres] ON 

INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (1, N'Polska', N'malopolskie', N'Krakow', N'ulica1', N'1', N'1')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (2, N'Polska', N'slaskie', N'Katowice', N'Piwna', N'11', N'2')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (3, N'Polska', N'mazowieckie', N'Warszawa', N'Warszawska', N'7', N'11')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (4, N'Polska', N'slaskie', N'Katowice', N'Krucza', N'43', N'3')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (5, N'Polska', N'kujawsko-pomorskie', N'Bydgoszcz', N'Morska', N'21', N'36')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (6, N'Polska', N'podlaskie', N'Bialystok', N'Gorska', N'6', N'89')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (7, N'Polska', N'malopolskie', N'Krakow', N'al. Jana Pawla 2', N'5', N'4')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (8, N'Polska', N'lubuskie', N'Zielona Gora', N'Zielona', N'3', N'3')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (9, N'Polska', N'mazowieckie', N'Warszawa', N'Krakowska', N'3', N'3')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (10, N'Polska', N'malopolskie', N'Krakow', N'Dluga', N'7', N'8')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (11, N'Polska', N'malopolskie', N'Krakow', N'Dluga', N'11', N'78')
INSERT [dbo].[adres] ([id], [panstwo], [wojewodztwo], [miejscowosc], [ulica], [numerDomu], [numerMieszkania]) VALUES (12, N'Polska', N'malopolskie', N'Krakow', N'Krotka', N'2', N'45')
SET IDENTITY_INSERT [dbo].[adres] OFF
GO
SET IDENTITY_INSERT [dbo].[dodatkoweInformacje] ON 

INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (1, 2, N'34.5', N'zaplacono', N'39.99')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (2, 34, N'3', N'zaplacono', N'70.00')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (3, 6, N'13', N'zaplacono', N'28.99')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (5, 5, N'23', N'do zaplaty', N'90.00')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (6, 78, N'0', N'zaplacono', N'23.45')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (7, 8, N'110', N'zaplacono', N'230.98')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (8, 51, N'10', N'do zaplaty', N'67.99')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (9, 1, N'9', N'zaplacono', N'99.99')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (10, 15, N'23.67', N'do zaplaty', N'90.00')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (11, 5, N'22', N'do zaplaty', N'50.00')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (12, 2, N'222', N'zaplacono', N'222.22')
INSERT [dbo].[dodatkoweInformacje] ([id], [numerSiedzenia], [wagaBagazu], [statusRezerwacji], [cena]) VALUES (13, 43, N'12', N'zaplacono', N'30.99')
SET IDENTITY_INSERT [dbo].[dodatkoweInformacje] OFF
GO
SET IDENTITY_INSERT [dbo].[lot] ON 

INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (1, N'Warszawa', CAST(N'2022-12-12' AS Date), 1)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (3, N'Berlin', CAST(N'2022-11-09' AS Date), 5)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (4, N'Warszawa', CAST(N'2022-12-01' AS Date), 9)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (5, N'Krakow', CAST(N'2022-10-11' AS Date), 9)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (6, N'Gdansk', CAST(N'2022-09-23' AS Date), 3)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (7, N'Poznan', CAST(N'2023-01-01' AS Date), 7)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (8, N'Watykan', CAST(N'2063-01-01' AS Date), 10)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (9, N'Katowice', CAST(N'2022-10-11' AS Date), 11)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (10, N'Katowice', CAST(N'2022-12-12' AS Date), 2)
INSERT [dbo].[lot] ([id], [celLotu], [dataLotu], [idSamolotu]) VALUES (11, N'Bialystok', CAST(N'2023-09-01' AS Date), 8)
SET IDENTITY_INSERT [dbo].[lot] OFF
GO
SET IDENTITY_INSERT [dbo].[pasazer] ON 

INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (1, N'Jan', N'Kowalski', N'12345678901', N'555555555', N'email@email.pl', 1)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (2, N'Mariusz', N'Tarczyk', N'02262212218', N'766956936', N'email1@email.pl', 2)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (3, N'Aneta', N'Bryk', N'88052865697', N'541609224', N'email2@email.pl', 3)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (4, N'Bogdan', N'Boner', N'81040786538', N'826865283', N'ZAQ1@WSX.pl', 4)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (5, N'Andrzej', N'Syta', N'76032453828', N'114709403', N'sdasdsa@dsa.pl', 5)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (6, N'Bozydar', N'Kiep', N'87042455919', N'285355388', N'gfgfgf@gmail.pl', 6)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (7, N'Irena', N'Nazwisko', N'04250823356', N'561147776', N'adres@email.pl', 7)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (8, N'Bronislaw', N'Granisz', N'86060487948', N'572953803', N'jgfddsa@interia.pl', 8)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (9, N'Julia', N'Oran', N'57102352843', N'150696234', N'qqqq@wwww.pl', 9)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (10, N'Imie', N'Nazwisko', N'77062967998', N'107312099', N'a@a.pl', 10)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (11, N'Edyta', N'Izba', N'86050233968', N'054340630', N'trtrtr@yyy.pl', 11)
INSERT [dbo].[pasazer] ([id], [imie], [nazwisko], [pesel], [telefon], [email], [idAdresu]) VALUES (12, N'Grzegorz', N'Drycz', N'49090183583', N'727572826', N'hhhhhh@onet.pl', 12)
SET IDENTITY_INSERT [dbo].[pasazer] OFF
GO
SET IDENTITY_INSERT [dbo].[rezerwacja] ON 

INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (4, 4, 5, 5)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (5, 5, 6, 6)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (6, 6, 7, 7)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (7, 7, 8, 8)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (8, 8, 9, 9)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (9, 9, 10, 10)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (10, 10, 11, 11)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (11, 11, 7, 12)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (12, 12, 9, 13)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (14, 1, 1, 1)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (15, 2, 3, 2)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (16, 3, 4, 3)
INSERT [dbo].[rezerwacja] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (18, 4, 6, 12)
SET IDENTITY_INSERT [dbo].[rezerwacja] OFF
GO
SET IDENTITY_INSERT [dbo].[rezerwacjaArchiwum] ON 

INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (4, 4, 5, 5)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (5, 5, 6, 6)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (6, 6, 7, 7)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (7, 7, 8, 8)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (8, 8, 9, 9)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (9, 9, 10, 10)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (10, 10, 11, 11)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (11, 11, 7, 12)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (12, 12, 9, 13)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (14, 1, 1, 1)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (15, 2, 3, 2)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (16, 3, 4, 3)
INSERT [dbo].[rezerwacjaArchiwum] ([id], [idPasazera], [idLotu], [idInformacji]) VALUES (18, 4, 6, 12)
SET IDENTITY_INSERT [dbo].[rezerwacjaArchiwum] OFF
GO
SET IDENTITY_INSERT [dbo].[samolot] ON 

INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (1, N'samolot1', N'pasazerski', N'Airbus')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (2, N'Boeing 747', N'pasazerski', N'Boeing Company')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (3, N'C-17', N'ladunkowy', N'Boeing Company')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (5, N'A380', N'pasazerski', N'Airbus')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (6, N'A330 MRTT', N'wojskowy', N'Airbus')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (7, N'Embraer 195', N'pasazerski', N'Embraer')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (8, N'Embraer 202 Ipanema', N'rolniczy', N'Embraer')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (9, N'Boeing 787', N'pasazerski', N'Boeing Company')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (10, N'A350', N'pasazerski', N'Airbus')
INSERT [dbo].[samolot] ([id], [nazwa], [typ], [producent]) VALUES (11, N'A340', N'pasazerski', N'Airbus')
SET IDENTITY_INSERT [dbo].[samolot] OFF
GO
ALTER TABLE [dbo].[lot]  WITH CHECK ADD  CONSTRAINT [FK_lot_samolot] FOREIGN KEY([idSamolotu])
REFERENCES [dbo].[samolot] ([id])
GO
ALTER TABLE [dbo].[lot] CHECK CONSTRAINT [FK_lot_samolot]
GO
ALTER TABLE [dbo].[pasazer]  WITH CHECK ADD  CONSTRAINT [FK_pasazer_adres] FOREIGN KEY([idAdresu])
REFERENCES [dbo].[adres] ([id])
GO
ALTER TABLE [dbo].[pasazer] CHECK CONSTRAINT [FK_pasazer_adres]
GO
ALTER TABLE [dbo].[rezerwacja]  WITH CHECK ADD  CONSTRAINT [FK_rezerwacja_dodatkoweInformacje] FOREIGN KEY([idInformacji])
REFERENCES [dbo].[dodatkoweInformacje] ([id])
GO
ALTER TABLE [dbo].[rezerwacja] CHECK CONSTRAINT [FK_rezerwacja_dodatkoweInformacje]
GO
ALTER TABLE [dbo].[rezerwacja]  WITH CHECK ADD  CONSTRAINT [FK_rezerwacja_lot] FOREIGN KEY([idLotu])
REFERENCES [dbo].[lot] ([id])
GO
ALTER TABLE [dbo].[rezerwacja] CHECK CONSTRAINT [FK_rezerwacja_lot]
GO
ALTER TABLE [dbo].[rezerwacja]  WITH CHECK ADD  CONSTRAINT [FK_rezerwacja_pasazer] FOREIGN KEY([idPasazera])
REFERENCES [dbo].[pasazer] ([id])
GO
ALTER TABLE [dbo].[rezerwacja] CHECK CONSTRAINT [FK_rezerwacja_pasazer]
GO
/****** Object:  Trigger [dbo].[deleteInfo]    Script Date: 1/13/2023 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[deleteInfo]
on [dbo].[dodatkoweInformacje]
instead of delete
as
begin
declare @Id int
select @Id = id from deleted
delete from rezerwacja where idInformacji = @Id
delete from dodatkoweInformacje where id = @Id
end
GO
ALTER TABLE [dbo].[dodatkoweInformacje] ENABLE TRIGGER [deleteInfo]
GO
/****** Object:  Trigger [dbo].[addArchive]    Script Date: 1/13/2023 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[addArchive]
on [dbo].[rezerwacja]
for insert
as
begin
declare @pasazer int
declare @lot int
declare @info int
select @pasazer = idPasazera from inserted
select @lot = idLotu from inserted
select @info = idInformacji from inserted
insert into rezerwacjaArchiwum values (@pasazer, @lot, @info)
end
GO
ALTER TABLE [dbo].[rezerwacja] ENABLE TRIGGER [addArchive]
GO
/****** Object:  Trigger [dbo].[updateArchive]    Script Date: 1/13/2023 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[updateArchive]
on [dbo].[rezerwacja]
for update
as
begin
declare @id int
declare @pasazer int
declare @lot int
declare @info int
select @id = id from inserted
select @pasazer = idPasazera from inserted
select @lot = idLotu from inserted
select @info = idInformacji from inserted
update rezerwacjaArchiwum set idPasazera = @pasazer, idLotu = @lot, idInformacji = @info where id = @id
end
GO
ALTER TABLE [dbo].[rezerwacja] ENABLE TRIGGER [updateArchive]
GO
USE [master]
GO
ALTER DATABASE [projektTomczyk] SET  READ_WRITE 
GO
