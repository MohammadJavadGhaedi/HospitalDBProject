
USE HospitalDB;
GO

-- INSERT برای Parastar
INSERT INTO Parastar (Name, FamilyName, Bakhsh, Contact) VALUES
(N'Reyhaneh', N'Azizi', N'داخلی', N'09121000001'),
(N'Niloofar', N'Samiei', N'اطفال', N'09121000002');

-- UPDATE برای Parastar
UPDATE Parastar SET Bakhsh = N'اورژانس' WHERE ParastarID = 1;
UPDATE Parastar SET Contact = N'09121111111' WHERE ParastarID = 2;

-- DELETE برای Parastar
DELETE FROM Parastar WHERE ParastarID = 9;
DELETE FROM Parastar WHERE ParastarID = 10;

-- INSERT برای Bakhsh
INSERT INTO Bakhsh (Name, MasoolBakhsh, TedadTakhtha) VALUES
(N'داخلی', N'دکتر امینی', 25),
(N'جراحی', N'دکتر موسوی', 20);

-- UPDATE برای Bakhsh
UPDATE Bakhsh SET TedadTakhtha = 40 WHERE BakhshID = 1;
UPDATE Bakhsh SET MasoolBakhsh = N'دکتر احمدی' WHERE BakhshID = 2;

-- DELETE برای Bakhsh
DELETE FROM Bakhsh WHERE BakhshID = 9;
DELETE FROM Bakhsh WHERE BakhshID = 10;

-- INSERT برای Parvande
INSERT INTO Parvande (BimarID, PezeshkID, TajziehAzmayesh, Noskhe, Tashkhis, DastooratPezeshk, TarikhBazdid) VALUES
(1, 1, N'نرمال', N'استامینوفن', N'سرماخوردگی', N'استراحت در خانه', '2024-01-01'),
(2, 2, N'بالا', N'آنتی‌بیوتیک', N'عفونت', N'استفاده از دارو', '2024-02-15');

-- UPDATE برای Parvande
UPDATE Parvande SET Tashkhis = N'آلرژی فصلی' WHERE ParvandeID = 1;
UPDATE Parvande SET DastooratPezeshk = N'قرنطینه خانگی' WHERE ParvandeID = 2;

-- DELETE برای Parvande
DELETE FROM Parvande WHERE ParvandeID = 9;
DELETE FROM Parvande WHERE ParvandeID = 10;

-- INSERT برای Daru
INSERT INTO Daru (Name, Type, MizanMasraf, TarikhEngheza, ParvandeID) VALUES
(N'استامینوفن', N'مسکن', N'3 بار در روز', '2025-01-01', 1),
(N'پنی‌سیلین', N'آنتی‌بیوتیک', N'2 بار در روز', '2025-02-01', 2);

-- UPDATE برای Daru
UPDATE Daru SET MizanMasraf = N'هر 8 ساعت' WHERE DaruID = 1;
UPDATE Daru SET TarikhEngheza = '2025-12-01' WHERE DaruID = 2;

-- DELETE برای Daru
DELETE FROM Daru WHERE DaruID = 9;
DELETE FROM Daru WHERE DaruID = 10;

-- INSERT برای SooratHesab
INSERT INTO SooratHesab (MablaghPardakht, TarikhSodor, BimarID) VALUES
(500000, '2024-06-01', 1),
(300000, '2024-06-02', 2);

-- UPDATE برای SooratHesab
UPDATE SooratHesab SET MablaghPardakht = 520000 WHERE SooratID = 1;
UPDATE SooratHesab SET TarikhSodor = '2024-06-11' WHERE SooratID = 2;

-- DELETE برای SooratHesab
DELETE FROM SooratHesab WHERE SooratID = 9;
DELETE FROM SooratHesab WHERE SooratID = 10;
