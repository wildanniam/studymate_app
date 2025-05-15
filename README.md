# 📚 StudyMate

Aplikasi edukasi modern berbasis Flutter untuk membantu pelajar dan mahasiswa belajar lebih efektif melalui fitur flashcard, kuis, progress tracker, dan reminder belajar harian.

---

## ✨ Deskripsi
StudyMate adalah aplikasi pembelajaran interaktif yang dirancang untuk membantu siswa, mahasiswa, dan siapa saja yang ingin meningkatkan pemahaman materi secara mandiri. Dengan pendekatan modular, StudyMate memudahkan pengguna mengelola materi belajar, menguji diri, dan memantau progres secara visual.

**Target Pengguna:**
- Pelajar SMP/SMA
- Mahasiswa
- Umum yang ingin belajar mandiri

**Permasalahan yang Diselesaikan:**
- Sulit mengingat materi pelajaran
- Tidak ada motivasi belajar rutin
- Tidak bisa memantau progres belajar

---

## 🚀 Fitur Utama

- 📇 **Flashcard**: Buat, edit, dan pelajari deck kartu materi.
- 📝 **Quiz**: Uji pemahaman dengan kuis otomatis dari flashcard.
- 📈 **Progress Tracker**: Lihat statistik belajar dan grafik perkembangan.
- ⏰ **Reminder Belajar**: Atur pengingat harian agar tidak lupa belajar.
- 🎨 **Tema Gelap/Terang**: Ganti mode tema sesuai kenyamanan.
- 👤 **Firebase Auth**: Login/register dengan email.
- ⚡ **UI Responsif**: Tampilan modern, nyaman di HP & tablet.

---

## 🖼️ Screenshots

| Home | Flashcard | Quiz | Progress | Settings | Notification |
|------|-----------|------|----------|----------|--------------|
| ![Home](https://github.com/user-attachments/assets/5771643c-c03c-4731-8adc-363d4f4e1635) | ![Flashcard](https://github.com/user-attachments/assets/7daab38c-542f-4590-a13a-072916031cee) | ![Quiz](https://github.com/user-attachments/assets/421e0833-f49a-4e78-9cf4-2a1a8669234d) | ![Progress](https://github.com/user-attachments/assets/6c6fc23c-1291-45b5-a6f5-181331dd342a) | ![Settings](https://github.com/user-attachments/assets/9dd4ffab-0937-4758-b21e-6f4b05ea6d88) | ![Notification](https://github.com/user-attachments/assets/notification1) |
| ![Home2](https://github.com/user-attachments/assets/home2) | ![Flashcard2](https://github.com/user-attachments/assets/flashcard2) | ![Quiz2](https://github.com/user-attachments/assets/quiz2) | ![Progress2](https://github.com/user-attachments/assets/progress2) | ![Settings2](https://github.com/user-attachments/assets/settings2) | ![Notification2](https://github.com/user-attachments/assets/notification2) |

---

## 🧩 Tech Stack

| Teknologi                | Keterangan                       |
|-------------------------|-----------------------------------|
| Flutter                 | Framework utama UI                |
| GetX                    | State management & routing        |
| Firebase Auth           | Autentikasi email                 |
| Hive                    | Penyimpanan data lokal            |
| GetStorage              | Local storage untuk setting/theme |
| flutter_local_notifications | Notifikasi lokal reminder    |
| Google Fonts            | Typography (Poppins)              |
| Syncfusion Charts       | Grafik progres belajar            |
| Card Swiper             | UI swipe flashcard                |

---

## ⚙️ Installation

1. **Clone repository**
   ```bash
   git clone https://github.com/username/studymate_app.git
   cd studymate_app
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Setup Firebase**
   - Download file konfigurasi `google-services.json` (Android) dan `GoogleService-Info.plist` (iOS) dari Firebase Console.
   - Letakkan di folder `android/app/` dan `ios/Runner/`.
4. **Jalankan aplikasi**
   ```bash
   flutter run
   ```
5. **(Opsional) Build APK/IPA**
   ```bash
   flutter build apk # Android
   flutter build ios # iOS
   ```

---

## 🎯 Design System

- **Warna Utama:** Sky Blue (`#38BDF8`), Green Accent (`#22C55E`)
- **Warna Sekunder:** Surface, background, error (Material 3)
- **Font:** Google Fonts Poppins (semua heading, body, dsb)
- **Card-based UI:** Semua fitur utama menggunakan card untuk konsistensi dan kenyamanan visual
- **Responsif:** Grid dan layout otomatis menyesuaikan ukuran layar (HP/tablet)
- **Interaktif:** Animasi, tombol, dan feedback visual modern
- **Tema:** Light & Dark mode, bisa di-toggle dari Settings/Home

---

## 🤝 Kontribusi
Pull request, issue, dan saran sangat terbuka untuk pengembangan lebih lanjut!

---

## 📄 Lisensi
[MIT License](LICENSE)
