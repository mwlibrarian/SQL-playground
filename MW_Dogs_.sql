/* Used to find out how many clients currently own dogs age 3 yrs or younger in the vet practice */
CREATE VIEW Puppy_owner AS
SELECT owner_id FROM Patient 
WHERE age <= 3;
GO

SELECT COUNT (DISTINCT owner_id) AS Number_puppy_owners_ FROM Puppy_owner

CREATE PROCEDURE Families_with_puppies AS
SELECT DISTINCT Owner.owner_id, Owner.first_name, Owner.last_name, Owner.address1, Owner.address2, Owner.address3, Owner.address4 FROM Owner INNER JOIN Puppy_owner ON Owner.owner_id = Puppy_owner.owner_id
GO

EXEC Families_with_puppies


/* Used to cleanup dates from string to datatype for dates and to connect the owner's information to the patient's information. */
ALTER TABLE Owner ADD rabies_shot_soon date;

SELECT TRY_CAST([rabies_shot_date] AS date) FROM Patient; 
UPDATE Owner SET rabies_shot_soon = rabies_shot_date FROM Patient WHERE Patient.owner_id = Owner.owner_id;


/* Used to identify the owners that have dogs who are overdue for a rabies shot. */
CREATE VIEW shots_due AS
SELECT owner_id FROM Patient
WHERE '1-1-2020' > TRY_CAST([rabies_shot_date] AS date);
GO

SELECT DISTINCT * FROM shots_due

SELECT COUNT (DISTINCT owner_id) AS due_now FROM Patient
WHERE '1-1-2020' > TRY_CAST([rabies_shot_date] AS date);
GO

CREATE TABLE temp_shots (owner_id varchar(15), phone varchar(15), email varchar(50), patient_first_name nvarchar(50), patient_last_name nvarchar(50), last_rabies_shot date) INSERT INTO temp_shots 
SELECT Owner.owner_id, Owner.phone, Owner.email, Patient.first_name, Patient.last_name, Owner.rabies_shot_soon FROM Owner FULL JOIN Patient ON Owner.owner_id = Patient.owner_id
 GO

CREATE PROCEDURE contact_asap AS
SELECT DISTINCT * FROM temp_shots
WHERE '1-1-2020' > last_rabies_shot;
GO

EXEC contact_asap



/* In order to remove changes that have been done to the Dogs_only database */
CREATE PROCEDURE Restore_Data AS
DROP PROCEDURE contact_asap;
DROP TABLE temp_shots;
DROP VIEW shots_due;
ALTER TABLE Owner DROP COLUMN rabies_shot_soon;
DROP PROCEDURE Families_with_puppies;
DROP VIEW Puppy_owner; 
GO

EXEC Restore_Data

/*  DROP PROCEDURE Restore_Data */