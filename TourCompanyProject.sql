@Author : Hatice Yagmur TORUN
@github : github.com/yagmuryg/TourCompanyDBProject


DROP DATABASE IF EXISTS TOURCOMPANY;
CREATE DATABASE IF NOT EXISTS TOURCOMPANY;
USE TOURCOMPANY;


--TABLE DEFINITIONS


CREATE TABLE [dbo].[BookingDetails](
	[BookingDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[TourDate] [date] NULL,
	[GuideID] [int] NOT NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[BookingDetailID] ASC
)
CREATE TABLE [dbo].[TourDestinationRel](
	[TourDestinationID] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [int] NOT NULL,
	[DestinationID] [int] NOT NULL,
 CONSTRAINT [PK_TourDestinationRel] PRIMARY KEY CLUSTERED 
(
	[TourDestinationID] ASC
)
CREATE TABLE [dbo].[Destination](
	[DestinationID] [int] NOT NULL,
	[DestinationName] [nvarchar](30) NOT NULL,
	[DestinationCity] [nvarchar](20) NULL,
	[DestinationPrice] [float] NOT NULL,
 CONSTRAINT [PK_Destination] PRIMARY KEY CLUSTERED 
(
	[DestinationID] ASC
)

CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[BookingDate] [date] NULL,
	[SaleChannelID] [int] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Firstname] [nvarchar](20) NOT NULL,
	[Customer_Lastname] [nvarchar](40) NOT NULL,
	[Customer_Birthdate] [date] NULL,
	[Nationality] [nvarchar](20) NULL,
	[Country] [nvarchar](15) NULL,
	[Gender] [nchar](1) NULL,
	[Email] [nvarchar](15) NULL,
	[Contact] [nchar](15) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)
GO

CREATE TABLE [dbo].[GuideLangRel](
	[GuideLangID] [int] IDENTITY(1,1) NOT NULL,
	[GuideID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_GuideLangRel] PRIMARY KEY CLUSTERED 
(
	[GuideLangID] ASC
)
GO

CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[HasDiscount] [numeric](1, 0) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[CustomerID] [int] NOT NULL,
	[DiscountAmount] [float] NULL,
	[InvoiceNumber] [nvarchar](15) NULL,
	[Customer_Firstname] [nvarchar](20) NULL,
	[Customer_Lastname] [nvarchar](40) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)
GO

CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)
GO

CREATE TABLE [dbo].[SaleChannels](
	[SaleChannelID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SaleChannels] PRIMARY KEY CLUSTERED 
(
	[SaleChannelID] ASC
)

CREATE TABLE [dbo].[TourGuides](
	[GuideID] [int] IDENTITY(1,1) NOT NULL,
	[Guide_FirstName] [nvarchar](20) NOT NULL,
	[Guide_LastName] [nvarchar](40) NOT NULL,
	[Contact] [nvarchar](10) NULL,
	[Gender] [nchar](1) NOT NULL,
 CONSTRAINT [PK_TourGuides] PRIMARY KEY CLUSTERED 
(
	[GuideID] ASC
)

CREATE TABLE [dbo].[Tours](
	[TourID] [int] IDENTITY(1,1) NOT NULL,
	[TourName] [nvarchar](5) NOT NULL,
	[TourDescription] [ntext] NULL,
	[TourPrice] [float] NULL,
	[TourDate] [date] NULL,
 CONSTRAINT [PK_Tours] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_BookingTour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tours] ([TourID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_BookingTour]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_CustomerID]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Customers]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_GuideID] FOREIGN KEY([GuideID])
REFERENCES [dbo].[TourGuides] ([GuideID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_GuideID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_SaleChannels] FOREIGN KEY([SaleChannelID])
REFERENCES [dbo].[SaleChannels] ([SaleChannelID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_SaleChannels]
GO
ALTER TABLE [dbo].[GuideLangRel]  WITH CHECK ADD  CONSTRAINT [FK_GuideLangRel_GuideID] FOREIGN KEY([GuideID])
REFERENCES [dbo].[TourGuides] ([GuideID])
GO
ALTER TABLE [dbo].[GuideLangRel] CHECK CONSTRAINT [FK_GuideLangRel_GuideID]
GO
ALTER TABLE [dbo].[GuideLangRel]  WITH CHECK ADD  CONSTRAINT [FK_GuideLangRel_LanguageID] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[GuideLangRel] CHECK CONSTRAINT [FK_GuideLangRel_LanguageID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_BookingID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_CustomerID]
GO
ALTER TABLE [dbo].[TourDestinationRel]  WITH CHECK ADD  CONSTRAINT [FK_TourDestinationRel_DestinationID] FOREIGN KEY([DestinationID])
REFERENCES [dbo].[Destination] ([DestinationID])
GO
ALTER TABLE [dbo].[TourDestinationRel] CHECK CONSTRAINT [FK_TourDestinationRel_DestinationID]
GO
ALTER TABLE [dbo].[TourDestinationRel]  WITH CHECK ADD  CONSTRAINT [FK_TourDestinationRel_TourID] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tours] ([TourID])
GO
ALTER TABLE [dbo].[TourDestinationRel] CHECK CONSTRAINT [FK_TourDestinationRel_TourID]
GO


-- VIEWS

-- View which show most visited destinations
CREATE VIEW [dbo].[vw_VisitedDestinations]
AS
SELECT D.DestinationID, D.DestinationName,COUNT(*) as VisitCount
FROM Destination D, TourDestinationRel TDR, BookingDetails BD
WHERE BD.TourID = TDR.TourID AND TDR.DestinationID = D.DestinationID
GROUP BY D.DestinationID, D.DestinationName


-- PROCEDURES

--Procedure to see most worked guide by month.
CREATE PROC [dbo].[MostWorkedGuideByMonth]
(
@month as numeric(2,0)
)
as
BEGIN
SELECT Count(bd.GuideID) as count,bd.GuideID,tg.Guide_FirstName,tg.Guide_LastName
FROM BookingDetails bd, TourGuides tg 
WHERE  DATEPART(MM, TourDate)=@month
and tg.GuideID = bd.GuideID
Group by bd.GuideID,tg.Guide_FirstName,tg.Guide_LastName
order by count desc
END
GO

--Procedure to see most visited destinations.
CREATE PROC [dbo].[MostVisitedDestinations]
AS
BEGIN
SELECT D.DestinationID, D.DestinationName,COUNT(*) as VisitCount
FROM Destination D, TourDestinationRel TDR, BookingDetails BD
WHERE BD.TourID = TDR.TourID AND TDR.DestinationID = D.DestinationID
GROUP BY D.DestinationID, D.DestinationName
order by VisitCount desc
END
GO

--Procedure to see most visited destination by female customers.
CREATE PROC [dbo].[MostVisitedDestinationByFemaleCust]
AS
BEGIN
	SELECT D.DestinationID, D.DestinationName,COUNT(*) as VisitCount, C.Gender
	FROM Destination D, TourDestinationRel TDR, BookingDetails BD, Customers C
	WHERE BD.TourID = TDR.TourID AND TDR.DestinationID = D.DestinationID AND C.CustomerID = BD.CustomerID
	AND C.Gender = 'F'
	GROUP BY D.DestinationID, D.DestinationName, C.Gender
	ORDER BY VisitCount DESC
END
GO

--Procedure to get visited destinations by year.
CREATE PROC [dbo].[GetVisitedDestinationsByYear]
AS
BEGIN
	SELECT COUNT(*) AS VisitedCount, D.DestinationName, DATEPART(YY,BD.TourDate)
	FROM Destination D, BookingDetails BD, TourDestinationRel TDR
	WHERE D.DestinationID = TDR.DestinationID AND BD.TourID = TDR.TourID
	GROUP BY D.DestinationName, DATEPART(YY,BD.TourDate)
END
GO

--Procedure to create invoice.
CREATE PROC [dbo].[CreateInvoice]
(
@bookingID as int
)
AS
BEGIN
	IF (SELECT count(*) FROM Invoice where BookingID=@bookingID) = 0
	BEGIN
	DECLARE @customerID AS INT = (SELECT CustomerID FROM Bookings where BookingID = @bookingID)
	DECLARE @customerFirstname AS NVARCHAR(20) = (SELECT Customer_Firstname from Customers where CustomerID = @customerID)
	DECLARE @customerLastname AS NVARCHAR(40) = (SELECT Customer_Lastname from Customers where CustomerID = @customerID)
	DECLARE @bookingDate as date = (SELECT BookingDate FROM Bookings where BookingID = @bookingID)
	DECLARE @age as INT = (select Year(GETDATE())-YEAR(Customer_Birthdate) from customers where CustomerID=@customerID)
	DECLARE @totalPrice AS FLOAT = (select dbo.getTotalPrice(@bookingID))
	DECLARE @hasDiscount AS Numeric (1,0) = 0
	DECLARE @discountAmount as FLOAT = 0
	if @age >=60
	BEGIN
		Set @totalPrice = @totalPrice - @totalPrice *0.15
		Set @hasDiscount = 1
		set @discountAmount = @totalPrice *0.15
	END
	INSERT INTO Invoice (BookingID, TotalPrice, InvoiceDate,CustomerID,Customer_Firstname,Customer_Lastname,HasDiscount,DiscountAmount)
	VALUES (@bookingID,@totalPrice,@bookingDate,@customerID,@customerFirstname,@customerLastname,@hasDiscount,@discountAmount)
END
ELSE
BEGIN
PRINT'Bu BookingID için önceden fatura oluþturulmuþtur. Tekrar oluþturulamaz'
END
END
GO

--Procedure to show sales by channel.
CREATE PROC [dbo].[SalesByChannel]
AS
BEGIN
	SELECT COUNT(*) AS SaleCount, s.SaleChannelID, s.ChannelName, t.TourID, t.TourName
	FROM SaleChannels s, Bookings b, BookingDetails bd, Tours t
	WHERE s.SaleChannelID = b.SaleChannelID AND b.BookingID = bd.BookingID AND bd.TourID = t.TourID
	GROUP BY s.SaleChannelID, s.ChannelName, t.TourID, t.TourName
	ORDER BY TourID, SaleChannelID
END
GO

-- TRIGGERS

--Trigger which create invoice number.
CREATE TRIGGER [dbo].[CreateInvoiceNumber]
ON [dbo].[Invoice]
AFTER INSERT
AS
BEGIN
	DECLARE @invoiceID AS INT = (SELECT InvoiceID FROM inserted)
	DECLARE @invoiceDate as DATE = (SELECT InvoiceDate FROM inserted)
	UPDATE Invoice
	SET InvoiceNumber = CONCAT('FTR', convert(varchar, @invoiceDate, 112),InvoiceID)
	WHERE InvoiceID = @invoiceID
END

--Trigger to check tour price.
CREATE TRIGGER [dbo].[CheckTourPrice]
ON [dbo].[Tours]
AFTER INSERT
AS
BEGIN
	DECLARE @tourID AS INT = (SELECT TourID FROM inserted)
	DECLARE @tourPrice AS FLOAT = (SELECT TourPrice FROM inserted)
	IF @tourPrice is not Null
		BEGIN
			UPDATE Tours
			SET TourPrice = Null
			WHERE TourID = @tourID
			PRINT 'Tur ücreti içerdiði bölgelerin ücretlerinin toplamýdýr. Bölge eklendiðinde otomatik olarak güncellenecektir.'
		END
END

--Trigger to check tour price updated.
CREATE TRIGGER [dbo].[CheckTourPriceUpdated]
ON [dbo].[Tours]
AFTER UPDATE
AS
BEGIN
	DECLARE @tourID AS INT = (SELECT TourID FROM inserted)
	DECLARE @oldTourPrice AS FLOAT = (SELECT TourPrice FROM deleted)
	DECLARE @newTourPrice AS FLOAT = (SELECT TourPrice FROM inserted)
	IF @newTourPrice != @oldTourPrice
		BEGIN
			UPDATE Tours
			SET TourPrice = @oldTourPrice
			WHERE TourID = @tourID
			PRINT 'Tur ücreti deðiþtirilemez; Tur ücreti içerdiði bölgelerin ücretlerinin toplamýdýr.'
		END
END

--Trigger to set total price.
CREATE TRIGGER [dbo].[SetTotalPrice]
ON [dbo].[TourDestinationRel]
AFTER INSERT
AS
BEGIN
	DECLARE @tourID AS INT = (SELECT TourID FROM inserted)
	DECLARE @totalPrice AS INT = 
	(SELECT SUM(DestinationPrice) from Destination where DestinationID
	in (select DestinationID from TourDestinationRel where TourID = @tourID))
	UPDATE Tours
	SET TourPrice = @totalPrice
	WHERE TourID = @tourID

END