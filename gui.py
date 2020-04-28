import tkinter as tk
from tkinter import filedialog, Text, font
import os
from PIL import ImageTk, Image
import sql_connector as sq
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use("TkAgg")
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

def showPatients():
	toplevel=tk.Toplevel( bg="white", height=900, width=900, ) #opens a new window
	toplevel.title("Patient Data")
	
	#	pie chart patient blood group
	query1="select Blood_gp, count(Blood_gp) from Patient group by Blood_gp;" 
	table=sq.Query(query1)
	label=[]
	size=[]
	explode=[]
	for i in table[1]:
		label.append(i[0])
		size.append(i[1])
		explode.append(i[1]*0.02)

	figure1 = plt.Figure(figsize=(6,5), dpi=100)
	ax1 = figure1.add_subplot(111)
	canvas = FigureCanvasTkAgg(figure1, toplevel)
	canvas.get_tk_widget().pack(side=tk.LEFT, fill=tk.BOTH)
	ax1.pie(size, labels=label, shadow=True,  autopct='%1.1f%%', explode=explode)
	ax1.set_title("Distribution of patients according to Blood Groups")

	# Lolipop graph of patients with different diseases
	sq.doQuery("create table t select Disease_ID from Treatment inner join Patient on Patient.Treatment_ID= Treatment.Treatment_ID;")
	table=sq.Query("select Name, count(*) from t inner join Disease on t.Disease_ID=Disease.Disease_ID group by Name;")
	sq.doQuery("Drop table t;")
	label=[]
	size=[]
	for i in table[1]:
		label.append(i[0])
		size.append(i[1])

	figure1 = plt.Figure(figsize=(6,5), dpi=100)
	ax = figure1.add_subplot(111)
	canvas = FigureCanvasTkAgg(figure1, toplevel)
	canvas.get_tk_widget().pack(side=tk.LEFT, fill=tk.BOTH)

	ax.vlines(x=label, ymin=0, ymax=size, color='firebrick', alpha=0.7, linewidth=2)
	ax.scatter(x=label, y=size, color='firebrick', alpha=0.7)
	ax.set_title('Lollipop Chart for Disease wise Patient Distribution')
	ax.set_ylabel('Number of Patients')
	ax.set_xticks(label)
	ax.set_xticklabels(label, rotation=60, fontdict={'horizontalalignment': 'right'})


	"""
	count new patients admitted today
	count total patients
	"""
	
def showDoctors():

	"""
	Grouping patients per doctor
	Distribution plot : doctors per department

	"""
	print("yay")
def showAdmin():
	print("Admin")


	"""
	Number of ongoing treatment per Department
	Resources stocks
	Dead patients per Disease
	Time series plot of patients getting admitted

	"""
	toplevel=tk.Toplevel( bg="white", height=900, width=900, )
	toplevel.title("Department Data")
	
	#	pie chart for the diff departments of the doctors
	query1="select type, count(type) from Doctors, Departments where Departments.Dept_ID=Doctors.Dept_ID group by type;" 
	table=sq.Query(query1)
	label=[]
	size=[]
	explode=[]
	for i in table[1]:
		label.append(i[0])
		size.append(i[1])
		explode.append(i[1]*0.02)

	figure1 = plt.Figure(figsize=(6,5), dpi=100)
	ax1 = figure1.add_subplot(111)
	canvas = FigureCanvasTkAgg(figure1, toplevel)
	canvas.get_tk_widget().pack(side=tk.LEFT, fill=tk.BOTH)
	ax1.pie(size, labels=label, shadow=True,  autopct='%1.1f%%', explode=explode)
	ax1.set_title("Distribution of Doctors according to Departments")

def show3rdParty():
	
	print("3rdParty")
	toplevel=tk.Toplevel( bg="white", height=900, width=900, ) #opens a new window
	toplevel.title("Organ Donation Data")

	# Organ Donation
	query1="select Organ , count(Organ ) from Organ_Donations group by Organ ;" 
	table=sq.Query(query1)
	print(table)
	label=[]
	size=[]
	explode=[]
	for i in table[1]:
		label.append(i[0])
		size.append(i[1])
		explode.append(i[1]*0.02)

	figure1 = plt.Figure(figsize=(6,5), dpi=100)
	ax1 = figure1.add_subplot(111)
	canvas = FigureCanvasTkAgg(figure1, toplevel)
	canvas.get_tk_widget().pack(side=tk.LEFT, fill=tk.BOTH)
	ax1.pie(size, labels=label, shadow=True,  autopct='%1.1f%%', explode=explode)
	ax1.set_title("Number of Organs Donated by Type")



	# toplevel=tk.Toplevel( bg="white", height=900, width=900, ) #opens a new window
	# toplevel.title("Insurance Distribution Data")

	#	Insurance
	query1="select EXTRACT(YEAR FROM Date_of_expiry),AVG(Amount) from insurance_record group by EXTRACT(YEAR FROM Date_of_expiry);" 
	table=sq.Query(query1)
	label=[]
	size=[]
	for i in table[1]:
		label.append(i[0])
		size.append((float)(i[1]))

	figure1 = plt.Figure(figsize=(16,5), dpi=100)
	# ax1 = figure1.add_subplot(111)
	ax1 = figure1.add_axes([0.2,0.2,0.7,0.7])
	canvas = FigureCanvasTkAgg(figure1, toplevel)
	canvas.get_tk_widget().pack(side=tk.LEFT, fill=tk.BOTH)
	ax1.bar(label,size, label=label, color=('#6600ff','#00ff00','#ff3300','#33FFFF'))
	ax1.set_title("Cost Distribution Over the Years")
	
	"""
	Organ Donation according to type of organ
	Distribution Graph: Average Cost Year Wise Distribution during Expiry

	"""
	print("yay")

root = tk.Tk()
root.title("MediQL Data Analytics")
root.resizable(width=True, height=True)


canvas = tk.Canvas(root, height=900, width = 900, bg="white")
canvas.pack()

img=ImageTk.PhotoImage(Image.open("./talend.png").resize((900, 900), Image.ANTIALIAS))

canvas.create_image(450, 400, image=img, anchor=tk.CENTER)

stake_holder_frame=tk.Frame(root)
stake_holder_frame.pack()
stake_holder_frame.place(relx=0.75, rely=0.37)


patient_button= tk.Button(stake_holder_frame, bg="white", fg="grey", text="  Patients  " , font=("Helvetica", 20, tk.font.BOLD), command=showPatients)
patient_button.pack()
doctor_button= tk.Button(stake_holder_frame, bg="white", fg="grey", text="  Doctors  " , font=("Helvetica", 20, tk.font.BOLD), command=showDoctors)
doctor_button.pack()
admin_button= tk.Button(stake_holder_frame, bg="white", fg="grey", text="   Admin    " , font=("Helvetica", 20, tk.font.BOLD), command=showAdmin)
admin_button.pack() 
thirdparty_button= tk.Button(stake_holder_frame, bg="white", fg="grey", text=" 3rd Party " , font=("Helvetica", 20, tk.font.BOLD), command=show3rdParty)
thirdparty_button.pack()
root.mainloop() # to run the app



"""
todo
auto-update in real time
"""
