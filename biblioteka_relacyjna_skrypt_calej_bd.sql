USE [master]
GO
/****** Object:  Database [BIBLIOTEKA_BD]    Script Date: 05.06.2019 19:56:22 ******/
CREATE DATABASE [BIBLIOTEKA_BD]
GO
USE [BIBLIOTEKA_BD]
GO
/****** Object:  Table [dbo].[Kategorie]    Script Date: 05.06.2019 19:56:23 ******/
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
/****** Object:  Table [dbo].[Autorzy]    Script Date: 05.06.2019 19:56:24 ******/
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
/****** Object:  Table [dbo].[Wydawnictwa]    Script Date: 05.06.2019 19:56:24 ******/
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
/****** Object:  Table [dbo].[Ksiazki]    Script Date: 05.06.2019 19:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ksiazki](
	[id_ksiazka] [int] NOT NULL,
	[isbn] [nvarchar](13) NULL,
	[id_kategoria] [int] NULL,
	[tytul] [nvarchar](255) NULL,
	[opis] [nvarchar](1000) NULL,
	[id_autor] [int] NULL,
	[id_wydawnictwo] [int] NULL,
	[rok_wydania] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ksiazka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Czytelnicy]    Script Date: 05.06.2019 19:56:24 ******/
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
/****** Object:  Table [dbo].[Wypozyczenia]    Script Date: 05.06.2019 19:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wypozyczenia](
	[id_wypozyczenie] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  View [dbo].[V_wypozyczenia]    Script Date: 05.06.2019 19:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_wypozyczenia]
AS
SELECT        dbo.Czytelnicy.login AS Czytelnik, dbo.Ksiazki.tytul AS [Tytul ksiazki], dbo.Ksiazki.rok_wydania AS [Rok wydania ksiazki], dbo.Kategorie.nazwa AS [Kategoria ksiazki], dbo.Wydawnictwa.nazwa AS Wydawnictwo, 
                         dbo.Autorzy.imie AS [Imie autora], dbo.Autorzy.nazwisko AS [Nazwisko autora], COUNT(*) AS [Ilosc wypozyczen]
FROM            dbo.Wypozyczenia INNER JOIN
                         dbo.Autorzy INNER JOIN
                         dbo.Ksiazki ON dbo.Autorzy.id_autor = dbo.Ksiazki.id_autor INNER JOIN
                         dbo.Kategorie ON dbo.Ksiazki.id_kategoria = dbo.Kategorie.id_kategoria INNER JOIN
                         dbo.Wydawnictwa ON dbo.Ksiazki.id_wydawnictwo = dbo.Wydawnictwa.id_wydawnictwo ON dbo.Wypozyczenia.id_ksiazka = dbo.Ksiazki.id_ksiazka INNER JOIN
                         dbo.Czytelnicy ON dbo.Wypozyczenia.id_czytelnik = dbo.Czytelnicy.id_czytelnik
WHERE        (dbo.Czytelnicy.login LIKE '[A-C]%')
GROUP BY dbo.Czytelnicy.login, dbo.Ksiazki.tytul, dbo.Ksiazki.rok_wydania, dbo.Kategorie.nazwa, dbo.Wydawnictwa.nazwa, dbo.Autorzy.imie, dbo.Autorzy.nazwisko
GO
/****** Object:  View [dbo].[MV_wypozyczenia]    Script Date: 05.06.2019 19:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MV_wypozyczenia] WITH SCHEMABINDING
AS
SELECT        dbo.Czytelnicy.login AS Czytelnik, dbo.Ksiazki.tytul AS [Tytul ksiazki], dbo.Ksiazki.rok_wydania AS [Rok wydania ksiazki], dbo.Kategorie.nazwa AS [Kategoria ksiazki], dbo.Wydawnictwa.nazwa AS Wydawnictwo, 
                         dbo.Autorzy.imie AS [Imie autora], dbo.Autorzy.nazwisko AS [Nazwisko autora], COUNT_BIG(*) AS [Ilosc wypozyczen]
FROM            dbo.Wypozyczenia INNER JOIN
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
/****** Object:  Index [MV_wypozyczeniaInd]    Script Date: 05.06.2019 19:56:25 ******/
CREATE UNIQUE CLUSTERED INDEX [MV_wypozyczeniaInd] ON [dbo].[MV_wypozyczenia]
(
	[Czytelnik] ASC,
	[Tytul ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 05.06.2019 19:56:25 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 05.06.2019 19:56:25 ******/
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
         Configuration = "(H (1[54] 4[10] 2[28] 3) )"
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
         Begin Table = "Wypozyczenia"
            Begin Extent = 
               Top = 80
               Left = 1051
               Bottom = 210
               Right = 1288
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Autorzy"
            Begin Extent = 
               Top = 233
               Left = 34
               Bottom = 368
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ksiazki"
            Begin Extent = 
               Top = 268
               Left = 439
               Bottom = 393
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kategorie"
            Begin Extent = 
               Top = 96
               Left = 59
               Bottom = 212
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Wydawnictwa"
            Begin Extent = 
               Top = 394
               Left = 36
               Bottom = 490
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Czytelnicy"
            Begin Extent = 
               Top = 16
               Left = 501
               Bottom = 146
               Right = 671
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
         Column = 1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_wypozyczenia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_wypozyczenia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_wypozyczenia'
GO
USE [master]
GO
ALTER DATABASE [BIBLIOTEKA_BD] SET  READ_WRITE 
GO
