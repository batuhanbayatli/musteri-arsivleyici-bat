# SigortamRahat - Müşteri Klasör Arşivleyici v1.0 🗂️⚡
### Acenteler İçin Standart Windows Dosya & Arşiv Yönetim Motoru

**bGroup // SigortamRahat — Sigorta acentelerinin teklif, poliçe, hasar, zeyil ve muhasebe evraklarını tek tıkla kurumsal bir hiyerarşide arşivlemesini sağlayan, harici kurulum gerektirmeyen Windows Batch (.BAT) otomasyon aracı.**

[![GitHub Repo](https://img.shields.io/badge/GitHub-Kaynak_Kod-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/batuhanbayatli/sigortamrahat-musteri-arsivleyici-bat)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows_All-0078D6?style=for-the-badge&logo=windows&logoColor=white)](#)
[![License: MIT](https://img.shields.io/badge/Lisans-MIT-059669?style=for-the-badge)](LICENSE)

---

## 📌 Proje Genel Bakışı

Sigorta acentelerinde en sık karşılaşılan operasyonel problemlerden biri; her personelin müşterilere ait ruhsat, teklif, poliçe ve hasar evraklarını masaüstünde dağınık şekilde saklamasıdır.

**SigortamRahat Müşteri Klasör Arşivleyici**, tek bir `.bat` dosyası ile tüm Windows sürümlerinde saniyeler içinde çalışır. Hem **tekil müşteri** (TCKN/VKN entegre müşteri kartıyla birlikte) hem de **toplu liste (`musteri_listesi.txt`)** üzerinden standart kurumsal arşiv klasör setini otomatik olarak inşa eder.

---

## 📁 Standart Arşiv Mimarisi

Oluşturulan her müşteri ana dizini altında şu standart mimari kurulur:

```text
[Müşteri Adı] - [TCKN / VKN]/
│
├── 📄 Musteri_Bilgi_Karti.txt       (Tarih, kimlik ve operasyonel notlar)
├── 📂 01_Teklifler                   (Verilen fiyat teklifleri ve çalışmalar)
├── 📂 02_Policeler/                  (Kesilen poliçe PDF belgeleri)
│   ├── 📁 Trafik_Kasko
│   ├── 📁 DASK_Konut_Isyeri
│   ├── 📁 Saglik_TSS_OSS
│   └── 📁 Diger_Branslar
├── 📂 03_Kimlik_Ruhsat_Tapu          (Kimlik fotokopisi, ruhsat, tapu, DASK evrakları)
├── 📂 04_Hasar_ve_Tazminat           (Kaza tutanakları, fotoğraflar, eksper raporları)
├── 📂 05_Zeyilname_ve_Iptaller       (Adres/plaka/dönem zeyilleri, iptal belgeleri)
└── 📂 06_Muhasebe_Makbuz_Dekont      (Tahsilat makbuzları, banka dekontları)

---

## ✨ Temel Özellikler

* ⚡ **Sıfır Bağımlılık (Zero-Dependency):** Python, Node.js veya herhangi bir ek yazılım kurmaya gerek yoktur; saf Windows komut satırı ile çalışır.
* 👤 **Tekil Müşteri Modu:** Ad, soyad ve TCKN/VKN bilgilerini alarak müşteri adına özel klasör ve otomatik bilgi kartı (`Musteri_Bilgi_Karti.txt`) üretir.
* 📋 **Toplu Müşteri Modu:** `musteri_listesi.txt` içerisindeki yüzlerce müşteriyi tek tıkla saniyeler içinde klasörler.
* 🖥️ **Evrensel Windows Uyumluluğu:** Windows 7, 8, 10, 11 ve tüm Windows Server sürümleriyle %100 uyumludur.

---

## 🚀 Kurulum ve Kullanım

1. `SigortamRahat_Arsivleyici.bat` dosyasını indirin.
2. Arşivinizi oluşturmak istediğiniz klasöre (veya ortak ağ sürücüsüne) yapıştırın.
3. Dosyaya çift tıklayarak çalıştırın ve menüden seçiminizi yapın:
   * `[1]` Tek müşteri kaydı oluşturma
   * `[2]` `musteri_listesi.txt` üzerinden toplu klasör açma

---

## 🏛️ bGroup 3M Ekosistem Entegrasyonu

| Ekosistem Katmanı | İlgili Marka | Rol & Katkı |
| :--- | :--- | :--- |
| **🛠️ Mutfak** | **bAI** | Komut satırı betik mimarisi ve otomasyon mantığı. |
| **🏢 Model** | **SigortamRahat** | Acente içi operasyonel dosya yönetim vitrini. |
| **🏢 Model** | **bSigorta** | Acente iş akışları ve evrak standardizasyonu stratejisi. |
| **📢 Medya** | **Sigortakademi** | Acente personeli dosyalama standartları eğitim kılavuzu. |

---

## 👨‍💻 Geliştirici & İletişim

**Batuhan Bayatlı**  
*InsurTech & FinTech Specialist | SEGEM | Japanese & English Bilingual*

* 🌐 **LinkedIn:** [linkedin.com/in/batuhanbayatlı](https://www.linkedin.com/in/batuhanbayatlı)
* 💻 **GitHub:** [github.com/batuhanbayatli](https://github.com/batuhanbayatli)

