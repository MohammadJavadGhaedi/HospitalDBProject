# Hospital Management System – Phase 4

## 📖 Project Overview

This project is a hospital management system developed as part of a database course final project. It includes the ability to register patients, schedule appointments, view records, and edit or delete data using a Python GUI connected to a Microsoft SQL Server database.

## 💻 Technologies Used

* Python (with Tkinter for GUI)
* Microsoft SQL Server
* SQL (T-SQL queries)
* pyodbc library (for database connection)
* GitHub (for version control and publishing)

## 🧩 Project Structure

* `register_patient.py` – Form to add new patients
* `appointment.py` – Schedule a new appointment
* `view_appointments.py` – View list of scheduled appointments using JOIN
* `update_delete_patient.py` – Edit or delete patient records
* `hospital.sql` – SQL script to create tables and insert sample data

## 🛠️ How to Run the Project

1. Clone or download this repository.
2. Open SQL Server Management Studio (SSMS) and run `hospital.sql` to create the database.
3. Install required Python libraries:

   ```bash
   pip install pyodbc
   ```
4. Open each Python file (e.g., `register_patient.py`) and run it with Python 3.

## 📸 Screenshots

### 🟢 SELECT Query in SQL Server
![SELECT](./SELECT.png)

### 🟢 INSERT Query in SQL Server
![INSERT](./INSERT.png)

### 🟡 UPDATE Query in SQL Server
![UPDATE](./UPDATE.png)

### 🧑‍⚕️ Patient Management Panel
![Patient management](./Patient%20management.png)

### 📅 Registering a New Appointment
![Registering a new appointment for a patient](./Registering%20a%20new%20appointment%20for%20a%20patient.png)

### 🆕 New Patient Registration Form
![New patient registration form](./New%20patient%20registration%20form.png)

### 📄 Appointments List (with JOIN)
![Display a list of appointments with complete patient and doctor information](./Display%20a%20list%20of%20appointments%20with%20complete%20patient%20and%20doctor%20information.png)

## 📄 License

This project is developed for academic and educational purposes only.

---

> Developed by: \[MohammadJavadGhaedi]
> Course: Database Systems – Final Project
> Phase 4: Implementation and Deployment
