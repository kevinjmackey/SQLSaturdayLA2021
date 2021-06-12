import argparse
import logging as log
import os
import os.path
import sys
import pprint
import pypyodbc
import pyratemp
from datetime import datetime
import DVConnection

class Table:
    schema = ""
    name = ""

class Column:
    name = ""
    ispk = ""
    datatype = ""
    maximumlength = ""
    decimalprecision = ""
    decimalscale = ""

def GetTableMetadata(_table):
    columns = []
    SqlString = """SELECT [ColumnName],[IsPrimaryKeyColumn] AS [IsPK],CASE [DataType] WHEN 'nvarchar(max)' THEN 'nvarchar' ELSE [DataType] END AS [DataType], CASE [DataType] WHEN 'nvarchar(max)' THEN 'max' ELSE CAST([MaximumLength] AS nvarchar(4)) END AS [MaximumLength],[DecimalPrecision],[DecimalScale]
    FROM [Metadata].[Columns] WHERE [Columns].[TableName] = '{}'
     AND [DataType] NOT LIKE 'AS %' AND [DataType] NOT LIKE '%binary%' ORDER BY [ColumnID]""".format(_table)
    cnxn = pypyodbc.connect(DVConnection.GetCodeGenerationConnectionString())
    cursor = cnxn.cursor()
    try:
        cursor.execute(SqlString)
        for row in cursor:
            column = Column()
            column.name=str(row[0])
            column.ispk=str(row[1])
            column.datatype=str(row[2])
            column.maximumlength = str(row[3])
            column.decimalprecision = str(row[4])
            column.decimalscale = str(row[5])
            #print("Table: {} - Column: {}".format(_table, str(row[0])))
            columns.append(column)

    except Exception as ex:
        cnxn.close()
        print("Error reading file groups from the database.")
        print ("Failed SQL statement " + SqlString)
        print (datetime.now())
        print(ex)
        log.error("Error reading column metadata from the database.")
        log.error("Failed SQL statement " + SqlString)
        log.error(datetime.now())
        log.error(ex)
        raise #re-raise the exception

    return columns

def GenerateCode(_version, _table, _columns, _outputFile, _template, _xS, _xI, _xU, _xD):
    print("Generating code for: {}".format(_table.name))

    pkColumn = ""
    for column in _columns:
        if(column.ispk == "True"):
            pkColumn = column.name
    d = {}
    d["date"] = str(datetime.now())
    d["version"] = _version
    d["table"] = _table
    d["pkcolumn"] = pkColumn
    d["column_list"] = _columns
    d["xS"] = "Y" if _xS==True else "N"
    d["xI"] = "Y" if _xI==True else "N"
    d["xU"] = "Y" if _xU==True else "N"
    d["xD"] = "Y" if _xD==True else "N"
    t = pyratemp.Template(filename=_template)
    with open(_outputFile, "a") as fout:
        fout.write(t(**d))

def ProcessAllTables(_version, _outputFile, _template, _xS, _xI, _xU, _xD):
    print("Getting the list of tables...")
    
    tables = []
    SqlString = "SELECT [SchemaName], [TableName] FROM [Metadata].[Tables] ORDER BY [TableCreationOrder]"
    cnxn = pypyodbc.connect(DVConnection.GetCodeGenerationConnectionString())
    cursor = cnxn.cursor()
    try:
        cursor.execute(SqlString)
        for row in cursor:
            table = Table()
            table.schema=str(row[0])
            table.name=str(row[1])
            tables.append(table)
        cnxn.close()
    except Exception as ex:
        print("Error reading file groups from the database.")
        print ("Failed SQL statement " + SqlString)
        print (datetime.now())
        print(ex)
        log.error("Error reading tables from the database.")
        log.error("Failed SQL statement " + SqlString)
        log.error(datetime.now())
        log.error(ex)
        raise #re-raise the exception

    print("Template file: {}".format(_template))

    if(_template != r"CSharpParser.tmpl"):
        if(os.path.isfile(_outputFile)):
            os.remove(_outputFile)

    for table in tables:
        if(_template == r"CSharpParser.tmpl"):
            _outputFile = "CSharpParser_{}.cs".format(table.name)
            if(os.path.isfile(_outputFile)):
                os.remove(_outputFile)

        GenerateCode(_version, table, GetTableMetadata(table.name), _outputFile, _template, _xS, _xI, _xU, _xD)

def Main(_argv):
    #Script starts here
    #Version 1.0  Initial version of the generator using WWI table metadata
    version = "1.0"
    argsparser = argparse.ArgumentParser(prog="GenerateCRUD")
    argsparser.add_argument("-all", "--all", action="store_true", default="True", help="Use -All to generate CRUD for all WWI tables.")
    argsparser.add_argument("-t", "--template", dest="template", default = "CRUDTemplate.tmpl", help="This is the template to use in generating stored procedures.")
    argsparser.add_argument("-o", "--output", dest="output", default = "CRUDStoredProcedures.sql", help="This is the output file to create.")
    argsparser.add_argument("-xS", "--NoSelect", dest="xS", action="store_true", default="False", help="Use -xS to omit SELECT stored procedure.")
    argsparser.add_argument("-xI", "--NoInsert", dest="xI", action="store_true", default="False", help="Use -xI to omit INSERT stored procedure.")
    argsparser.add_argument("-xU", "--NoUpdate", dest="xU", action="store_true", default="False", help="Use -xU to omit UPDATE stored procedure.")
    argsparser.add_argument("-xD", "--NoDelete", dest="xD", action="store_true", default="False", help="Use -xD to omit DELETE stored procedure.")

    args = argsparser.parse_args()

    ProcessAllTables(version, args.output, args.template, args.xS, args.xI, args.xU, args.xD)

if __name__ == "__main__":
  Main(sys.argv)
