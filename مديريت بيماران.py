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

def delete_bimar():
    try:
        bimar_id = entry_delete.get()
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Bimar WHERE BimarID = ?", bimar_id)
        conn.commit()
        conn.close()
        messagebox.showinfo("موفقیت", "بیمار حذف شد")
        entry_delete.delete(0, tk.END)
    except Exception as e:
        messagebox.showerror("خطا", str(e))

def update_bimar():
    try:
        bimar_id = entry_id.get()
        name = entry_name.get()
        family = entry_family.get()
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute("""
            UPDATE Bimar SET Name = ?, FamilyName = ? WHERE BimarID = ?
        """, name, family, bimar_id)
        conn.commit()
        conn.close()
        messagebox.showinfo("موفقیت", "اطلاعات بروزرسانی شد")
    except Exception as e:
        messagebox.showerror("خطا", str(e))

root = tk.Tk()
root.title("لیست نوبت‌ها و مدیریت بیماران")
root.geometry("600x600")

tree = ttk.Treeview(root, columns=("ID", "Patient", "Doctor", "Date", "Time"), show="headings")
tree.heading("ID", text="کد نوبت")
tree.heading("Patient", text="نام بیمار")
tree.heading("Doctor", text="نام پزشک")
tree.heading("Date", text="تاریخ")
tree.heading("Time", text="ساعت")
tree.pack(fill=tk.BOTH, expand=True)

btn_load = tk.Button(root, text="بارگذاری نوبت‌ها", command=load_appointments)
btn_load.pack(pady=10)

# فرم حذف بیمار
tk.Label(root, text="کد بیمار برای حذف:").pack()
entry_delete = tk.Entry(root)
entry_delete.pack()
tk.Button(root, text="حذف بیمار", command=delete_bimar).pack(pady=5)

# فرم بروزرسانی بیمار
tk.Label(root, text="کد بیمار برای بروزرسانی:").pack()
entry_id = tk.Entry(root)
entry_id.pack()

tk.Label(root, text="نام جدید:").pack()
entry_name = tk.Entry(root)
entry_name.pack()

tk.Label(root, text="نام خانوادگی جدید:").pack()
entry_family = tk.Entry(root)
entry_family.pack()

tk.Button(root, text="بروزرسانی اطلاعات بیمار", command=update_bimar).pack(pady=5)

root.mainloop()