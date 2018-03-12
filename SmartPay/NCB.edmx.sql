
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/12/2018 16:39:23
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

IF OBJECT_ID(N'[dbo].[FK_AccountAccount_Type]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_Accounts] DROP CONSTRAINT [FK_AccountAccount_Type];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTransaction_log_Accounts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_AccountTransaction_log] DROP CONSTRAINT [FK_AccountTransaction_log_Accounts];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTransaction_log_Transaction_log]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_AccountTransaction_log] DROP CONSTRAINT [FK_AccountTransaction_log_Transaction_log];
GO
IF OBJECT_ID(N'[dbo].[FK_BillCustomer_Bill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_BillCustomer] DROP CONSTRAINT [FK_BillCustomer_Bill];
GO
IF OBJECT_ID(N'[dbo].[FK_BillCustomer_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_BillCustomer] DROP CONSTRAINT [FK_BillCustomer_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_BranchCustomer_Branches]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_BranchCustomer] DROP CONSTRAINT [FK_BranchCustomer_Branches];
GO
IF OBJECT_ID(N'[dbo].[FK_BranchCustomer_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_BranchCustomer] DROP CONSTRAINT [FK_BranchCustomer_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAccount_Accounts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_CustomerAccount] DROP CONSTRAINT [FK_CustomerAccount_Accounts];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAccount_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_CustomerAccount] DROP CONSTRAINT [FK_CustomerAccount_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_Transaction_logtrans_type]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nwc_Transaction_log] DROP CONSTRAINT [FK_Transaction_logtrans_type];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[nwc_Account_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_Account_Type];
GO
IF OBJECT_ID(N'[dbo].[nwc_Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_Accounts];
GO
IF OBJECT_ID(N'[dbo].[nwc_AccountTransaction_log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_AccountTransaction_log];
GO
IF OBJECT_ID(N'[dbo].[nwc_BillCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_BillCustomer];
GO
IF OBJECT_ID(N'[dbo].[nwc_Bills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_Bills];
GO
IF OBJECT_ID(N'[dbo].[nwc_BranchCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_BranchCustomer];
GO
IF OBJECT_ID(N'[dbo].[nwc_Branches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_Branches];
GO
IF OBJECT_ID(N'[dbo].[nwc_CustomerAccount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_CustomerAccount];
GO
IF OBJECT_ID(N'[dbo].[nwc_Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_Customers];
GO
IF OBJECT_ID(N'[dbo].[nwc_sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[nwc_trans_type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_trans_type];
GO
IF OBJECT_ID(N'[dbo].[nwc_Transaction_log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nwc_Transaction_log];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'nwc_Account_Type'
CREATE TABLE [dbo].[nwc_Account_Type] (
    [Type_Id] nchar(5)  NOT NULL,
    [Account_type1] nvarchar(max)  NOT NULL,
    [InterestRate] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'nwc_Accounts'
CREATE TABLE [dbo].[nwc_Accounts] (
    [Account_Number] int IDENTITY(1,1) NOT NULL,
    [Cust_num] int  NOT NULL,
    [Account_type] nvarchar(max)  NOT NULL,
    [Balance] int  NOT NULL,
    [Account_Type_Type_Id] nchar(5)  NOT NULL
);
GO

-- Creating table 'nwc_Bills'
CREATE TABLE [dbo].[nwc_Bills] (
    [Bill_Id] int IDENTITY(1,1) NOT NULL,
    [Cust_ID] int  NOT NULL,
    [Cust_name] nchar(4000)  NOT NULL,
    [Statement_Date] datetime  NOT NULL,
    [Due_Date] datetime  NOT NULL,
    [Bill_Amt] int  NOT NULL
);
GO

-- Creating table 'nwc_Branches'
CREATE TABLE [dbo].[nwc_Branches] (
    [Branch_code] int IDENTITY(1,1) NOT NULL,
    [branch_name] nvarchar(max)  NOT NULL,
    [branch_address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'nwc_Customers'
CREATE TABLE [dbo].[nwc_Customers] (
    [Cust_Id] int IDENTITY(1,1) NOT NULL,
    [Cust_name] nchar(4000)  NOT NULL,
    [branch_id] int  NOT NULL,
    [Cust_address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'nwc_sysdiagrams'
CREATE TABLE [dbo].[nwc_sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'nwc_trans_type'
CREATE TABLE [dbo].[nwc_trans_type] (
    [transtype_Id] nchar(5)  NOT NULL,
    [transtype_desc] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'nwc_Transaction_log'
CREATE TABLE [dbo].[nwc_Transaction_log] (
    [transaction_Id] int IDENTITY(1,1) NOT NULL,
    [acct_num] int  NOT NULL,
    [trans_desc] nvarchar(max)  NOT NULL,
    [trans_amt] int  NOT NULL,
    [date_time] datetime  NOT NULL,
    [customer] nvarchar(max)  NOT NULL,
    [trans_type1_transtype_Id] nchar(5)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'nwc_AccountTransaction_log'
CREATE TABLE [dbo].[nwc_AccountTransaction_log] (
    [nwc_Accounts_Account_Number] int  NOT NULL,
    [nwc_Transaction_log_transaction_Id] int  NOT NULL
);
GO

-- Creating table 'nwc_BillCustomer'
CREATE TABLE [dbo].[nwc_BillCustomer] (
    [nwc_Bills_Bill_Id] int  NOT NULL,
    [nwc_Customers_Cust_Id] int  NOT NULL
);
GO

-- Creating table 'nwc_BranchCustomer'
CREATE TABLE [dbo].[nwc_BranchCustomer] (
    [nwc_Branches_Branch_code] int  NOT NULL,
    [nwc_Customers_Cust_Id] int  NOT NULL
);
GO

-- Creating table 'nwc_CustomerAccount'
CREATE TABLE [dbo].[nwc_CustomerAccount] (
    [nwc_Accounts_Account_Number] int  NOT NULL,
    [nwc_Customers_Cust_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Type_Id] in table 'nwc_Account_Type'
ALTER TABLE [dbo].[nwc_Account_Type]
ADD CONSTRAINT [PK_nwc_Account_Type]
    PRIMARY KEY CLUSTERED ([Type_Id] ASC);
GO

-- Creating primary key on [Account_Number] in table 'nwc_Accounts'
ALTER TABLE [dbo].[nwc_Accounts]
ADD CONSTRAINT [PK_nwc_Accounts]
    PRIMARY KEY CLUSTERED ([Account_Number] ASC);
GO

-- Creating primary key on [Bill_Id] in table 'nwc_Bills'
ALTER TABLE [dbo].[nwc_Bills]
ADD CONSTRAINT [PK_nwc_Bills]
    PRIMARY KEY CLUSTERED ([Bill_Id] ASC);
GO

-- Creating primary key on [Branch_code] in table 'nwc_Branches'
ALTER TABLE [dbo].[nwc_Branches]
ADD CONSTRAINT [PK_nwc_Branches]
    PRIMARY KEY CLUSTERED ([Branch_code] ASC);
GO

-- Creating primary key on [Cust_Id] in table 'nwc_Customers'
ALTER TABLE [dbo].[nwc_Customers]
ADD CONSTRAINT [PK_nwc_Customers]
    PRIMARY KEY CLUSTERED ([Cust_Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'nwc_sysdiagrams'
ALTER TABLE [dbo].[nwc_sysdiagrams]
ADD CONSTRAINT [PK_nwc_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [transtype_Id] in table 'nwc_trans_type'
ALTER TABLE [dbo].[nwc_trans_type]
ADD CONSTRAINT [PK_nwc_trans_type]
    PRIMARY KEY CLUSTERED ([transtype_Id] ASC);
GO

-- Creating primary key on [transaction_Id] in table 'nwc_Transaction_log'
ALTER TABLE [dbo].[nwc_Transaction_log]
ADD CONSTRAINT [PK_nwc_Transaction_log]
    PRIMARY KEY CLUSTERED ([transaction_Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [nwc_Accounts_Account_Number], [nwc_Transaction_log_transaction_Id] in table 'nwc_AccountTransaction_log'
ALTER TABLE [dbo].[nwc_AccountTransaction_log]
ADD CONSTRAINT [PK_nwc_AccountTransaction_log]
    PRIMARY KEY CLUSTERED ([nwc_Accounts_Account_Number], [nwc_Transaction_log_transaction_Id] ASC);
GO

-- Creating primary key on [nwc_Bills_Bill_Id], [nwc_Customers_Cust_Id] in table 'nwc_BillCustomer'
ALTER TABLE [dbo].[nwc_BillCustomer]
ADD CONSTRAINT [PK_nwc_BillCustomer]
    PRIMARY KEY CLUSTERED ([nwc_Bills_Bill_Id], [nwc_Customers_Cust_Id] ASC);
GO

-- Creating primary key on [nwc_Branches_Branch_code], [nwc_Customers_Cust_Id] in table 'nwc_BranchCustomer'
ALTER TABLE [dbo].[nwc_BranchCustomer]
ADD CONSTRAINT [PK_nwc_BranchCustomer]
    PRIMARY KEY CLUSTERED ([nwc_Branches_Branch_code], [nwc_Customers_Cust_Id] ASC);
GO

-- Creating primary key on [nwc_Accounts_Account_Number], [nwc_Customers_Cust_Id] in table 'nwc_CustomerAccount'
ALTER TABLE [dbo].[nwc_CustomerAccount]
ADD CONSTRAINT [PK_nwc_CustomerAccount]
    PRIMARY KEY CLUSTERED ([nwc_Accounts_Account_Number], [nwc_Customers_Cust_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Account_Type_Type_Id] in table 'nwc_Accounts'
ALTER TABLE [dbo].[nwc_Accounts]
ADD CONSTRAINT [FK_AccountAccount_Type]
    FOREIGN KEY ([Account_Type_Type_Id])
    REFERENCES [dbo].[nwc_Account_Type]
        ([Type_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAccount_Type'
CREATE INDEX [IX_FK_AccountAccount_Type]
ON [dbo].[nwc_Accounts]
    ([Account_Type_Type_Id]);
GO

-- Creating foreign key on [trans_type1_transtype_Id] in table 'nwc_Transaction_log'
ALTER TABLE [dbo].[nwc_Transaction_log]
ADD CONSTRAINT [FK_Transaction_logtrans_type]
    FOREIGN KEY ([trans_type1_transtype_Id])
    REFERENCES [dbo].[nwc_trans_type]
        ([transtype_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Transaction_logtrans_type'
CREATE INDEX [IX_FK_Transaction_logtrans_type]
ON [dbo].[nwc_Transaction_log]
    ([trans_type1_transtype_Id]);
GO

-- Creating foreign key on [nwc_Accounts_Account_Number] in table 'nwc_AccountTransaction_log'
ALTER TABLE [dbo].[nwc_AccountTransaction_log]
ADD CONSTRAINT [FK_nwc_AccountTransaction_log_nwc_Accounts]
    FOREIGN KEY ([nwc_Accounts_Account_Number])
    REFERENCES [dbo].[nwc_Accounts]
        ([Account_Number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [nwc_Transaction_log_transaction_Id] in table 'nwc_AccountTransaction_log'
ALTER TABLE [dbo].[nwc_AccountTransaction_log]
ADD CONSTRAINT [FK_nwc_AccountTransaction_log_nwc_Transaction_log]
    FOREIGN KEY ([nwc_Transaction_log_transaction_Id])
    REFERENCES [dbo].[nwc_Transaction_log]
        ([transaction_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_nwc_AccountTransaction_log_nwc_Transaction_log'
CREATE INDEX [IX_FK_nwc_AccountTransaction_log_nwc_Transaction_log]
ON [dbo].[nwc_AccountTransaction_log]
    ([nwc_Transaction_log_transaction_Id]);
GO

-- Creating foreign key on [nwc_Bills_Bill_Id] in table 'nwc_BillCustomer'
ALTER TABLE [dbo].[nwc_BillCustomer]
ADD CONSTRAINT [FK_nwc_BillCustomer_nwc_Bills]
    FOREIGN KEY ([nwc_Bills_Bill_Id])
    REFERENCES [dbo].[nwc_Bills]
        ([Bill_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [nwc_Customers_Cust_Id] in table 'nwc_BillCustomer'
ALTER TABLE [dbo].[nwc_BillCustomer]
ADD CONSTRAINT [FK_nwc_BillCustomer_nwc_Customers]
    FOREIGN KEY ([nwc_Customers_Cust_Id])
    REFERENCES [dbo].[nwc_Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_nwc_BillCustomer_nwc_Customers'
CREATE INDEX [IX_FK_nwc_BillCustomer_nwc_Customers]
ON [dbo].[nwc_BillCustomer]
    ([nwc_Customers_Cust_Id]);
GO

-- Creating foreign key on [nwc_Branches_Branch_code] in table 'nwc_BranchCustomer'
ALTER TABLE [dbo].[nwc_BranchCustomer]
ADD CONSTRAINT [FK_nwc_BranchCustomer_nwc_Branches]
    FOREIGN KEY ([nwc_Branches_Branch_code])
    REFERENCES [dbo].[nwc_Branches]
        ([Branch_code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [nwc_Customers_Cust_Id] in table 'nwc_BranchCustomer'
ALTER TABLE [dbo].[nwc_BranchCustomer]
ADD CONSTRAINT [FK_nwc_BranchCustomer_nwc_Customers]
    FOREIGN KEY ([nwc_Customers_Cust_Id])
    REFERENCES [dbo].[nwc_Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_nwc_BranchCustomer_nwc_Customers'
CREATE INDEX [IX_FK_nwc_BranchCustomer_nwc_Customers]
ON [dbo].[nwc_BranchCustomer]
    ([nwc_Customers_Cust_Id]);
GO

-- Creating foreign key on [nwc_Accounts_Account_Number] in table 'nwc_CustomerAccount'
ALTER TABLE [dbo].[nwc_CustomerAccount]
ADD CONSTRAINT [FK_nwc_CustomerAccount_nwc_Accounts]
    FOREIGN KEY ([nwc_Accounts_Account_Number])
    REFERENCES [dbo].[nwc_Accounts]
        ([Account_Number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [nwc_Customers_Cust_Id] in table 'nwc_CustomerAccount'
ALTER TABLE [dbo].[nwc_CustomerAccount]
ADD CONSTRAINT [FK_nwc_CustomerAccount_nwc_Customers]
    FOREIGN KEY ([nwc_Customers_Cust_Id])
    REFERENCES [dbo].[nwc_Customers]
        ([Cust_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_nwc_CustomerAccount_nwc_Customers'
CREATE INDEX [IX_FK_nwc_CustomerAccount_nwc_Customers]
ON [dbo].[nwc_CustomerAccount]
    ([nwc_Customers_Cust_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------