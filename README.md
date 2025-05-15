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
| ![Home](https://github.com/user-attachments/assets/5771643c-c03c-4731-8adc-363d4f4e1635) | ![Flashcard](https://github.com/user-attachments/assets/7daab38c-542f-4590-a13a-072916031cee) | ![Quiz](https://github.com/user-attachments/assets/421e0833-f49a-4e78-9cf4-2a1a8669234d) | ![Progress](https://github.com/user-attachments/assets/6c6fc23c-1291-45b5-a6f5-181331dd342a) | ![Settings](https://github.com/user-attachments/assets/9dd4ffab-0937-4758-b21e-6f4b05ea6d88) | ![Notification](https://github.com/user-attachments/assets/a3957499-d839-4f7d-b079-23fadffe4ffb) |
| ![Home2](https://github.com/user-attachments/assets/62f1e871-880e-4b0a-b626-74575eaf22f4) | ![Flashcard2](https://github.com/user-attachments/assets/e39a1721-ae32-4b3b-9160-406225ff02f0) | ![Quiz2](https://github.com/user-attachments/assets/d312165f-d5d5-4499-b150-68a5a5d284bd) | ![Progress2](https://github.com/user-attachments/assets/5ea20936-332c-4273-8c52-e8995876c6e0) | ![Settings2](https://github.com/user-attachments/assets/265aeb68-f776-41fe-85c6-135af57227aa) | ![Notification2](https://github.com/user-attachments/assets/cbd079e1-67cf-4c95-a61b-af6f085f18fb) |

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
