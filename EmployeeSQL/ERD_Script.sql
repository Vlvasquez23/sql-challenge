-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Rr8iFB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_id] VARCHAR  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_id] ASC
    )
)

CREATE TABLE [dept_employee] (
    [employee_id] INT  NOT NULL ,
    [dept_id] VARCHAR  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [dept_id] VARCHAR  NOT NULL ,
    [employee_id] INT  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

CREATE TABLE [employee] (
    [employee_id] INT  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [gender] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED (
        [employee_id] ASC
    )
)

CREATE TABLE [salary] (
    [employee_id] INT  NOT NULL ,
    [salary] INT  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

CREATE TABLE [title] (
    [employee_id] INT  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    [from_date] DATE  NOT NULL ,
    [to_date] DATE  NOT NULL 
)

ALTER TABLE [dept_employee] WITH CHECK ADD CONSTRAINT [FK_dept_employee_employee_id] FOREIGN KEY([employee_id])
REFERENCES [employee] ([employee_id])

ALTER TABLE [dept_employee] CHECK CONSTRAINT [FK_dept_employee_employee_id]

ALTER TABLE [dept_employee] WITH CHECK ADD CONSTRAINT [FK_dept_employee_dept_id] FOREIGN KEY([dept_id])
REFERENCES [departments] ([dept_id])

ALTER TABLE [dept_employee] CHECK CONSTRAINT [FK_dept_employee_dept_id]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_id] FOREIGN KEY([dept_id])
REFERENCES [departments] ([dept_id])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_id]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_employee_id] FOREIGN KEY([employee_id])
REFERENCES [employee] ([employee_id])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_employee_id]

ALTER TABLE [salary] WITH CHECK ADD CONSTRAINT [FK_salary_employee_id] FOREIGN KEY([employee_id])
REFERENCES [employee] ([employee_id])

ALTER TABLE [salary] CHECK CONSTRAINT [FK_salary_employee_id]

ALTER TABLE [title] WITH CHECK ADD CONSTRAINT [FK_title_employee_id] FOREIGN KEY([employee_id])
REFERENCES [employee] ([employee_id])

ALTER TABLE [title] CHECK CONSTRAINT [FK_title_employee_id]

COMMIT TRANSACTION QUICKDBD