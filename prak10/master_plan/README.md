# Praktikum 10 - Dasar State Management

**Praktikum 1**
<br>
Hasil master_plan:
![alt text](<2025-12-13 17-28-55.gif>)

**Tugas Praktikum 1**
<br>

1. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?<br>
   Jawab: untuk mengelompokkan (encapsulation) model data ke dalam satu akses import.

2. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?<br>
   Jawab: Variabel plan berfungsi untuk menyimpan state utama aplikasi yang berisi nama rencana dan daftar task yang bertipe `List<Task>`. Variabel plan dibuat konstanta agar tidak ada perubahan langsung pada objek, tetapi membuat objek baru setiap setState().

3. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
   ![alt text](<2025-12-13 18-00-53.gif>)

4. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?<br>
   Jawab: Method initState() dipanggil satu kali saat widget pertama kali dibuat untuk menginisialisasi ScrollController dan menambahkan listener agar fokus keyboard hilang saat pengguna melakukan scroll, sehingga meningkatkan kenyamanan penggunaan terutama di iOS. Sedangkan dispose() dipanggil saat widget dihapus dari widget tree untuk membersihkan resource seperti controller dan listener agar tidak terjadi memory leak atau proses yang berjalan di latar belakang tanpa digunakan.

<br>

**Praktikum 2**
<br>
Hasil output praktikum 2:
![alt text](<2025-12-13 18-12-05.gif>)

**Tugas Praktikum 2**
<br>

1. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?<br>
   Jawab: InheritedWidget pada langkah 1:

```dart
class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>>
```

InheritedNotifier sendiri adalah turunan dari InheritedWidget. Artinya, PlanProvider berfungsi sebagai penyedia data (state) yang bisa diakses oleh seluruh widget di bawahnya pada widget tree melalui BuildContext.<br>
InheritedNotifier digunakan karena state yang dibagikan (Plan) bersifat dinamis, state tersebut dikelola oleh `ValueNotifier<Plan>`, Widget yang mendengarkan akan rebuild otomatis saat ValueNotifier berubah

2. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
   Jawab:

```dart
int get completedCount =>
  tasks.where((task) => task.complete).length;

String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
```

Method tersebut berfungsi untuk menghitung jumlah task yang telah selesai dan menyusun pesan ringkas progres penyelesaian task. Method tersebut dibuat agar pemrosesan dilakukan di model dan bukan di UI, sehingga view hanya menampilkan data, bukan menghitung

**Praktikum 3**
<br>
Hasil State di Multiple Screens:
![alt text](<2025-12-13 18-40-26.gif>)

**Tugas Praktikum 3**

1. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
   ![alt text](image.png)
   Jawab: Diagram tersebut menjelaskan alur navigasi dari PlanCreatorScreen ke PlanScreen menggunakan Navigator.push, sekaligus menunjukkan bahwa PlanProvider tetap berada di atas widget tree sehingga state `List<Plan>` tetap terjaga dan dapat diakses oleh kedua screen. Dengan struktur ini, aplikasi menerapkan prinsip pemisahan antara view dan state serta memastikan konsistensi data meskipun terjadi perpindahan halaman.
