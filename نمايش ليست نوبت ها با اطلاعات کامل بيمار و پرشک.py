import tkinter as tk
from tkinter import ttk, messagebox
import pyodbc

def connect_db():
    return pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=HospitalDB;'
        'Trusted_Connection=yes;'
    )

def load_appointments():
    try:
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT n.NobatID, b.Name AS PatientName, p.Name AS DoctorName, n.Tarikh, n.Saat
            FROM NobatDehi n
            JOIN Bimar b ON n.BimarID = b.BimarID
            JOIN Pezeshk p ON n.PezeshkID = p.PezeshkID
        """)
        records = cursor.fetchall()
        conn.close()

        for row in tree.get_children():
            tree.delete(row)

        for rec in records:
            tree.insert("", tk.END, values=rec)

    except Exception as e:
        messagebox.showerror("Error", str(e))

root = tk.Tk()
root.title("لیست نوبت‌ها")
root.geometry("600x400")

tree = ttk.Treeview(root, columns=("ID", "Patient", "Doctor", "Date", "Time"), show="headings")
tree.heading("ID", text="کد نوبت")
tree.heading("Patient", text="نام بیمار")
tree.heading("Doctor", text="نام پزشک")
tree.heading("Date", text="تاریخ")
tree.heading("Time", text="ساعت")
tree.pack(fill=tk.BOTH, expand=True)

btn_load = tk.Button(root, text="بارگذاری نوبت‌ها", command=load_appointments)
btn_load.pack(pady=10)

root.mainloop()
