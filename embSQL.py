#!/usr/bin/python
########### change the password and username acco to your database #################
hostname = 'localhost'
username = 'root'
password = 'MySql@18'    
database = 'dbms_proj'
print ("Using mysql.connector…")
import mysql.connector
qNO=1

def connect():
	myConnection = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
	return myConnection
def disconnect():
	myConnection.close()



def convertToSql(s):
	conn=connect()
	print("s:",s)
	if(s.lower().find('select')==0):
		print("Enter the table from which you want to select something")
		tName=input()
		cur = conn.cursor()
		q='select * from '+tName
		try:
			cur.execute(q)
			seq=cur.column_names
			l='select '
			count=0
			for i in range (len(seq)):
				print("do want to select column:",seq[i])
				inp=input()
				if(inp.lower().find("y")==0):
					if(count==0):
						l+=seq[i]
						count+=1
					else:
						l+=", "
						l+=seq[i]
			l+=' from '
			l+=tName
			print("any conditions? y/n")
			inp=input()
			if(inp.lower().find('y')==0):
				print("write the conditions (for example col_name1=col_name2 and col_name1='something')")
				inp=input()
				l+=" Where "
				l+=inp+";"
			else:
				l+=";"
			disconnect()
			return (l)
		except:
			disconnect()

			print("Wrong input")
			return ''
	elif(s.lower().find('insert')==0):
		print("Enter the table in which you want to insert something")
		tName=input()

		cur = conn.cursor()
		q='select * from '+tName
		try:
			cur.execute(q)
			seq=cur.column_names
			l='insert into '+tName+ "("
			temp=[]
			count=0
			for i in range (len(seq)):
				print("do want to insert something in column:",seq[i])
				inp=input()
				if(inp.lower().find("y")==0):
					if(count==0):
						l+=seq[i]
						print("enter the values (use ' ' for any char values. for eg: 'Mukul' ")
						inp=input()
						temp.append(inp)
						count+=1
					else:
						l+=", "+seq[i]
						print("enter the values")
						inp=input()
						temp.append(inp)
			l+=" ) VALUES ("
			for i in range(len(temp)):
				if(i==0):
					l+=temp[i]
				else:
					l+=", "+temp[i]

			l+=' );'
			disconnect()

			return l
		except:
			disconnect()
			
			print("wrong input")
			return ''
# Simple routine to run a query on a database and print the results:
def doQuery( conn,s) :
	global qNO
	if(len(s)==6):
		s=convertToSql(s)

		print ("Converted SQL Query",qNO,". :", s)
		try:

			conn=connect()
			cur=conn.cursor()
			cur.execute(s)

			if(s.lower().find("select")>=0 and s.lower().find("select")<=5 ):
				rows=cur.fetchall()
				# print("rows",rows)
				seq=cur.column_names
				for i in range (len(seq)):
					if(i==len(seq)-1):
						print(seq[i])
					else:
						print(seq[i],"	  |",end='')
				if(len(rows)==0):
					print("Table Empty")
				for i in range (len(rows)):
					for j in range(len(rows[i])):
						if(j==len(rows[i])-1):
							print(rows[i][j])
						else:
							print(rows[i][j],"	    |",end='')
			print("***************************************************************************************************************************************************")
			print()
			qNO+=1
		except:
			print("wrong input try again")
			return 
	else:
		print()
		print ("Your SQL Query",qNO,". :", s)
		qNO+=1
		try:
			cur = conn.cursor()
			cur.execute(s)


			if(s.lower().find("select")>=0 and s.lower().find("select")<=5 ):
				rows=cur.fetchall()
				# print("rows",rows)
				seq=cur.column_names
				for i in range (len(seq)):
					if(i==len(seq)-1):
						print(seq[i])
					else:
						print(seq[i],"	  |",end='')
				if(len(rows)==0):
					print("Table Empty")
				for i in range (len(rows)):
					for j in range(len(rows[i])):
						if(j==len(rows[i])-1):
							print(rows[i][j])
						else:
							print(rows[i][j],"	    |",end='')
			print("***************************************************************************************************************************************************")
			print()
		except:
			print("wrong input try again")
			return
# print ("Using MySQLdb…")
# import MySQLdb
# myConnection = MySQLdb.connect( host=hostname, user=username, passwd=password, db=database )
# doQuery( myConnection )
# myConnection.close()

# print ("Using pymysql…")
# import pymysql
# myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
# doQuery( myConnection )
# myConnection.close()

myConnection=connect()
doQuery(myConnection,"SELECT * from Person where insurance_id=(select insurance_id from insurance_record where Amount=2649.74)")

doQuery(myConnection,"DELETE FROM Person WHERE U_ID='U22GwpgjRKS';")
doQuery(myConnection,"INSERT INTO Person VALUES ('U22GwpgjRKS','sadfgustasdus','Intsdfressant','Engleld','FeMale',38,'322 Namekagon Point','France','263-475-1146','gengldfield0@123-reg.co.uk','Iu2sod2ng');")

print("Add new Patient in table Patient and also add its details in Person table and insurance table")

mqd11="DELETE FROM insurance_record WHERE insurance_id='Iu4sod2di';"
mqd12="DELETE FROM Person WHERE U_ID='U13BtixCMLI';"
mqd13="DELETE FROM Patient WHERE Patient_ID='P-j8-694I0';"

doQuery( myConnection,mqd11)
doQuery( myConnection,mqd12)
doQuery( myConnection,mqd13)

mq11="INSERT INTO insurance_record VALUES ('Iu4sod2di','2013-03-27 08:34:02','2019-04-18 21:41:26',2492.12);"
mq12="INSERT INTO Person (U_ID, First_Name, Mid_Name, Last_Name, Gender, Age, Address, Nationality, mobile_no , email_id) VALUES ( 'U13BtixCMLI', 'Betty', 'Camelio', 'Lette', 'Female', 27, '02 Ridgeview Pass valley', 'Los Angeles', '118-313-2179', 'Betty9@gmail.com');"
mq13=" INSERT INTO Patient VALUES ('U13BtixCMLI','P-j8-694I0','Tr-4z5-05gQ','2019-08-12 15:56:21','AB-');"

doQuery( myConnection,mq11)
doQuery( myConnection,mq12)
doQuery( myConnection,mq13)




print("What’s the Cost of Treatment of a Patient (given: Patient_ID= P-j8-694I0)")
mq2="SELECT Cost FROM Treatment WHERE Treatment_ID = (	SELECT Treatment_ID	FROM Patient WHERE Patient_ID = 'P-j8-694I0' );"
doQuery( myConnection,mq2)

print("Display Patient’s first Name, address and mobile number having a particular disease name in this hospital.")
mq3="SELECT First_Name, Address, mobile_no FROM Person WHERE U_ID IN (	SELECT U_ID FROM Patient WHERE Treatment_ID IN ( SELECT Treatment_ID FROM Treatment WHERE Disease_ID = (	SELECT Disease_ID	FROM Disease WHERE Name = 'Malaria' )));"
doQuery( myConnection,mq3)

print("Create and show a view of the doctor table for the Patients (Patients do not need to know about the doctor's address, salary, number of holidays left , etc).This doctor information view should have the information of doctors like his/her specialization, experience, name, booking slot available for that doctor only.")
mq41="CREATE OR REPLACE VIEW  Doctor_Info AS SELECT p.First_Name, p.Mid_Name, p.Last_Name, p.Age, Dept.type, doc.experience, doc.Avl_from, doc.Avl_till FROM Person p, Departments Dept, Doctors doc WHERE p.U_ID=doc.U_ID and doc.Dept_ID = Dept.Dept_ID;"
doQuery( myConnection,mq41)
mq42=" select * from Doctor_Info;"
doQuery( myConnection,mq42)


print("Add new transactions to the Financial Transactions table if the Patient record does not have an insurance record")
sqd11="DELETE FROM Financial_Transactions WHERE Trans_ID='TR-760-212frU9';"
doQuery( myConnection,sqd11)
sq11="INSERT INTO Financial_Transactions VALUES ('TR-760-212frU9','2019-11-11 06:13:24',5911870.36);"
doQuery( myConnection,sq11)

sq12="CREATE OR REPLACE VIEW InsurTrans_Mapping AS	select pat.Patient_ID, 'TR-760-212frU9' as Trans_ID	 from Patient as pat where pat.U_ID in ( select per.U_ID from Person as per	where per.insurance_id is NULL);"
doQuery( myConnection,sq12)


print("Display names of dead Patients who gave their organs for donation and didn't have insurance cover.")
sq2="select * from Dead_Patient as a where a.U_ID in (select b.U_ID	from Person as b    where insurance_id is not NULL)"
doQuery( myConnection,sq2)

print("What’s the average cost of Treatment for a given disease for Patients who had an insurance cover v/s those who didn’t")
sq31="select avg(A.Cost) as 'Patients having Insurance'from Treatment as A where A.Treatment_id in (select Treatment_id from Patient as B where B.U_ID in (select U_ID  from Person as C	where C.insurance_id is not NULL));"
doQuery( myConnection,sq31)
sq32="select avg(A.Cost) as 'Patients having no Insurance' from Treatment as A where A.Treatment_id in (select Treatment_id from Patient as B	where B.U_ID in (select U_ID from Person as C where C.insurance_id is NULL));"
doQuery( myConnection,sq32)


print("Find the medical history of the Patient with the name “XYZ”. In other words, find all the diseases he has been treated for.")
tq1="select name from Disease Where Disease_ID = ( select Disease_ID from Treatment where Treatment_ID = (select Treatment_ID from Patient where U_ID = ( select U_ID from Person where First_name = 'XYZ')));"
doQuery( myConnection,tq1)

print("Find all the Treatments which cost more than $400000")
tq2="select Treatment_ID from Treatment where Cost>=400000;"
doQuery( myConnection,tq2)

print("Add CoronaVirus to the disease table.")
tqd3="DELETE FROM Disease WHERE Disease_ID='D42069';"
doQuery( myConnection,tqd3)

tq3="insert into Disease values ('Corona', 'D42069', 'Corona Virus');"
doQuery( myConnection,tq3)



print("Showing Disease name and information due to which maximum Patients died in the last 3 months")
vq11="create table d_cnt select Treatment.Disease_ID, count(Disease_ID) as disease_count from Treatment where Treatment.Treatment_ID in (select Treatment_ID from Dead_Patient where DATEDIFF(CURDATE(), Date_of_death)<92) group by Disease_ID;"
doQuery( myConnection,vq11)
vq12=" select * from Disease where Disease_ID in (select Disease_ID from d_cnt  where disease_count in (select max(disease_count) from d_cnt));"
doQuery( myConnection,vq12)
vq13=" drop table d_cnt;"
doQuery( myConnection,vq13)

print("Reporting supplies which need re-stocking")
vq2="select Supply_id, Name, Category, Retail_Price from Stock_of_supplies where Quantity_Available<=10;"
doQuery( myConnection,vq2)

print("Which is the busiest Department in the hospital currently?")
vq31="create table temp select Doctor_ID from Treatment where End_time is NULL; "
vq32="create table d_count select Dept_ID,count(Dept_ID) as dept_count from temp inner join Doctors on Doctors.Doctor_ID =temp.Doctor_ID group by Dept_ID;"
vq33="select type as Department_Name from Departments where Dept_ID in ( select Dept_ID from d_count where dept_count in (select max(dept_count) from d_count group by dept_count) );"
vq34=" drop table temp, d_count;"
doQuery( myConnection,vq31)
doQuery( myConnection,vq32)
doQuery( myConnection,vq33)
doQuery( myConnection,vq34)


print("What's the avg cost of treatment in this hospital?")
mq5="SELECT avg(cost) from Treatment;"
doQuery( myConnection,mq5)

print("What's the Max cost of treatments in this hospital?")
mq5="SELECT max(cost) from Treatment;" 
doQuery( myConnection,mq5)

print("What's the Min cost of treatments in this hospital?")
mq5="SELECT min(cost) from Treatment;" 
doQuery( myConnection,mq5)

print("What's the Variance of cost of treatments in this hospital?")
mq5="SELECT VARIANCE(cost) from Treatment;" #################### This show that how much a cost of treatment may vary from avg cost(hOW THE VALUES ARE DISPERSED)
doQuery( myConnection,mq5)

print("What's the Std deviation of cost of treatments in this hospital?")
mq5="SELECT STDDEV(cost) from Treatment;" #################### This show that how much a cost of treatment may vary from avg cost(SQ ROOT OF VARIANCE)
doQuery( myConnection,mq5)

print("What's the total revenue generated by Hospital")
mq5="SELECT sum(cost) from Treatment;" ################# used sum
doQuery( myConnection,mq5)

print("What's the rounded Age of Active Patient in this Hospital")
mq5="SELECT ROUND(avg(Age)) from Person,Patient Where Patient.U_ID=Person.U_ID;" ################# used Round and Avg nested
doQuery( myConnection,mq5)

print("What's the rounded Age of Dead Patient in this Hospital")
mq5="SELECT ROUND(avg(Age)) from Person,Dead_Patient Where Dead_Patient.U_ID=Person.U_ID;" ################# used Round and Avg nested
doQuery( myConnection,mq5)

print("What's the Floored Salary of each workers in this Hospital")
mq5="  select Floor(Salary) from human_resources;" ################# used Floor
doQuery( myConnection,mq5)

print("What's the Floored Avg Salary of workers in this Hospital")
mq5="  select Floor(avg(Salary)) from human_resources;" ################# used Floor and Avg nested
doQuery( myConnection,mq5)



print("Details of doctor who is most experienced (sort acco to the doctor's experience) for Gynaecology")
mq6="SELECT Doctor_ID, max(experience), p.First_Name, p.Mid_Name, p.Last_Name, p.Age, doc.experience, doc.Avl_from, doc.Avl_till FROM Person p, Doctors doc WHERE p.U_ID=doc.U_ID and doc.Dept_ID =(SELECT Dept_ID from Departments where type='Gynaecology') group by Doctor_ID;"
doQuery( myConnection,mq6)

print("What's the Std deviation of Salary of Doctors in this hospital?")
mq5="  select STDDEV(Salary) from Doctors;" #################### This show that how much the salary of Doctors may vary from avg Salary, which helps 
											# hopital admin to decide the salary of doctor(SQ ROOT OF VARIANCE)
doQuery( myConnection,mq5)

print("What's the Std deviation of Salary of Doctors in this hospital?")
mq5="  select VARIANCE(Salary) from Doctors;" #################### This show that how much the salary of Doctors may ARE DISTRIBUTED, which helps 
											# hopital admin to decide the salary of doctor
doQuery( myConnection,mq5)


print("Total number of FeMale patient")
mq7="SELECT count(Patient_ID) FROM patient WHERE U_ID in (SELECT U_ID from person WHERE gender = 'FeMale');"
doQuery( myConnection,mq7)


print("DO YOU WANT TO WRITE YOUR OWN SQL QUERIES? Y/N")
s=input()
while(s.lower().find("y")==0):
	print("Write your query in single line")
	uq=input()
	doQuery( myConnection,uq)
	print("DO YOU WANT TO WRITE MORE SQL QUERIES? Y/N")
	s=input()
print("HAVE SOME QUERIES?")
s=input()
while(s.lower().find("y")==0):
	print("Do You want to Add some data to the table? Y/N")
	uq=input()
	if(uq.lower().find('y')==0):
	    doQuery( myConnection,"insert")
	else:
		print("Do You want to retrieve some data from the table? Y/N")
		uq=input()
		if(uq.lower().find('y')==0):
			doQuery( myConnection,"select")
		# else:
		# 	print("Do You want to create a table? Y/N")
		# 	uq=input()
		# 	if(uq.lower().find('y')==0):
		# 		doQuery( myConnection,"create")

	print("DO YOU WANT TO WRITE MORE SQL QUERIES? Y/N")
	s=input()

