-- --------------------------------------------------------------------------------
-- Name:  
-- Class: IT-111 
-- Abstract: Test #1
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbWannacureu;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

-- --------------------------------------------------------------------------------
--						Test #1
-- --------------------------------------------------------------------------------

-- Drop Table Statements

IF OBJECT_ID ('TNurseAppointments')	IS NOT NULL DROP TABLE TNurseAppointments
IF OBJECT_ID ('TNurses')			IS NOT NULL DROP TABLE TNurses
IF OBJECT_ID ('TAppointments')		IS NOT NULL DROP TABLE TAppointments
IF OBJECT_ID ('TDoctors')			IS NOT NULL DROP TABLE TDoctors
IF OBJECT_ID ('TPatients')			IS NOT NULL DROP TABLE TPatients





-- --------------------------------------------------------------------------------
--	Step #1 : Create table 
-- --------------------------------------------------------------------------------

CREATE TABLE TPatients
(
	 intPatientID						INTEGER			NOT NULL
	,strFirstName						VARCHAR(255)	NOT NULL
	,strLastName						VARCHAR(255)	NOT NULL
	,strSSN								VARCHAR(255)	NOT NULL
	,strAddress							VARCHAR(255)	NOT NULL
	,strCity							VARCHAR(255)	NOT NULL
	,strState							VARCHAR(255)	NOT NULL
	,strZip								VARCHAR(255)	NOT NULL
	,dtmDateOfBirth						DATETIME		NOT NULL
	,strRace							VARCHAR(255)	NOT NULL
	,strGender							VARCHAR(255)	NOT NULL
	,strEmail							VARCHAR(255)	NOT NULL
	,strPhoneNumber						VARCHAR(255)	NOT NULL
	,strinsurance						VARCHAR(255)	NOT NULL
	,strEmergencyContactFirstName		VARCHAR(25)		NOT NULL
	,strEmergencyContactLastName		VARCHAR(255)	NOT NULL
	,CONSTRAINT TPatients_PK PRIMARY KEY ( intPatientID )
)

CREATE TABLE TDoctors
(
	 intDoctorID						INTEGER			NOT NULL
	,strFirstName						VARCHAR(255)	NOT NULL
	,strLastName						VARCHAR(255)	NOT NULL
	,strAddress							VARCHAR(255)	NOT NULL
	,strCity							VARCHAR(255)	NOT NULL
	,strState							VARCHAR(255)	NOT NULL
	,strZip								VARCHAR(255)	NOT NULL
	,dtmDateOfBirth						DATETIME		NOT NULL
	,strEmail							VARCHAR(255)	NOT NULL
	,strPhoneNumber						VARCHAR(255)	NOT NULL
	,strEmployeeID						VARCHAR(255)	NOT NULL
	,dtmDateOfHire						DATETIME		NOT NULL
	,dtmDateOfTermination				DATETIME		NOT NULL
	,dtmPassedBoards					DATETIME		NOT NULL
	,CONSTRAINT TDoctors_PK PRIMARY KEY ( intDoctorID )
)
CREATE TABLE TNurses
(
	 intNurseID							INTEGER			NOT NULL
	,strFirstName						VARCHAR(255)	NOT NULL
	,strLastName						VARCHAR(255)	NOT NULL
	,strAddress							VARCHAR(255)	NOT NULL
	,strCity							VARCHAR(255)	NOT NULL
	,strState							VARCHAR(255)	NOT NULL
	,strZip								VARCHAR(255)	NOT NULL
	,dtmDateOfBirth						DATETIME		NOT NULL
	,strEmail							VARCHAR(255)	NOT NULL
	,strPhoneNumber						VARCHAR(255)	NOT NULL
	,strEmployeeID						VARCHAR(255)	NOT NULL
	,dtmDateOfHire						DATETIME		NOT NULL
	,dtmDateOfTermination				DATETIME		NOT NULL
	,CONSTRAINT TNurses_PK PRIMARY KEY ( intNurseID )
)

CREATE TABLE TAppointments
(
	 intAppointmentID					INTEGER			NOT NULL
	,intDoctorID						INTEGER			NOT NULL
	,intPatientID						INTEGER			NOT NULL
	,strAppointmentNumber				VARCHAR(255)	NOT NULL
	,dtmAppointmentDate					DATETIME		NOT NULL
	,strReasonForAppointment			VARCHAR(255)	NOT NULL
	,dtmFollowUpAppointment				DATETIME		NOT NULL
	,CONSTRAINT TAppointments_PK PRIMARY KEY ( intAppointmentID )
)


CREATE TABLE TNurseAppointments
(
	  intNurseAppointmentID				INTEGER			NOT NULL
	 ,intNurseID						INTEGER			NOT NULL
	 ,intAppointmentID					INTEGER			NOT NULL
	 ,CONSTRAINT TNurseAppointments_PK PRIMARY KEY ( intNurseAppointmentID )
)



-- --------------------------------------------------------------------------------
--	Step #2 : Establish Referential Integrity 
-- --------------------------------------------------------------------------------
--
-- #	Child							Parent						Column
-- -	-----							------						---------
-- 1	TAppointments					TPatients					intPatientID	
-- 2	TAppointments					TDoctors					intDoctorID
-- 3	TNurseAppoitments				TNurses						intNurseID
-- 4	TNurseAppoitments				TAppoitments				intAppointmentID
-- 5	TPatientDiagnoses				TPatients					intPatientID
-- 6	TPatientDiagnoses				TDiagnoses					intDiagnosisID

--1
ALTER TABLE TAppointments ADD CONSTRAINT TAppointments_TPatients_FK 
FOREIGN KEY ( intPatientID ) REFERENCES TPatients ( intPatientID )

--2
ALTER TABLE TAppointments ADD CONSTRAINT TAppointments_TDoctors_FK 
FOREIGN KEY ( intDoctorID ) REFERENCES TDoctors ( intDoctorID )


--3
ALTER TABLE TNurseAppointments ADD CONSTRAINT  TNurseAppointments_TAppointments_FK 
FOREIGN KEY ( intAppointmentID ) REFERENCES TAppointments ( intAppointmentID )

--4
ALTER TABLE TNurseAppointments ADD CONSTRAINT  TNurseAppointments_TNurses_FK 
FOREIGN KEY ( intNurseID ) REFERENCES TNurses ( intNurseID )

--5


--6
-- --------------------------------------------------------------------------------
--	Step #3 : Add Data - INSERTS
-- --------------------------------------------------------------------------------

INSERT INTO TPatients (intPatientID, strFirstName, strLastName, strSSN, strAddress, strCity, strState, strZip, dtmDateOfBirth, strRace, strGender ,strEmail ,strPhoneNumber ,strinsurance ,strEmergencyContactFirstName ,strEmergencyContactLastName)
VALUES				  (1, 'James', 'Jones', '123-45-6789', '321 Elm St.', 'Cincinnati', 'Oh', '45201', '1/1/1997', 'Hispanic', 'Male' , 'Icleantooth@treesrus.com', '555-555-5555', 'Progressive', 'Mike', 'Puma')
					 ,(2, 'Sally', 'Smith', '987-65-4321', '987 Main St.', 'Norwood', 'Oh', '45218', '12/1/1999', 'African-American', 'Female' , 'etotheright@shirtsrus.com', '666-666-6666', 'Geico', 'Matt', 'Puma')
					 ,(3, 'Jose', 'Hernandez', '315-56-4020', '1569 Windisch Rd.', 'West Chester', 'Oh', '45069', '9/23/1998', 'Hispanic', 'Male',  'mmetosing@toysrus.com', '888-888-8888', 'State Farm', 'Marc', 'Puma')
					 ,(4, 'Lan', 'Kim','589-28-4526', '44561 Oak Ave.', 'Milford', 'Oh', '45246', '6/11/1999', 'Asian', 'Male', 'myemail@gmail.com', '513-867-5309', 'The General', 'Paula', 'Puma')
					 ,(5, 'Mitch', 'Puma', '123-45-6789', '123 Duck St.', 'Mason', 'Oh', '45206', '10/08/1998', 'Asian', 'Male', 'mitchpuma17@gmail.com', '513-999-9999', 'Liberty Mutual', 'Jared','Puma')

INSERT INTO TDoctors  (intDoctorID, strFirstName, strLastName, strAddress, strCity, strState, strZip, dtmDateOfBirth ,strEmail ,strPhoneNumber ,strEmployeeID ,dtmDateOfHire, dtmDateOfTermination, dtmPassedBoards)
VALUES				  (1, 'Bob', 'Nields', '999 Street St.', 'Cincinnati', 'Oh', '45201', '2/2/1990', 'Bob@gamil.com', '111-111-1111', '001', '1/1/2024', '2/2/2024', '3/3/2000')
					 ,(2, 'Ray', 'Harmon', '888 Road St.', 'Norwood', 'Oh', '45218', '3/3/1991', 'Ray@gmail.com', '222-222-2222', '002', '4/4/2024', '5/5/2024', '6/6/2000') 
					 ,(3, 'Pam', 'Ransdell', '7777 Chair Rd.', 'West Chester', 'Oh', '45069', '4/4/1992', 'Pam@gmail.com', '333-333-3333', '003', '7/7/2024', '8/8/2024', '9/9/2000')
					 ,(4, 'Joe', 'Burrow', '66666 Desk Ave.', 'Milford', 'Oh', '45246', '5/5/1993', 'Joe@gmail.com', '444-444-4444', '004', '10/10/2024', '11/11/2024', '12/12/2000')
					 ,(5, 'Jamarr', 'Chase', '555 Bengal St.', 'Mason', 'Oh', '45206', '6/6/1994', 'Jamarr@gmail.com', '777-777-7777', '005', '1/10/2024', '2/10/2024', '3/10/2000')

INSERT INTO TNurses   (intNurseID, strFirstName, strLastName, strAddress, strCity, strState, strZip, dtmDateOfBirth,strEmail ,strPhoneNumber ,strEmployeeID	,dtmDateOfHire ,dtmDateOfTermination)
VALUES				  (1, 'Drew', 'Sample', '123 Fire St.', 'Cincinnati', 'Oh', '45201', '7/7/1995', 'Drew@gamil.com', '111-000-1111', '006', '5/10/2024', '6/10/2024')
					 ,(2, 'Sam', 'Hubbard', '456 Red St.', 'Norwood', 'Oh', '45218', '8/8/1996', 'Sam@gmail.com', '222-000-2222', '007', '8/10/2024', '9/10/2024') 
					 ,(3, 'Cam', 'Taylor-Britt', '7891 Blue Rd.', 'West Chester', 'Oh', '45069', '9/9/1997', 'Cam@gmail.com', '333-000-3333', '008', '11/10/2024', '12/10/2024')
					 ,(4, 'Joe', 'Mixon', '23456 Green Ave.', 'Milford', 'Oh', '45246', '10/10/1998', 'Mixon@gmail.com', '444-000-4444', '009', '2/20/2024', '3/20/2024')
					 ,(5, 'Jake', 'Browning', '987 Purple St.', 'Mason', 'Oh', '45206', '11/11/1998', 'Jake@gmail.com', '777-000-7777', '010', '5/20/2024', '6/20/2024')

INSERT INTO TAppointments(intAppointmentID, intPatientID, intDoctorID, strAppointmentNumber, dtmAppointmentDate, strReasonForAppointment, dtmFollowUpAppointment)
VALUES					 (1, 1, 1, '101', '7/20/2024','Flu Shot', '8/20/2024')
						,(2, 3, 1, '102', '9/20/2024','Check Up', '10/20/2024')
						,(3, 4, 3, '103', '11/20/2024','Flu Shot', '12/20/2024')
						,(4, 2, 3, '104', '1/30/2024','Phizer Shot', '2/28/2024')
						,(5, 5, 5, '105', '3/30/2024','Moderna Shot', '4/30/2024')

INSERT INTO TNurseAppointments (intNurseAppointmentID, intNurseID, intAppointmentID)
VALUES				   (1, 1, 2)
					  ,(2, 2, 2)
					  ,(3, 3, 2)
					  ,(4, 4, 3)
					  ,(5, 5, 3)



-- --------------------------------------------------------------------------------
--	Step #4 : SELECT INFORMATION
-- --------------------------------------------------------------------------------
-- a
SELECT TP.*
FROM TPatients		as TP
Order By TP.strLastName, TP.strFirstName

--b
SELECT TP.*
FROM TPatients		as TP
WHERE TP.strZip		= '45206'
Order By TP.strLastName, TP.strFirstName

--c
SELECT TP.strFirstName, TP.strLastName
FROM TPatients		as TP
	,TAppointments  as TA
WHERE 
	TP.intPatientID				= TA.intPatientID
and TA.dtmAppointmentDate		< '11/1/2024'
Order By TP.strLastName, TP.strFirstName

--d
SELECT TP.*
FROM TPatients		as TP
	,TNurses		as TN
	,TAppointments  as TA
	,TNurseAppointments as TNA
WHERE
	TN.intNurseID		= TNA.intNurseID
and	TA.intAppointmentID = TNA.intAppointmentID
and TP.intPatientID		= TA.intPatientID
and TN.intNurseID		= 2
Order By TP.strLastName, TP.strFirstName

--e
SELECT TP.*
FROM TPatients		as TP
	,TDoctors		as TD
	,TAppointments  as TA
WHERE
	TD.intDoctorID		= TA.intDoctorID
and TP.intPatientID		= TA.intPatientID
Order By TP.strLastName, TP.strFirstName

-- --------------------------------------------------------------------------------
--	Step #5 : UPDATE Data
-- --------------------------------------------------------------------------------
SELECT TP.*
FROM   TPatients	as TP

UPDATE TPatients
SET  strEmergencyContactFirstName = 'Bob'
	,strEmergencyContactLastName = 'Nields'
WHERE intPatientID = 1

SELECT TP.*
FROM   TPatients	as TP

-- --------------------------------------------------------------------------------
--	Step #5 : DELETE  Data 
-- --------------------------------------------------------------------------------
SELECT TP.* , TA.*
FROM     TPatients	as TP
		,TAppointments as TA

DELETE FROM TAppointments 
WHERE  dtmAppointmentDate = '10/20/2024'

SELECT TP.* , TA.*
FROM     TPatients	as TP
		,TAppointments as TA
