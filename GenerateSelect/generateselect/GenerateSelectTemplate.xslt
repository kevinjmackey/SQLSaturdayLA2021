<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="text" indent="yes"/>

<!--
  Declare the parameters passed to the XSLT stylesheet
-->
    <xsl:param name="table" />
    <xsl:param name="now" />
    
<!--
  Declare the variables needed for the operation of the XSLT stylesheet
-->
    <xsl:variable name="Version" select="'1.0'"/>
    <xsl:variable name="TemplateVersion" select="'1.0'"/>
    <xsl:variable name="spName" select="concat($table, '_Select_One')"/>
    <xsl:variable name="pkColumn">
        <xsl:for-each select="root/table/columns">
            <xsl:if test="@IsPK=1">
                <xsl:value-of select="@ColumnName"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="dbschemaName">
        <xsl:for-each select="root/table/columns">
            <xsl:if test="@IsPK=1">
                <xsl:value-of select="@dbSchema"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>

<!--
  Main driver template for the stylesheet
-->
    <xsl:template match="/">
        <xsl:call-template name="OpenSP"/>
        <xsl:call-template name="SPbody"/>
        <xsl:call-template name="CloseSP"/>
    </xsl:template>

    <xsl:template name="OpenSP">
        USE [WideWorldImporters]
        GO 
        SET QUOTED_IDENTIFIER ON
        GO
        SET ANSI_NULLS ON
        GO

        IF EXISTS (
        SELECT * FROM dbo.sysobjects
        WHERE id = OBJECT_ID(N'<xsl:value-of select="$spName" />')
        AND OBJECTPROPERTY(id, N'IsProcedure') = 1)

        DROP PROCEDURE <xsl:value-of select="$spName" />
        GO

/*
========================================================================================================================
-- <xsl:value-of select="$spName" />
-- Generated on: <xsl:value-of  select="substring-before($now, 'T')" />
-- Generator Version: <xsl:value-of select="$Version"/>
-- Template Version : <xsl:value-of select="$TemplateVersion"/>
-- ========================================================================================================================
*/
        CREATE PROCEDURE <xsl:text>[dbo].[</xsl:text><xsl:value-of select="$spName" /><xsl:text>]</xsl:text> 
        (@<xsl:value-of select="$table"/>ID INT = NULL) AS
        BEGIN --Procedure

            SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
            SET NOCOUNT ON;
            SET XACT_ABORT ON;
    </xsl:template>

    <xsl:template name="SPbody">
            SELECT <xsl:apply-templates select="root/table/columns"/>
            FROM [<xsl:value-of select="$dbschemaName"/>].[<xsl:value-of select="$table"/>] AS [T]
            WHERE [T].[<xsl:value-of select="$pkColumn"/>] = @<xsl:value-of select="$table"/>ID
    </xsl:template>

    <xsl:template match="root/table/columns">
                [T].[<xsl:value-of select="@ColumnName"/>]<xsl:if test="position()!=last()">,</xsl:if>
    </xsl:template>

    <xsl:template name="CloseSP">
        END --Procedure
    </xsl:template>
</xsl:stylesheet>
