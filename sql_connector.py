import mysql.connector

def Query(s) :
	"""
	Return the resulted output table[header_list, list of rows]
	"""
	hostname = 'localhost'
	username = 'root'
	password = ''
	database = 'dbms_proj'
	conn= mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
	cur = conn.cursor()
	cur.execute(s)
	table=[]
	table.append(list(cur.column_names))
	table.append(cur.fetchall())
	return table

def doQuery(s):
	""" Only perform the Query, for create table, drop table extra"""
	hostname = 'localhost'
	username = 'root'
	password = ''
	database = 'dbms_proj'
	conn= mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
	cur = conn.cursor()
	cur.execute(s)