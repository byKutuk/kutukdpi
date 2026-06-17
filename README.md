# KutukDPI

Vodafone ve diger Turk ISP'lerde Discord gibi engelli hizmetlere **VPN kullanmadan** erismek icin acik kaynak Windows araci.

[GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI) tabanli. **WinDivert** ile ag paketlerini yakalar, DPI engelini atlatir. Bulut servisi degil; bilgisayarinda arka planda calisir.

## Kurulum

1. GitHub Actions'tan en son build ZIP'ini indir
2. `C:\KutukDPI\` gibi sabit bir konuma cikar — **tasima**
3. `HIZMET_KUR.cmd` → cift tik → **Evet**

Arka planda Windows hizmeti olarak calisir. Pencere gerekmez, her acilista otomatik baslar.

Kaldirmak: `HIZMET_KALDIR.cmd`

## Gereksinimler

- Windows 10/11, 64-bit
- Yonetici yetkisi (kurulumda)
- KutukDPI klasorunu antivirus dislamalarina ekle

## Bilinen sorunlar

- Discord **web** acilip **uygulama** acilmiyorsa: tarayicidan "Uygulama olarak yukle"
- Kaspersky WinDivert ile uyumsuz olabilir
- Klasor tasinirsa hizmet calismaz

## Derleme

```bash
cd src && make CPREFIX=x86_64-w64-mingw32- BIT64=1 \
  WINDIVERTHEADERS=../WinDivert/include WINDIVERTLIBS=../WinDivert/x64
```

## Lisans

Apache 2.0 — bkz. [LICENSE](LICENSE). Atiflar: [CREDITS.md](CREDITS.md)
