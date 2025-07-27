import tkinter as tk
from tkinter import messagebox
import pyodbc

# اتصال به SQL Server
def connect_db():
    return pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=HospitalDB;'
        'Trusted_Connection=yes;'
    )

# تابع ثبت بیمار
def insert_bimar():
    name = entry_name.get()
    family = entry_family.get()
    age = entry_age.get()
    gender = var_gender.get()
    contact = entry_contact.get()
    address = entry_address.get()

    try:
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO Bimar (Name, FamilyName, Age, Gender, Contact, Address)
            VALUES (?, ?, ?, ?, ?, ?)""",
            name, family, age, gender, contact, address
        )
        conn.commit()
        conn.close()
        messagebox.showinfo("Success", "Patient registered successfully")
        clear_fields()
    except Exception as e:
        messagebox.showerror("Error", str(e))

# پاک‌کردن فیلدها
def clear_fields():
    entry_name.delete(0, tk.END)
    entry_family.delete(0, tk.END)
    entry_age.delete(0, tk.END)
    entry_contact.delete(0, tk.END)
    entry_address.delete(0, tk.END)
    var_gender.set('M')

# ساخت پنجره اصلی
root = tk.Tk()
root.title("ثبت بیمار جدید")
root.geometry("400x400")

# ویجت‌ها
lbl_name = tk.Label(root, text="نام:")
lbl_name.pack()
entry_name = tk.Entry(root)
entry_name.pack()

lbl_family = tk.Label(root, text="نام خانوادگی:")
lbl_family.pack()
entry_family = tk.Entry(root)
entry_family.pack()

lbl_age = tk.Label(root, text="سن:")
lbl_age.pack()
entry_age = tk.Entry(root)
entry_age.pack()

lbl_gender = tk.Label(root, text="جنسیت:")
lbl_gender.pack()
var_gender = tk.StringVar(value='M')
tk.Radiobutton(root, text="مرد", variable=var_gender, value='M').pack()
tk.Radiobutton(root, text="زن", variable=var_gender, value='F').pack()

lbl_contact = tk.Label(root, text="شماره تماس:")
lbl_contact.pack()
entry_contact = tk.Entry(root)
entry_contact.pack()

lbl_address = tk.Label(root, text="آدرس:")
lbl_address.pack()
entry_address = tk.Entry(root)
entry_address.pack()

btn_submit = tk.Button(root, text="ثبت بیمار", command=insert_bimar)
btn_submit.pack(pady=10)

# اجرای برنامه
root.mainloop()
