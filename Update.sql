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
