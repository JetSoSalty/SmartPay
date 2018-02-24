
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/24/2018 15:10:49
-- Generated from EDMX file: C:\Users\Phil-Jon-D\source\repos\SmartPay\SmartPay\NCB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [NCB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Transaction_logtrans_type]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction_log] DROP CONSTRAINT [FK_Transaction_logtrans_type];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountAccount_Type]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_AccountAccount_Type];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAccount_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAccount] DROP CONSTRAINT [FK_CustomerAccount_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAccount_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAccount] DROP CONSTRAINT [FK_CustomerAccount_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_BranchCustomer_Branch]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BranchCustomer] DROP CONSTRAINT [FK_BranchCustomer_Branch];
GO
IF OBJECT_ID(N'[dbo].[FK_BranchCustomer_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BranchCustomer] DROP CONSTRAINT [FK_BranchCustomer_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTransaction_log_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountTransaction_log] DROP CONSTRAINT [FK_AccountTransaction_log_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTransaction_log_Transaction_log]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountTransaction_log] DROP CONSTRAINT [FK_AccountTransaction_log_Transaction_log];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Branches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Branches];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[Account_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Account_Type];
GO
IF OBJECT_ID(N'[dbo].[Transaction_log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transaction_log];
GO
IF OBJECT_ID(N'[dbo].[trans_type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[trans_type];
GO
IF OBJECT_ID(N'[dbo].[CustomerAccount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerAccount];
GO
IF OBJECT_ID(N'[dbo].[BranchCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BranchCustomer];
GO
IF OBJECT_ID(N'[dbo].[AccountTransaction_log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountTransaction_log];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Branches'
CREATE TABLE [dbo].[Branches] (
    [Branch_code] int IDENTITY(1,1) NOT NULL,
    [branch_name] nvarchar(max)  NOT NULL,
    [branch_address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Cust_Id] int IDENTITY(1,1) NOT NULL,
    [Cust_name] nchar(4000)  NOT NULL,
    [branch_id] int  NOT NULL,
    [Cust_address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [Account_Number] int IDENTITY(1,1) NOT NULL,
    [Cust_num] int  NOT NULL,
    [Account_type] nvarchar(max)  NOT NULL,
    [Balance] int  NOT NULL,
    [Account_Type_Type_Id] nchar(5)  NOT NULL
);
GO

-- Creating table 'Account_Type'
CREATE TABLE [dbo].[Account_Type] (
    [Type_Id] nchar(5)  NOT NULL,
    [Account_type] nvarchar(max)  NOT NULL,
    [InterestRate] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Transaction_log'
CREATE TABLE [dbo].[Transaction_log] (
    [transaction_Id] int IDENTITY(1,1) NOT NULL,
    [acct_num] int  NOT NULL,
    [trans_type] nvarchar(max)  NOT NULL,
    [trans_desc] nvarchar(max)  NOT NULL,
    [trans_amt] int  NOT NULL,
    [time] datetime  NOT NULL,
    [customer] nvarchar(max)  NOT NULL,
    [trans_type1_transtype_Id] nchar(5)  NOT NULL
);
GO

-- Creating table 'trans_type'
CREATE TABLE [dbo].[trans_type] (
    [transtype_Id] nchar(5)  NOT NULL,
    [transtype_desc] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CustomerAccount'
CREATE TABLE [dbo].[CustomerAccount] (
    [Customers_Cust_Id] int  NOT NULL,
    [Accounts_Account_Number] int  NOT NULL
);
GO

-- Creating table 'BranchCustomer'
CREATE TABLE [dbo].[BranchCustomer] (
    [Branches_Branch_code] int  NOT NULL,
    [Customers_Cust_Id] int  NOT NULL
);
GO

-- Creating table 'AccountTransaction_log'
CREATE TABLE [dbo].[AccountTransaction_log] (
    [Accounts_Account_Number] int  NOT NULL,
    [Transaction_log_transaction_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

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

-- Creating primary key on [Account_Number] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([Account_Number] ASC);
GO

-- Creating primary key on [Type_Id] in table 'Account_Type'
ALTER TABLE [dbo].[Account_Type]
ADD CONSTRAINT [PK_Account_Type]
    PRIMARY KEY CLUSTERED ([Type_Id] ASC);
GO

-- Creating primary key on [transaction_Id] in table 'Transaction_log'
ALTER TABLE [dbo].[Transaction_log]
ADD CONSTRAINT [PK_Transaction_log]
    PRIMARY KEY CLUSTERED ([transaction_Id] ASC);
GO

-- Creating primary key on [transtype_Id] in table 'trans_type'
ALTER TABLE [dbo].[trans_type]
ADD CONSTRAINT [PK_trans_type]
    PRIMARY KEY CLUSTERED ([transtype_Id] ASC);
GO

-- Creating primary key on [Customers_Cust_Id], [Accounts_Account_Number] in table 'CustomerAccount'
ALTER TABLE [dbo].[CustomerAccount]
ADD CONSTRAINT [PK_CustomerAccount]
    PRIMARY KEY CLUSTERED ([Customers_Cust_Id], [Accounts_Account_Number] ASC);
GO

-- Creating primary key on [Branches_Branch_code], [Customers_Cust_Id] in table 'BranchCustomer'
ALTER TABLE [dbo].[BranchCustomer]
ADD CONSTRAINT [PK_BranchCustomer]
    PRIMARY KEY CLUSTERED ([Branches_Branch_code], [Customers_Cust_Id] ASC);
GO

-- Creating primary key on [Accounts_Account_Number], [Transaction_log_transaction_Id] in table 'AccountTransaction_log'
ALTER TABLE [dbo].[AccountTransaction_log]
ADD CONSTRAINT [PK_AccountTransaction_log]
    PRIMARY KEY CLUSTERED ([Accounts_Account_Number], [Transaction_log_transaction_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [trans_type1_transtype_Id] in table 'Transaction_log'
ALTER TABLE [dbo].[Transaction_log]
ADD CONSTRAINT [FK_Transaction_logtrans_type]
    FOREIGN KEY ([trans_type1_transtype_Id])
    REFERENCES [dbo].[trans_type]
        ([transtype_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Transaction_logtrans_type'
CREATE INDEX [IX_FK_Transaction_logtrans_type]
ON [dbo].[Transaction_log]
    ([trans_type1_transtype_Id]);
GO

-- Creating foreign key on [Account_Type_Type_Id] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_AccountAccount_Type]
    FOREIGN KEY ([Account_Type_Type_Id])
    REFERENCES [dbo].[Account_Type]
        ([Type_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAccount_Type'
CREATE INDEX [IX_FK_AccountAccount_Type]
ON [dbo].[Accounts]
    ([Account_Type_Type_Id]);
GO

-- Creating foreign key on [Customers_Cust_Id] in table 'CustomerAccount'
ALTER TABLE [dbo].[CustomerAccount]
ADD CONSTRAINT [FK_CustomerAccount_Customer]
    FOREIGN KEY ([Customers_Cust_Id])
    REFERENCES [dbo].[Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Accounts_Account_Number] in table 'CustomerAccount'
ALTER TABLE [dbo].[CustomerAccount]
ADD CONSTRAINT [FK_CustomerAccount_Account]
    FOREIGN KEY ([Accounts_Account_Number])
    REFERENCES [dbo].[Accounts]
        ([Account_Number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAccount_Account'
CREATE INDEX [IX_FK_CustomerAccount_Account]
ON [dbo].[CustomerAccount]
    ([Accounts_Account_Number]);
GO

-- Creating foreign key on [Branches_Branch_code] in table 'BranchCustomer'
ALTER TABLE [dbo].[BranchCustomer]
ADD CONSTRAINT [FK_BranchCustomer_Branch]
    FOREIGN KEY ([Branches_Branch_code])
    REFERENCES [dbo].[Branches]
        ([Branch_code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Customers_Cust_Id] in table 'BranchCustomer'
ALTER TABLE [dbo].[BranchCustomer]
ADD CONSTRAINT [FK_BranchCustomer_Customer]
    FOREIGN KEY ([Customers_Cust_Id])
    REFERENCES [dbo].[Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BranchCustomer_Customer'
CREATE INDEX [IX_FK_BranchCustomer_Customer]
ON [dbo].[BranchCustomer]
    ([Customers_Cust_Id]);
GO

-- Creating foreign key on [Accounts_Account_Number] in table 'AccountTransaction_log'
ALTER TABLE [dbo].[AccountTransaction_log]
ADD CONSTRAINT [FK_AccountTransaction_log_Account]
    FOREIGN KEY ([Accounts_Account_Number])
    REFERENCES [dbo].[Accounts]
        ([Account_Number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Transaction_log_transaction_Id] in table 'AccountTransaction_log'
ALTER TABLE [dbo].[AccountTransaction_log]
ADD CONSTRAINT [FK_AccountTransaction_log_Transaction_log]
    FOREIGN KEY ([Transaction_log_transaction_Id])
    REFERENCES [dbo].[Transaction_log]
        ([transaction_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountTransaction_log_Transaction_log'
CREATE INDEX [IX_FK_AccountTransaction_log_Transaction_log]
ON [dbo].[AccountTransaction_log]
    ([Transaction_log_transaction_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------