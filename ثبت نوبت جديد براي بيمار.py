import tkinter as tk
from tkinter import messagebox
import pyodbc

def connect_db():
    return pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=HospitalDB;'
        'Trusted_Connection=yes;'
    )

def insert_appointment():
    try:
        bimar_id = entry_bimar_id.get()
        doctor_id = entry_doctor_id.get()
        date = entry_date.get()
        time = entry_time.get()

        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO NobatDehi (Tarikh, Saat, BimarID, PezeshkID)
            VALUES (?, ?, ?, ?)
        """, date, time, bimar_id, doctor_id)
        conn.commit()
        conn.close()
        messagebox.showinfo("موفقیت", "نوبت با موفقیت ثبت شد")
        clear_fields()
    except Exception as e:
        messagebox.showerror("خطا", str(e))

def clear_fields():
    entry_bimar_id.delete(0, tk.END)
    entry_doctor_id.delete(0, tk.END)
    entry_date.delete(0, tk.END)
    entry_time.delete(0, tk.END)

root = tk.Tk()
root.title("ثبت نوبت جدید")
root.geometry("400x300")

lbl_bimar_id = tk.Label(root, text="کد بیمار:")
lbl_bimar_id.pack()
entry_bimar_id = tk.Entry(root)
entry_bimar_id.pack()

lbl_doctor_id = tk.Label(root, text="کد پزشک:")
lbl_doctor_id.pack()
entry_doctor_id = tk.Entry(root)
entry_doctor_id.pack()

lbl_date = tk.Label(root, text="تاریخ (YYYY-MM-DD):")
lbl_date.pack()
entry_date = tk.Entry(root)
entry_date.pack()

lbl_time = tk.Label(root, text="ساعت (HH:MM:SS):")
lbl_time.pack()
entry_time = tk.Entry(root)
entry_time.pack()

btn_submit = tk.Button(root, text="ثبت نوبت", command=insert_appointment)
btn_submit.pack(pady=10)

root.mainloop()
