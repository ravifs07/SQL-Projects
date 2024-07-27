use Hospital_Management_System

CREATE TABLE Patient(
PatientId VARCHAR(10) PRIMARY KEY,
FName VARCHAR(MAX),
LName VARCHAR(MAX),
Contact INT,
Age INT )

INSERT INTO Patient VALUES ('P0001', 'John', 'Doe', '1234567890', '35')
INSERT INTO Patient VALUES ('P0002', 'Jane', 'Smit', '897456321', '25')
INSERT INTO Patient VALUES ('P0003', 'Michael', 'Johnson', '555555555', '62')
INSERT INTO Patient VALUES ('P0004', 'David', 'Lee', '1112223333', '33')
INSERT INTO Patient VALUES ('P0005', 'Sarah', 'Brown', '444555666', '21')
INSERT INTO Patient VALUES ('P0006', 'John', 'Doe', '1234567890', '35')
INSERT INTO Patient VALUES ('P0007', 'Jane', 'Smit', '897456321', '25')
INSERT INTO Patient VALUES ('P0008', 'Michael', 'Johnson', '555555555', '62')
INSERT INTO Patient VALUES ('P0009', 'David', 'Lee', '1112223333', '33')
INSERT INTO Patient VALUES ('P0010', 'Sarah', 'Brown', '444555666', '21')

SELECT * FROM Patient 

CREATE TABLE Doctor(
DoctorId VARCHAR(10),
Fname VARCHAR(MAX),
Lname VARCHAR(MAX),
Speciality VARCHAR(MAX),
ContactEmail VARCHAR(MAX)
 PRIMARY KEY(DoctorId))

INSERT INTO Doctor VALUES ('D0001', 'Dr.John', 'Doe', 'General Physician', 'john.doe@example.com')
INSERT INTO Doctor VALUES ('D0002', 'Dr.Jane', 'Smith', 'Pediatrician', 'jane.smith@example.com')
INSERT INTO Doctor VALUES ('D0003', 'Dr.Michael', 'Johnson', 'Cardiologist', 'michael.johnson@example.com')

select * from Doctor 

CREATE TABLE Appointment(
Appointment VARCHAR(10) PRIMARY KEY,
PatientId varchar(10),
DoctorId VARCHAR(10),
Date DATETIME,
EndTime DATETIME,
Status VARCHAR(20),
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId)
);

INSERT INTO Appointment VALUES ('A0001','P0001', 'D0001', '07-11-2023 10:00', '07-11-2023 11:15', 'Scheduled')

INSERT INTO Appointment VALUES ('A0002','P0002', 'D0002', '08-11-2023  11:00', '08-11-2023  12:06', 'Completed')
INSERT INTO Appointment VALUES ('A0003','P0003', 'D0003', '09-11-2023  12:00', '09-11-2023  01:21', 'Cancelled')
INSERT INTO Appointment VALUES ('A0004','P0004', 'D0001', '10-11-2023  13:00', '10-11-2023  14:17', 'Scheduled')
INSERT INTO Appointment VALUES ('A0005','P0005', 'D0002', '11-11-2023  14:00', '11-11-2023  15:45', 'Completed')
INSERT INTO Appointment VALUES ('A0006','P0006', 'D0003', '12-11-2023  15:00', '12-11-2023  16:15', 'Cancelled')
INSERT INTO Appointment VALUES ('A0007', 'P0007', 'D0001', '08-11-2023 12:00', '08-11-2023  12:07', 'Scheduled')
INSERT INTO Appointment VALUES ('A0008','P0008', 'D0002', '11-11-2023  14:00', '11-11-2023 15:47', 'Completed')
INSERT INTO Appointment VALUES ('A0009','P0009', 'D0003', '12-11-2023 18:00', '12-11-2023 16:16', 'Cancelled')
INSERT INTO Appointment VALUES ('A0010','P0010', 'D0001', '07-11-2023 10:00', '07-11-2023 17:09', 'Scheduled')
SELECT * FROM Appointment 

CREATE TABLE PatientsAttendAppointments(
PatientId VARCHAR(10),
Appointment VARCHAR(10),
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (Appointment) REFERENCES Appointment(Appointment))

INSERT INTO PatientsAttendAppointments VALUES ('P0001', 'A0001')
INSERT INTO PatientsAttendAppointments VALUES ('P0002', 'A0002')
INSERT INTO PatientsAttendAppointments VALUES ('P0003', 'A0003')
INSERT INTO PatientsAttendAppointments VALUES ('P0004', 'A0004')
INSERT INTO PatientsAttendAppointments VALUES ('P0005', 'A0005')
INSERT INTO PatientsAttendAppointments VALUES ('P0006', 'A0006')
INSERT INTO PatientsAttendAppointments VALUES ('P0007', 'A0007')
INSERT INTO PatientsAttendAppointments VALUES ('P0008', 'A0008')
INSERT INTO PatientsAttendAppointments VALUES ('P0009', 'A0009')
INSERT INTO PatientsAttendAppointments VALUES ('P0010', 'A0010')

SELECT * FROM PatientsAttendAppointments

CREATE TABLE MedicalHistory(
HistoryId VARCHAR(10) PRIMARY KEY,
PatientId VARCHAR(10),
Date DATETIME,
Condition VARCHAR(20),
Surgeries VARCHAR(20),
Medication VARCHAR(20),
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId))

INSERT INTO MedicalHistory VALUES('H0001', 'P0001', '01-11-2023  08:00', 'Hypertension', 'Appendectomy', 'Lisinopril')
INSERT INTO MedicalHistory VALUES('H0002', 'P0002', '02-11-2023  09:00', 'Diabetes', 'None', 'Metformin')
INSERT INTO MedicalHistory VALUES('H0003', 'P0003', '03-11-2023  10:00', 'Asthma', 'Tonsillectomy', 'Albuterol')
INSERT INTO MedicalHistory VALUES('H0004', 'P0004', '04-11-2023  11:00', 'Migraine', 'Appendectomy', 'Ibuprofen')
INSERT INTO MedicalHistory VALUES('H0005', 'P0005', '05-11-2023  12:00', 'Diabetes', 'None', 'Insulin')
INSERT INTO MedicalHistory VALUES('H0006', 'P0006', '06-11-2023  13:00', 'Asthma', 'Tonsillectomy', 'Albuterol')
INSERT INTO MedicalHistory VALUES('H0007', 'P0007', '07-11-2023  14:00', 'Hypertension', 'Appendectomy', 'Lisinopril')
INSERT INTO MedicalHistory VALUES('H0008', 'P0008', '08-11-2023  15:00', 'Diabetes', 'None', 'Metformin')
INSERT INTO MedicalHistory VALUES('H0009', 'P0009', '09-11-2023  16:00', 'Asthma', 'Tonsillectomy', 'Albuterol')
INSERT INTO MedicalHistory VALUES('H0010', 'P0010', '10-11-2023  17:00', 'Migraine', 'Appendectomy', 'Ibuprofen')

SELECT * FROM MedicalHistory

CREATE TABLE PatientsFillHistory(
PatientId VARCHAR(10),
HistoryId varchar(10),
Datefilled DATETIME,
FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY (HistoryId) REFERENCES MedicalHistory(HistoryId))

INSERT INTO PatientsFillHistory VALUES ('P0001', 'H0001', '04-11-2023  08:30')
INSERT INTO PatientsFillHistory VALUES ('P0002', 'H0002', '04-11-2023  09:45')
INSERT INTO PatientsFillHistory VALUES ('P0003', 'H0003', '05-11-2023  10:30')
INSERT INTO PatientsFillHistory VALUES ('P0004', 'H0004', '06-11-2023  11:15')
INSERT INTO PatientsFillHistory VALUES ('P0005', 'H0005', '07-11-2023  12:45')
INSERT INTO PatientsFillHistory VALUES ('P0006', 'H0006', '08-11-2023  13:30')
INSERT INTO PatientsFillHistory VALUES ('P0007', 'H0007', '09-11-2023  14:15')
INSERT INTO PatientsFillHistory VALUES ('P0008', 'H0008', '10-11-2023  15:45')
INSERT INTO PatientsFillHistory VALUES ('P0009', 'H0009', '11-11-2023  16:30')
INSERT INTO PatientsFillHistory VALUES ('P0010', 'H00010', '12-11-2023 17:15')

SELECT * FROM MedicalHistory 
SELECT * FROM PatientsAttendAppointments
SELECT * FROM Appointment 

CREATE TABLE MedicationCost(
MedicationN Varchar(10),
CostM INT)

update Appointment set Date = '2023-05-16 14:00:00.000' where PatientId = 'P0005'
drop TRIGGER UpdateAppointmentStatus
INSERT INTO MedicationCost VALUES ('Lisinopril', '10')
INSERT INTO MedicationCost VALUES ('Metformin', '15')
INSERT INTO MedicationCost VALUES ('Albuterol', '12')
INSERT INTO MedicationCost VALUES ('Ibuprofen', '8')
INSERT INTO MedicationCost VALUES ('Insulin', '20')

select * from MedicationCost

1st Query :-
SELECT DISTINCT p.FName, p.LName
FROM appointment a
JOIN doctor d ON a.DoctorId = d.DoctorId
JOIN patient p ON a.PatientId = p.PatientId
WHERE d.Fname = 'Dr.John' AND d.Lname = 'Doe';

2nd Query :- SELECT AVG(Age) FROM Patient

3rd Query :- 
CREATE PROCEDURE GetTotalAppointments1
    @PatientId VARCHAR(10)
AS
BEGIN
    SELECT COUNT(*) AS TotalAppointments1
    FROM Appointment
    WHERE PatientId = @PatientId;
END;



--4th Query :- 

CREATE TRIGGER UpdateAppointmentStatus2
ON appointment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE appointment
    SET Status = 'Completed'
    WHERE Date < GETDATE() AND Status <> 'Completed';
END;

CREATE TRIGGER UpdateAppointmentStatus1
ON appointment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT OFF;

    UPDATE appointment
    SET Status = 'Completed'
    WHERE Date < GETDATE() AND Status <> 'Completed';
END;

INSERT INTO Appointment VALUES ('A0012', 'P0007', 'D0001', '02-04-2024 12:00', '03-04-2024  12:07', 'Scheduled')

5th Query
SELECT
    A.Status,
    D.Fname + ' ' + D.Lname AS DoctorName
FROM Patient P
JOIN Appointment A ON P.PatientId = A.PatientId
JOIN Doctor D ON A.DoctorId = D.DoctorId;

--6th Query
SELECT
    P.FName + ' ' + P.LName AS PatientName,
    A.Appointment,
    A.Date,
    D.Fname + ' ' + D.Lname AS DoctorName
FROM Patient P
JOIN Appointment A ON P.PatientId = A.PatientId
JOIN Doctor D ON A.DoctorId = D.DoctorId
WHERE P.PatientId IN (
    SELECT DISTINCT PatientId
    FROM MedicalHistory
    WHERE Condition = 'Diabetes'
)
AND A.Date BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE());

--7th Query
SELECT P.FName + ' ' + P.LName AS PatientName, COUNT(A.Appointment) AS NumAppointments
FROM Patient P
JOIN Appointment A ON P.PatientId = A.PatientId
GROUP BY P.PatientId, P.FName, P.LName
HAVING COUNT(A.Appointment) > 1;

8th Query :-
SELECT
    D.Fname + ' ' + D.Lname AS DoctorName,
    AVG(DATEDIFF(MINUTE, A.Date, A.EndTime)) AS AvgDurationMinutes
FROM Doctor D
JOIN Appointment A ON D.DoctorId = A.DoctorId
GROUP BY D.DoctorId, D.Fname, D.Lname;

9th Query
SELECT TOP 1
    P.FName + ' ' + P.LName AS PatientName,
    COUNT(A.Appointment) AS NumAppointments
FROM Patient P
JOIN Appointment A ON P.PatientId = A.PatientId
GROUP BY P.PatientId, P.FName, P.LName
ORDER BY COUNT(A.Appointment) DESC;

10th Query:-

CREATE PROCEDURE CalculatePatientBill (@PatientID VARCHAR(10))
AS
BEGIN
    DECLARE @total_cost DECIMAL(10, 2);

    -- Calculate medication costs
    SET @total_cost = (
        SELECT ISNULL(SUM(CostM), 0)
        FROM PatientsFillHistory
        JOIN MedicalHistory ON PatientsFillHistory.HistoryId = MedicalHistory.HistoryId
        JOIN MedicationCost ON MedicalHistory.Medication = MedicationCost.MedicationN
        WHERE PatientsFillHistory.PatientId = @PatientID
    );

    -- Add surgery charges
    SET @total_cost = @total_cost + (
        SELECT COUNT(*) * 50
        FROM MedicalHistory
        WHERE MedicalHistory.Surgeries != 'None' AND MedicalHistory.PatientId = @PatientID
    );

    -- Ensure a basic charge of $50 even if no medical history
    IF @total_cost = 0
        SET @total_cost = 50.00;

    -- Return the total cost
    SELECT @total_cost AS TotalBill;
END;



EXEC GetTotalAppointments1  @PatientId = 'P0001';


EXEC CalculatePatientBill @PatientID = 'P0004'; 

SELECT ROUTINE_NAME, ROUTINE_DEFINITION
FROM INFORMATION_SCHEMA.ROUTINESs
WHERE ROUTINE_TYPE = 'PROCEDURE';







