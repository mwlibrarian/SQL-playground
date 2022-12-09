/* Part 2 - find csv file, import into The ACC Store, create view from the table, create stored procedure to clean up data, create function to look up entry in the table */

CREATE VIEW interesting_info AS
SELECT Program_Category, Region_Served, Age_Group, Mental_Illness, Race, Employment_Status FROM Mental_Health_Patient_Characteristics_Survey__2022
WHERE Program_Category = 'INPATIENT';
GO

SELECT * FROM interesting_info 

CREATE PROCEDURE cleanup AS
ALTER TABLE Mental_Health_Patient_Characteristics_Survey_2022
DROP COLUMN Survey_Year, Sexual_Orientation, Religous_Preference, Other_Cardiac, SSI_Cash_Assistance, SSDI_Cash_Assistance, Three_Digit_Residence_Zip_Code, Public_Assistance_Cash_Program, Other_Cash_Benefits, Veterans_Disability_Benefits, Veterans_Cash_Assistance, Medicaid_and_Medicare_Insurance, Medicare_Insurance, Medicaid_Insurance, No_Insurance, Private_Insurance, Other_Insurance, Child_Health_Plus_Insurance, Unknown_Insurance_Coverage; 
GO 
SELECT * INTO Mental_Health_Patient_Types_2022
FROM Mental_Health_Patient_Characteristics_Survey_2022;
GO


-- I know this is wrong (below function), but I cannot figure it out, sorry. Please advise, thanks --

CREATE FUNCTION children AS
SELECT Age_Group WHERE Age_Group = 'Child' COUNT(Age_Group) FROM Mental_Health_Patient_Characteristics_Survey_2022; 
GO




 