
-- ساخت دیتابیس و استفاده از آن
CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO

-- جدول بیمار
CREATE TABLE Bimar (
    BimarID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    FamilyName NVARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Contact NVARCHAR(15),
    Address NVARCHAR(200)
);
GO

-- جدول پزشک
CREATE TABLE Pezeshk (
    PezeshkID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    FamilyName NVARCHAR(100),
    Takhasos NVARCHAR(100),
    Email NVARCHAR(100),
    Contact NVARCHAR(15)
);
GO

-- جدول پرستار
CREATE TABLE Parastar (
    ParastarID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    FamilyName NVARCHAR(100),
    Bakhsh NVARCHAR(100),
    Contact NVARCHAR(15)
);
GO

-- جدول بخش
CREATE TABLE Bakhsh (
    BakhshID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    MasoolBakhsh NVARCHAR(100),
    TedadTakhtha INT
);
GO

-- جدول نوبت‌دهی
CREATE TABLE NobatDehi (
    NobatID INT PRIMARY KEY IDENTITY(1,1),
    Tarikh DATE,
    Saat TIME,
    BimarID INT,
    PezeshkID INT,
    FOREIGN KEY (BimarID) REFERENCES Bimar(BimarID),
    FOREIGN KEY (PezeshkID) REFERENCES Pezeshk(PezeshkID)
);
GO

-- جدول پرونده پزشکی
CREATE TABLE Parvande (
    ParvandeID INT PRIMARY KEY IDENTITY(1,1),
    BimarID INT,
    PezeshkID INT,
    TajziehAzmayesh NVARCHAR(MAX),
    Noskhe NVARCHAR(MAX),
    Tashkhis NVARCHAR(MAX),
    DastooratPezeshk NVARCHAR(MAX),
    TarikhBazdid DATE,
    FOREIGN KEY (BimarID) REFERENCES Bimar(BimarID),
    FOREIGN KEY (PezeshkID) REFERENCES Pezeshk(PezeshkID)
);
GO

-- جدول دارو
CREATE TABLE Daru (
    DaruID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Type NVARCHAR(50),
    MizanMasraf NVARCHAR(50),
    TarikhEngheza DATE,
    ParvandeID INT,
    FOREIGN KEY (ParvandeID) REFERENCES Parvande(ParvandeID)
);
GO

-- جدول صورتحساب
CREATE TABLE SooratHesab (
    SooratID INT PRIMARY KEY IDENTITY(1,1),
    MablaghPardakht DECIMAL(10,2),
    TarikhSodor DATE,
    BimarID INT,
    FOREIGN KEY (BimarID) REFERENCES Bimar(BimarID)
);
GO
