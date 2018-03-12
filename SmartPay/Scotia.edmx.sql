
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/12/2018 13:59:56
-- Generated from EDMX file: C:\Users\Phil-Jon-D\source\repos\SmartPay\SmartPay\scotia.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Scotia Bank];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AccountAccount_type]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_AccountAccount_type];
GO
IF OBJECT_ID(N'[dbo].[FK_transaction_historytransaction_type]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transaction_history] DROP CONSTRAINT [FK_transaction_historytransaction_type];
GO
IF OBJECT_ID(N'[dbo].[FK_Accounttransaction_history_Accounts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounttransaction_history] DROP CONSTRAINT [FK_Accounttransaction_history_Accounts];
GO
IF OBJECT_ID(N'[dbo].[FK_Accounttransaction_history_transaction_history]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounttransaction_history] DROP CONSTRAINT [FK_Accounttransaction_history_transaction_history];
GO
IF OBJECT_ID(N'[dbo].[FK_BranchCustomer_Branches]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BranchCustomer] DROP CONSTRAINT [FK_BranchCustomer_Branches];
GO
IF OBJECT_ID(N'[dbo].[FK_BranchCustomer_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BranchCustomer] DROP CONSTRAINT [FK_BranchCustomer_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountCustomer_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountCustomer] DROP CONSTRAINT [FK_AccountCustomer_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountCustomer_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountCustomer] DROP CONSTRAINT [FK_AccountCustomer_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_BillCustomer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK_BillCustomer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Account_type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Account_type];
GO
IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[Branches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Branches];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[transaction_history]', 'U') IS NOT NULL
    DROP TABLE [dbo].[transaction_history];
GO
IF OBJECT_ID(N'[dbo].[transaction_type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[transaction_type];
GO
IF OBJECT_ID(N'[dbo].[Bills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bills];
GO
IF OBJECT_ID(N'[dbo].[Accounttransaction_history]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounttransaction_history];
GO
IF OBJECT_ID(N'[dbo].[BranchCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BranchCustomer];
GO
IF OBJECT_ID(N'[dbo].[AccountCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountCustomer];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Account_type'
CREATE TABLE [dbo].[Account_type] (
    [acctype_Id] nvarchar(5)  NOT NULL,
    [acctype] nchar(15)  NOT NULL,
    [InterestRate] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [Account_number] int IDENTITY(1,1) NOT NULL,
    [cust_number] int  NOT NULL,
    [Acct_balance] decimal(18,0)  NOT NULL,
    [Account_type_acctype_Id] nvarchar(5)  NOT NULL
);
GO

-- Creating table 'Branches'
CREATE TABLE [dbo].[Branches] (
    [Branch_code] nchar(8)  NOT NULL,
    [branch_name] nvarchar(50)  NOT NULL,
    [branch_address] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Cust_Id] int IDENTITY(1,1) NOT NULL,
    [branch_code] nvarchar(50)  NOT NULL,
    [cust_name] nvarchar(50)  NOT NULL,
    [cust_address] nvarchar(50)  NOT NULL,
    [gender] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'transaction_history'
CREATE TABLE [dbo].[transaction_history] (
    [trans_Id] int IDENTITY(1,1) NOT NULL,
    [acct_number] int  NOT NULL,
    [trans_desc] nvarchar(30)  NOT NULL,
    [trans_amt] decimal(18,0)  NOT NULL,
    [date_time] datetime  NOT NULL,
    [transaction_type_transtype_Id] nchar(5)  NOT NULL
);
GO

-- Creating table 'transaction_type'
CREATE TABLE [dbo].[transaction_type] (
    [transtype_Id] nchar(5)  NOT NULL,
    [transtype_desc] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Bills'
CREATE TABLE [dbo].[Bills] (
    [Bill_Id] int IDENTITY(1,1) NOT NULL,
    [Cust_ID] int  NOT NULL,
    [Cust_name] nvarchar(50)  NOT NULL,
    [Statement_date] datetime  NOT NULL,
    [Due_date] datetime  NOT NULL,
    [Bill_Amt] decimal(18,0)  NOT NULL,
    [Customer_Cust_Id] int  NOT NULL
);
GO

-- Creating table 'Accounttransaction_history'
CREATE TABLE [dbo].[Accounttransaction_history] (
    [Accounts_Account_number] int  NOT NULL,
    [transaction_history_trans_Id] int  NOT NULL
);
GO

-- Creating table 'BranchCustomer'
CREATE TABLE [dbo].[BranchCustomer] (
    [Branches_Branch_code] nchar(8)  NOT NULL,
    [Customers_Cust_Id] int  NOT NULL
);
GO

-- Creating table 'AccountCustomer'
CREATE TABLE [dbo].[AccountCustomer] (
    [Accounts_Account_number] int  NOT NULL,
    [Customers_Cust_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [acctype_Id] in table 'Account_type'
ALTER TABLE [dbo].[Account_type]
ADD CONSTRAINT [PK_Account_type]
    PRIMARY KEY CLUSTERED ([acctype_Id] ASC);
GO

-- Creating primary key on [Account_number] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([Account_number] ASC);
GO

-- Creating primary key on [Branch_code] in table 'Branches'
ALTER TABLE [dbo].[Branches]
ADD CONSTRAINT [PK_Branches]
    PRIMARY KEY CLUSTERED ([Branch_code] ASC);
GO

-- Creating primary key on [Cust_Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Cust_Id] ASC);
GO

-- Creating primary key on [trans_Id] in table 'transaction_history'
ALTER TABLE [dbo].[transaction_history]
ADD CONSTRAINT [PK_transaction_history]
    PRIMARY KEY CLUSTERED ([trans_Id] ASC);
GO

-- Creating primary key on [transtype_Id] in table 'transaction_type'
ALTER TABLE [dbo].[transaction_type]
ADD CONSTRAINT [PK_transaction_type]
    PRIMARY KEY CLUSTERED ([transtype_Id] ASC);
GO

-- Creating primary key on [Bill_Id] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [PK_Bills]
    PRIMARY KEY CLUSTERED ([Bill_Id] ASC);
GO

-- Creating primary key on [Accounts_Account_number], [transaction_history_trans_Id] in table 'Accounttransaction_history'
ALTER TABLE [dbo].[Accounttransaction_history]
ADD CONSTRAINT [PK_Accounttransaction_history]
    PRIMARY KEY CLUSTERED ([Accounts_Account_number], [transaction_history_trans_Id] ASC);
GO

-- Creating primary key on [Branches_Branch_code], [Customers_Cust_Id] in table 'BranchCustomer'
ALTER TABLE [dbo].[BranchCustomer]
ADD CONSTRAINT [PK_BranchCustomer]
    PRIMARY KEY CLUSTERED ([Branches_Branch_code], [Customers_Cust_Id] ASC);
GO

-- Creating primary key on [Accounts_Account_number], [Customers_Cust_Id] in table 'AccountCustomer'
ALTER TABLE [dbo].[AccountCustomer]
ADD CONSTRAINT [PK_AccountCustomer]
    PRIMARY KEY CLUSTERED ([Accounts_Account_number], [Customers_Cust_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Account_type_acctype_Id] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_AccountAccount_type]
    FOREIGN KEY ([Account_type_acctype_Id])
    REFERENCES [dbo].[Account_type]
        ([acctype_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAccount_type'
CREATE INDEX [IX_FK_AccountAccount_type]
ON [dbo].[Accounts]
    ([Account_type_acctype_Id]);
GO

-- Creating foreign key on [transaction_type_transtype_Id] in table 'transaction_history'
ALTER TABLE [dbo].[transaction_history]
ADD CONSTRAINT [FK_transaction_historytransaction_type]
    FOREIGN KEY ([transaction_type_transtype_Id])
    REFERENCES [dbo].[transaction_type]
        ([transtype_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_transaction_historytransaction_type'
CREATE INDEX [IX_FK_transaction_historytransaction_type]
ON [dbo].[transaction_history]
    ([transaction_type_transtype_Id]);
GO

-- Creating foreign key on [Accounts_Account_number] in table 'Accounttransaction_history'
ALTER TABLE [dbo].[Accounttransaction_history]
ADD CONSTRAINT [FK_Accounttransaction_history_Accounts]
    FOREIGN KEY ([Accounts_Account_number])
    REFERENCES [dbo].[Accounts]
        ([Account_number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [transaction_history_trans_Id] in table 'Accounttransaction_history'
ALTER TABLE [dbo].[Accounttransaction_history]
ADD CONSTRAINT [FK_Accounttransaction_history_transaction_history]
    FOREIGN KEY ([transaction_history_trans_Id])
    REFERENCES [dbo].[transaction_history]
        ([trans_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Accounttransaction_history_transaction_history'
CREATE INDEX [IX_FK_Accounttransaction_history_transaction_history]
ON [dbo].[Accounttransaction_history]
    ([transaction_history_trans_Id]);
GO

-- Creating foreign key on [Branches_Branch_code] in table 'BranchCustomer'
ALTER TABLE [dbo].[BranchCustomer]
ADD CONSTRAINT [FK_BranchCustomer_Branches]
    FOREIGN KEY ([Branches_Branch_code])
    REFERENCES [dbo].[Branches]
        ([Branch_code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Customers_Cust_Id] in table 'BranchCustomer'
ALTER TABLE [dbo].[BranchCustomer]
ADD CONSTRAINT [FK_BranchCustomer_Customers]
    FOREIGN KEY ([Customers_Cust_Id])
    REFERENCES [dbo].[Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BranchCustomer_Customers'
CREATE INDEX [IX_FK_BranchCustomer_Customers]
ON [dbo].[BranchCustomer]
    ([Customers_Cust_Id]);
GO

-- Creating foreign key on [Accounts_Account_number] in table 'AccountCustomer'
ALTER TABLE [dbo].[AccountCustomer]
ADD CONSTRAINT [FK_AccountCustomer_Account]
    FOREIGN KEY ([Accounts_Account_number])
    REFERENCES [dbo].[Accounts]
        ([Account_number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Customers_Cust_Id] in table 'AccountCustomer'
ALTER TABLE [dbo].[AccountCustomer]
ADD CONSTRAINT [FK_AccountCustomer_Customer]
    FOREIGN KEY ([Customers_Cust_Id])
    REFERENCES [dbo].[Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountCustomer_Customer'
CREATE INDEX [IX_FK_AccountCustomer_Customer]
ON [dbo].[AccountCustomer]
    ([Customers_Cust_Id]);
GO

-- Creating foreign key on [Customer_Cust_Id] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK_BillCustomer]
    FOREIGN KEY ([Customer_Cust_Id])
    REFERENCES [dbo].[Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillCustomer'
CREATE INDEX [IX_FK_BillCustomer]
ON [dbo].[Bills]
    ([Customer_Cust_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------