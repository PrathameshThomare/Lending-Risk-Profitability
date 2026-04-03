use lending_loan_db;
select @sql_mode;

show variables like 'local_infile';

set global local_infile = 1;

#Loading data into database;
load data local infile 'C:\\Users\\ENVY\\Downloads\\loans.csv'
into table loans
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(loan_amnt,
term,
int_rate,
grade,
home_ownership,
annual_inc,
@issue_d,
loan_status,
purpose,
addr_state,
dti,
total_pymnt,
total_rec_prncp)
set issue_d = str_to_date(@issue_d,'%b-%y');

select * from loans;

select count(*) from loans where default_flag = 1;

#Creating derived columns

#1. default flag
alter table loans add default_flag int;

update loans
set default_flag = 
	case
		when loan_status = 'charged off' then 1
        else 0
	end;
    
#2. Income Band
alter table loans add column income_band varchar(20);

update loans
set income_band = 
	case
		when annual_inc < 50000 then 'Low'
        when annual_inc between 50000 and 100000 then 'Medium'
        else 'High'
	end;

#3. Loan Term
ALTER TABLE loans ADD loan_term INT;

UPDATE loans
SET loan_term =
    CASE
        WHEN term LIKE '%36%' THEN 36
        WHEN term LIKE '%60%' THEN 60
    END;

#Portfolio Overview (KPIs)
#1. Total Loans + default rate
select 
	count(*) as total_loans,
    sum(default_flag) as total_defaults,
    round(sum(default_flag) * 100.0/count(*),2) as default_rate_percent
from loans;

#2. Loan Status Distribution
select
	loan_status,
	count(*) as total
from loans
group by loan_status;

#Risk Segmentation
#1. Default rate by grade
select
	grade,
    count(*) as total_loans,
    round(sum(default_flag)*100.0/count(*),2) as default_flag_percentage
from loans
group by grade
order by grade;

#2. Default rate by income band
select
	income_band,
    count(*) as total_loans,
    rount(sum(default_flag) * 100.0/count(*),2) as default_flag_percentage
from loans
group by income_band;

# Profit and loss Analysis
#1. Total Interest Earned
select
	round(sum(total_pymnt - total_rec_prncp),2) as total_interest_earned
from loans;

#2. Principle loss (Charged Off) 
select
	round(sum(loan_amnt - total_rec_prncp),2) as principle_loss
from loans
where default_flag = 1;

#3. Net Profit
select
	round(sum(total_pymnt - loan_amnt),2) as net_profit
from loans;
	
select * from loans;

select user, host, plugin from mysql.user;

alter user 'root'@'localhost'
identified with mysql_native_password
by 'root';

flush privileges;
