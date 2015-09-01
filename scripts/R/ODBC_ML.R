#
# Example how R can use ODBC against MarkLogc server
#
# This require a ODBC Server, view(s) and Range Indexes on the MarkLogic side
# On the client we need the MarkLogic ODBC driver and the RODBC R package
#

library(RODBC)
# connect to the MarkLogic ODBC server with the default credentials (set in ODBC settings)
ch <- odbcConnect("MarkLogicSQL")

# List all tables(views)
sqlTables(ch)

# simple select
sql <- "select * from winners_organization where country = 'Sweden'"
df <- sqlQuery(ch, sql)

# show first six rows
head(df)

# more advanced using search functionality, searching in all fields
sql <- "select * from winners_organization where winners_organization MATCH 'uppsala'"
df <- sqlQuery(ch, sql)
df
