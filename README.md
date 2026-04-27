# Tugas-2-Desain-Database-Lengkap
**Gambar ERD**
<img width="502" height="557" alt="ERD perpus" src="https://github.com/user-attachments/assets/c93fbf68-b4e7-43b2-a204-46bb57617625" />

**Relasi antar tabel**
Relasi antar tabel dalam database ini terdiri dari dua hubungan utama, yaitu antara tabel kategori_buku dengan buku, serta antara tabel penerbit dengan buku. Kedua relasi tersebut merupakan relasi one-to-many (1:N), dimana satu kategori dan satu penerbit dapat memiliki banyak buku. Relasi ini dihubungkan melalui foreign key pada tabel buku, yaitu id_kategori dan id_penerbit.


**Screenshot**
1. Struktur semua tabel
   1. buku <img width="1887" height="877" alt="image" src="https://github.com/user-attachments/assets/7ccb8cf0-3da4-4160-a518-9ec675bf3433" />
   2. kategori_buku <img width="1882" height="639" alt="image" src="https://github.com/user-attachments/assets/694392a5-9747-4467-a5d4-3ca718b25bd1" />
   3. penerbit <img width="1890" height="730" alt="image" src="https://github.com/user-attachments/assets/7112d421-548e-4a07-85b9-b28685a8cb52" />
   
2. Data di setiap tabel
   1. buku <img width="1897" height="862" alt="image" src="https://github.com/user-attachments/assets/1dc3ea68-310f-40f1-86e7-130dcfe88104" />
   2. kategori_buku <img width="1916" height="584" alt="image" src="https://github.com/user-attachments/assets/73ff873f-3504-4d36-a047-3f6eeaa01384" />
   3. penerbit <img width="1907" height="705" alt="image" src="https://github.com/user-attachments/assets/1466cb71-2a0b-4bfc-9cf8-bfe114a5d3bd" />

3. Hasil query JOIN
   1. JOIN untuk tampilkan buku dengan nama kategori dan penerbit <img width="1890" height="896" alt="query join 1" src="https://github.com/user-attachments/assets/66956e90-b56b-4459-8e5c-7d63358113aa" />
   2. Jumlah buku per kategori <img width="1890" height="895" alt="query join 2" src="https://github.com/user-attachments/assets/237d2033-650f-496f-aadf-da73034e0b1a" />
   3. Jumlah buku per penerbit <img width="1890" height="895" alt="query join 3" src="https://github.com/user-attachments/assets/7c4cb571-ef95-4b79-93b5-fe7f47274bf4" />
   4. Buku beserta detail lengkap (kategori + penerbit) <img width="1885" height="954" alt="query join 4" src="https://github.com/user-attachments/assets/6a1fb065-5577-45be-8cb4-85fd3adb7d51" />
