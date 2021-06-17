import os

def GetCodeGenerationConnectionString():
    connectionStringLocal = r"Driver={SQL Server};Server=localhost,15789;Database=WWI_Preparation;uid=sa;pwd=<Some big secret>;"

    user = "<some user>"
    password = "<Some big secret>"
    server = "<some server>.database.windows.net"
    database = "CodeGeneration"

    connectionStringAzure = r"Driver={{{0}}};".format('ODBC Driver 13 for SQL Server') + 'Server={};Database={};UID={};PWD={};'.format(server, database, user, password)

    try:
        domain = os.environ['userdomain']
    except:
        pass

    if (domain and domain != "<the laptop I am on>"):
        return connectionStringAzure

    return connectionStringLocal


def main():
    print(GetCodeGenerationConnectionString())

if __name__ == "__main__":
    main()