IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.People_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[People_Select];
   GO
/*  -- ====================================================================================
    -- People CRUD Stored Procedures ([Application].[People_Select])
    -- Generated on: 2021-06-11 23:27:51.788947
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[People_Select] (@PersonID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [PersonID],
            [FullName],
            [PreferredName],
            [IsPermittedToLogon],
            [LogonName],
            [IsExternalLogonProvider],
            [IsSystemUser],
            [IsEmployee],
            [IsSalesperson],
            [UserPreferences],
            [PhoneNumber],
            [FaxNumber],
            [EmailAddress],
            [CustomFields]
       FROM [Application].[People] AS [T]
       WHERE [T].[PersonID] = @PersonID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.People_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[People_Insert];
   GO
/*  -- ====================================================================================
    -- People CRUD Stored Procedures ([Application].[People_Insert])
    -- Generated on: 2021-06-11 23:27:51.788947
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[People_Insert] (
            @PersonID int,
            @FullName nvarchar(50),
            @PreferredName nvarchar(50),
            @IsPermittedToLogon bit,
            @LogonName nvarchar(50),
            @IsExternalLogonProvider bit,
            @IsSystemUser bit,
            @IsEmployee bit,
            @IsSalesperson bit,
            @UserPreferences nvarchar(max),
            @PhoneNumber nvarchar(20),
            @FaxNumber nvarchar(20),
            @EmailAddress nvarchar(256),
            @CustomFields nvarchar(max)
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[People]
       (
            [PersonID],
            [FullName],
            [PreferredName],
            [IsPermittedToLogon],
            [LogonName],
            [IsExternalLogonProvider],
            [IsSystemUser],
            [IsEmployee],
            [IsSalesperson],
            [UserPreferences],
            [PhoneNumber],
            [FaxNumber],
            [EmailAddress],
            [CustomFields]
        )
        SELECT 
            @PersonID,
            @FullName,
            @PreferredName,
            @IsPermittedToLogon,
            @LogonName,
            @IsExternalLogonProvider,
            @IsSystemUser,
            @IsEmployee,
            @IsSalesperson,
            @UserPreferences,
            @PhoneNumber,
            @FaxNumber,
            @EmailAddress,
            @CustomFields
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.People_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[People_Delete];
   GO
/*  -- ====================================================================================
    -- People CRUD Stored Procedures ([Application].[People_Delete])
    -- Generated on: 2021-06-11 23:27:51.788947
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[People_Delete] (@PersonID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[People]
       WHERE [PersonID] = @PersonID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.ColdRoomTemperatures_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[ColdRoomTemperatures_Select];
   GO
/*  -- ====================================================================================
    -- ColdRoomTemperatures CRUD Stored Procedures ([Warehouse].[ColdRoomTemperatures_Select])
    -- Generated on: 2021-06-11 23:27:51.811658
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[ColdRoomTemperatures_Select] (@ColdRoomTemperatureID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [ColdRoomTemperatureID],
            [ColdRoomSensorNumber],
            [RecordedWhen],
            [Temperature]
       FROM [Warehouse].[ColdRoomTemperatures] AS [T]
       WHERE [T].[ColdRoomTemperatureID] = @ColdRoomTemperatureID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.ColdRoomTemperatures_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[ColdRoomTemperatures_Insert];
   GO
/*  -- ====================================================================================
    -- ColdRoomTemperatures CRUD Stored Procedures ([Warehouse].[ColdRoomTemperatures_Insert])
    -- Generated on: 2021-06-11 23:27:51.811658
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[ColdRoomTemperatures_Insert] (
            @ColdRoomTemperatureID bigint,
            @ColdRoomSensorNumber int,
            @RecordedWhen datetime2(7),
            @Temperature decimal(10, 2)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[ColdRoomTemperatures]
       (
            [ColdRoomTemperatureID],
            [ColdRoomSensorNumber],
            [RecordedWhen],
            [Temperature]
        )
        SELECT 
            @ColdRoomTemperatureID,
            @ColdRoomSensorNumber,
            @RecordedWhen,
            @Temperature
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.ColdRoomTemperatures_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[ColdRoomTemperatures_Delete];
   GO
/*  -- ====================================================================================
    -- ColdRoomTemperatures CRUD Stored Procedures ([Warehouse].[ColdRoomTemperatures_Delete])
    -- Generated on: 2021-06-11 23:27:51.811658
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[ColdRoomTemperatures_Delete] (@ColdRoomTemperatureID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[ColdRoomTemperatures]
       WHERE [ColdRoomTemperatureID] = @ColdRoomTemperatureID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.VehicleTemperatures_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[VehicleTemperatures_Select];
   GO
/*  -- ====================================================================================
    -- VehicleTemperatures CRUD Stored Procedures ([Warehouse].[VehicleTemperatures_Select])
    -- Generated on: 2021-06-11 23:27:51.830754
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[VehicleTemperatures_Select] (@VehicleTemperatureID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [VehicleTemperatureID],
            [VehicleRegistration],
            [ChillerSensorNumber],
            [RecordedWhen],
            [Temperature],
            [IsCompressed],
            [FullSensorData]
       FROM [Warehouse].[VehicleTemperatures] AS [T]
       WHERE [T].[VehicleTemperatureID] = @VehicleTemperatureID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.VehicleTemperatures_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[VehicleTemperatures_Insert];
   GO
/*  -- ====================================================================================
    -- VehicleTemperatures CRUD Stored Procedures ([Warehouse].[VehicleTemperatures_Insert])
    -- Generated on: 2021-06-11 23:27:51.830754
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[VehicleTemperatures_Insert] (
            @VehicleTemperatureID bigint,
            @VehicleRegistration nvarchar(20),
            @ChillerSensorNumber int,
            @RecordedWhen datetime2(7),
            @Temperature decimal(10, 2),
            @IsCompressed bit,
            @FullSensorData nvarchar(1000)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[VehicleTemperatures]
       (
            [VehicleTemperatureID],
            [VehicleRegistration],
            [ChillerSensorNumber],
            [RecordedWhen],
            [Temperature],
            [IsCompressed],
            [FullSensorData]
        )
        SELECT 
            @VehicleTemperatureID,
            @VehicleRegistration,
            @ChillerSensorNumber,
            @RecordedWhen,
            @Temperature,
            @IsCompressed,
            @FullSensorData
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.VehicleTemperatures_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[VehicleTemperatures_Delete];
   GO
/*  -- ====================================================================================
    -- VehicleTemperatures CRUD Stored Procedures ([Warehouse].[VehicleTemperatures_Delete])
    -- Generated on: 2021-06-11 23:27:51.830754
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[VehicleTemperatures_Delete] (@VehicleTemperatureID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[VehicleTemperatures]
       WHERE [VehicleTemperatureID] = @VehicleTemperatureID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Countries_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Countries_Select];
   GO
/*  -- ====================================================================================
    -- Countries CRUD Stored Procedures ([Application].[Countries_Select])
    -- Generated on: 2021-06-11 23:27:51.851322
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[Countries_Select] (@CountryID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [CountryID],
            [CountryName],
            [FormalName],
            [IsoAlpha3Code],
            [IsoNumericCode],
            [CountryType],
            [LatestRecordedPopulation],
            [Continent],
            [Region],
            [Subregion],
            [Border]
       FROM [Application].[Countries] AS [T]
       WHERE [T].[CountryID] = @CountryID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Countries_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Countries_Insert];
   GO
/*  -- ====================================================================================
    -- Countries CRUD Stored Procedures ([Application].[Countries_Insert])
    -- Generated on: 2021-06-11 23:27:51.851322
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[Countries_Insert] (
            @CountryID int,
            @CountryName nvarchar(60),
            @FormalName nvarchar(60),
            @IsoAlpha3Code nvarchar(3),
            @IsoNumericCode int,
            @CountryType nvarchar(20),
            @LatestRecordedPopulation bigint,
            @Continent nvarchar(30),
            @Region nvarchar(30),
            @Subregion nvarchar(30),
            @Border geography
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[Countries]
       (
            [CountryID],
            [CountryName],
            [FormalName],
            [IsoAlpha3Code],
            [IsoNumericCode],
            [CountryType],
            [LatestRecordedPopulation],
            [Continent],
            [Region],
            [Subregion],
            [Border]
        )
        SELECT 
            @CountryID,
            @CountryName,
            @FormalName,
            @IsoAlpha3Code,
            @IsoNumericCode,
            @CountryType,
            @LatestRecordedPopulation,
            @Continent,
            @Region,
            @Subregion,
            @Border
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Countries_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Countries_Delete];
   GO
/*  -- ====================================================================================
    -- Countries CRUD Stored Procedures ([Application].[Countries_Delete])
    -- Generated on: 2021-06-11 23:27:51.851322
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[Countries_Delete] (@CountryID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[Countries]
       WHERE [CountryID] = @CountryID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.DeliveryMethods_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[DeliveryMethods_Select];
   GO
/*  -- ====================================================================================
    -- DeliveryMethods CRUD Stored Procedures ([Application].[DeliveryMethods_Select])
    -- Generated on: 2021-06-11 23:27:51.871387
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[DeliveryMethods_Select] (@DeliveryMethodID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [DeliveryMethodID],
            [DeliveryMethodName]
       FROM [Application].[DeliveryMethods] AS [T]
       WHERE [T].[DeliveryMethodID] = @DeliveryMethodID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.DeliveryMethods_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[DeliveryMethods_Insert];
   GO
/*  -- ====================================================================================
    -- DeliveryMethods CRUD Stored Procedures ([Application].[DeliveryMethods_Insert])
    -- Generated on: 2021-06-11 23:27:51.871387
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[DeliveryMethods_Insert] (
            @DeliveryMethodID int,
            @DeliveryMethodName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[DeliveryMethods]
       (
            [DeliveryMethodID],
            [DeliveryMethodName]
        )
        SELECT 
            @DeliveryMethodID,
            @DeliveryMethodName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.DeliveryMethods_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[DeliveryMethods_Delete];
   GO
/*  -- ====================================================================================
    -- DeliveryMethods CRUD Stored Procedures ([Application].[DeliveryMethods_Delete])
    -- Generated on: 2021-06-11 23:27:51.871387
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[DeliveryMethods_Delete] (@DeliveryMethodID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[DeliveryMethods]
       WHERE [DeliveryMethodID] = @DeliveryMethodID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.PaymentMethods_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[PaymentMethods_Select];
   GO
/*  -- ====================================================================================
    -- PaymentMethods CRUD Stored Procedures ([Application].[PaymentMethods_Select])
    -- Generated on: 2021-06-11 23:27:51.889943
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[PaymentMethods_Select] (@PaymentMethodID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [PaymentMethodID],
            [PaymentMethodName]
       FROM [Application].[PaymentMethods] AS [T]
       WHERE [T].[PaymentMethodID] = @PaymentMethodID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.PaymentMethods_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[PaymentMethods_Insert];
   GO
/*  -- ====================================================================================
    -- PaymentMethods CRUD Stored Procedures ([Application].[PaymentMethods_Insert])
    -- Generated on: 2021-06-11 23:27:51.889943
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[PaymentMethods_Insert] (
            @PaymentMethodID int,
            @PaymentMethodName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[PaymentMethods]
       (
            [PaymentMethodID],
            [PaymentMethodName]
        )
        SELECT 
            @PaymentMethodID,
            @PaymentMethodName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.PaymentMethods_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[PaymentMethods_Delete];
   GO
/*  -- ====================================================================================
    -- PaymentMethods CRUD Stored Procedures ([Application].[PaymentMethods_Delete])
    -- Generated on: 2021-06-11 23:27:51.889943
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[PaymentMethods_Delete] (@PaymentMethodID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[PaymentMethods]
       WHERE [PaymentMethodID] = @PaymentMethodID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.TransactionTypes_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[TransactionTypes_Select];
   GO
/*  -- ====================================================================================
    -- TransactionTypes CRUD Stored Procedures ([Application].[TransactionTypes_Select])
    -- Generated on: 2021-06-11 23:27:51.909576
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[TransactionTypes_Select] (@TransactionTypeID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [TransactionTypeID],
            [TransactionTypeName]
       FROM [Application].[TransactionTypes] AS [T]
       WHERE [T].[TransactionTypeID] = @TransactionTypeID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.TransactionTypes_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[TransactionTypes_Insert];
   GO
/*  -- ====================================================================================
    -- TransactionTypes CRUD Stored Procedures ([Application].[TransactionTypes_Insert])
    -- Generated on: 2021-06-11 23:27:51.909576
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[TransactionTypes_Insert] (
            @TransactionTypeID int,
            @TransactionTypeName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[TransactionTypes]
       (
            [TransactionTypeID],
            [TransactionTypeName]
        )
        SELECT 
            @TransactionTypeID,
            @TransactionTypeName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.TransactionTypes_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[TransactionTypes_Delete];
   GO
/*  -- ====================================================================================
    -- TransactionTypes CRUD Stored Procedures ([Application].[TransactionTypes_Delete])
    -- Generated on: 2021-06-11 23:27:51.909576
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[TransactionTypes_Delete] (@TransactionTypeID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[TransactionTypes]
       WHERE [TransactionTypeID] = @TransactionTypeID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierCategories_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierCategories_Select];
   GO
/*  -- ====================================================================================
    -- SupplierCategories CRUD Stored Procedures ([Purchasing].[SupplierCategories_Select])
    -- Generated on: 2021-06-11 23:27:51.928451
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[SupplierCategories_Select] (@SupplierCategoryID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [SupplierCategoryID],
            [SupplierCategoryName]
       FROM [Purchasing].[SupplierCategories] AS [T]
       WHERE [T].[SupplierCategoryID] = @SupplierCategoryID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierCategories_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierCategories_Insert];
   GO
/*  -- ====================================================================================
    -- SupplierCategories CRUD Stored Procedures ([Purchasing].[SupplierCategories_Insert])
    -- Generated on: 2021-06-11 23:27:51.928451
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[SupplierCategories_Insert] (
            @SupplierCategoryID int,
            @SupplierCategoryName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Purchasing].[SupplierCategories]
       (
            [SupplierCategoryID],
            [SupplierCategoryName]
        )
        SELECT 
            @SupplierCategoryID,
            @SupplierCategoryName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierCategories_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierCategories_Delete];
   GO
/*  -- ====================================================================================
    -- SupplierCategories CRUD Stored Procedures ([Purchasing].[SupplierCategories_Delete])
    -- Generated on: 2021-06-11 23:27:51.928451
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[SupplierCategories_Delete] (@SupplierCategoryID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Purchasing].[SupplierCategories]
       WHERE [SupplierCategoryID] = @SupplierCategoryID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.BuyingGroups_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[BuyingGroups_Select];
   GO
/*  -- ====================================================================================
    -- BuyingGroups CRUD Stored Procedures ([Sales].[BuyingGroups_Select])
    -- Generated on: 2021-06-11 23:27:51.948044
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[BuyingGroups_Select] (@BuyingGroupID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [BuyingGroupID],
            [BuyingGroupName]
       FROM [Sales].[BuyingGroups] AS [T]
       WHERE [T].[BuyingGroupID] = @BuyingGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.BuyingGroups_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[BuyingGroups_Insert];
   GO
/*  -- ====================================================================================
    -- BuyingGroups CRUD Stored Procedures ([Sales].[BuyingGroups_Insert])
    -- Generated on: 2021-06-11 23:27:51.948044
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[BuyingGroups_Insert] (
            @BuyingGroupID int,
            @BuyingGroupName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[BuyingGroups]
       (
            [BuyingGroupID],
            [BuyingGroupName]
        )
        SELECT 
            @BuyingGroupID,
            @BuyingGroupName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.BuyingGroups_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[BuyingGroups_Delete];
   GO
/*  -- ====================================================================================
    -- BuyingGroups CRUD Stored Procedures ([Sales].[BuyingGroups_Delete])
    -- Generated on: 2021-06-11 23:27:51.948044
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[BuyingGroups_Delete] (@BuyingGroupID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[BuyingGroups]
       WHERE [BuyingGroupID] = @BuyingGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerCategories_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerCategories_Select];
   GO
/*  -- ====================================================================================
    -- CustomerCategories CRUD Stored Procedures ([Sales].[CustomerCategories_Select])
    -- Generated on: 2021-06-11 23:27:51.966644
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[CustomerCategories_Select] (@CustomerCategoryID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [CustomerCategoryID],
            [CustomerCategoryName]
       FROM [Sales].[CustomerCategories] AS [T]
       WHERE [T].[CustomerCategoryID] = @CustomerCategoryID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerCategories_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerCategories_Insert];
   GO
/*  -- ====================================================================================
    -- CustomerCategories CRUD Stored Procedures ([Sales].[CustomerCategories_Insert])
    -- Generated on: 2021-06-11 23:27:51.966644
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[CustomerCategories_Insert] (
            @CustomerCategoryID int,
            @CustomerCategoryName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[CustomerCategories]
       (
            [CustomerCategoryID],
            [CustomerCategoryName]
        )
        SELECT 
            @CustomerCategoryID,
            @CustomerCategoryName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerCategories_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerCategories_Delete];
   GO
/*  -- ====================================================================================
    -- CustomerCategories CRUD Stored Procedures ([Sales].[CustomerCategories_Delete])
    -- Generated on: 2021-06-11 23:27:51.966644
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[CustomerCategories_Delete] (@CustomerCategoryID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[CustomerCategories]
       WHERE [CustomerCategoryID] = @CustomerCategoryID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.Colors_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[Colors_Select];
   GO
/*  -- ====================================================================================
    -- Colors CRUD Stored Procedures ([Warehouse].[Colors_Select])
    -- Generated on: 2021-06-11 23:27:51.985269
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[Colors_Select] (@ColorID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [ColorID],
            [ColorName]
       FROM [Warehouse].[Colors] AS [T]
       WHERE [T].[ColorID] = @ColorID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.Colors_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[Colors_Insert];
   GO
/*  -- ====================================================================================
    -- Colors CRUD Stored Procedures ([Warehouse].[Colors_Insert])
    -- Generated on: 2021-06-11 23:27:51.985269
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[Colors_Insert] (
            @ColorID int,
            @ColorName nvarchar(20)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[Colors]
       (
            [ColorID],
            [ColorName]
        )
        SELECT 
            @ColorID,
            @ColorName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.Colors_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[Colors_Delete];
   GO
/*  -- ====================================================================================
    -- Colors CRUD Stored Procedures ([Warehouse].[Colors_Delete])
    -- Generated on: 2021-06-11 23:27:51.985269
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[Colors_Delete] (@ColorID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[Colors]
       WHERE [ColorID] = @ColorID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.PackageTypes_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[PackageTypes_Select];
   GO
/*  -- ====================================================================================
    -- PackageTypes CRUD Stored Procedures ([Warehouse].[PackageTypes_Select])
    -- Generated on: 2021-06-11 23:27:52.004352
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[PackageTypes_Select] (@PackageTypeID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [PackageTypeID],
            [PackageTypeName]
       FROM [Warehouse].[PackageTypes] AS [T]
       WHERE [T].[PackageTypeID] = @PackageTypeID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.PackageTypes_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[PackageTypes_Insert];
   GO
/*  -- ====================================================================================
    -- PackageTypes CRUD Stored Procedures ([Warehouse].[PackageTypes_Insert])
    -- Generated on: 2021-06-11 23:27:52.004352
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[PackageTypes_Insert] (
            @PackageTypeID int,
            @PackageTypeName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[PackageTypes]
       (
            [PackageTypeID],
            [PackageTypeName]
        )
        SELECT 
            @PackageTypeID,
            @PackageTypeName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.PackageTypes_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[PackageTypes_Delete];
   GO
/*  -- ====================================================================================
    -- PackageTypes CRUD Stored Procedures ([Warehouse].[PackageTypes_Delete])
    -- Generated on: 2021-06-11 23:27:52.004352
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[PackageTypes_Delete] (@PackageTypeID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[PackageTypes]
       WHERE [PackageTypeID] = @PackageTypeID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockGroups_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockGroups_Select];
   GO
/*  -- ====================================================================================
    -- StockGroups CRUD Stored Procedures ([Warehouse].[StockGroups_Select])
    -- Generated on: 2021-06-11 23:27:52.023796
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockGroups_Select] (@StockGroupID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [StockGroupID],
            [StockGroupName]
       FROM [Warehouse].[StockGroups] AS [T]
       WHERE [T].[StockGroupID] = @StockGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockGroups_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockGroups_Insert];
   GO
/*  -- ====================================================================================
    -- StockGroups CRUD Stored Procedures ([Warehouse].[StockGroups_Insert])
    -- Generated on: 2021-06-11 23:27:52.023796
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockGroups_Insert] (
            @StockGroupID int,
            @StockGroupName nvarchar(50)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[StockGroups]
       (
            [StockGroupID],
            [StockGroupName]
        )
        SELECT 
            @StockGroupID,
            @StockGroupName
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockGroups_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockGroups_Delete];
   GO
/*  -- ====================================================================================
    -- StockGroups CRUD Stored Procedures ([Warehouse].[StockGroups_Delete])
    -- Generated on: 2021-06-11 23:27:52.023796
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockGroups_Delete] (@StockGroupID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[StockGroups]
       WHERE [StockGroupID] = @StockGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.StateProvinces_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[StateProvinces_Select];
   GO
/*  -- ====================================================================================
    -- StateProvinces CRUD Stored Procedures ([Application].[StateProvinces_Select])
    -- Generated on: 2021-06-11 23:27:52.045841
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[StateProvinces_Select] (@StateProvinceID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [StateProvinceID],
            [StateProvinceCode],
            [StateProvinceName],
            [CountryID],
            [SalesTerritory],
            [Border],
            [LatestRecordedPopulation]
       FROM [Application].[StateProvinces] AS [T]
       WHERE [T].[StateProvinceID] = @StateProvinceID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.StateProvinces_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[StateProvinces_Insert];
   GO
/*  -- ====================================================================================
    -- StateProvinces CRUD Stored Procedures ([Application].[StateProvinces_Insert])
    -- Generated on: 2021-06-11 23:27:52.045841
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[StateProvinces_Insert] (
            @StateProvinceID int,
            @StateProvinceCode nvarchar(5),
            @StateProvinceName nvarchar(50),
            @CountryID int,
            @SalesTerritory nvarchar(50),
            @Border geography,
            @LatestRecordedPopulation bigint
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[StateProvinces]
       (
            [StateProvinceID],
            [StateProvinceCode],
            [StateProvinceName],
            [CountryID],
            [SalesTerritory],
            [Border],
            [LatestRecordedPopulation]
        )
        SELECT 
            @StateProvinceID,
            @StateProvinceCode,
            @StateProvinceName,
            @CountryID,
            @SalesTerritory,
            @Border,
            @LatestRecordedPopulation
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.StateProvinces_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[StateProvinces_Delete];
   GO
/*  -- ====================================================================================
    -- StateProvinces CRUD Stored Procedures ([Application].[StateProvinces_Delete])
    -- Generated on: 2021-06-11 23:27:52.045841
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[StateProvinces_Delete] (@StateProvinceID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[StateProvinces]
       WHERE [StateProvinceID] = @StateProvinceID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Cities_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Cities_Select];
   GO
/*  -- ====================================================================================
    -- Cities CRUD Stored Procedures ([Application].[Cities_Select])
    -- Generated on: 2021-06-11 23:27:52.065826
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[Cities_Select] (@CityID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [CityID],
            [CityName],
            [StateProvinceID],
            [Location],
            [LatestRecordedPopulation]
       FROM [Application].[Cities] AS [T]
       WHERE [T].[CityID] = @CityID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Cities_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Cities_Insert];
   GO
/*  -- ====================================================================================
    -- Cities CRUD Stored Procedures ([Application].[Cities_Insert])
    -- Generated on: 2021-06-11 23:27:52.065826
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[Cities_Insert] (
            @CityID int,
            @CityName nvarchar(50),
            @StateProvinceID int,
            @Location geography,
            @LatestRecordedPopulation bigint
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[Cities]
       (
            [CityID],
            [CityName],
            [StateProvinceID],
            [Location],
            [LatestRecordedPopulation]
        )
        SELECT 
            @CityID,
            @CityName,
            @StateProvinceID,
            @Location,
            @LatestRecordedPopulation
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Cities_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Cities_Delete];
   GO
/*  -- ====================================================================================
    -- Cities CRUD Stored Procedures ([Application].[Cities_Delete])
    -- Generated on: 2021-06-11 23:27:52.065826
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[Cities_Delete] (@CityID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[Cities]
       WHERE [CityID] = @CityID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.SystemParameters_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[SystemParameters_Select];
   GO
/*  -- ====================================================================================
    -- SystemParameters CRUD Stored Procedures ([Application].[SystemParameters_Select])
    -- Generated on: 2021-06-11 23:27:52.084092
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[SystemParameters_Select] (@SystemParameterID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [SystemParameterID],
            [DeliveryAddressLine1],
            [DeliveryAddressLine2],
            [DeliveryCityID],
            [DeliveryPostalCode],
            [DeliveryLocation],
            [PostalAddressLine1],
            [PostalAddressLine2],
            [PostalCityID],
            [PostalPostalCode],
            [ApplicationSettings]
       FROM [Application].[SystemParameters] AS [T]
       WHERE [T].[SystemParameterID] = @SystemParameterID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.SystemParameters_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[SystemParameters_Insert];
   GO
/*  -- ====================================================================================
    -- SystemParameters CRUD Stored Procedures ([Application].[SystemParameters_Insert])
    -- Generated on: 2021-06-11 23:27:52.084092
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[SystemParameters_Insert] (
            @SystemParameterID int,
            @DeliveryAddressLine1 nvarchar(60),
            @DeliveryAddressLine2 nvarchar(60),
            @DeliveryCityID int,
            @DeliveryPostalCode nvarchar(10),
            @DeliveryLocation geography,
            @PostalAddressLine1 nvarchar(60),
            @PostalAddressLine2 nvarchar(60),
            @PostalCityID int,
            @PostalPostalCode nvarchar(10),
            @ApplicationSettings nvarchar(max)
   )
   AS
   BEGIN --Procedure
       INSERT [Application].[SystemParameters]
       (
            [SystemParameterID],
            [DeliveryAddressLine1],
            [DeliveryAddressLine2],
            [DeliveryCityID],
            [DeliveryPostalCode],
            [DeliveryLocation],
            [PostalAddressLine1],
            [PostalAddressLine2],
            [PostalCityID],
            [PostalPostalCode],
            [ApplicationSettings]
        )
        SELECT 
            @SystemParameterID,
            @DeliveryAddressLine1,
            @DeliveryAddressLine2,
            @DeliveryCityID,
            @DeliveryPostalCode,
            @DeliveryLocation,
            @PostalAddressLine1,
            @PostalAddressLine2,
            @PostalCityID,
            @PostalPostalCode,
            @ApplicationSettings
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.SystemParameters_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[SystemParameters_Delete];
   GO
/*  -- ====================================================================================
    -- SystemParameters CRUD Stored Procedures ([Application].[SystemParameters_Delete])
    -- Generated on: 2021-06-11 23:27:52.084092
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Application].[SystemParameters_Delete] (@SystemParameterID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Application].[SystemParameters]
       WHERE [SystemParameterID] = @SystemParameterID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.Suppliers_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[Suppliers_Select];
   GO
/*  -- ====================================================================================
    -- Suppliers CRUD Stored Procedures ([Purchasing].[Suppliers_Select])
    -- Generated on: 2021-06-11 23:27:52.103846
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[Suppliers_Select] (@SupplierID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [SupplierID],
            [SupplierName],
            [SupplierCategoryID],
            [PrimaryContactPersonID],
            [AlternateContactPersonID],
            [DeliveryMethodID],
            [DeliveryCityID],
            [PostalCityID],
            [SupplierReference],
            [BankAccountName],
            [BankAccountBranch],
            [BankAccountCode],
            [BankAccountNumber],
            [BankInternationalCode],
            [PaymentDays],
            [InternalComments],
            [PhoneNumber],
            [FaxNumber],
            [WebsiteURL],
            [DeliveryAddressLine1],
            [DeliveryAddressLine2],
            [DeliveryPostalCode],
            [DeliveryLocation],
            [PostalAddressLine1],
            [PostalAddressLine2],
            [PostalPostalCode]
       FROM [Purchasing].[Suppliers] AS [T]
       WHERE [T].[SupplierID] = @SupplierID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.Suppliers_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[Suppliers_Insert];
   GO
/*  -- ====================================================================================
    -- Suppliers CRUD Stored Procedures ([Purchasing].[Suppliers_Insert])
    -- Generated on: 2021-06-11 23:27:52.103846
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[Suppliers_Insert] (
            @SupplierID int,
            @SupplierName nvarchar(100),
            @SupplierCategoryID int,
            @PrimaryContactPersonID int,
            @AlternateContactPersonID int,
            @DeliveryMethodID int,
            @DeliveryCityID int,
            @PostalCityID int,
            @SupplierReference nvarchar(20),
            @BankAccountName nvarchar(50),
            @BankAccountBranch nvarchar(50),
            @BankAccountCode nvarchar(20),
            @BankAccountNumber nvarchar(20),
            @BankInternationalCode nvarchar(20),
            @PaymentDays int,
            @InternalComments nvarchar(max),
            @PhoneNumber nvarchar(20),
            @FaxNumber nvarchar(20),
            @WebsiteURL nvarchar(256),
            @DeliveryAddressLine1 nvarchar(60),
            @DeliveryAddressLine2 nvarchar(60),
            @DeliveryPostalCode nvarchar(10),
            @DeliveryLocation geography,
            @PostalAddressLine1 nvarchar(60),
            @PostalAddressLine2 nvarchar(60),
            @PostalPostalCode nvarchar(10)
   )
   AS
   BEGIN --Procedure
       INSERT [Purchasing].[Suppliers]
       (
            [SupplierID],
            [SupplierName],
            [SupplierCategoryID],
            [PrimaryContactPersonID],
            [AlternateContactPersonID],
            [DeliveryMethodID],
            [DeliveryCityID],
            [PostalCityID],
            [SupplierReference],
            [BankAccountName],
            [BankAccountBranch],
            [BankAccountCode],
            [BankAccountNumber],
            [BankInternationalCode],
            [PaymentDays],
            [InternalComments],
            [PhoneNumber],
            [FaxNumber],
            [WebsiteURL],
            [DeliveryAddressLine1],
            [DeliveryAddressLine2],
            [DeliveryPostalCode],
            [DeliveryLocation],
            [PostalAddressLine1],
            [PostalAddressLine2],
            [PostalPostalCode]
        )
        SELECT 
            @SupplierID,
            @SupplierName,
            @SupplierCategoryID,
            @PrimaryContactPersonID,
            @AlternateContactPersonID,
            @DeliveryMethodID,
            @DeliveryCityID,
            @PostalCityID,
            @SupplierReference,
            @BankAccountName,
            @BankAccountBranch,
            @BankAccountCode,
            @BankAccountNumber,
            @BankInternationalCode,
            @PaymentDays,
            @InternalComments,
            @PhoneNumber,
            @FaxNumber,
            @WebsiteURL,
            @DeliveryAddressLine1,
            @DeliveryAddressLine2,
            @DeliveryPostalCode,
            @DeliveryLocation,
            @PostalAddressLine1,
            @PostalAddressLine2,
            @PostalPostalCode
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.Suppliers_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[Suppliers_Delete];
   GO
/*  -- ====================================================================================
    -- Suppliers CRUD Stored Procedures ([Purchasing].[Suppliers_Delete])
    -- Generated on: 2021-06-11 23:27:52.103846
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[Suppliers_Delete] (@SupplierID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Purchasing].[Suppliers]
       WHERE [SupplierID] = @SupplierID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Customers_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Customers_Select];
   GO
/*  -- ====================================================================================
    -- Customers CRUD Stored Procedures ([Sales].[Customers_Select])
    -- Generated on: 2021-06-11 23:27:52.123823
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Customers_Select] (@CustomerID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [CustomerID],
            [CustomerName],
            [BillToCustomerID],
            [CustomerCategoryID],
            [BuyingGroupID],
            [PrimaryContactPersonID],
            [AlternateContactPersonID],
            [DeliveryMethodID],
            [DeliveryCityID],
            [PostalCityID],
            [CreditLimit],
            [AccountOpenedDate],
            [StandardDiscountPercentage],
            [IsStatementSent],
            [IsOnCreditHold],
            [PaymentDays],
            [PhoneNumber],
            [FaxNumber],
            [DeliveryRun],
            [RunPosition],
            [WebsiteURL],
            [DeliveryAddressLine1],
            [DeliveryAddressLine2],
            [DeliveryPostalCode],
            [DeliveryLocation],
            [PostalAddressLine1],
            [PostalAddressLine2],
            [PostalPostalCode]
       FROM [Sales].[Customers] AS [T]
       WHERE [T].[CustomerID] = @CustomerID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Customers_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Customers_Insert];
   GO
/*  -- ====================================================================================
    -- Customers CRUD Stored Procedures ([Sales].[Customers_Insert])
    -- Generated on: 2021-06-11 23:27:52.123823
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Customers_Insert] (
            @CustomerID int,
            @CustomerName nvarchar(100),
            @BillToCustomerID int,
            @CustomerCategoryID int,
            @BuyingGroupID int,
            @PrimaryContactPersonID int,
            @AlternateContactPersonID int,
            @DeliveryMethodID int,
            @DeliveryCityID int,
            @PostalCityID int,
            @CreditLimit decimal(18, 2),
            @AccountOpenedDate date,
            @StandardDiscountPercentage decimal(18, 3),
            @IsStatementSent bit,
            @IsOnCreditHold bit,
            @PaymentDays int,
            @PhoneNumber nvarchar(20),
            @FaxNumber nvarchar(20),
            @DeliveryRun nvarchar(5),
            @RunPosition nvarchar(5),
            @WebsiteURL nvarchar(256),
            @DeliveryAddressLine1 nvarchar(60),
            @DeliveryAddressLine2 nvarchar(60),
            @DeliveryPostalCode nvarchar(10),
            @DeliveryLocation geography,
            @PostalAddressLine1 nvarchar(60),
            @PostalAddressLine2 nvarchar(60),
            @PostalPostalCode nvarchar(10)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[Customers]
       (
            [CustomerID],
            [CustomerName],
            [BillToCustomerID],
            [CustomerCategoryID],
            [BuyingGroupID],
            [PrimaryContactPersonID],
            [AlternateContactPersonID],
            [DeliveryMethodID],
            [DeliveryCityID],
            [PostalCityID],
            [CreditLimit],
            [AccountOpenedDate],
            [StandardDiscountPercentage],
            [IsStatementSent],
            [IsOnCreditHold],
            [PaymentDays],
            [PhoneNumber],
            [FaxNumber],
            [DeliveryRun],
            [RunPosition],
            [WebsiteURL],
            [DeliveryAddressLine1],
            [DeliveryAddressLine2],
            [DeliveryPostalCode],
            [DeliveryLocation],
            [PostalAddressLine1],
            [PostalAddressLine2],
            [PostalPostalCode]
        )
        SELECT 
            @CustomerID,
            @CustomerName,
            @BillToCustomerID,
            @CustomerCategoryID,
            @BuyingGroupID,
            @PrimaryContactPersonID,
            @AlternateContactPersonID,
            @DeliveryMethodID,
            @DeliveryCityID,
            @PostalCityID,
            @CreditLimit,
            @AccountOpenedDate,
            @StandardDiscountPercentage,
            @IsStatementSent,
            @IsOnCreditHold,
            @PaymentDays,
            @PhoneNumber,
            @FaxNumber,
            @DeliveryRun,
            @RunPosition,
            @WebsiteURL,
            @DeliveryAddressLine1,
            @DeliveryAddressLine2,
            @DeliveryPostalCode,
            @DeliveryLocation,
            @PostalAddressLine1,
            @PostalAddressLine2,
            @PostalPostalCode
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Customers_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Customers_Delete];
   GO
/*  -- ====================================================================================
    -- Customers CRUD Stored Procedures ([Sales].[Customers_Delete])
    -- Generated on: 2021-06-11 23:27:52.123823
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Customers_Delete] (@CustomerID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[Customers]
       WHERE [CustomerID] = @CustomerID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrders_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrders_Select];
   GO
/*  -- ====================================================================================
    -- PurchaseOrders CRUD Stored Procedures ([Purchasing].[PurchaseOrders_Select])
    -- Generated on: 2021-06-11 23:27:52.145013
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[PurchaseOrders_Select] (@PurchaseOrderID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [PurchaseOrderID],
            [SupplierID],
            [OrderDate],
            [DeliveryMethodID],
            [ContactPersonID],
            [ExpectedDeliveryDate],
            [SupplierReference],
            [IsOrderFinalized],
            [Comments],
            [InternalComments]
       FROM [Purchasing].[PurchaseOrders] AS [T]
       WHERE [T].[PurchaseOrderID] = @PurchaseOrderID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrders_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrders_Insert];
   GO
/*  -- ====================================================================================
    -- PurchaseOrders CRUD Stored Procedures ([Purchasing].[PurchaseOrders_Insert])
    -- Generated on: 2021-06-11 23:27:52.145013
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[PurchaseOrders_Insert] (
            @PurchaseOrderID int,
            @SupplierID int,
            @OrderDate date,
            @DeliveryMethodID int,
            @ContactPersonID int,
            @ExpectedDeliveryDate date,
            @SupplierReference nvarchar(20),
            @IsOrderFinalized bit,
            @Comments nvarchar(max),
            @InternalComments nvarchar(max)
   )
   AS
   BEGIN --Procedure
       INSERT [Purchasing].[PurchaseOrders]
       (
            [PurchaseOrderID],
            [SupplierID],
            [OrderDate],
            [DeliveryMethodID],
            [ContactPersonID],
            [ExpectedDeliveryDate],
            [SupplierReference],
            [IsOrderFinalized],
            [Comments],
            [InternalComments]
        )
        SELECT 
            @PurchaseOrderID,
            @SupplierID,
            @OrderDate,
            @DeliveryMethodID,
            @ContactPersonID,
            @ExpectedDeliveryDate,
            @SupplierReference,
            @IsOrderFinalized,
            @Comments,
            @InternalComments
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrders_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrders_Delete];
   GO
/*  -- ====================================================================================
    -- PurchaseOrders CRUD Stored Procedures ([Purchasing].[PurchaseOrders_Delete])
    -- Generated on: 2021-06-11 23:27:52.145013
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[PurchaseOrders_Delete] (@PurchaseOrderID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Purchasing].[PurchaseOrders]
       WHERE [PurchaseOrderID] = @PurchaseOrderID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Orders_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Orders_Select];
   GO
/*  -- ====================================================================================
    -- Orders CRUD Stored Procedures ([Sales].[Orders_Select])
    -- Generated on: 2021-06-11 23:27:52.164410
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Orders_Select] (@OrderID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [OrderID],
            [CustomerID],
            [SalespersonPersonID],
            [PickedByPersonID],
            [ContactPersonID],
            [BackorderOrderID],
            [OrderDate],
            [ExpectedDeliveryDate],
            [CustomerPurchaseOrderNumber],
            [IsUndersupplyBackordered],
            [Comments],
            [DeliveryInstructions],
            [InternalComments],
            [PickingCompletedWhen]
       FROM [Sales].[Orders] AS [T]
       WHERE [T].[OrderID] = @OrderID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Orders_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Orders_Insert];
   GO
/*  -- ====================================================================================
    -- Orders CRUD Stored Procedures ([Sales].[Orders_Insert])
    -- Generated on: 2021-06-11 23:27:52.164410
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Orders_Insert] (
            @OrderID int,
            @CustomerID int,
            @SalespersonPersonID int,
            @PickedByPersonID int,
            @ContactPersonID int,
            @BackorderOrderID int,
            @OrderDate date,
            @ExpectedDeliveryDate date,
            @CustomerPurchaseOrderNumber nvarchar(20),
            @IsUndersupplyBackordered bit,
            @Comments nvarchar(max),
            @DeliveryInstructions nvarchar(max),
            @InternalComments nvarchar(max),
            @PickingCompletedWhen datetime2(7)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[Orders]
       (
            [OrderID],
            [CustomerID],
            [SalespersonPersonID],
            [PickedByPersonID],
            [ContactPersonID],
            [BackorderOrderID],
            [OrderDate],
            [ExpectedDeliveryDate],
            [CustomerPurchaseOrderNumber],
            [IsUndersupplyBackordered],
            [Comments],
            [DeliveryInstructions],
            [InternalComments],
            [PickingCompletedWhen]
        )
        SELECT 
            @OrderID,
            @CustomerID,
            @SalespersonPersonID,
            @PickedByPersonID,
            @ContactPersonID,
            @BackorderOrderID,
            @OrderDate,
            @ExpectedDeliveryDate,
            @CustomerPurchaseOrderNumber,
            @IsUndersupplyBackordered,
            @Comments,
            @DeliveryInstructions,
            @InternalComments,
            @PickingCompletedWhen
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Orders_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Orders_Delete];
   GO
/*  -- ====================================================================================
    -- Orders CRUD Stored Procedures ([Sales].[Orders_Delete])
    -- Generated on: 2021-06-11 23:27:52.164410
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Orders_Delete] (@OrderID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[Orders]
       WHERE [OrderID] = @OrderID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItems_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItems_Select];
   GO
/*  -- ====================================================================================
    -- StockItems CRUD Stored Procedures ([Warehouse].[StockItems_Select])
    -- Generated on: 2021-06-11 23:27:52.183725
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItems_Select] (@StockItemID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [StockItemID],
            [StockItemName],
            [SupplierID],
            [ColorID],
            [UnitPackageID],
            [OuterPackageID],
            [Brand],
            [Size],
            [LeadTimeDays],
            [QuantityPerOuter],
            [IsChillerStock],
            [Barcode],
            [TaxRate],
            [UnitPrice],
            [RecommendedRetailPrice],
            [TypicalWeightPerUnit],
            [MarketingComments],
            [InternalComments],
            [CustomFields]
       FROM [Warehouse].[StockItems] AS [T]
       WHERE [T].[StockItemID] = @StockItemID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItems_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItems_Insert];
   GO
/*  -- ====================================================================================
    -- StockItems CRUD Stored Procedures ([Warehouse].[StockItems_Insert])
    -- Generated on: 2021-06-11 23:27:52.183725
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItems_Insert] (
            @StockItemID int,
            @StockItemName nvarchar(100),
            @SupplierID int,
            @ColorID int,
            @UnitPackageID int,
            @OuterPackageID int,
            @Brand nvarchar(50),
            @Size nvarchar(20),
            @LeadTimeDays int,
            @QuantityPerOuter int,
            @IsChillerStock bit,
            @Barcode nvarchar(50),
            @TaxRate decimal(18, 3),
            @UnitPrice decimal(18, 2),
            @RecommendedRetailPrice decimal(18, 2),
            @TypicalWeightPerUnit decimal(18, 3),
            @MarketingComments nvarchar(max),
            @InternalComments nvarchar(max),
            @CustomFields nvarchar(max)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[StockItems]
       (
            [StockItemID],
            [StockItemName],
            [SupplierID],
            [ColorID],
            [UnitPackageID],
            [OuterPackageID],
            [Brand],
            [Size],
            [LeadTimeDays],
            [QuantityPerOuter],
            [IsChillerStock],
            [Barcode],
            [TaxRate],
            [UnitPrice],
            [RecommendedRetailPrice],
            [TypicalWeightPerUnit],
            [MarketingComments],
            [InternalComments],
            [CustomFields]
        )
        SELECT 
            @StockItemID,
            @StockItemName,
            @SupplierID,
            @ColorID,
            @UnitPackageID,
            @OuterPackageID,
            @Brand,
            @Size,
            @LeadTimeDays,
            @QuantityPerOuter,
            @IsChillerStock,
            @Barcode,
            @TaxRate,
            @UnitPrice,
            @RecommendedRetailPrice,
            @TypicalWeightPerUnit,
            @MarketingComments,
            @InternalComments,
            @CustomFields
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItems_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItems_Delete];
   GO
/*  -- ====================================================================================
    -- StockItems CRUD Stored Procedures ([Warehouse].[StockItems_Delete])
    -- Generated on: 2021-06-11 23:27:52.183725
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItems_Delete] (@StockItemID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[StockItems]
       WHERE [StockItemID] = @StockItemID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemHoldings_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemHoldings_Select];
   GO
/*  -- ====================================================================================
    -- StockItemHoldings CRUD Stored Procedures ([Warehouse].[StockItemHoldings_Select])
    -- Generated on: 2021-06-11 23:27:52.203525
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemHoldings_Select] (@StockItemID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [StockItemID],
            [QuantityOnHand],
            [BinLocation],
            [LastStocktakeQuantity],
            [LastCostPrice],
            [ReorderLevel],
            [TargetStockLevel]
       FROM [Warehouse].[StockItemHoldings] AS [T]
       WHERE [T].[StockItemID] = @StockItemID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemHoldings_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemHoldings_Insert];
   GO
/*  -- ====================================================================================
    -- StockItemHoldings CRUD Stored Procedures ([Warehouse].[StockItemHoldings_Insert])
    -- Generated on: 2021-06-11 23:27:52.203525
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemHoldings_Insert] (
            @StockItemID int,
            @QuantityOnHand int,
            @BinLocation nvarchar(20),
            @LastStocktakeQuantity int,
            @LastCostPrice decimal(18, 2),
            @ReorderLevel int,
            @TargetStockLevel int
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[StockItemHoldings]
       (
            [StockItemID],
            [QuantityOnHand],
            [BinLocation],
            [LastStocktakeQuantity],
            [LastCostPrice],
            [ReorderLevel],
            [TargetStockLevel]
        )
        SELECT 
            @StockItemID,
            @QuantityOnHand,
            @BinLocation,
            @LastStocktakeQuantity,
            @LastCostPrice,
            @ReorderLevel,
            @TargetStockLevel
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemHoldings_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemHoldings_Delete];
   GO
/*  -- ====================================================================================
    -- StockItemHoldings CRUD Stored Procedures ([Warehouse].[StockItemHoldings_Delete])
    -- Generated on: 2021-06-11 23:27:52.203525
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemHoldings_Delete] (@StockItemID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[StockItemHoldings]
       WHERE [StockItemID] = @StockItemID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrderLines_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrderLines_Select];
   GO
/*  -- ====================================================================================
    -- PurchaseOrderLines CRUD Stored Procedures ([Purchasing].[PurchaseOrderLines_Select])
    -- Generated on: 2021-06-11 23:27:52.222010
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[PurchaseOrderLines_Select] (@PurchaseOrderLineID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [PurchaseOrderLineID],
            [PurchaseOrderID],
            [StockItemID],
            [OrderedOuters],
            [Description],
            [ReceivedOuters],
            [PackageTypeID],
            [ExpectedUnitPricePerOuter],
            [LastReceiptDate],
            [IsOrderLineFinalized]
       FROM [Purchasing].[PurchaseOrderLines] AS [T]
       WHERE [T].[PurchaseOrderLineID] = @PurchaseOrderLineID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrderLines_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrderLines_Insert];
   GO
/*  -- ====================================================================================
    -- PurchaseOrderLines CRUD Stored Procedures ([Purchasing].[PurchaseOrderLines_Insert])
    -- Generated on: 2021-06-11 23:27:52.222010
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[PurchaseOrderLines_Insert] (
            @PurchaseOrderLineID int,
            @PurchaseOrderID int,
            @StockItemID int,
            @OrderedOuters int,
            @Description nvarchar(100),
            @ReceivedOuters int,
            @PackageTypeID int,
            @ExpectedUnitPricePerOuter decimal(18, 2),
            @LastReceiptDate date,
            @IsOrderLineFinalized bit
   )
   AS
   BEGIN --Procedure
       INSERT [Purchasing].[PurchaseOrderLines]
       (
            [PurchaseOrderLineID],
            [PurchaseOrderID],
            [StockItemID],
            [OrderedOuters],
            [Description],
            [ReceivedOuters],
            [PackageTypeID],
            [ExpectedUnitPricePerOuter],
            [LastReceiptDate],
            [IsOrderLineFinalized]
        )
        SELECT 
            @PurchaseOrderLineID,
            @PurchaseOrderID,
            @StockItemID,
            @OrderedOuters,
            @Description,
            @ReceivedOuters,
            @PackageTypeID,
            @ExpectedUnitPricePerOuter,
            @LastReceiptDate,
            @IsOrderLineFinalized
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrderLines_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrderLines_Delete];
   GO
/*  -- ====================================================================================
    -- PurchaseOrderLines CRUD Stored Procedures ([Purchasing].[PurchaseOrderLines_Delete])
    -- Generated on: 2021-06-11 23:27:52.222010
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[PurchaseOrderLines_Delete] (@PurchaseOrderLineID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Purchasing].[PurchaseOrderLines]
       WHERE [PurchaseOrderLineID] = @PurchaseOrderLineID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierTransactions_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierTransactions_Select];
   GO
/*  -- ====================================================================================
    -- SupplierTransactions CRUD Stored Procedures ([Purchasing].[SupplierTransactions_Select])
    -- Generated on: 2021-06-11 23:27:52.242184
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[SupplierTransactions_Select] (@SupplierTransactionID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [SupplierTransactionID],
            [SupplierID],
            [TransactionTypeID],
            [PurchaseOrderID],
            [PaymentMethodID],
            [SupplierInvoiceNumber],
            [TransactionDate],
            [AmountExcludingTax],
            [TaxAmount],
            [TransactionAmount],
            [OutstandingBalance],
            [FinalizationDate]
       FROM [Purchasing].[SupplierTransactions] AS [T]
       WHERE [T].[SupplierTransactionID] = @SupplierTransactionID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierTransactions_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierTransactions_Insert];
   GO
/*  -- ====================================================================================
    -- SupplierTransactions CRUD Stored Procedures ([Purchasing].[SupplierTransactions_Insert])
    -- Generated on: 2021-06-11 23:27:52.242184
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[SupplierTransactions_Insert] (
            @SupplierTransactionID int,
            @SupplierID int,
            @TransactionTypeID int,
            @PurchaseOrderID int,
            @PaymentMethodID int,
            @SupplierInvoiceNumber nvarchar(20),
            @TransactionDate date,
            @AmountExcludingTax decimal(18, 2),
            @TaxAmount decimal(18, 2),
            @TransactionAmount decimal(18, 2),
            @OutstandingBalance decimal(18, 2),
            @FinalizationDate date
   )
   AS
   BEGIN --Procedure
       INSERT [Purchasing].[SupplierTransactions]
       (
            [SupplierTransactionID],
            [SupplierID],
            [TransactionTypeID],
            [PurchaseOrderID],
            [PaymentMethodID],
            [SupplierInvoiceNumber],
            [TransactionDate],
            [AmountExcludingTax],
            [TaxAmount],
            [TransactionAmount],
            [OutstandingBalance],
            [FinalizationDate]
        )
        SELECT 
            @SupplierTransactionID,
            @SupplierID,
            @TransactionTypeID,
            @PurchaseOrderID,
            @PaymentMethodID,
            @SupplierInvoiceNumber,
            @TransactionDate,
            @AmountExcludingTax,
            @TaxAmount,
            @TransactionAmount,
            @OutstandingBalance,
            @FinalizationDate
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierTransactions_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierTransactions_Delete];
   GO
/*  -- ====================================================================================
    -- SupplierTransactions CRUD Stored Procedures ([Purchasing].[SupplierTransactions_Delete])
    -- Generated on: 2021-06-11 23:27:52.242184
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Purchasing].[SupplierTransactions_Delete] (@SupplierTransactionID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Purchasing].[SupplierTransactions]
       WHERE [SupplierTransactionID] = @SupplierTransactionID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.SpecialDeals_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[SpecialDeals_Select];
   GO
/*  -- ====================================================================================
    -- SpecialDeals CRUD Stored Procedures ([Sales].[SpecialDeals_Select])
    -- Generated on: 2021-06-11 23:27:52.261186
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[SpecialDeals_Select] (@SpecialDealID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [SpecialDealID],
            [StockItemID],
            [CustomerID],
            [BuyingGroupID],
            [CustomerCategoryID],
            [StockGroupID],
            [DealDescription],
            [StartDate],
            [EndDate],
            [DiscountAmount],
            [DiscountPercentage],
            [UnitPrice]
       FROM [Sales].[SpecialDeals] AS [T]
       WHERE [T].[SpecialDealID] = @SpecialDealID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.SpecialDeals_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[SpecialDeals_Insert];
   GO
/*  -- ====================================================================================
    -- SpecialDeals CRUD Stored Procedures ([Sales].[SpecialDeals_Insert])
    -- Generated on: 2021-06-11 23:27:52.261186
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[SpecialDeals_Insert] (
            @SpecialDealID int,
            @StockItemID int,
            @CustomerID int,
            @BuyingGroupID int,
            @CustomerCategoryID int,
            @StockGroupID int,
            @DealDescription nvarchar(30),
            @StartDate date,
            @EndDate date,
            @DiscountAmount decimal(18, 2),
            @DiscountPercentage decimal(18, 3),
            @UnitPrice decimal(18, 2)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[SpecialDeals]
       (
            [SpecialDealID],
            [StockItemID],
            [CustomerID],
            [BuyingGroupID],
            [CustomerCategoryID],
            [StockGroupID],
            [DealDescription],
            [StartDate],
            [EndDate],
            [DiscountAmount],
            [DiscountPercentage],
            [UnitPrice]
        )
        SELECT 
            @SpecialDealID,
            @StockItemID,
            @CustomerID,
            @BuyingGroupID,
            @CustomerCategoryID,
            @StockGroupID,
            @DealDescription,
            @StartDate,
            @EndDate,
            @DiscountAmount,
            @DiscountPercentage,
            @UnitPrice
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.SpecialDeals_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[SpecialDeals_Delete];
   GO
/*  -- ====================================================================================
    -- SpecialDeals CRUD Stored Procedures ([Sales].[SpecialDeals_Delete])
    -- Generated on: 2021-06-11 23:27:52.261186
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[SpecialDeals_Delete] (@SpecialDealID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[SpecialDeals]
       WHERE [SpecialDealID] = @SpecialDealID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Invoices_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Invoices_Select];
   GO
/*  -- ====================================================================================
    -- Invoices CRUD Stored Procedures ([Sales].[Invoices_Select])
    -- Generated on: 2021-06-11 23:27:52.280715
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Invoices_Select] (@InvoiceID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [InvoiceID],
            [CustomerID],
            [BillToCustomerID],
            [OrderID],
            [DeliveryMethodID],
            [ContactPersonID],
            [AccountsPersonID],
            [SalespersonPersonID],
            [PackedByPersonID],
            [InvoiceDate],
            [CustomerPurchaseOrderNumber],
            [IsCreditNote],
            [CreditNoteReason],
            [Comments],
            [DeliveryInstructions],
            [InternalComments],
            [TotalDryItems],
            [TotalChillerItems],
            [DeliveryRun],
            [RunPosition],
            [ReturnedDeliveryData]
       FROM [Sales].[Invoices] AS [T]
       WHERE [T].[InvoiceID] = @InvoiceID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Invoices_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Invoices_Insert];
   GO
/*  -- ====================================================================================
    -- Invoices CRUD Stored Procedures ([Sales].[Invoices_Insert])
    -- Generated on: 2021-06-11 23:27:52.280715
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Invoices_Insert] (
            @InvoiceID int,
            @CustomerID int,
            @BillToCustomerID int,
            @OrderID int,
            @DeliveryMethodID int,
            @ContactPersonID int,
            @AccountsPersonID int,
            @SalespersonPersonID int,
            @PackedByPersonID int,
            @InvoiceDate date,
            @CustomerPurchaseOrderNumber nvarchar(20),
            @IsCreditNote bit,
            @CreditNoteReason nvarchar(max),
            @Comments nvarchar(max),
            @DeliveryInstructions nvarchar(max),
            @InternalComments nvarchar(max),
            @TotalDryItems int,
            @TotalChillerItems int,
            @DeliveryRun nvarchar(5),
            @RunPosition nvarchar(5),
            @ReturnedDeliveryData nvarchar(max)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[Invoices]
       (
            [InvoiceID],
            [CustomerID],
            [BillToCustomerID],
            [OrderID],
            [DeliveryMethodID],
            [ContactPersonID],
            [AccountsPersonID],
            [SalespersonPersonID],
            [PackedByPersonID],
            [InvoiceDate],
            [CustomerPurchaseOrderNumber],
            [IsCreditNote],
            [CreditNoteReason],
            [Comments],
            [DeliveryInstructions],
            [InternalComments],
            [TotalDryItems],
            [TotalChillerItems],
            [DeliveryRun],
            [RunPosition],
            [ReturnedDeliveryData]
        )
        SELECT 
            @InvoiceID,
            @CustomerID,
            @BillToCustomerID,
            @OrderID,
            @DeliveryMethodID,
            @ContactPersonID,
            @AccountsPersonID,
            @SalespersonPersonID,
            @PackedByPersonID,
            @InvoiceDate,
            @CustomerPurchaseOrderNumber,
            @IsCreditNote,
            @CreditNoteReason,
            @Comments,
            @DeliveryInstructions,
            @InternalComments,
            @TotalDryItems,
            @TotalChillerItems,
            @DeliveryRun,
            @RunPosition,
            @ReturnedDeliveryData
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Invoices_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Invoices_Delete];
   GO
/*  -- ====================================================================================
    -- Invoices CRUD Stored Procedures ([Sales].[Invoices_Delete])
    -- Generated on: 2021-06-11 23:27:52.280715
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[Invoices_Delete] (@InvoiceID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[Invoices]
       WHERE [InvoiceID] = @InvoiceID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.OrderLines_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[OrderLines_Select];
   GO
/*  -- ====================================================================================
    -- OrderLines CRUD Stored Procedures ([Sales].[OrderLines_Select])
    -- Generated on: 2021-06-11 23:27:52.301446
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[OrderLines_Select] (@OrderLineID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [OrderLineID],
            [OrderID],
            [StockItemID],
            [Description],
            [PackageTypeID],
            [Quantity],
            [UnitPrice],
            [TaxRate],
            [PickedQuantity],
            [PickingCompletedWhen]
       FROM [Sales].[OrderLines] AS [T]
       WHERE [T].[OrderLineID] = @OrderLineID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.OrderLines_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[OrderLines_Insert];
   GO
/*  -- ====================================================================================
    -- OrderLines CRUD Stored Procedures ([Sales].[OrderLines_Insert])
    -- Generated on: 2021-06-11 23:27:52.301446
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[OrderLines_Insert] (
            @OrderLineID int,
            @OrderID int,
            @StockItemID int,
            @Description nvarchar(100),
            @PackageTypeID int,
            @Quantity int,
            @UnitPrice decimal(18, 2),
            @TaxRate decimal(18, 3),
            @PickedQuantity int,
            @PickingCompletedWhen datetime2(7)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[OrderLines]
       (
            [OrderLineID],
            [OrderID],
            [StockItemID],
            [Description],
            [PackageTypeID],
            [Quantity],
            [UnitPrice],
            [TaxRate],
            [PickedQuantity],
            [PickingCompletedWhen]
        )
        SELECT 
            @OrderLineID,
            @OrderID,
            @StockItemID,
            @Description,
            @PackageTypeID,
            @Quantity,
            @UnitPrice,
            @TaxRate,
            @PickedQuantity,
            @PickingCompletedWhen
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.OrderLines_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[OrderLines_Delete];
   GO
/*  -- ====================================================================================
    -- OrderLines CRUD Stored Procedures ([Sales].[OrderLines_Delete])
    -- Generated on: 2021-06-11 23:27:52.301446
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[OrderLines_Delete] (@OrderLineID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[OrderLines]
       WHERE [OrderLineID] = @OrderLineID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemStockGroups_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemStockGroups_Select];
   GO
/*  -- ====================================================================================
    -- StockItemStockGroups CRUD Stored Procedures ([Warehouse].[StockItemStockGroups_Select])
    -- Generated on: 2021-06-11 23:27:52.321844
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemStockGroups_Select] (@StockItemStockGroupID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [StockItemStockGroupID],
            [StockItemID],
            [StockGroupID]
       FROM [Warehouse].[StockItemStockGroups] AS [T]
       WHERE [T].[StockItemStockGroupID] = @StockItemStockGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemStockGroups_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemStockGroups_Insert];
   GO
/*  -- ====================================================================================
    -- StockItemStockGroups CRUD Stored Procedures ([Warehouse].[StockItemStockGroups_Insert])
    -- Generated on: 2021-06-11 23:27:52.321844
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemStockGroups_Insert] (
            @StockItemStockGroupID int,
            @StockItemID int,
            @StockGroupID int
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[StockItemStockGroups]
       (
            [StockItemStockGroupID],
            [StockItemID],
            [StockGroupID]
        )
        SELECT 
            @StockItemStockGroupID,
            @StockItemID,
            @StockGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemStockGroups_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemStockGroups_Delete];
   GO
/*  -- ====================================================================================
    -- StockItemStockGroups CRUD Stored Procedures ([Warehouse].[StockItemStockGroups_Delete])
    -- Generated on: 2021-06-11 23:27:52.321844
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemStockGroups_Delete] (@StockItemStockGroupID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[StockItemStockGroups]
       WHERE [StockItemStockGroupID] = @StockItemStockGroupID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerTransactions_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerTransactions_Select];
   GO
/*  -- ====================================================================================
    -- CustomerTransactions CRUD Stored Procedures ([Sales].[CustomerTransactions_Select])
    -- Generated on: 2021-06-11 23:27:52.341395
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[CustomerTransactions_Select] (@CustomerTransactionID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [CustomerTransactionID],
            [CustomerID],
            [TransactionTypeID],
            [InvoiceID],
            [PaymentMethodID],
            [TransactionDate],
            [AmountExcludingTax],
            [TaxAmount],
            [TransactionAmount],
            [OutstandingBalance],
            [FinalizationDate]
       FROM [Sales].[CustomerTransactions] AS [T]
       WHERE [T].[CustomerTransactionID] = @CustomerTransactionID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerTransactions_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerTransactions_Insert];
   GO
/*  -- ====================================================================================
    -- CustomerTransactions CRUD Stored Procedures ([Sales].[CustomerTransactions_Insert])
    -- Generated on: 2021-06-11 23:27:52.341395
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[CustomerTransactions_Insert] (
            @CustomerTransactionID int,
            @CustomerID int,
            @TransactionTypeID int,
            @InvoiceID int,
            @PaymentMethodID int,
            @TransactionDate date,
            @AmountExcludingTax decimal(18, 2),
            @TaxAmount decimal(18, 2),
            @TransactionAmount decimal(18, 2),
            @OutstandingBalance decimal(18, 2),
            @FinalizationDate date
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[CustomerTransactions]
       (
            [CustomerTransactionID],
            [CustomerID],
            [TransactionTypeID],
            [InvoiceID],
            [PaymentMethodID],
            [TransactionDate],
            [AmountExcludingTax],
            [TaxAmount],
            [TransactionAmount],
            [OutstandingBalance],
            [FinalizationDate]
        )
        SELECT 
            @CustomerTransactionID,
            @CustomerID,
            @TransactionTypeID,
            @InvoiceID,
            @PaymentMethodID,
            @TransactionDate,
            @AmountExcludingTax,
            @TaxAmount,
            @TransactionAmount,
            @OutstandingBalance,
            @FinalizationDate
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerTransactions_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerTransactions_Delete];
   GO
/*  -- ====================================================================================
    -- CustomerTransactions CRUD Stored Procedures ([Sales].[CustomerTransactions_Delete])
    -- Generated on: 2021-06-11 23:27:52.341395
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[CustomerTransactions_Delete] (@CustomerTransactionID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[CustomerTransactions]
       WHERE [CustomerTransactionID] = @CustomerTransactionID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.InvoiceLines_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[InvoiceLines_Select];
   GO
/*  -- ====================================================================================
    -- InvoiceLines CRUD Stored Procedures ([Sales].[InvoiceLines_Select])
    -- Generated on: 2021-06-11 23:27:52.360454
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[InvoiceLines_Select] (@InvoiceLineID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [InvoiceLineID],
            [InvoiceID],
            [StockItemID],
            [Description],
            [PackageTypeID],
            [Quantity],
            [UnitPrice],
            [TaxRate],
            [TaxAmount],
            [LineProfit],
            [ExtendedPrice]
       FROM [Sales].[InvoiceLines] AS [T]
       WHERE [T].[InvoiceLineID] = @InvoiceLineID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.InvoiceLines_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[InvoiceLines_Insert];
   GO
/*  -- ====================================================================================
    -- InvoiceLines CRUD Stored Procedures ([Sales].[InvoiceLines_Insert])
    -- Generated on: 2021-06-11 23:27:52.360454
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[InvoiceLines_Insert] (
            @InvoiceLineID int,
            @InvoiceID int,
            @StockItemID int,
            @Description nvarchar(100),
            @PackageTypeID int,
            @Quantity int,
            @UnitPrice decimal(18, 2),
            @TaxRate decimal(18, 3),
            @TaxAmount decimal(18, 2),
            @LineProfit decimal(18, 2),
            @ExtendedPrice decimal(18, 2)
   )
   AS
   BEGIN --Procedure
       INSERT [Sales].[InvoiceLines]
       (
            [InvoiceLineID],
            [InvoiceID],
            [StockItemID],
            [Description],
            [PackageTypeID],
            [Quantity],
            [UnitPrice],
            [TaxRate],
            [TaxAmount],
            [LineProfit],
            [ExtendedPrice]
        )
        SELECT 
            @InvoiceLineID,
            @InvoiceID,
            @StockItemID,
            @Description,
            @PackageTypeID,
            @Quantity,
            @UnitPrice,
            @TaxRate,
            @TaxAmount,
            @LineProfit,
            @ExtendedPrice
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.InvoiceLines_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[InvoiceLines_Delete];
   GO
/*  -- ====================================================================================
    -- InvoiceLines CRUD Stored Procedures ([Sales].[InvoiceLines_Delete])
    -- Generated on: 2021-06-11 23:27:52.360454
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Sales].[InvoiceLines_Delete] (@InvoiceLineID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Sales].[InvoiceLines]
       WHERE [InvoiceLineID] = @InvoiceLineID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemTransactions_Select')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemTransactions_Select];
   GO
/*  -- ====================================================================================
    -- StockItemTransactions CRUD Stored Procedures ([Warehouse].[StockItemTransactions_Select])
    -- Generated on: 2021-06-11 23:27:52.380060
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemTransactions_Select] (@StockItemTransactionID INT = NULL)
   AS
   BEGIN --Procedure
       SELECT
            [StockItemTransactionID],
            [StockItemID],
            [TransactionTypeID],
            [CustomerID],
            [InvoiceID],
            [SupplierID],
            [PurchaseOrderID],
            [TransactionOccurredWhen],
            [Quantity]
       FROM [Warehouse].[StockItemTransactions] AS [T]
       WHERE [T].[StockItemTransactionID] = @StockItemTransactionID
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemTransactions_Insert')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemTransactions_Insert];
   GO
/*  -- ====================================================================================
    -- StockItemTransactions CRUD Stored Procedures ([Warehouse].[StockItemTransactions_Insert])
    -- Generated on: 2021-06-11 23:27:52.380060
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemTransactions_Insert] (
            @StockItemTransactionID int,
            @StockItemID int,
            @TransactionTypeID int,
            @CustomerID int,
            @InvoiceID int,
            @SupplierID int,
            @PurchaseOrderID int,
            @TransactionOccurredWhen datetime2(7),
            @Quantity decimal(18, 3)
   )
   AS
   BEGIN --Procedure
       INSERT [Warehouse].[StockItemTransactions]
       (
            [StockItemTransactionID],
            [StockItemID],
            [TransactionTypeID],
            [CustomerID],
            [InvoiceID],
            [SupplierID],
            [PurchaseOrderID],
            [TransactionOccurredWhen],
            [Quantity]
        )
        SELECT 
            @StockItemTransactionID,
            @StockItemID,
            @TransactionTypeID,
            @CustomerID,
            @InvoiceID,
            @SupplierID,
            @PurchaseOrderID,
            @TransactionOccurredWhen,
            @Quantity
    END --Procedure
GO

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemTransactions_Delete')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemTransactions_Delete];
   GO
/*  -- ====================================================================================
    -- StockItemTransactions CRUD Stored Procedures ([Warehouse].[StockItemTransactions_Delete])
    -- Generated on: 2021-06-11 23:27:52.380060
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for CRUD Stored Procedures
    -- ========================================================================================*/

   CREATE PROCEDURE [Warehouse].[StockItemTransactions_Delete] (@StockItemTransactionID INT = NULL)
   AS
   BEGIN --Procedure
       DELETE [Warehouse].[StockItemTransactions]
       WHERE [StockItemTransactionID] = @StockItemTransactionID
    END --Procedure
GO

