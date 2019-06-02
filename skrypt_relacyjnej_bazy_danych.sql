USE [master]
GO
/****** Object:  Database [Biblioteka_BD]    Script Date: 02.06.2019 22:47:41 ******/
CREATE DATABASE [Biblioteka_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteka_BD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Biblioteka_BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteka_BD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Biblioteka_BD_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Biblioteka_BD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteka_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteka_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Biblioteka_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteka_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteka_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteka_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteka_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteka_BD] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteka_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteka_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteka_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteka_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteka_BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteka_BD] SET QUERY_STORE = OFF
GO
USE [Biblioteka_BD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Biblioteka_BD]
GO
/****** Object:  Table [dbo].[Kategorie]    Script Date: 02.06.2019 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorie](
	[id_kategoria] [int] NOT NULL,
	[nazwa] [nvarchar](46) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_kategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autorzy]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autorzy](
	[id_autor] [int] NOT NULL,
	[imie] [nvarchar](15) NULL,
	[nazwisko] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wydawnictwa]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wydawnictwa](
	[id_wydawnictwo] [int] NOT NULL,
	[nazwa] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_wydawnictwo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ksiazki]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ksiazki](
	[id_ksiazka] [int] NOT NULL,
	[isbn] [nvarchar](13) NULL,
	[id_kategoria] [int] NULL,
	[tytul] [nvarchar](255) NULL,
	[opis] [nvarchar](500) NULL,
	[id_autor] [int] NULL,
	[id_wydawnictwo] [int] NULL,
	[rok_wydania] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ksiazka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Czytelnicy]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Czytelnicy](
	[id_czytelnik] [int] NOT NULL,
	[login] [nvarchar](10) NULL,
	[haslo] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[telefon] [nvarchar](20) NULL,
	[data_urodzenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_czytelnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id_rola] [int] NOT NULL,
	[nazwa] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rola] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[id_pracownik] [int] NOT NULL,
	[login] [nvarchar](10) NULL,
	[haslo] [nvarchar](20) NULL,
	[id_rola] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pracownik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wypozyczenia]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wypozyczenia](
	[id_wypozyczenie] [bigint] NOT NULL,
	[id_czytelnik] [int] NULL,
	[id_ksiazka] [int] NULL,
	[data_wypozyczenia] [date] NULL,
	[id_pracownik_wypozyczenie] [int] NULL,
	[data_oddania] [date] NULL,
	[id_pracownik_oddanie] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_wypozyczenie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Widok zdenormalizowany]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Widok zdenormalizowany]
AS
SELECT        dbo.Wypozyczenia.id_wypozyczenie AS [ID wypozyczenia], dbo.Wypozyczenia.data_wypozyczenia AS [Data wypozyczenia], dbo.Czytelnicy.login AS [Login czytelnika], dbo.Pracownicy.login AS [Login pracownika], 
                         dbo.Role.nazwa AS [Rola pracownika], dbo.Ksiazki.tytul AS [Tytul ksiazki], dbo.Ksiazki.rok_wydania AS [Rok wydania ksiazki], dbo.Kategorie.nazwa AS [Kategoria ksiazki], dbo.Wydawnictwa.nazwa AS Wydawnictwo, 
                         dbo.Autorzy.imie AS [Imie autora], dbo.Autorzy.nazwisko AS [Nazwisko autora]
FROM            dbo.Role INNER JOIN
                         dbo.Pracownicy ON dbo.Role.id_rola = dbo.Pracownicy.id_rola INNER JOIN
                         dbo.Wypozyczenia ON dbo.Pracownicy.id_pracownik = dbo.Wypozyczenia.id_pracownik_wypozyczenie AND dbo.Pracownicy.id_pracownik = dbo.Wypozyczenia.id_pracownik_oddanie INNER JOIN
                         dbo.Autorzy INNER JOIN
                         dbo.Ksiazki ON dbo.Autorzy.id_autor = dbo.Ksiazki.id_autor INNER JOIN
                         dbo.Kategorie ON dbo.Ksiazki.id_kategoria = dbo.Kategorie.id_kategoria INNER JOIN
                         dbo.Wydawnictwa ON dbo.Ksiazki.id_wydawnictwo = dbo.Wydawnictwa.id_wydawnictwo ON dbo.Wypozyczenia.id_ksiazka = dbo.Ksiazki.id_ksiazka INNER JOIN
                         dbo.Czytelnicy ON dbo.Wypozyczenia.id_czytelnik = dbo.Czytelnicy.id_czytelnik
GO
/****** Object:  View [dbo].[wypozyczenia ksiazek przez czytelnikow]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[wypozyczenia ksiazek przez czytelnikow]
AS
SELECT        dbo.Czytelnicy.login AS Czytelnik, dbo.Ksiazki.tytul AS [Tytuł ksiazki], dbo.Ksiazki.rok_wydania AS [Rok wydania ksiazki], dbo.Kategorie.nazwa AS [Kategoria ksiazki], dbo.Wydawnictwa.nazwa AS Wydawnictwo, 
                         dbo.Autorzy.imie AS [Imie autora], dbo.Autorzy.nazwisko AS [Nazwisko autora], COUNT(*) AS [Ilosc wypozyczen]
FROM            dbo.Role INNER JOIN
                         dbo.Pracownicy ON dbo.Role.id_rola = dbo.Pracownicy.id_rola INNER JOIN
                         dbo.Wypozyczenia ON dbo.Pracownicy.id_pracownik = dbo.Wypozyczenia.id_pracownik_wypozyczenie AND dbo.Pracownicy.id_pracownik = dbo.Wypozyczenia.id_pracownik_oddanie INNER JOIN
                         dbo.Autorzy INNER JOIN
                         dbo.Ksiazki ON dbo.Autorzy.id_autor = dbo.Ksiazki.id_autor INNER JOIN
                         dbo.Kategorie ON dbo.Ksiazki.id_kategoria = dbo.Kategorie.id_kategoria INNER JOIN
                         dbo.Wydawnictwa ON dbo.Ksiazki.id_wydawnictwo = dbo.Wydawnictwa.id_wydawnictwo ON dbo.Wypozyczenia.id_ksiazka = dbo.Ksiazki.id_ksiazka INNER JOIN
                         dbo.Czytelnicy ON dbo.Wypozyczenia.id_czytelnik = dbo.Czytelnicy.id_czytelnik
WHERE        (dbo.Czytelnicy.login LIKE '[A-C]%')
GROUP BY dbo.Czytelnicy.login, dbo.Ksiazki.tytul, dbo.Ksiazki.rok_wydania, dbo.Kategorie.nazwa, dbo.Wydawnictwa.nazwa, dbo.Autorzy.imie, dbo.Autorzy.nazwisko
GO
/****** Object:  View [dbo].[MV_wypozyczenia]    Script Date: 02.06.2019 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MV_wypozyczenia] WITH SCHEMABINDING AS
SELECT        dbo.Czytelnicy.login AS Czytelnik, dbo.Ksiazki.tytul AS [Tytuł ksiazki], dbo.Ksiazki.rok_wydania AS [Rok wydania ksiazki], dbo.Kategorie.nazwa AS [Kategoria ksiazki], dbo.Wydawnictwa.nazwa AS Wydawnictwo, 
                         dbo.Autorzy.imie AS [Imie autora], dbo.Autorzy.nazwisko AS [Nazwisko autora], COUNT_BIG(*) AS [Ilosc wypozyczen]
FROM            dbo.Role INNER JOIN
                         dbo.Pracownicy ON dbo.Role.id_rola = dbo.Pracownicy.id_rola INNER JOIN
                         dbo.Wypozyczenia ON dbo.Pracownicy.id_pracownik = dbo.Wypozyczenia.id_pracownik_wypozyczenie AND dbo.Pracownicy.id_pracownik = dbo.Wypozyczenia.id_pracownik_oddanie INNER JOIN
                         dbo.Autorzy INNER JOIN
                         dbo.Ksiazki ON dbo.Autorzy.id_autor = dbo.Ksiazki.id_autor INNER JOIN
                         dbo.Kategorie ON dbo.Ksiazki.id_kategoria = dbo.Kategorie.id_kategoria INNER JOIN
                         dbo.Wydawnictwa ON dbo.Ksiazki.id_wydawnictwo = dbo.Wydawnictwa.id_wydawnictwo ON dbo.Wypozyczenia.id_ksiazka = dbo.Ksiazki.id_ksiazka INNER JOIN
                         dbo.Czytelnicy ON dbo.Wypozyczenia.id_czytelnik = dbo.Czytelnicy.id_czytelnik
WHERE        (dbo.Czytelnicy.login LIKE '[A-C]%')
GROUP BY dbo.Czytelnicy.login, dbo.Ksiazki.tytul, dbo.Ksiazki.rok_wydania, dbo.Kategorie.nazwa, dbo.Wydawnictwa.nazwa, dbo.Autorzy.imie, dbo.Autorzy.nazwisko
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [MV_wypozyczeniaInd]    Script Date: 02.06.2019 22:47:42 ******/
CREATE UNIQUE CLUSTERED INDEX [MV_wypozyczeniaInd] ON [dbo].[MV_wypozyczenia]
(
	[Czytelnik] ASC,
	[Tytuł ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK_autor] FOREIGN KEY([id_autor])
REFERENCES [dbo].[Autorzy] ([id_autor])
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK_autor]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK_kategoria] FOREIGN KEY([id_kategoria])
REFERENCES [dbo].[Kategorie] ([id_kategoria])
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK_kategoria]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK_wydawnictwo] FOREIGN KEY([id_wydawnictwo])
REFERENCES [dbo].[Wydawnictwa] ([id_wydawnictwo])
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK_wydawnictwo]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_rola] FOREIGN KEY([id_rola])
REFERENCES [dbo].[Role] ([id_rola])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_rola]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_czytelnik] FOREIGN KEY([id_czytelnik])
REFERENCES [dbo].[Czytelnicy] ([id_czytelnik])
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK_czytelnik]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_ksiazka] FOREIGN KEY([id_ksiazka])
REFERENCES [dbo].[Ksiazki] ([id_ksiazka])
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK_ksiazka]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_pracownik_oddanie] FOREIGN KEY([id_pracownik_oddanie])
REFERENCES [dbo].[Pracownicy] ([id_pracownik])
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK_pracownik_oddanie]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_pracownik_wypozyczenie] FOREIGN KEY([id_pracownik_wypozyczenie])
REFERENCES [dbo].[Pracownicy] ([id_pracownik])
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK_pracownik_wypozyczenie]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Role"
            Begin Extent = 
               Top = 198
               Left = 1085
               Bottom = 294
               Right = 1255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pracownicy"
            Begin Extent = 
               Top = 198
               Left = 877
               Bottom = 328
               Right = 1047
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Wypozyczenia"
            Begin Extent = 
               Top = 363
               Left = 830
               Bottom = 493
               Right = 1067
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Autorzy"
            Begin Extent = 
               Top = 198
               Left = 38
               Bottom = 311
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ksiazki"
            Begin Extent = 
               Top = 198
               Left = 662
               Bottom = 328
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Kategorie"
            Begin Extent = 
               Top = 198
               Left = 454
               Bottom = 294
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Wydawnictwa"
            Begin Extent = 
               Top = 342
               Left = 396
               Bottom = 438
               Right = 573
            End
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Widok zdenormalizowany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Czytelnicy"
            Begin Extent = 
               Top = 198
               Left = 246
               Bottom = 328
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2115
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 2190
         SortOrder = 1935
         GroupBy = 1350
         Filter = 2010
         Or = 1920
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Widok zdenormalizowany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Widok zdenormalizowany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Autorzy"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Czytelnicy"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kategorie"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ksiazki"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Pracownicy"
            Begin Extent = 
               Top = 6
               Left = 877
               Bottom = 136
               Right = 1047
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 1085
               Bottom = 102
               Right = 1255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Wydawnictwa"
            Begin Extent = 
               Top = 102
               Left = 454
               Bottom = 198
               Right = 631
            End
            DisplayFlags ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'wypozyczenia ksiazek przez czytelnikow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 280
            TopColumn = 0
         End
         Begin Table = "Wypozyczenia"
            Begin Extent = 
               Top = 102
               Left = 1085
               Bottom = 232
               Right = 1322
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1665
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'wypozyczenia ksiazek przez czytelnikow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'wypozyczenia ksiazek przez czytelnikow'
GO
USE [master]
GO
ALTER DATABASE [Biblioteka_BD] SET  READ_WRITE 
GO
