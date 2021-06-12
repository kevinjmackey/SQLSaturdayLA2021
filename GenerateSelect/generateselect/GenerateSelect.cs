using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Xsl;

namespace SQLSaturday
{
    class GenerateSelect
    {
        static string GetConnectionString()
        {
            return "Data Source=localhost,15789; Initial Catalog = WWI_Preparation; uid=sa;pwd=<Some big secret>;";
        }

        
        static XmlDocument GetTableColumns(string _dbTable)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * FROM (SELECT ColumnID, ColumnName,Columns.TableName,SchemaName AS [dbSchema],IsPrimaryKeyColumn AS [IsPK],ColumnDescription AS [DESC]");
            sb.Append(" FROM Metadata.[Columns] INNER JOIN Metadata.Tables ON Tables.TableName = Columns.TableName");
            sb.Append(" WHERE Columns.TableName = '");
            sb.Append(_dbTable);
            sb.Append("') AS [columns] ORDER BY ColumnID FOR XML AUTO");

            XmlDocument doc = new XmlDocument();
            XmlNode root = doc.CreateElement("root");
            doc.AppendChild(root);
            XmlNode tableNode = doc.CreateElement("table");

            SqlConnection conn = new SqlConnection(GetConnectionString());
            using (SqlCommand cmd = new SqlCommand(sb.ToString(), conn))
            {
                conn.Open();
                using (XmlReader reader = cmd.ExecuteXmlReader())
                {
                    reader.MoveToContent();
                    while (!reader.EOF)
                    {
                        XmlDocumentFragment xfrag = doc.CreateDocumentFragment();
                        xfrag.InnerXml = reader.ReadOuterXml();
                        tableNode.AppendChild(xfrag);
                    }
                }
                root.AppendChild(tableNode);
            }
            conn.Close();

            return doc;
        }
        static void TransformTableXML(string _dbTable)
        {
            XmlDocument tableColumns = GetTableColumns(_dbTable);
            XsltArgumentList argsList = new XsltArgumentList();
            argsList.AddParam("table", "", _dbTable);
            argsList.AddParam("now", "", System.DateTime.Today);
            XslCompiledTransform transform = new XslCompiledTransform();
            transform.Load("GenerateSelectTemplate.xslt");
            //tableColumns.Save("People.xml");
            //Write the stored procedure
            using (StreamWriter sw = new StreamWriter("TestSP" + ".sql"))
            {
                transform.Transform(tableColumns, argsList, sw);
            }

            transform = null;
            tableColumns = null;

        }
        static void Main(string[] args)
        {
            string dbTable = "People";
            if (args.Length == 0)
            {
                TransformTableXML(dbTable);
            }
            else
            {
                for (int i = 0; i < args.Length; i++)
                {
                    switch (i)
                    {
                        case 0:
                            dbTable = args[0].ToString();
                            break;
                    }
                }
                TransformTableXML(dbTable);
            }
        }
    }
}
