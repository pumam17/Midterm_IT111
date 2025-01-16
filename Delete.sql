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