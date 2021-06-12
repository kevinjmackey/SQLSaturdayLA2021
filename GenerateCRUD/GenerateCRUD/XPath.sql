IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.People_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[People_XPath];
   GO
/*  -- ====================================================================================
    -- People XPath Stored Procedures ([Application].[People_XPath])
    -- Generated on: 2019-08-10 17:06:29.409741
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[People_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [PersonID] int,
            [FullName] nvarchar(50),
            [PreferredName] nvarchar(50),
            [IsPermittedToLogon] bit,
            [LogonName] nvarchar(50),
            [IsExternalLogonProvider] bit,
            [IsSystemUser] bit,
            [IsEmployee] bit,
            [IsSalesperson] bit,
            [UserPreferences] nvarchar(max),
            [PhoneNumber] nvarchar(20),
            [FaxNumber] nvarchar(20),
            [EmailAddress] nvarchar(256),
            [CustomFields] nvarchar(max)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [PersonID] = [b].[value]('payload[1]/record[1]/PersonID', 'int') ,
               [FullName] = [b].[value]('payload[1]/record[1]/FullName', 'nvarchar(50)') ,
               [PreferredName] = [b].[value]('payload[1]/record[1]/PreferredName', 'nvarchar(50)') ,
               [IsPermittedToLogon] = [b].[value]('payload[1]/record[1]/IsPermittedToLogon', 'bit') ,
               [LogonName] = [b].[value]('payload[1]/record[1]/LogonName', 'nvarchar(50)') ,
               [IsExternalLogonProvider] = [b].[value]('payload[1]/record[1]/IsExternalLogonProvider', 'bit') ,
               [IsSystemUser] = [b].[value]('payload[1]/record[1]/IsSystemUser', 'bit') ,
               [IsEmployee] = [b].[value]('payload[1]/record[1]/IsEmployee', 'bit') ,
               [IsSalesperson] = [b].[value]('payload[1]/record[1]/IsSalesperson', 'bit') ,
               [UserPreferences] = [b].[value]('payload[1]/record[1]/UserPreferences', 'nvarchar(max)') ,
               [PhoneNumber] = [b].[value]('payload[1]/record[1]/PhoneNumber', 'nvarchar(20)') ,
               [FaxNumber] = [b].[value]('payload[1]/record[1]/FaxNumber', 'nvarchar(20)') ,
               [EmailAddress] = [b].[value]('payload[1]/record[1]/EmailAddress', 'nvarchar(256)') ,
               [CustomFields] = [b].[value]('payload[1]/record[1]/CustomFields', 'nvarchar(max)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.ColdRoomTemperatures_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[ColdRoomTemperatures_XPath];
   GO
/*  -- ====================================================================================
    -- ColdRoomTemperatures XPath Stored Procedures ([Warehouse].[ColdRoomTemperatures_XPath])
    -- Generated on: 2019-08-10 17:06:29.424774
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[ColdRoomTemperatures_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [ColdRoomTemperatureID] bigint,
            [ColdRoomSensorNumber] int,
            [RecordedWhen] datetime2(7),
            [Temperature] decimal(10, 2)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [ColdRoomTemperatureID],
            [ColdRoomSensorNumber],
            [RecordedWhen],
            [Temperature]
        )
        SELECT
               [ColdRoomTemperatureID] = [b].[value]('payload[1]/record[1]/ColdRoomTemperatureID', 'bigint') ,
               [ColdRoomSensorNumber] = [b].[value]('payload[1]/record[1]/ColdRoomSensorNumber', 'int') ,
               [RecordedWhen] = [b].[value]('payload[1]/record[1]/RecordedWhen', 'datetime2(7)') ,
               [Temperature] = [b].[value]('payload[1]/record[1]/Temperature', 'decimal(10, 2)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.VehicleTemperatures_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[VehicleTemperatures_XPath];
   GO
/*  -- ====================================================================================
    -- VehicleTemperatures XPath Stored Procedures ([Warehouse].[VehicleTemperatures_XPath])
    -- Generated on: 2019-08-10 17:06:29.436781
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[VehicleTemperatures_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [VehicleTemperatureID] bigint,
            [VehicleRegistration] nvarchar(20),
            [ChillerSensorNumber] int,
            [RecordedWhen] datetime2(7),
            [Temperature] decimal(10, 2),
            [IsCompressed] bit,
            [FullSensorData] nvarchar(1000)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [VehicleTemperatureID] = [b].[value]('payload[1]/record[1]/VehicleTemperatureID', 'bigint') ,
               [VehicleRegistration] = [b].[value]('payload[1]/record[1]/VehicleRegistration', 'nvarchar(20)') ,
               [ChillerSensorNumber] = [b].[value]('payload[1]/record[1]/ChillerSensorNumber', 'int') ,
               [RecordedWhen] = [b].[value]('payload[1]/record[1]/RecordedWhen', 'datetime2(7)') ,
               [Temperature] = [b].[value]('payload[1]/record[1]/Temperature', 'decimal(10, 2)') ,
               [IsCompressed] = [b].[value]('payload[1]/record[1]/IsCompressed', 'bit') ,
               [FullSensorData] = [b].[value]('payload[1]/record[1]/FullSensorData', 'nvarchar(1000)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Countries_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Countries_XPath];
   GO
/*  -- ====================================================================================
    -- Countries XPath Stored Procedures ([Application].[Countries_XPath])
    -- Generated on: 2019-08-10 17:06:29.450743
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[Countries_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [CountryID] int,
            [CountryName] nvarchar(60),
            [FormalName] nvarchar(60),
            [IsoAlpha3Code] nvarchar(3),
            [IsoNumericCode] int,
            [CountryType] nvarchar(20),
            [LatestRecordedPopulation] bigint,
            [Continent] nvarchar(30),
            [Region] nvarchar(30),
            [Subregion] nvarchar(30),
            [Border] geography
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [CountryID] = [b].[value]('payload[1]/record[1]/CountryID', 'int') ,
               [CountryName] = [b].[value]('payload[1]/record[1]/CountryName', 'nvarchar(60)') ,
               [FormalName] = [b].[value]('payload[1]/record[1]/FormalName', 'nvarchar(60)') ,
               [IsoAlpha3Code] = [b].[value]('payload[1]/record[1]/IsoAlpha3Code', 'nvarchar(3)') ,
               [IsoNumericCode] = [b].[value]('payload[1]/record[1]/IsoNumericCode', 'int') ,
               [CountryType] = [b].[value]('payload[1]/record[1]/CountryType', 'nvarchar(20)') ,
               [LatestRecordedPopulation] = [b].[value]('payload[1]/record[1]/LatestRecordedPopulation', 'bigint') ,
               [Continent] = [b].[value]('payload[1]/record[1]/Continent', 'nvarchar(30)') ,
               [Region] = [b].[value]('payload[1]/record[1]/Region', 'nvarchar(30)') ,
               [Subregion] = [b].[value]('payload[1]/record[1]/Subregion', 'nvarchar(30)') ,
               [Border] = [b].[value]('payload[1]/record[1]/Border', 'geography') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.DeliveryMethods_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[DeliveryMethods_XPath];
   GO
/*  -- ====================================================================================
    -- DeliveryMethods XPath Stored Procedures ([Application].[DeliveryMethods_XPath])
    -- Generated on: 2019-08-10 17:06:29.465777
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[DeliveryMethods_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [DeliveryMethodID] int,
            [DeliveryMethodName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [DeliveryMethodID],
            [DeliveryMethodName]
        )
        SELECT
               [DeliveryMethodID] = [b].[value]('payload[1]/record[1]/DeliveryMethodID', 'int') ,
               [DeliveryMethodName] = [b].[value]('payload[1]/record[1]/DeliveryMethodName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.PaymentMethods_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[PaymentMethods_XPath];
   GO
/*  -- ====================================================================================
    -- PaymentMethods XPath Stored Procedures ([Application].[PaymentMethods_XPath])
    -- Generated on: 2019-08-10 17:06:29.478653
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[PaymentMethods_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [PaymentMethodID] int,
            [PaymentMethodName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [PaymentMethodID],
            [PaymentMethodName]
        )
        SELECT
               [PaymentMethodID] = [b].[value]('payload[1]/record[1]/PaymentMethodID', 'int') ,
               [PaymentMethodName] = [b].[value]('payload[1]/record[1]/PaymentMethodName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.TransactionTypes_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[TransactionTypes_XPath];
   GO
/*  -- ====================================================================================
    -- TransactionTypes XPath Stored Procedures ([Application].[TransactionTypes_XPath])
    -- Generated on: 2019-08-10 17:06:29.491330
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[TransactionTypes_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [TransactionTypeID] int,
            [TransactionTypeName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [TransactionTypeID],
            [TransactionTypeName]
        )
        SELECT
               [TransactionTypeID] = [b].[value]('payload[1]/record[1]/TransactionTypeID', 'int') ,
               [TransactionTypeName] = [b].[value]('payload[1]/record[1]/TransactionTypeName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierCategories_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierCategories_XPath];
   GO
/*  -- ====================================================================================
    -- SupplierCategories XPath Stored Procedures ([Purchasing].[SupplierCategories_XPath])
    -- Generated on: 2019-08-10 17:06:29.503330
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Purchasing].[SupplierCategories_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [SupplierCategoryID] int,
            [SupplierCategoryName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [SupplierCategoryID],
            [SupplierCategoryName]
        )
        SELECT
               [SupplierCategoryID] = [b].[value]('payload[1]/record[1]/SupplierCategoryID', 'int') ,
               [SupplierCategoryName] = [b].[value]('payload[1]/record[1]/SupplierCategoryName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.BuyingGroups_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[BuyingGroups_XPath];
   GO
/*  -- ====================================================================================
    -- BuyingGroups XPath Stored Procedures ([Sales].[BuyingGroups_XPath])
    -- Generated on: 2019-08-10 17:06:29.515330
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[BuyingGroups_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [BuyingGroupID] int,
            [BuyingGroupName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [BuyingGroupID],
            [BuyingGroupName]
        )
        SELECT
               [BuyingGroupID] = [b].[value]('payload[1]/record[1]/BuyingGroupID', 'int') ,
               [BuyingGroupName] = [b].[value]('payload[1]/record[1]/BuyingGroupName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerCategories_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerCategories_XPath];
   GO
/*  -- ====================================================================================
    -- CustomerCategories XPath Stored Procedures ([Sales].[CustomerCategories_XPath])
    -- Generated on: 2019-08-10 17:06:29.529078
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[CustomerCategories_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [CustomerCategoryID] int,
            [CustomerCategoryName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [CustomerCategoryID],
            [CustomerCategoryName]
        )
        SELECT
               [CustomerCategoryID] = [b].[value]('payload[1]/record[1]/CustomerCategoryID', 'int') ,
               [CustomerCategoryName] = [b].[value]('payload[1]/record[1]/CustomerCategoryName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.Colors_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[Colors_XPath];
   GO
/*  -- ====================================================================================
    -- Colors XPath Stored Procedures ([Warehouse].[Colors_XPath])
    -- Generated on: 2019-08-10 17:06:29.541647
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[Colors_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [ColorID] int,
            [ColorName] nvarchar(20)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [ColorID],
            [ColorName]
        )
        SELECT
               [ColorID] = [b].[value]('payload[1]/record[1]/ColorID', 'int') ,
               [ColorName] = [b].[value]('payload[1]/record[1]/ColorName', 'nvarchar(20)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.PackageTypes_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[PackageTypes_XPath];
   GO
/*  -- ====================================================================================
    -- PackageTypes XPath Stored Procedures ([Warehouse].[PackageTypes_XPath])
    -- Generated on: 2019-08-10 17:06:29.554957
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[PackageTypes_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [PackageTypeID] int,
            [PackageTypeName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [PackageTypeID],
            [PackageTypeName]
        )
        SELECT
               [PackageTypeID] = [b].[value]('payload[1]/record[1]/PackageTypeID', 'int') ,
               [PackageTypeName] = [b].[value]('payload[1]/record[1]/PackageTypeName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockGroups_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockGroups_XPath];
   GO
/*  -- ====================================================================================
    -- StockGroups XPath Stored Procedures ([Warehouse].[StockGroups_XPath])
    -- Generated on: 2019-08-10 17:06:29.569144
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[StockGroups_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [StockGroupID] int,
            [StockGroupName] nvarchar(50)
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [StockGroupID],
            [StockGroupName]
        )
        SELECT
               [StockGroupID] = [b].[value]('payload[1]/record[1]/StockGroupID', 'int') ,
               [StockGroupName] = [b].[value]('payload[1]/record[1]/StockGroupName', 'nvarchar(50)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.StateProvinces_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[StateProvinces_XPath];
   GO
/*  -- ====================================================================================
    -- StateProvinces XPath Stored Procedures ([Application].[StateProvinces_XPath])
    -- Generated on: 2019-08-10 17:06:29.582325
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[StateProvinces_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [StateProvinceID] int,
            [StateProvinceCode] nvarchar(5),
            [StateProvinceName] nvarchar(50),
            [CountryID] int,
            [SalesTerritory] nvarchar(50),
            [Border] geography,
            [LatestRecordedPopulation] bigint
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [StateProvinceID] = [b].[value]('payload[1]/record[1]/StateProvinceID', 'int') ,
               [StateProvinceCode] = [b].[value]('payload[1]/record[1]/StateProvinceCode', 'nvarchar(5)') ,
               [StateProvinceName] = [b].[value]('payload[1]/record[1]/StateProvinceName', 'nvarchar(50)') ,
               [CountryID] = [b].[value]('payload[1]/record[1]/CountryID', 'int') ,
               [SalesTerritory] = [b].[value]('payload[1]/record[1]/SalesTerritory', 'nvarchar(50)') ,
               [Border] = [b].[value]('payload[1]/record[1]/Border', 'geography') ,
               [LatestRecordedPopulation] = [b].[value]('payload[1]/record[1]/LatestRecordedPopulation', 'bigint') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.Cities_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[Cities_XPath];
   GO
/*  -- ====================================================================================
    -- Cities XPath Stored Procedures ([Application].[Cities_XPath])
    -- Generated on: 2019-08-10 17:06:29.595311
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[Cities_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [CityID] int,
            [CityName] nvarchar(50),
            [StateProvinceID] int,
            [Location] geography,
            [LatestRecordedPopulation] bigint
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [CityID],
            [CityName],
            [StateProvinceID],
            [Location],
            [LatestRecordedPopulation]
        )
        SELECT
               [CityID] = [b].[value]('payload[1]/record[1]/CityID', 'int') ,
               [CityName] = [b].[value]('payload[1]/record[1]/CityName', 'nvarchar(50)') ,
               [StateProvinceID] = [b].[value]('payload[1]/record[1]/StateProvinceID', 'int') ,
               [Location] = [b].[value]('payload[1]/record[1]/Location', 'geography') ,
               [LatestRecordedPopulation] = [b].[value]('payload[1]/record[1]/LatestRecordedPopulation', 'bigint') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Application.SystemParameters_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Application].[SystemParameters_XPath];
   GO
/*  -- ====================================================================================
    -- SystemParameters XPath Stored Procedures ([Application].[SystemParameters_XPath])
    -- Generated on: 2019-08-10 17:06:29.608311
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Application].[SystemParameters_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [SystemParameterID] int,
            [DeliveryAddressLine1] nvarchar(60),
            [DeliveryAddressLine2] nvarchar(60),
            [DeliveryCityID] int,
            [DeliveryPostalCode] nvarchar(10),
            [DeliveryLocation] geography,
            [PostalAddressLine1] nvarchar(60),
            [PostalAddressLine2] nvarchar(60),
            [PostalCityID] int,
            [PostalPostalCode] nvarchar(10),
            [ApplicationSettings] nvarchar(max)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [SystemParameterID] = [b].[value]('payload[1]/record[1]/SystemParameterID', 'int') ,
               [DeliveryAddressLine1] = [b].[value]('payload[1]/record[1]/DeliveryAddressLine1', 'nvarchar(60)') ,
               [DeliveryAddressLine2] = [b].[value]('payload[1]/record[1]/DeliveryAddressLine2', 'nvarchar(60)') ,
               [DeliveryCityID] = [b].[value]('payload[1]/record[1]/DeliveryCityID', 'int') ,
               [DeliveryPostalCode] = [b].[value]('payload[1]/record[1]/DeliveryPostalCode', 'nvarchar(10)') ,
               [DeliveryLocation] = [b].[value]('payload[1]/record[1]/DeliveryLocation', 'geography') ,
               [PostalAddressLine1] = [b].[value]('payload[1]/record[1]/PostalAddressLine1', 'nvarchar(60)') ,
               [PostalAddressLine2] = [b].[value]('payload[1]/record[1]/PostalAddressLine2', 'nvarchar(60)') ,
               [PostalCityID] = [b].[value]('payload[1]/record[1]/PostalCityID', 'int') ,
               [PostalPostalCode] = [b].[value]('payload[1]/record[1]/PostalPostalCode', 'nvarchar(10)') ,
               [ApplicationSettings] = [b].[value]('payload[1]/record[1]/ApplicationSettings', 'nvarchar(max)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.Suppliers_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[Suppliers_XPath];
   GO
/*  -- ====================================================================================
    -- Suppliers XPath Stored Procedures ([Purchasing].[Suppliers_XPath])
    -- Generated on: 2019-08-10 17:06:29.621779
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Purchasing].[Suppliers_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [SupplierID] int,
            [SupplierName] nvarchar(100),
            [SupplierCategoryID] int,
            [PrimaryContactPersonID] int,
            [AlternateContactPersonID] int,
            [DeliveryMethodID] int,
            [DeliveryCityID] int,
            [PostalCityID] int,
            [SupplierReference] nvarchar(20),
            [BankAccountName] nvarchar(50),
            [BankAccountBranch] nvarchar(50),
            [BankAccountCode] nvarchar(20),
            [BankAccountNumber] nvarchar(20),
            [BankInternationalCode] nvarchar(20),
            [PaymentDays] int,
            [InternalComments] nvarchar(max),
            [PhoneNumber] nvarchar(20),
            [FaxNumber] nvarchar(20),
            [WebsiteURL] nvarchar(256),
            [DeliveryAddressLine1] nvarchar(60),
            [DeliveryAddressLine2] nvarchar(60),
            [DeliveryPostalCode] nvarchar(10),
            [DeliveryLocation] geography,
            [PostalAddressLine1] nvarchar(60),
            [PostalAddressLine2] nvarchar(60),
            [PostalPostalCode] nvarchar(10)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [SupplierID] = [b].[value]('payload[1]/record[1]/SupplierID', 'int') ,
               [SupplierName] = [b].[value]('payload[1]/record[1]/SupplierName', 'nvarchar(100)') ,
               [SupplierCategoryID] = [b].[value]('payload[1]/record[1]/SupplierCategoryID', 'int') ,
               [PrimaryContactPersonID] = [b].[value]('payload[1]/record[1]/PrimaryContactPersonID', 'int') ,
               [AlternateContactPersonID] = [b].[value]('payload[1]/record[1]/AlternateContactPersonID', 'int') ,
               [DeliveryMethodID] = [b].[value]('payload[1]/record[1]/DeliveryMethodID', 'int') ,
               [DeliveryCityID] = [b].[value]('payload[1]/record[1]/DeliveryCityID', 'int') ,
               [PostalCityID] = [b].[value]('payload[1]/record[1]/PostalCityID', 'int') ,
               [SupplierReference] = [b].[value]('payload[1]/record[1]/SupplierReference', 'nvarchar(20)') ,
               [BankAccountName] = [b].[value]('payload[1]/record[1]/BankAccountName', 'nvarchar(50)') ,
               [BankAccountBranch] = [b].[value]('payload[1]/record[1]/BankAccountBranch', 'nvarchar(50)') ,
               [BankAccountCode] = [b].[value]('payload[1]/record[1]/BankAccountCode', 'nvarchar(20)') ,
               [BankAccountNumber] = [b].[value]('payload[1]/record[1]/BankAccountNumber', 'nvarchar(20)') ,
               [BankInternationalCode] = [b].[value]('payload[1]/record[1]/BankInternationalCode', 'nvarchar(20)') ,
               [PaymentDays] = [b].[value]('payload[1]/record[1]/PaymentDays', 'int') ,
               [InternalComments] = [b].[value]('payload[1]/record[1]/InternalComments', 'nvarchar(max)') ,
               [PhoneNumber] = [b].[value]('payload[1]/record[1]/PhoneNumber', 'nvarchar(20)') ,
               [FaxNumber] = [b].[value]('payload[1]/record[1]/FaxNumber', 'nvarchar(20)') ,
               [WebsiteURL] = [b].[value]('payload[1]/record[1]/WebsiteURL', 'nvarchar(256)') ,
               [DeliveryAddressLine1] = [b].[value]('payload[1]/record[1]/DeliveryAddressLine1', 'nvarchar(60)') ,
               [DeliveryAddressLine2] = [b].[value]('payload[1]/record[1]/DeliveryAddressLine2', 'nvarchar(60)') ,
               [DeliveryPostalCode] = [b].[value]('payload[1]/record[1]/DeliveryPostalCode', 'nvarchar(10)') ,
               [DeliveryLocation] = [b].[value]('payload[1]/record[1]/DeliveryLocation', 'geography') ,
               [PostalAddressLine1] = [b].[value]('payload[1]/record[1]/PostalAddressLine1', 'nvarchar(60)') ,
               [PostalAddressLine2] = [b].[value]('payload[1]/record[1]/PostalAddressLine2', 'nvarchar(60)') ,
               [PostalPostalCode] = [b].[value]('payload[1]/record[1]/PostalPostalCode', 'nvarchar(10)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Customers_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Customers_XPath];
   GO
/*  -- ====================================================================================
    -- Customers XPath Stored Procedures ([Sales].[Customers_XPath])
    -- Generated on: 2019-08-10 17:06:29.634809
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[Customers_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [CustomerID] int,
            [CustomerName] nvarchar(100),
            [BillToCustomerID] int,
            [CustomerCategoryID] int,
            [BuyingGroupID] int,
            [PrimaryContactPersonID] int,
            [AlternateContactPersonID] int,
            [DeliveryMethodID] int,
            [DeliveryCityID] int,
            [PostalCityID] int,
            [CreditLimit] decimal(18, 2),
            [AccountOpenedDate] date,
            [StandardDiscountPercentage] decimal(18, 3),
            [IsStatementSent] bit,
            [IsOnCreditHold] bit,
            [PaymentDays] int,
            [PhoneNumber] nvarchar(20),
            [FaxNumber] nvarchar(20),
            [DeliveryRun] nvarchar(5),
            [RunPosition] nvarchar(5),
            [WebsiteURL] nvarchar(256),
            [DeliveryAddressLine1] nvarchar(60),
            [DeliveryAddressLine2] nvarchar(60),
            [DeliveryPostalCode] nvarchar(10),
            [DeliveryLocation] geography,
            [PostalAddressLine1] nvarchar(60),
            [PostalAddressLine2] nvarchar(60),
            [PostalPostalCode] nvarchar(10)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [CustomerID] = [b].[value]('payload[1]/record[1]/CustomerID', 'int') ,
               [CustomerName] = [b].[value]('payload[1]/record[1]/CustomerName', 'nvarchar(100)') ,
               [BillToCustomerID] = [b].[value]('payload[1]/record[1]/BillToCustomerID', 'int') ,
               [CustomerCategoryID] = [b].[value]('payload[1]/record[1]/CustomerCategoryID', 'int') ,
               [BuyingGroupID] = [b].[value]('payload[1]/record[1]/BuyingGroupID', 'int') ,
               [PrimaryContactPersonID] = [b].[value]('payload[1]/record[1]/PrimaryContactPersonID', 'int') ,
               [AlternateContactPersonID] = [b].[value]('payload[1]/record[1]/AlternateContactPersonID', 'int') ,
               [DeliveryMethodID] = [b].[value]('payload[1]/record[1]/DeliveryMethodID', 'int') ,
               [DeliveryCityID] = [b].[value]('payload[1]/record[1]/DeliveryCityID', 'int') ,
               [PostalCityID] = [b].[value]('payload[1]/record[1]/PostalCityID', 'int') ,
               [CreditLimit] = [b].[value]('payload[1]/record[1]/CreditLimit', 'decimal(18, 2)') ,
               [AccountOpenedDate] = [b].[value]('payload[1]/record[1]/AccountOpenedDate', 'date') ,
               [StandardDiscountPercentage] = [b].[value]('payload[1]/record[1]/StandardDiscountPercentage', 'decimal(18, 3)') ,
               [IsStatementSent] = [b].[value]('payload[1]/record[1]/IsStatementSent', 'bit') ,
               [IsOnCreditHold] = [b].[value]('payload[1]/record[1]/IsOnCreditHold', 'bit') ,
               [PaymentDays] = [b].[value]('payload[1]/record[1]/PaymentDays', 'int') ,
               [PhoneNumber] = [b].[value]('payload[1]/record[1]/PhoneNumber', 'nvarchar(20)') ,
               [FaxNumber] = [b].[value]('payload[1]/record[1]/FaxNumber', 'nvarchar(20)') ,
               [DeliveryRun] = [b].[value]('payload[1]/record[1]/DeliveryRun', 'nvarchar(5)') ,
               [RunPosition] = [b].[value]('payload[1]/record[1]/RunPosition', 'nvarchar(5)') ,
               [WebsiteURL] = [b].[value]('payload[1]/record[1]/WebsiteURL', 'nvarchar(256)') ,
               [DeliveryAddressLine1] = [b].[value]('payload[1]/record[1]/DeliveryAddressLine1', 'nvarchar(60)') ,
               [DeliveryAddressLine2] = [b].[value]('payload[1]/record[1]/DeliveryAddressLine2', 'nvarchar(60)') ,
               [DeliveryPostalCode] = [b].[value]('payload[1]/record[1]/DeliveryPostalCode', 'nvarchar(10)') ,
               [DeliveryLocation] = [b].[value]('payload[1]/record[1]/DeliveryLocation', 'geography') ,
               [PostalAddressLine1] = [b].[value]('payload[1]/record[1]/PostalAddressLine1', 'nvarchar(60)') ,
               [PostalAddressLine2] = [b].[value]('payload[1]/record[1]/PostalAddressLine2', 'nvarchar(60)') ,
               [PostalPostalCode] = [b].[value]('payload[1]/record[1]/PostalPostalCode', 'nvarchar(10)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrders_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrders_XPath];
   GO
/*  -- ====================================================================================
    -- PurchaseOrders XPath Stored Procedures ([Purchasing].[PurchaseOrders_XPath])
    -- Generated on: 2019-08-10 17:06:29.649811
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Purchasing].[PurchaseOrders_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [PurchaseOrderID] int,
            [SupplierID] int,
            [OrderDate] date,
            [DeliveryMethodID] int,
            [ContactPersonID] int,
            [ExpectedDeliveryDate] date,
            [SupplierReference] nvarchar(20),
            [IsOrderFinalized] bit,
            [Comments] nvarchar(max),
            [InternalComments] nvarchar(max)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [PurchaseOrderID] = [b].[value]('payload[1]/record[1]/PurchaseOrderID', 'int') ,
               [SupplierID] = [b].[value]('payload[1]/record[1]/SupplierID', 'int') ,
               [OrderDate] = [b].[value]('payload[1]/record[1]/OrderDate', 'date') ,
               [DeliveryMethodID] = [b].[value]('payload[1]/record[1]/DeliveryMethodID', 'int') ,
               [ContactPersonID] = [b].[value]('payload[1]/record[1]/ContactPersonID', 'int') ,
               [ExpectedDeliveryDate] = [b].[value]('payload[1]/record[1]/ExpectedDeliveryDate', 'date') ,
               [SupplierReference] = [b].[value]('payload[1]/record[1]/SupplierReference', 'nvarchar(20)') ,
               [IsOrderFinalized] = [b].[value]('payload[1]/record[1]/IsOrderFinalized', 'bit') ,
               [Comments] = [b].[value]('payload[1]/record[1]/Comments', 'nvarchar(max)') ,
               [InternalComments] = [b].[value]('payload[1]/record[1]/InternalComments', 'nvarchar(max)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Orders_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Orders_XPath];
   GO
/*  -- ====================================================================================
    -- Orders XPath Stored Procedures ([Sales].[Orders_XPath])
    -- Generated on: 2019-08-10 17:06:29.665602
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[Orders_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [OrderID] int,
            [CustomerID] int,
            [SalespersonPersonID] int,
            [PickedByPersonID] int,
            [ContactPersonID] int,
            [BackorderOrderID] int,
            [OrderDate] date,
            [ExpectedDeliveryDate] date,
            [CustomerPurchaseOrderNumber] nvarchar(20),
            [IsUndersupplyBackordered] bit,
            [Comments] nvarchar(max),
            [DeliveryInstructions] nvarchar(max),
            [InternalComments] nvarchar(max),
            [PickingCompletedWhen] datetime2(7)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [OrderID] = [b].[value]('payload[1]/record[1]/OrderID', 'int') ,
               [CustomerID] = [b].[value]('payload[1]/record[1]/CustomerID', 'int') ,
               [SalespersonPersonID] = [b].[value]('payload[1]/record[1]/SalespersonPersonID', 'int') ,
               [PickedByPersonID] = [b].[value]('payload[1]/record[1]/PickedByPersonID', 'int') ,
               [ContactPersonID] = [b].[value]('payload[1]/record[1]/ContactPersonID', 'int') ,
               [BackorderOrderID] = [b].[value]('payload[1]/record[1]/BackorderOrderID', 'int') ,
               [OrderDate] = [b].[value]('payload[1]/record[1]/OrderDate', 'date') ,
               [ExpectedDeliveryDate] = [b].[value]('payload[1]/record[1]/ExpectedDeliveryDate', 'date') ,
               [CustomerPurchaseOrderNumber] = [b].[value]('payload[1]/record[1]/CustomerPurchaseOrderNumber', 'nvarchar(20)') ,
               [IsUndersupplyBackordered] = [b].[value]('payload[1]/record[1]/IsUndersupplyBackordered', 'bit') ,
               [Comments] = [b].[value]('payload[1]/record[1]/Comments', 'nvarchar(max)') ,
               [DeliveryInstructions] = [b].[value]('payload[1]/record[1]/DeliveryInstructions', 'nvarchar(max)') ,
               [InternalComments] = [b].[value]('payload[1]/record[1]/InternalComments', 'nvarchar(max)') ,
               [PickingCompletedWhen] = [b].[value]('payload[1]/record[1]/PickingCompletedWhen', 'datetime2(7)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItems_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItems_XPath];
   GO
/*  -- ====================================================================================
    -- StockItems XPath Stored Procedures ([Warehouse].[StockItems_XPath])
    -- Generated on: 2019-08-10 17:06:29.678601
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[StockItems_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [StockItemID] int,
            [StockItemName] nvarchar(100),
            [SupplierID] int,
            [ColorID] int,
            [UnitPackageID] int,
            [OuterPackageID] int,
            [Brand] nvarchar(50),
            [Size] nvarchar(20),
            [LeadTimeDays] int,
            [QuantityPerOuter] int,
            [IsChillerStock] bit,
            [Barcode] nvarchar(50),
            [TaxRate] decimal(18, 3),
            [UnitPrice] decimal(18, 2),
            [RecommendedRetailPrice] decimal(18, 2),
            [TypicalWeightPerUnit] decimal(18, 3),
            [MarketingComments] nvarchar(max),
            [InternalComments] nvarchar(max),
            [CustomFields] nvarchar(max)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [StockItemName] = [b].[value]('payload[1]/record[1]/StockItemName', 'nvarchar(100)') ,
               [SupplierID] = [b].[value]('payload[1]/record[1]/SupplierID', 'int') ,
               [ColorID] = [b].[value]('payload[1]/record[1]/ColorID', 'int') ,
               [UnitPackageID] = [b].[value]('payload[1]/record[1]/UnitPackageID', 'int') ,
               [OuterPackageID] = [b].[value]('payload[1]/record[1]/OuterPackageID', 'int') ,
               [Brand] = [b].[value]('payload[1]/record[1]/Brand', 'nvarchar(50)') ,
               [Size] = [b].[value]('payload[1]/record[1]/Size', 'nvarchar(20)') ,
               [LeadTimeDays] = [b].[value]('payload[1]/record[1]/LeadTimeDays', 'int') ,
               [QuantityPerOuter] = [b].[value]('payload[1]/record[1]/QuantityPerOuter', 'int') ,
               [IsChillerStock] = [b].[value]('payload[1]/record[1]/IsChillerStock', 'bit') ,
               [Barcode] = [b].[value]('payload[1]/record[1]/Barcode', 'nvarchar(50)') ,
               [TaxRate] = [b].[value]('payload[1]/record[1]/TaxRate', 'decimal(18, 3)') ,
               [UnitPrice] = [b].[value]('payload[1]/record[1]/UnitPrice', 'decimal(18, 2)') ,
               [RecommendedRetailPrice] = [b].[value]('payload[1]/record[1]/RecommendedRetailPrice', 'decimal(18, 2)') ,
               [TypicalWeightPerUnit] = [b].[value]('payload[1]/record[1]/TypicalWeightPerUnit', 'decimal(18, 3)') ,
               [MarketingComments] = [b].[value]('payload[1]/record[1]/MarketingComments', 'nvarchar(max)') ,
               [InternalComments] = [b].[value]('payload[1]/record[1]/InternalComments', 'nvarchar(max)') ,
               [CustomFields] = [b].[value]('payload[1]/record[1]/CustomFields', 'nvarchar(max)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemHoldings_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemHoldings_XPath];
   GO
/*  -- ====================================================================================
    -- StockItemHoldings XPath Stored Procedures ([Warehouse].[StockItemHoldings_XPath])
    -- Generated on: 2019-08-10 17:06:29.692601
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[StockItemHoldings_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [StockItemID] int,
            [QuantityOnHand] int,
            [BinLocation] nvarchar(20),
            [LastStocktakeQuantity] int,
            [LastCostPrice] decimal(18, 2),
            [ReorderLevel] int,
            [TargetStockLevel] int
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [QuantityOnHand] = [b].[value]('payload[1]/record[1]/QuantityOnHand', 'int') ,
               [BinLocation] = [b].[value]('payload[1]/record[1]/BinLocation', 'nvarchar(20)') ,
               [LastStocktakeQuantity] = [b].[value]('payload[1]/record[1]/LastStocktakeQuantity', 'int') ,
               [LastCostPrice] = [b].[value]('payload[1]/record[1]/LastCostPrice', 'decimal(18, 2)') ,
               [ReorderLevel] = [b].[value]('payload[1]/record[1]/ReorderLevel', 'int') ,
               [TargetStockLevel] = [b].[value]('payload[1]/record[1]/TargetStockLevel', 'int') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.PurchaseOrderLines_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[PurchaseOrderLines_XPath];
   GO
/*  -- ====================================================================================
    -- PurchaseOrderLines XPath Stored Procedures ([Purchasing].[PurchaseOrderLines_XPath])
    -- Generated on: 2019-08-10 17:06:29.705601
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Purchasing].[PurchaseOrderLines_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [PurchaseOrderLineID] int,
            [PurchaseOrderID] int,
            [StockItemID] int,
            [OrderedOuters] int,
            [Description] nvarchar(100),
            [ReceivedOuters] int,
            [PackageTypeID] int,
            [ExpectedUnitPricePerOuter] decimal(18, 2),
            [LastReceiptDate] date,
            [IsOrderLineFinalized] bit
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [PurchaseOrderLineID] = [b].[value]('payload[1]/record[1]/PurchaseOrderLineID', 'int') ,
               [PurchaseOrderID] = [b].[value]('payload[1]/record[1]/PurchaseOrderID', 'int') ,
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [OrderedOuters] = [b].[value]('payload[1]/record[1]/OrderedOuters', 'int') ,
               [Description] = [b].[value]('payload[1]/record[1]/Description', 'nvarchar(100)') ,
               [ReceivedOuters] = [b].[value]('payload[1]/record[1]/ReceivedOuters', 'int') ,
               [PackageTypeID] = [b].[value]('payload[1]/record[1]/PackageTypeID', 'int') ,
               [ExpectedUnitPricePerOuter] = [b].[value]('payload[1]/record[1]/ExpectedUnitPricePerOuter', 'decimal(18, 2)') ,
               [LastReceiptDate] = [b].[value]('payload[1]/record[1]/LastReceiptDate', 'date') ,
               [IsOrderLineFinalized] = [b].[value]('payload[1]/record[1]/IsOrderLineFinalized', 'bit') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Purchasing.SupplierTransactions_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Purchasing].[SupplierTransactions_XPath];
   GO
/*  -- ====================================================================================
    -- SupplierTransactions XPath Stored Procedures ([Purchasing].[SupplierTransactions_XPath])
    -- Generated on: 2019-08-10 17:06:29.718665
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Purchasing].[SupplierTransactions_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [SupplierTransactionID] int,
            [SupplierID] int,
            [TransactionTypeID] int,
            [PurchaseOrderID] int,
            [PaymentMethodID] int,
            [SupplierInvoiceNumber] nvarchar(20),
            [TransactionDate] date,
            [AmountExcludingTax] decimal(18, 2),
            [TaxAmount] decimal(18, 2),
            [TransactionAmount] decimal(18, 2),
            [OutstandingBalance] decimal(18, 2),
            [FinalizationDate] date
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [SupplierTransactionID] = [b].[value]('payload[1]/record[1]/SupplierTransactionID', 'int') ,
               [SupplierID] = [b].[value]('payload[1]/record[1]/SupplierID', 'int') ,
               [TransactionTypeID] = [b].[value]('payload[1]/record[1]/TransactionTypeID', 'int') ,
               [PurchaseOrderID] = [b].[value]('payload[1]/record[1]/PurchaseOrderID', 'int') ,
               [PaymentMethodID] = [b].[value]('payload[1]/record[1]/PaymentMethodID', 'int') ,
               [SupplierInvoiceNumber] = [b].[value]('payload[1]/record[1]/SupplierInvoiceNumber', 'nvarchar(20)') ,
               [TransactionDate] = [b].[value]('payload[1]/record[1]/TransactionDate', 'date') ,
               [AmountExcludingTax] = [b].[value]('payload[1]/record[1]/AmountExcludingTax', 'decimal(18, 2)') ,
               [TaxAmount] = [b].[value]('payload[1]/record[1]/TaxAmount', 'decimal(18, 2)') ,
               [TransactionAmount] = [b].[value]('payload[1]/record[1]/TransactionAmount', 'decimal(18, 2)') ,
               [OutstandingBalance] = [b].[value]('payload[1]/record[1]/OutstandingBalance', 'decimal(18, 2)') ,
               [FinalizationDate] = [b].[value]('payload[1]/record[1]/FinalizationDate', 'date') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.SpecialDeals_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[SpecialDeals_XPath];
   GO
/*  -- ====================================================================================
    -- SpecialDeals XPath Stored Procedures ([Sales].[SpecialDeals_XPath])
    -- Generated on: 2019-08-10 17:06:29.732664
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[SpecialDeals_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [SpecialDealID] int,
            [StockItemID] int,
            [CustomerID] int,
            [BuyingGroupID] int,
            [CustomerCategoryID] int,
            [StockGroupID] int,
            [DealDescription] nvarchar(30),
            [StartDate] date,
            [EndDate] date,
            [DiscountAmount] decimal(18, 2),
            [DiscountPercentage] decimal(18, 3),
            [UnitPrice] decimal(18, 2)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [SpecialDealID] = [b].[value]('payload[1]/record[1]/SpecialDealID', 'int') ,
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [CustomerID] = [b].[value]('payload[1]/record[1]/CustomerID', 'int') ,
               [BuyingGroupID] = [b].[value]('payload[1]/record[1]/BuyingGroupID', 'int') ,
               [CustomerCategoryID] = [b].[value]('payload[1]/record[1]/CustomerCategoryID', 'int') ,
               [StockGroupID] = [b].[value]('payload[1]/record[1]/StockGroupID', 'int') ,
               [DealDescription] = [b].[value]('payload[1]/record[1]/DealDescription', 'nvarchar(30)') ,
               [StartDate] = [b].[value]('payload[1]/record[1]/StartDate', 'date') ,
               [EndDate] = [b].[value]('payload[1]/record[1]/EndDate', 'date') ,
               [DiscountAmount] = [b].[value]('payload[1]/record[1]/DiscountAmount', 'decimal(18, 2)') ,
               [DiscountPercentage] = [b].[value]('payload[1]/record[1]/DiscountPercentage', 'decimal(18, 3)') ,
               [UnitPrice] = [b].[value]('payload[1]/record[1]/UnitPrice', 'decimal(18, 2)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.Invoices_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[Invoices_XPath];
   GO
/*  -- ====================================================================================
    -- Invoices XPath Stored Procedures ([Sales].[Invoices_XPath])
    -- Generated on: 2019-08-10 17:06:29.747118
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[Invoices_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [InvoiceID] int,
            [CustomerID] int,
            [BillToCustomerID] int,
            [OrderID] int,
            [DeliveryMethodID] int,
            [ContactPersonID] int,
            [AccountsPersonID] int,
            [SalespersonPersonID] int,
            [PackedByPersonID] int,
            [InvoiceDate] date,
            [CustomerPurchaseOrderNumber] nvarchar(20),
            [IsCreditNote] bit,
            [CreditNoteReason] nvarchar(max),
            [Comments] nvarchar(max),
            [DeliveryInstructions] nvarchar(max),
            [InternalComments] nvarchar(max),
            [TotalDryItems] int,
            [TotalChillerItems] int,
            [DeliveryRun] nvarchar(5),
            [RunPosition] nvarchar(5),
            [ReturnedDeliveryData] nvarchar(max)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [InvoiceID] = [b].[value]('payload[1]/record[1]/InvoiceID', 'int') ,
               [CustomerID] = [b].[value]('payload[1]/record[1]/CustomerID', 'int') ,
               [BillToCustomerID] = [b].[value]('payload[1]/record[1]/BillToCustomerID', 'int') ,
               [OrderID] = [b].[value]('payload[1]/record[1]/OrderID', 'int') ,
               [DeliveryMethodID] = [b].[value]('payload[1]/record[1]/DeliveryMethodID', 'int') ,
               [ContactPersonID] = [b].[value]('payload[1]/record[1]/ContactPersonID', 'int') ,
               [AccountsPersonID] = [b].[value]('payload[1]/record[1]/AccountsPersonID', 'int') ,
               [SalespersonPersonID] = [b].[value]('payload[1]/record[1]/SalespersonPersonID', 'int') ,
               [PackedByPersonID] = [b].[value]('payload[1]/record[1]/PackedByPersonID', 'int') ,
               [InvoiceDate] = [b].[value]('payload[1]/record[1]/InvoiceDate', 'date') ,
               [CustomerPurchaseOrderNumber] = [b].[value]('payload[1]/record[1]/CustomerPurchaseOrderNumber', 'nvarchar(20)') ,
               [IsCreditNote] = [b].[value]('payload[1]/record[1]/IsCreditNote', 'bit') ,
               [CreditNoteReason] = [b].[value]('payload[1]/record[1]/CreditNoteReason', 'nvarchar(max)') ,
               [Comments] = [b].[value]('payload[1]/record[1]/Comments', 'nvarchar(max)') ,
               [DeliveryInstructions] = [b].[value]('payload[1]/record[1]/DeliveryInstructions', 'nvarchar(max)') ,
               [InternalComments] = [b].[value]('payload[1]/record[1]/InternalComments', 'nvarchar(max)') ,
               [TotalDryItems] = [b].[value]('payload[1]/record[1]/TotalDryItems', 'int') ,
               [TotalChillerItems] = [b].[value]('payload[1]/record[1]/TotalChillerItems', 'int') ,
               [DeliveryRun] = [b].[value]('payload[1]/record[1]/DeliveryRun', 'nvarchar(5)') ,
               [RunPosition] = [b].[value]('payload[1]/record[1]/RunPosition', 'nvarchar(5)') ,
               [ReturnedDeliveryData] = [b].[value]('payload[1]/record[1]/ReturnedDeliveryData', 'nvarchar(max)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.OrderLines_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[OrderLines_XPath];
   GO
/*  -- ====================================================================================
    -- OrderLines XPath Stored Procedures ([Sales].[OrderLines_XPath])
    -- Generated on: 2019-08-10 17:06:29.761204
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[OrderLines_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [OrderLineID] int,
            [OrderID] int,
            [StockItemID] int,
            [Description] nvarchar(100),
            [PackageTypeID] int,
            [Quantity] int,
            [UnitPrice] decimal(18, 2),
            [TaxRate] decimal(18, 3),
            [PickedQuantity] int,
            [PickingCompletedWhen] datetime2(7)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [OrderLineID] = [b].[value]('payload[1]/record[1]/OrderLineID', 'int') ,
               [OrderID] = [b].[value]('payload[1]/record[1]/OrderID', 'int') ,
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [Description] = [b].[value]('payload[1]/record[1]/Description', 'nvarchar(100)') ,
               [PackageTypeID] = [b].[value]('payload[1]/record[1]/PackageTypeID', 'int') ,
               [Quantity] = [b].[value]('payload[1]/record[1]/Quantity', 'int') ,
               [UnitPrice] = [b].[value]('payload[1]/record[1]/UnitPrice', 'decimal(18, 2)') ,
               [TaxRate] = [b].[value]('payload[1]/record[1]/TaxRate', 'decimal(18, 3)') ,
               [PickedQuantity] = [b].[value]('payload[1]/record[1]/PickedQuantity', 'int') ,
               [PickingCompletedWhen] = [b].[value]('payload[1]/record[1]/PickingCompletedWhen', 'datetime2(7)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemStockGroups_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemStockGroups_XPath];
   GO
/*  -- ====================================================================================
    -- StockItemStockGroups XPath Stored Procedures ([Warehouse].[StockItemStockGroups_XPath])
    -- Generated on: 2019-08-10 17:06:29.776926
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[StockItemStockGroups_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [StockItemStockGroupID] int,
            [StockItemID] int,
            [StockGroupID] int
        )

        DELETE FROM @Messages

        INSERT @Messages
        (
            [StockItemStockGroupID],
            [StockItemID],
            [StockGroupID]
        )
        SELECT
               [StockItemStockGroupID] = [b].[value]('payload[1]/record[1]/StockItemStockGroupID', 'int') ,
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [StockGroupID] = [b].[value]('payload[1]/record[1]/StockGroupID', 'int') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.CustomerTransactions_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[CustomerTransactions_XPath];
   GO
/*  -- ====================================================================================
    -- CustomerTransactions XPath Stored Procedures ([Sales].[CustomerTransactions_XPath])
    -- Generated on: 2019-08-10 17:06:29.791140
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[CustomerTransactions_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [CustomerTransactionID] int,
            [CustomerID] int,
            [TransactionTypeID] int,
            [InvoiceID] int,
            [PaymentMethodID] int,
            [TransactionDate] date,
            [AmountExcludingTax] decimal(18, 2),
            [TaxAmount] decimal(18, 2),
            [TransactionAmount] decimal(18, 2),
            [OutstandingBalance] decimal(18, 2),
            [FinalizationDate] date
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [CustomerTransactionID] = [b].[value]('payload[1]/record[1]/CustomerTransactionID', 'int') ,
               [CustomerID] = [b].[value]('payload[1]/record[1]/CustomerID', 'int') ,
               [TransactionTypeID] = [b].[value]('payload[1]/record[1]/TransactionTypeID', 'int') ,
               [InvoiceID] = [b].[value]('payload[1]/record[1]/InvoiceID', 'int') ,
               [PaymentMethodID] = [b].[value]('payload[1]/record[1]/PaymentMethodID', 'int') ,
               [TransactionDate] = [b].[value]('payload[1]/record[1]/TransactionDate', 'date') ,
               [AmountExcludingTax] = [b].[value]('payload[1]/record[1]/AmountExcludingTax', 'decimal(18, 2)') ,
               [TaxAmount] = [b].[value]('payload[1]/record[1]/TaxAmount', 'decimal(18, 2)') ,
               [TransactionAmount] = [b].[value]('payload[1]/record[1]/TransactionAmount', 'decimal(18, 2)') ,
               [OutstandingBalance] = [b].[value]('payload[1]/record[1]/OutstandingBalance', 'decimal(18, 2)') ,
               [FinalizationDate] = [b].[value]('payload[1]/record[1]/FinalizationDate', 'date') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Sales.InvoiceLines_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Sales].[InvoiceLines_XPath];
   GO
/*  -- ====================================================================================
    -- InvoiceLines XPath Stored Procedures ([Sales].[InvoiceLines_XPath])
    -- Generated on: 2019-08-10 17:06:29.804139
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Sales].[InvoiceLines_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [InvoiceLineID] int,
            [InvoiceID] int,
            [StockItemID] int,
            [Description] nvarchar(100),
            [PackageTypeID] int,
            [Quantity] int,
            [UnitPrice] decimal(18, 2),
            [TaxRate] decimal(18, 3),
            [TaxAmount] decimal(18, 2),
            [LineProfit] decimal(18, 2),
            [ExtendedPrice] decimal(18, 2)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [InvoiceLineID] = [b].[value]('payload[1]/record[1]/InvoiceLineID', 'int') ,
               [InvoiceID] = [b].[value]('payload[1]/record[1]/InvoiceID', 'int') ,
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [Description] = [b].[value]('payload[1]/record[1]/Description', 'nvarchar(100)') ,
               [PackageTypeID] = [b].[value]('payload[1]/record[1]/PackageTypeID', 'int') ,
               [Quantity] = [b].[value]('payload[1]/record[1]/Quantity', 'int') ,
               [UnitPrice] = [b].[value]('payload[1]/record[1]/UnitPrice', 'decimal(18, 2)') ,
               [TaxRate] = [b].[value]('payload[1]/record[1]/TaxRate', 'decimal(18, 3)') ,
               [TaxAmount] = [b].[value]('payload[1]/record[1]/TaxAmount', 'decimal(18, 2)') ,
               [LineProfit] = [b].[value]('payload[1]/record[1]/LineProfit', 'decimal(18, 2)') ,
               [ExtendedPrice] = [b].[value]('payload[1]/record[1]/ExtendedPrice', 'decimal(18, 2)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

IF EXISTS (SELECT *
           FROM [dbo].[sysobjects]
           WHERE [id] = OBJECT_ID(N'Warehouse.StockItemTransactions_XPath')
           AND OBJECTPROPERTY([id],N'IsProcedure') = 1)
   DROP PROCEDURE [Warehouse].[StockItemTransactions_XPath];
   GO
/*  -- ====================================================================================
    -- StockItemTransactions XPath Stored Procedures ([Warehouse].[StockItemTransactions_XPath])
    -- Generated on: 2019-08-10 17:06:29.817550
    -- Generator Version: 1.0
    --
    -- Template Version:  1.0
    -- Version 1.0  Initial version of the template for the XPath Stored Procedures
    -- ========================================================================================*/

    CREATE PROCEDURE [Warehouse].[StockItemTransactions_XPath]
    AS
    BEGIN --Procedure
        DECLARE @ReceivedMessages TABLE
        (
            Payload XML
        )
        DECLARE @Messages TABLE
        (
            [StockItemTransactionID] int,
            [StockItemID] int,
            [TransactionTypeID] int,
            [CustomerID] int,
            [InvoiceID] int,
            [SupplierID] int,
            [PurchaseOrderID] int,
            [TransactionOccurredWhen] datetime2(7),
            [Quantity] decimal(18, 3)
        )

        DELETE FROM @Messages

        INSERT @Messages
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
               [StockItemTransactionID] = [b].[value]('payload[1]/record[1]/StockItemTransactionID', 'int') ,
               [StockItemID] = [b].[value]('payload[1]/record[1]/StockItemID', 'int') ,
               [TransactionTypeID] = [b].[value]('payload[1]/record[1]/TransactionTypeID', 'int') ,
               [CustomerID] = [b].[value]('payload[1]/record[1]/CustomerID', 'int') ,
               [InvoiceID] = [b].[value]('payload[1]/record[1]/InvoiceID', 'int') ,
               [SupplierID] = [b].[value]('payload[1]/record[1]/SupplierID', 'int') ,
               [PurchaseOrderID] = [b].[value]('payload[1]/record[1]/PurchaseOrderID', 'int') ,
               [TransactionOccurredWhen] = [b].[value]('payload[1]/record[1]/TransactionOccurredWhen', 'datetime2(7)') ,
               [Quantity] = [b].[value]('payload[1]/record[1]/Quantity', 'decimal(18, 3)') 
        FROM    @ReceivedMessages AS [A]
        CROSS APPLY [payload].[nodes]('//message/dataInput') AS [hdr] ( [b] );

    END --Procedure

