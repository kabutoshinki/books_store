USE [master]
GO
/****** Object:  Database [BookStoreManagement]    Script Date: 3/22/2022 2:13:45 AM ******/
CREATE DATABASE [BookStoreManagement]
GO
ALTER DATABASE [BookStoreManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoreManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStoreManagement] SET QUERY_STORE = OFF
GO
USE [BookStoreManagement]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](255) NOT NULL,
	[AuthorSummary] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](255) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BookImage] [nvarchar](30) NULL,
	[PublishingYear] [int] NOT NULL,
	[Bought] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [int] NULL,
	[BookSummary] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[CartStatus] [int] NULL,
	[Total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CategorySummary] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[CartID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[VoucherID] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[UserAddress] [nvarchar](255) NULL,
	[Note] [nvarchar](1000) NULL,
	[Total] [money] NULL,
	[CreateDate] [date] NULL,
	[PaymentStatus] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](255) NOT NULL,
	[PublisherSummary] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserName] [nvarchar](255) NOT NULL,
	[UserPassword] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[UserAddress] [nvarchar](255) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[UserRole] [nvarchar](20) NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Age] [int] NULL,
	[UserImage] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 3/22/2022 2:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherName] [varchar](255) NOT NULL,
	[VoucherValue] [int] NOT NULL,
	[VoucherSummary] [nvarchar](1000) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (1, N'Douglas C. Montgomery', N'Douglas Montgomery is a Regents Professor of Industrial Engineering and Statistics')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (2, N'Michelle Obama', N'She was the first African-American woman to serve in this position. She is the wife of former President Barack Obama.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (3, N'Freeman E.T', N'John Freeman (born 1974) is an American writer and a literary critic.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (4, N'D. Sivanandhan Radhakrishnan Pillai', N'Chanakya, who lived in India in the fourth century BC, was a leadership guru par excellence.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (5, N'NA', N'NA')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (6, N'Benjamin Graham', N'Benjamin Graham (May 9, 1894 – September 21, 1976) was a British-born American economist, professor and investor.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (7, N'Michael Sincere', N'Michael Sincere is a contributor to MarketWatch. He is an investor and trader, and publisher of "The Weekly Trader" newsletter.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (8, N'BOISSONNAULT W G', N'Dr. Boissonnault is the Executive Vice President of Professional Affairs for the APTA.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (9, N'ZINGADE', N'As a medical specialist that takes part in Karnataka''s healthcare, Dr. N D Zingade (rated 4.3 by NiceLocal users) offers respective assistance to its people in the field of neurology, otorhinolaryngology, pediatry and psychology.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (10, N'GIBLIN LES', N'One of the pioneers of the personal development industry, Les Giblin was born in 1912 in Cedar Rapids, Iowa.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (11, N'Polly Vernon', N'Polly Vernon is an interviewer and feature writer for The Times.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (12, N'Anjum Katyal', N'Anjum Katyal has been the Chief Editor, Seagull Books, Calcutta (1987–2006) and Editor, Seagull Theatre Quarterly (1994–2004), as well as the Web Editor, Saregama-HMV (2006–11) and Editor, Art and the City, a web magazine on the contemporary arts in India (2010–13).')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (13, N'Stallings', N'William Stallings is an American author. He has written computer science textbooks on operating systems, computer networks, computer organization, and cryptography.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (14, N'Punithavathy Pandian', N'She has a masters degree in Economics, Commerce and Business Administration (Investment Management), as well as a doctoral degree in the field of Industrial Economics.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (15, N'Lovelock / Chatterjee', N'Christopher Lovelock (12 July 1940 – 24 February 2008) was born in the town of Saltash, Cornwall in the United Kingdom. He was best known as a pioneer in the field of Services Marketing among other titles such as author, professor and consultant. Lovelock was also known for his excellent case studies.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (16, N'Ravinder Kumar', N'Ravinder Kumar (born 1991) is a serial killer who embarked upon a 5-7 year raping and killing spree until his arrest on 19 July 2015. ')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (17, N'John D. Barrow', N'John David Barrow FRS (29 November 1952 – 26 September 2020) was an English cosmologist, theoretical physicist, and mathematician. He served as Gresham Professor of Geometry at Gresham College from 2008 to 2011. Barrow was also a writer of popular science and an amateur playwright.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (18, N'Catherine Carver', N'Catherine Carver joined the Ford School as the Events & Outreach Manager in November 2018, bringing with her two decades of experience from academia and the private sector. Raised in Washington, DC in a government family and trained as an art historian, she has always been fascinated by the intersections of socio-economic factors and structures of politics and space.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (19, N'C. Xavier', N'Joana C. Xavier, Ph.D. is a bioengineer, computational biologist, author, explorer, and philosophy apprentice.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (20, N'Ben Morley', N'Ben is a former US Air Force pilot turned entrepreneur, empowering people through his courses and mentorship to achieve greater clarity and purpose in life.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (21, N'Little, Tony', N'Little Tony (born Antonio Ciacci 9 February 1941 – 27 May 2013) was a Sammarinese pop singer and actor, who achieved success in Britain in the late 1950s and early 1960s, as the lead singer of Little Tony & His Brothers, before returning to Italy where he continued a successful career as a singer and film actor.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (22, N'S.P.K.Jena', N'S. P. K. Jena is Professor, Department of Applied Psychology, University of Delhi, and former Director, Institute of Behavioural Sciences, Gujarat Forensic Sciences University (now National Forensic Sciences University).')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (23, N'Joseph Brodsky', N'Joseph Brodsky was born in Leningrad, the Soviet Union (now Saint Petersburg, Russia), and worked as a poet, essayist and translator.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (24, N'Borges, Jorge Luis & Levine, Suzanne Jil', N'Jorge Luis Borges is an influential figure in the Boom, a literary movement that helped Latin American literature go beyond its local, social, and regional spheres. ')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (25, N'Raj Kamal', N'Raj Kamal Jha (born 1966) is an Indian newspaper editor and novelist writing in English. He currently serves as the Editor-in-Chief of The Indian Express.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (26, N'Nayar', N'Nayar, are a group of Indian Hindu castes, described by anthropologist Kathleen Gough as "not a unitary group but a named category of castes". ')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (27, N'Jon R.Katzenbach', N'Jon R. Katzenbach is a published author and consultant who is best known for his work on the informal organization.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (28, N'McKee, Annie', N'Annie McKee, PhD is a best-selling author, respected academic, speaker and advisor to top global leaders.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (29, N'Whitney Johnson', N'Whitney Johnson is the CEO of Disruption Advisors (disruptionadvisors.co), a tech-enabled talent development company, and an Inc.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (30, N'Monika Halan', N'Monika Halan is Consulting Editor with Mint, India''s second largest business daily and a well-known media personality.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (31, N'Roberto Tamassia Michael T. Goodrich', N'Roberto Tamassia, PhD in Electrical and Computer Engineering from the University of Illinois at Urbana-Champaign, 1988; Plastech Professor of Computer Science and Chair of the CS Dept at Brown University; co-author with Goodrich, see texts above.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (32, N'LEVENSPIEL', N'Octave Levenspiel (January 1, 1926 – March 5, 2017) was a professor of chemical engineering at Oregon State University (OSU).')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (33, N'Dan Olsen', N'Dan Olsen is an entrepreneur, consultant, author, speaker, and expert in product management and Lean Startup')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (34, N'STROUSTRUP', N'Bjarne Stroustrup born 30 December 1950) is a Danish computer scientist, most notable for the invention and development of the C++ programming language.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (35, N'Hall', N'James W. Hall (born 1947) is an American author and professor from Florida. He has written eighteen novels, four books of poetry, a collection of short stories, and a collection of essays.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (36, N'BECK', N'Beck David Hansen is an American musician, singer, songwriter, and record producer. ')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (37, N'Sprankle', N'Christine Sprankle is one of the American pioneers of Magic: The Gathering cosplay. She is one of the best known and popular cosplayers.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (38, N'Hughes/Hughes', N'Richard Arthur Warren Hughes OBE (19 April 1900 – 28 April 1976) was a British writer of poems, short stories, novels and plays.[1]')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (39, N'Lutz Mark', N'Mark Lutz is a leading Python trainer, the author of Python''s earliest and best-selling texts, and a pioneering figure in the Python world.')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorSummary]) VALUES (40, N'Cook', N'Robert Brian "Robin" Cook (born May 4, 1940) is an American physician and novelist who writes about medicine and topics affecting public health.')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO

SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategorySummary]) VALUES (1, N'Machine Learning', N'Truyện tranh')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategorySummary]) VALUES (2, N'Business', N'Truyện chữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategorySummary]) VALUES (3, N'Textbooks', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (1, N'Wiley', N'We''re a global leader in research and education.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (2, N'Penguin Random House', N'Committed to publishing great books, connecting readers and authors globally, and spreading the love of reading.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (3, N'Jaypee Brothers Medical Publishers', N'Top Medical Publisher With Broad Categories of Medical Books Available at Affordable Prices.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (4, N'Shroff Publishers & Distributers Private Limited - Mumbai (2014)', N' Wholesaler of business communication books & other products in Navi Mumbai, Maharashtra.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (5, N'Jaico Publishing House', N'Jaico was founded in 1946 by Jaman Shah as a book distribution business for U.S. paperback publishers. ')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (6, N'ELSEVIER (NP)', N'Elsevier is a leading publisher of health science books and journals, helping to advance medicine')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (7, N'Harper Business', N'Harper Business brings you innovative, authoritative, and creative works from world-class thinkers.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (8, N'Adams Media', N'Adams Media, an imprint of Simon & Schuster, informs, instructs, and inspires readers across a variety of lifestyle categories by providing the content they’re looking for, from the experts they follow and trust.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (9, N'Embassy Books', N'Embassy Books is a niche publishing house based in Mumbai.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (10, N'Hodder & Stoughton ', N'Hodder & Stoughton is a British publishing house, now an imprint of Hachette.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (11, N'SAGE India', N'Founded in 1981, SAGE Publications India Pvt Ltd is a leading independent, academic and professional publisher of innovative, high-quality content.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (12, N'Pearson Education India', N'Pearson has emerged as a leading presence in Indian publishing, and continues to grow at an exciting pace.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (13, N'Vikas Publishing House', N'Vikas Publishing House Private Limited offers educational publishing services.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (14, N'Cengage Learning India Pvt Ltd ', N'Cengage Learning India Pvt Ltd. publishes academic and professional books. ')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (15, N'RHUK', N'Our nine creatively and editorially independent publishing houses seek out and enable talented people from all walks of life to tell their stories – and make sure they are heard. From bestselling writers and bold illustrators, to big thinkers and political commentators, trailblazing entrepreneurs and wellbeing experts, we are home to some of the world''s most celebrated authors. ')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (16, N'Bloomsbury India ', N'Bloomsbury India is the New Delhi office of Bloomsbury Publishing. Our authors include Khaled Hosseini, J.K. Rowling, William Dalrymple and Shiv Khera.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (17, N'McGraw Hill Education ', N'McGraw Hill is a global pioneer in educational content, assessment, training, and platform innovation; and is one of the world''s largest educational companies')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (18, N'Tamarind ', N'Tamarind has championed diversity in children’s publishing since 1987, helping to make sure children of all cultures and ethnicities have the chance to see themselves in stories and books. ')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (19, N'Bloomsbury Continuum', N'Bloomsbury Continuum is part of Bloomsbury’s Special Interest Division and publishes serious and rigorous trade non-fiction, aimed at a wider educated readership.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (20, N'Penguin UK ', N'Penguin Books is a British publishing house. It was co-founded in 1935 by Sir Allen Lane with his brothers Richard and John,[3] as a line of the publishers The Bodley Head, only becoming a separate company the following year')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (21, N'Cengage Learning', N'Cengage helps higher education instructors, learners and institutions thrive with course materials built around their needs.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (22, N'Shroff', N'Shroff Publishers and Distributors Private Limited has a tie up to reprint and distribute a few US publishers like O''Reilly & Associates, Packt Publishing, Mike Murach & Associates, Rampant TechPress, Pragmatic Bookshelf, IBM Redbooks, MC Press, Discovery Press, etc.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (23, N'Elsevier', N'Elsevier is a global information analytics business that helps institutions and professionals progress science, advance healthcare and improve performance.')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherSummary]) VALUES (24, N'Havard Business', NULL)
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
INSERT [dbo].[UserInformation] ([UserName], [UserPassword], [Email], [UserAddress], [Gender], [PhoneNumber], [UserRole], [FullName], [DateOfBirth], [Age], [UserImage]) VALUES (N'administrator', N'abcdef', N'admin@gmail.com', N'Ho Chi Minh', N'Male', N'0123456789', N'Admin', N'Admin', CAST(N'2022-02-27' AS Date), 0, NULL)
INSERT [dbo].[UserInformation] ([UserName], [UserPassword], [Email], [UserAddress], [Gender], [PhoneNumber], [UserRole], [FullName], [DateOfBirth], [Age], [UserImage]) VALUES (N'client', N'abcdef', N'client@gmail.com', N'Ho Chi Minh', N'Male', N'0123456787', N'Client', N'Client', CAST(N'1975-02-27' AS Date), 47, NULL)
INSERT [dbo].[UserInformation] ([UserName], [UserPassword], [Email], [UserAddress], [Gender], [PhoneNumber], [UserRole], [FullName], [DateOfBirth], [Age], [UserImage]) VALUES (N'moderator', N'abcdef', N'mod@gmail.com', N'Ho Chi Minh', N'Female', N'0123456788', N'Mod', N'Mod', CAST(N'2000-02-27' AS Date), 22, NULL)
GO

SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (1, N'Applied Statistics and Probability for Engineers, 5ed (WSE)', 1, 1, 1, N'1.jpg', 2012, 0, 10, 100000.0000, 0, N'This best-selling engineering statistics text provides a practical approach that is more oriented to engineering and the chemical and physical sciences than many similar texts. It is packed with unique problem sets that reflect realistic situations engineers will encounter in their working lives. This text shows how statistics, the science of data is just as important for engineers as the mechanical, electrical, and materials sciences.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (2, N'Becoming', 2, 2, 3, N'2.jpg', 2018, 0, 4, 700000.0000, 0, N'This book contains a comprehensive, well detailed summary and key takeaways of the original book by Michelle Obama. It summarizes the book in detail, to help people effectively understand, articulate and imbibe the original work by the former first lady. This book is not meant to replace the original book but to serve as a companion to it.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (12, N'Head First JavaScript Programming', 3, 4, 1, N'3.jpg', 2014, 0, 3, 500000.0000, 0, N'This brain friendly guide teaches you everything from JavaScript language fundamentals to advanced topics, including objects, functions, and the browser’s document object model. You won’t just be reading—you’ll be playing games, solving puzzles, pondering mysteries, and interacting with JavaScript in ways you never imagined. And you’ll write real code, lots of it, so you can start building your own web applications')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (13, N'Chanakya''s 7 Secrets of Leadership', 4, 5, 2, N'4.jpg', 2012, 0, 2, 300000.0000, 0, N'The treasure of his teachings can be found in his book, The Arthashastra, which deals with good governance based on ideal leadership.  The concept of the ideal nation in The Arthashastra, called Saptanga, holds that there are seven pillars of a kingdom: Swami, Amatya, Janpada, Durg, Kosha, Dand, Mitra.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (14, N'Harvard Business Review on Profiting from Green Business', 5, 24, 2, N'5.jpg', 2000, 16, 3, 200000.0000, 3, N'The "Harvard Business Review Paperback Series" brings managers and professionals the fundamental information they need to stay competitive in a fast-moving world')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (15, N'The Intelligent Investor (English) Paperback 2013', 6, 7, 2, N'6.jpg', 2013, 20, 3, 279000.0000, 2, N'It is a widely acclaimed book by Benjamin Graham on value investing. Written by one of the greatest investment advisers of twentieth century, the book aims at preventing potential investors from substantial errors and also teaches them strategies to achieve long-term investment goals.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (19, N'Predict the Next Bull or Bear Market and Win: How to Use Key Indicators to Profit in Any Market', 7, 8, 2, N'7.jpg', 2014, 44, 3, 950000.0000, 5, N'IThe secrets to making money--no matter what the market conditions!A fundamental guide to investing, Predict the Next Bull or Bear Market and Win shows you how to build your wealth and protect your investments in an ever-changing market. With author and financial expert Michael Sincere''s guidance, you''ll learn everything you need to know about the key economic indicators that can help you predict the market''s performance and better understand when to sell and when to buy')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (22, N' Primary Care for the Physical Therapist: Examination and Triage', 8, 6, 3, N'8.jpg', 2021, 36, 15, 450000.0000, 1, N'Designed to address the expanding role of physical therapists in primary care, Primary Care for the Physical Therapist: Examination and Triage, 3rd Edition covers all the information and skills you need to be successful in the field.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (23, N' Manual Of Practical PhysiologyAuthor:ZINGADE', 9, 3, 3, N'9.jpg', 2007, 57, 14, 600000.0000, 1, N'Provides everything students need to know for their practical physiology course')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (25, N'The Art of Dealing with People', 10, 9, 2, N'10.jpg', 2001, 2, 16, 345000.0000, 1, N'The Art of Dealing With People, written by Les Giblin shows individuals how to achieve their goals while handling the human ego by becoming a master conversationalist and making others feel better about themselves.This guidebook provides with tips and techniques for taking one''s skills to whole new level.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (26, N'Hot Feminist', 11, 10, 3, N'11.jpg', 2016, 5, 17, 1040000.0000, 1, N'A relevant, inclusive guide to living in a sexy, fashionable and empowered way - without judgement. Because judgement is a most un-feminist act. Hot (adj.) : (Of a person) Attractive ''a hot chick''Fem-i-n-ist (n.) : A person who supports feminism, the movement that advocates equal rights for women Polly Vernon, Grazia columnist, Times feature writer (hair-flicker, Brazilian-waxer, jeans obsessive, outrageous flirt) presents a brave new perspective on feminism.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (29, N'Badal Sircar: Towards a Theatre of Conscience', 12, 11, 2, N'12.jpg', 2015, 4, 1, 300200.0000, 1, N'The first full-length study of Badal Sircar, who brought theatre to the streets and to the masses in India! Badal Sircar (1925-2011) is one of the most important and influential figures in the history of post-independence Indian theatre.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (30, N'Data and Computer Communications', 13, 12, 1, N'13.jpg', 2013, 46, 0, 350000.0000, 1, N'With a focus on the most current technology and a convenient modular format, this best-selling text offers a clear and comprehensive survey of the entire data and computer communications field. Emphasizing both the fundamental principles as well as the critical role of performance in driving protocol and network design, it explores in detail all the critical technical areas in data communications, wide-area networking, local area networking and protocol design.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (31, N'Security Analysis and Portfolio Management', 14, 13, 1, N'14.jpg', 2012, 35, 3, 605000.0000, 1, N'Security Analysis And Portfolio Management is a management textbook written by P Pandian. Recently, even the seasoned professionals find it challenging to invest in stock markets. Students also find the topic of Security Analysis and Portfolio Management complicated. The book gives readers theoretical clarity and exhaustive coverage with an approach suitable for students.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (32, N'Services Marketing: People, Technology and Strategy 7th Edition', 15, 12, 2, N'15.jpg', 2011, 65, 5, 760000.0000, 1, N'Organized around a strategic marketing framework, Services Marketing provides with maximum flexibility for instructors in structuring the course for teaching and at the same time guiding students into the consumer and competitive environments in services marketing.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (33, N'Legal Aspects of Business', 16, 14, 2, N'16.jpg', 2011, 356, 45, 546000.0000, 1, N'Legal Aspects of Business is a comprehensive text on the subject tailored to meet the longstanding needs of MBA, M.Com, PGDBM, BBA, B.Com, and other degree and diploma programmes in Commerce and Business offered by various universities and institutes. The legislations covered in this book include the Indian Contract Act, 1872; the Sale of Goods Act, 1930; the Partnership Act, 1932; the Negotiable Instruments Act, 1881; the Companies Act, 1956; the Consumer Protection Act, 1986; the Securities and Exchange Board of India Act, 1992; the Information Technology Act, 2000; and the Right to Information Act, 2005.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (34, N'The Book of Universes', 17, 15, 3, N'17.jpg', 2012, 357, 3, 356000.0000, 1, N'This is a book about universes. It tells a story that revolves around a single extraordinary fact: that Albert Einstein''s famous theory of relativity describes a series of entire universes.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (35, N'Immune: How Your Body Defends and Protects You', 18, 16, 3, N'18.jpg', 2012, 23, 2, 357000.0000, 1, N'The human body is like an exceedingly well-fortified castle, defended by billions of soldiers some live for less than a day, others remember battles for decades, but all are essential in protecting us from disease. This hidden army is our immune system and without it we could not')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (36, N'World Wide Web Design with HTML', 19, 17, 1, N'19.jpg', 2017, 56, 5, 245600.0000, 1, N'Web literacy will be a basic skill as the cyber revolution gets the world up to speed. The World Wide Web is going to fundamentally change how we work and play.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (37, N'The Silence Seeker', 20, 18, 3, N'20.jpg', 2009, 3, 4, 327000.0000, 1, N'When a new family moves in next door, Joe''s mum explains that they are asylum seekers. Joe hears that they are silence seekers, especially as Mum adds that they need peace and quiet. When he sees a young boy from the family sitting disconsolately on the steps, Joe decides to help him find a quiet place in the noisy and chaotic city.A simple, moving story which is the perfect way to gently open discussion around the refugee crisis.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (38, N'An Intelligent Person s Guide to Education', 21, 19, 3, N'21.jpg', 2016, 6, 14, 763000.0000, 1, N'Tony Little is the Head Master of Eton. One of the most progressive and imaginative people in British education today he has hitherto kept a low profile. This book, published to coincide with his retirement, sets out his educational fundamentals.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (39, N'Learning Disability: Theory to Practice', 22, 11, 3, N'22.jpg', 2013, 9, 10, 980000.0000, 1, N'In spite of their average or even above-average intelligence and conventional classroom experience, a large number of children suffer from learning disabilities. Failing to cope with the academic demands of the school, many of them drop out at an early age. This deprives them of many opportunities in life that a literate person enjoys.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (40, N'On Grief And Reason: Essays (Penguin Modern Classics)', 23, 20, 3, N'23.jpg', 2011, 0, 12, 299000.0000, 1, N'In this richly diverse collection of essays, Joseph Brodsky casts a reflective eye on his experiences of early life in Russia and exile in America..')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (41, N'Poems of the Night: A Dual-Language Edition with Parallel Text (Penguin Classics)', 24, 20, 3, N'24.jpg', 2013, 6, 1, 599000.0000, 1, N'ge volume of poems on darkness and lightmany appearing in English for the first timeby one of the greatest writers of the twentieth century Revered for his magnificent works of fiction, Jorge Luis Borges thought of himself primarily as a poet.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (42, N'EMBEDDED SYSTEMS: ARCHITECTURE, PROGRAMMING AND DESIGN', 25, 17, 1, N'25.jpg', 2008, 3, 0, 499000.0000, 1, N'This book, equally applicable for a CSE or ECE course, gives an extensive account of Embedded Systems, keeping a balanced coverage of hardware and software concepts. Adhering to syllabus needs, this title is ''microprocessor'' and ''software design methodology'' specific, giving due weightage to architecture, programming and design aspects.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (43, N'Employees First Customers Second ', 26, 24, 2, N'26.jpg', 2011, 5, 57, 799000.0000, 1, N'One small idea can ignite a revolution just as a single matchstick can start a fire. One such idea - putting employees first and customers second - sparked a revolution at HCL Technologies, the IT services giant.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (44, N'The Wisdom of Teams: Creating the High-Performance Organization', 27, 24, 2, N'27.jpg', 2015, 8, 38, 899000.0000, 1, N'The definitive classic on high-performance teams The Wisdom of Teams is the definitive work on how to create high-performance teams in any organization.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (45, N'How to Be Happy at Work', 28, 24, 2, N'28.jpg', 2017, 4, 79, 299000.0000, 1, N'Annie McKee, coauthor of the bestselling Primal Leadership. In her new transformative book, she makes the most compelling case yet that happinessand the full engagement that comes with itis more important than ever in todays workplace and she sheds new light on the powerful relationship of happiness to individual, team and organizational success.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (46, N'Build an A-Team: Play to Their Strengths and Lead Them Up the Learning Curve', 29, 24, 2, N'29.jpg', 2018, 6, 36, 199000.0000, 1, N'Johnson explains how to become one of those bosses and how to buildyour A-team by:Identifying what your employees already know and what they need to learnDesigning their jobs to maximize engagement and learning Applying a seven-step process for leading each person up their learning curveWe all want opportunities to learn, experiment and grow in our jobs.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (47, N'Let''s Talk Money: You''ve Worked Hard for It, Now Make It Work for You', 30, 7, 2, N'30.jpg', 2018, 8, 67, 399000.0000, 1, N'Monika Halan offers you a feet-on-the-ground system to build financial security.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (48, N'Algorithm Design: Foundations, Analysis and Internet Examples', 31, 1, 1, N'31.jpg', 2006, 4, 64, 599000.0000, 1, N'This text addresses the often neglected issue of how to actually implement data structures and algorithms.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (49, N'Chemical Reaction Engineering, 3ed (WSE)', 32, 1, 1, N'32.jpg', 2006, 2, 100, 345000.0000, 1, N'Chemical reaction engineering is concerned with the exploitation of chemical reactions on a commercial scale. Its goal is the successful design and operation of chemical reactors. This text emphasizes qualitative arguments, simple design methods, graphical procedures, and frequent comparison of capabilities of the major reactor types. ')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (50, N'Human-Computer Interaction', 33, 14, 1, N'33.jpg', 2009, 4, 34, 924000.0000, 1, N'''Human--Computer Interaction is becoming ever more important as a means of achieving competitive IT product designs. A growing field of employment for IT graduates and others, HCI helps students to focus upon how best to design interactive systems that are productive and pleasurable to use.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (51, N'The C++ Programming Language, 1e: third edition', 34, 12, 1, N'34.jpg', 2002, 7, 47, 324000.0000, 1, N'One book has always set the standard for C++ programmers: The C++ Programming Language, by Bjarne Stroustrup, the Bell Laboratories developer who created C++. Now, Stroustrup has updated this classic with clarifications based on reader feedback and new information in two brand-new appendices on ISO/ANSI C++: internationalization and exception safety.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (52, N'Core Web Programming, 2e', 35, 12, 1, N'35.jpg', 2009, 4, 60, 332000.0000, 1, N'This comprehensive introduction to programming for the Web teaches programming students all the tools they need for effective Web programming using Java as the base language. It provides detailed, practical coverage of HTML4, Java 2, J2EE and JavaScript 1.5, as well as numerous other new Web programming standards and presents Web-focused coverage of Swing, Java threads, I/O network programming on both clients and servers, JavaServer pages and the latest version of JavaScript.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (53, N'Linux Kernel Programming, 3e', 36, 12, 1, N'36.jpg', 2002, 3, 36, 309000.0000, 1, N'The student will learn how a modern multi-tasking operating system will work and will understand how the open Linux sources work.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (54, N'Problem Solving and Programming Concepts, 9e', 37, 12, 1, N'37.jpg', 2012, 6, 26, 645900.0000, 1, N'Designed for students with little or no computer experience - but useful to programmers at any level - the text provides step-by-step progression and consistent in-depth coverage of topics, with detailed explanations and many illustrations.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (55, N'Robot Programming 1 ED', 38, 12, 1, N'38.jpg', 2016, 3, 46, 693000.0000, 1, N'The Beginner''s Guide to Programming Robots helps students build their skills through four simple projects created with today''s leading robot microcontrollers (ARM9 and ARM7) on leading robot platforms (LEGO Mindstorms EV3, NXT and Wowee RS Media Robot). Step by step, they''ll learn how to use modern techniques to program robot sensors, motors and more.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (56, N'Programming Python', 39, 22, 1, N'39.jpg', 2011, 6, 7, 593000.0000, 1, N'If you''ve mastered Python''s fundamentals, you''re ready to start using it to get real work done. Programming Python will show you how, with in-depth tutorials on the language''s primary application domains: system administration, GUIs, and the Web.')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [PublisherID], [CategoryID], [BookImage], [PublishingYear], [Bought], [Quantity], [Price], [Discount], [BookSummary]) VALUES (57, N'CUDA Programming: A Developer''s Guide to Parallel Computing with GPUs', 40, 23, 1, N'40.jpg', 2014, 9, 8, 1020000.0000, 1, N'If you need to learn CUDA but don''t have experience with parallel computing, CUDA Programming: A Developer''s Introduction offers a detailed guide to CUDA with a grounding in parallel fundamentals. It starts by introducing CUDA and bringing you up to speed on GPU parallelism and hardware, then delving into CUDA installation. Chapters on core concepts including threads, blocks, grids, and memory focus on both parallel and CUDA-specific issues. Later, the book demonstrates CUDA in practice for optimizing applications, adjusting to new hardware, and solving common problems.')
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [VoucherValue], [VoucherSummary], [StartDate], [EndDate]) VALUES (1, N'Voucher 01', 50, N'Nothing', CAST(N'2020-11-11' AS Date), CAST(N'2022-11-11' AS Date))
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [VoucherValue], [VoucherSummary], [StartDate], [EndDate]) VALUES (2, N'Voucher 02', 10, N'Nothing', CAST(N'2021-10-11' AS Date), CAST(N'2021-11-11' AS Date))
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [VoucherValue], [VoucherSummary], [StartDate], [EndDate]) VALUES (3, N'Voucher 03', 5, N'Nothing', CAST(N'2022-02-20' AS Date), CAST(N'2022-03-11' AS Date))
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserInfo__85FB4E3885948732]    Script Date: 3/22/2022 2:13:45 AM ******/
ALTER TABLE [dbo].[UserInformation] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserInfo__A9D105347CDD3F84]    Script Date: 3/22/2022 2:13:45 AM ******/
ALTER TABLE [dbo].[UserInformation] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT ((0)) FOR [Bought]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((1)) FOR [CartStatus]
GO
ALTER TABLE [dbo].[UserInformation] ADD  DEFAULT ('Client') FOR [UserRole]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[UserInformation] ([UserName])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([VoucherID])
GO
USE [master]
GO
ALTER DATABASE [BookStoreManagement] SET  READ_WRITE 
GO
