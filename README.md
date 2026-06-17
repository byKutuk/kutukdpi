# KutukDPI

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)](https://www.microsoft.com/windows)

**KutukDPI**, Vodafone ve diger Turk internet saglayicilarinda Discord gibi engelli hizmetlere **VPN kullanmadan** erismenizi saglayan acik kaynak bir Windows aracidir.

Bu proje [GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI) uzerine kuruludur ve ayni calisma mantigini kullanir: **WinDivert** surucusu ile ag paketlerini yakalar, DPI (Derin Paket Inceleme) engelini atlatmak icin duzenler ve yeniden gonderir.

> Bu bir VPN degildir. Tum internet trafiginizi yonlendirmez; yalnizca engellenen baglantilari duzeltir.

## Nasil calisir?

1. **WinDivert** — Windows Filtering Platform uzerinden paketleri yakalar
2. **DPI atlatma** — TCP parcalama, sahte paketler, Host/SNI manipulasyonu
3. **DNS yonlendirme** — ISS'nin zehirledigi DNS isteklerini Yandex DNS'e (1253 portu) yonlendirir

Hicbir uzak sunucuya baglanmaz; her sey bilgisayarinizda yerel olarak calisir.

## Hizli baslangic

### Gereksinimler

- Windows 10 veya 11 (64-bit onerilir)
- **Yonetici** yetkisi (zorunlu)
- Antivirusun `WinDivert.dll` / `WinDivert64.sys` dosyalarini silmemesi icin klasoru istisnaya eklemeniz gerekebilir

### Kurulum

1. [Releases](https://github.com/byKutuk/kutukdpi/releases) sayfasindan en son surumu indirin
2. ZIP dosyasini sabit bir konuma cikartin (ornegin `C:\KutukDPI\`)
3. Asagidaki yontemlerden birini secin

### Yontem 1: Tek seferlik (onerilen deneme)

`vodafone_discord.cmd` dosyasina sag tik → **Yonetici olarak calistir**

- Discord odakli mod (`-9` + Discord domain listesi)
- Konsol penceresi kapaninca program durur

### Yontem 2: Windows hizmeti (otomatik baslatma)

`service_install_vodafone.cmd` dosyasina sag tik → **Yonetici olarak kalistir**

- Bilgisayar her acildiginda KutukDPI otomatik baslar
- Kaldirmak icin: `service_remove.cmd` (yonetici olarak)

### Alternatif modlar

| Dosya | Ne zaman? |
|-------|-----------|
| `vodafone_discord.cmd` | Ilk deneme — Discord icin optimize |
| `vodafone_discord_alternative.cmd` | Ilk mod calismazsa (TTL tabanli) |
| `vodafone_discord_full.cmd` | Sadece Discord yetmiyorsa, tum trafik |

## Kaynaktan derleme

Bagimlilik: [MinGW-w64](https://mingw-w64.org) ve [WinDivert 2.2](https://github.com/basil00/WinDivert)

```bash
# WinDivert indir ve ac
wget https://reqrypt.org/download/WinDivert-2.2.0-A.zip
unzip WinDivert-2.2.0-A.zip

cd src
make clean
make CPREFIX=x86_64-w64-mingw32- BIT64=1 \
  WINDIVERTHEADERS=../WinDivert-2.2.0-A/include \
  WINDIVERTLIBS=../WinDivert-2.2.0-A/x64
```

Derleme sonrasi `kutukdpi.exe` ile birlikte `WinDivert.dll` ve `WinDivert64.sys` dosyalarini `x86_64/` klasorune kopyalayin.

## Bilinen sorunlar

- **Kaspersky** antivirusu WinDivert ile uyumsuz olabilir; kaldirmaniz veya baska antiviruse gecmeniz gerekebilir
- **Killer Network** kartlarinda `Advanced Stream Detect` kapatilmalidir
- Bazi fiber tarifelerde Discord uygulamasi web surumunden farkli davranabilir; alternatif modlari deneyin
- ZIP cikardiginiz klasoru tasimayin; hizmet kurulumu dosya yoluna baglidir

## Yasal uyari

Bu yazilim egitim ve arastirma amaclidir. Kullanimindan dogan sorumluluk kullaniciya aittir.

## Tesekkurler

- [ValdikSS / GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI) — Ana DPI atlatma motoru
- [basil00 / WinDivert](https://github.com/basil00/WinDivert) — Paket yakalama kutuphanesi

Detayli atiflar icin [CREDITS.md](CREDITS.md) dosyasina bakin.

## Lisans

Apache License 2.0 — bkz. [LICENSE](LICENSE)
