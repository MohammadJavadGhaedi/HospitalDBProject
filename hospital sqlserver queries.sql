
USE HospitalDB;
GO

-- INSERT برای Bimar
INSERT INTO Bimar (Name, FamilyName, Age, Gender, Contact, Address) VALUES 
(N'Ali', N'Rezaei', 35, 'M', N'09121234567', N'Tehran'),
(N'Sara', N'Ahmadi', 29, 'F', N'09121237890', N'Shiraz');

-- UPDATE برای Bimar
UPDATE Bimar SET Address = N'Esfahan' WHERE BimarID = 1;
UPDATE Bimar SET Age = 40 WHERE BimarID = 2;

-- DELETE برای Bimar
DELETE FROM Bimar WHERE BimarID = 9;
DELETE FROM Bimar WHERE BimarID = 10;

-- INSERT برای Pezeshk
INSERT INTO Pezeshk (Name, FamilyName, Takhasos, Email, Contact) VALUES
(N'Hossein', N'Mohammadi', N'Cardiology', N'hossein@example.com', N'09121230000'),
(N'Narges', N'Rostami', N'Dermatology', N'narges@example.com', N'09121231111');

-- UPDATE برای Pezeshk
UPDATE Pezeshk SET Takhasos = N'Internal Medicine' WHERE PezeshkID = 1;
UPDATE Pezeshk SET Contact = N'09125550000' WHERE PezeshkID = 2;

-- DELETE برای Pezeshk
DELETE FROM Pezeshk WHERE PezeshkID = 9;
DELETE FROM Pezeshk WHERE PezeshkID = 10;

-- INSERT برای NobatDehi
INSERT INTO NobatDehi (Tarikh, Saat, BimarID, PezeshkID) VALUES 
('2024-06-01', '09:00:00', 1, 1),
('2024-06-01', '10:00:00', 2, 1);

-- UPDATE برای NobatDehi
UPDATE NobatDehi SET Tarikh = '2024-06-05' WHERE NobatID = 1;
UPDATE NobatDehi SET Saat = '12:00:00' WHERE NobatID = 2;

-- DELETE برای NobatDehi
DELETE FROM NobatDehi WHERE NobatID = 9;
DELETE FROM NobatDehi WHERE NobatID = 10;

-- JOIN: نمایش نوبت‌ها با نام بیمار و پزشک
SELECT n.NobatID, b.Name AS PatientName, p.Name AS DoctorName, n.Tarikh, n.Saat
FROM NobatDehi n
JOIN Bimar b ON n.BimarID = b.BimarID
JOIN Pezeshk p ON n.PezeshkID = p.PezeshkID;
GO

-- AGGREGATE: شمار بیماران به تفکیک جنسیت
SELECT Gender, COUNT(*) AS Count FROM Bimar GROUP BY Gender;
GO

-- AGGREGATE: میانگین سن بیماران
SELECT AVG(Age) AS AverageAge FROM Bimar;
GO

-- AGGREGATE: مجموع پرداختی‌ها به ازای هر بیمار
SELECT b.Name, SUM(sh.MablaghPardakht) AS TotalPaid
FROM SooratHesab sh
JOIN Bimar b ON sh.BimarID = b.BimarID
GROUP BY b.Name;
GO
