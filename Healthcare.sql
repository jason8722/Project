-- create a new table to edit
create table healthcare_dataset1 as
select *
from healthcare_dataset;

select *
from healthcare_dataset1

-- number of unique patients
select count(distinct(name))
from healthcare_dataset1

--rename columns
alter table healthcare_dataset1
rename column `Blood Type` to Blood_type,
rename column `Medical Condition` to Medical_condition,
rename column `Date of admission` to Admission_date,
rename column `Insurance Provider` to Insurance,
rename column `Billing Amount` to Billing_amt,
rename column `Room number` to Room,
rename column `Admission Type` to Admission_type,
rename column `Discharge Date` to Discharge_Date,
rename column `Test Results` to Results;

-- check for null or missing values
select *
from healthcare_dataset1
where 
Name is NUll or name = ''
or Age is NUll or Age = ''
or Gender is Null or Gender = ''
or Blood_Type is NUll or Blood_type =  ''
or Medical_condition is NUll or Medical_condition = ''
or admission_date is NUll or admission_date =  ''
or Doctor is NUll or doctor = ''
or Hospital is NUll or hospital = ''
or Insurance is NUll or insurance = ''
or Billing_amt is NUll or billing_amt = ''
or Room is NUll or Room = ''
or Admission_type is NULL or admission_type = ''
or Discharge_Date is NUll or Discharge_date =  ''
or Medication is NUll or Medication = ''
or Results is NUll or Results = ''

-- looking for average age of patients
select avg(Age), gender
from healthcare_dataset1
group by gender

-- average amount billed 
select round(AVG(billing_amt),0) as AVG_billed, gender
from healthcare_dataset1
group by gender

-- show which patients had inconclusive results
select *
from healthcare_dataset1
where results = 'inconclusive';

-- determining which admission type has higher costs
select round(sum(billing_amt), 0) as total_emergencybill
from healthcare_dataset1
where admission_type = "emergency";

select round(sum(billing_amt), 0) as total_electivebill
from healthcare_dataset1
where admission_type = "elective";

-- higher cost of elective admission types to hospitals could account for higher number of elective admission types
select count(admission_type)
from healthcare_dataset1
where admission_type = "elective";

select count(admission_type)
from healthcare_dataset1
where admission_type = "emergency";


-- find doctor that bills the most
select doctor
from healthcare_dataset1
where billing_amt = (select max(Billing_amt) from healthcare_dataset1);

-- finding out patients with cancer that have an inconclusive result
select Name
from healthcare_dataset1
where Medical_condition = "cancer" and results = "inconclusive";

