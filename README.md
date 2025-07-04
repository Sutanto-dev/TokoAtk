
# TokoAtk

TokoAtk adalah aplikasi web berbasis Java EE (JSP & Servlet) yang dirancang untuk mengelola toko alat tulis kantor secara praktis. Aplikasi ini mendukung pengelolaan barang, stok, transaksi penjualan, serta sistem user secara lengkap.

---

## Fitur

- Pengelolaan data barang: tambah, ubah, hapus, dan lihat daftar  
- Stok barang otomatis mengikuti transaksi penjualan  
- Input dan laporan penjualan detail  
- Sistem registrasi dan login user  
- Pencarian dan filter data untuk kemudahan navigasi  
- Pagination pada tampilan data  
- Tampilan modern menggunakan TailwindCSS dan CSS kustom  

---

## Cara Build & Jalankan

### Build

1. Buka terminal di direktori utama proyek.  
2. Bersihkan build sebelumnya dengan:
   ```bash
   ant clean
    ```

3. Bangun aplikasi dengan:

   ```bash
   ant build
   ```

   atau buat paket distribusi `.war` dengan:

   ```bash
   ant dist
   ```
4. File `.war` hasil build akan tersedia di folder `dist/`.

### Deploy

* Tempatkan file `.war` ke folder `webapps` Apache Tomcat, atau deploy melalui Tomcat Manager.
* Pastikan server Tomcat sudah berjalan.

### Jalankan

* Buka browser dan akses:

  ```
  http://localhost:8080/TokoAtk/
  ```

---

## Persyaratan Sistem

* JDK minimal versi 8 (disarankan 11 ke atas)
* Apache Tomcat 9+
* MySQL atau MariaDB
* IDE NetBeans (opsional untuk kemudahan pengembangan)

---

## Konfigurasi Database

Sesuaikan pengaturan koneksi di file berikut:

```
src/java/tokoatk/DbConnection.java
```

Ubah username, password, dan nama database sesuai setup lokalmu.

---

---

## Lisensi

Proyek ini dibuat untuk pembelajaran dan penggunaan internal.

## Developer Info

**Sutanto Dwi Putra**  
NIM: 22110233 | Kelas: L2022  
📧 sutantodputra@gmail.com  
🔗 [GitHub](https://github.com/Sutanto-dev)

---

