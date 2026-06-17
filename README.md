# KutukDPI

Vodafone ve Turk ISP'lerde **Discord masaustu uygulamasina** VPN'siz erisim.

- **GoodbyeDPI** (`kutukdpi.exe`) — genel DPI atlatma
- **ByeDPI** (`ciadpi.exe`) + **drover** — Discord.exe trafik yonlendirme

## Kurulum

1. GitHub Actions'tan ZIP indir
2. `C:\KutukDPI\` gibi sabit konuma cikar — **tasima**
3. Discord masaustu uygulamasi kurulu olsun
4. `HIZMET_KUR.cmd` → Evet
5. Discord'u kapat ve tekrar ac

Kaldirmak: `HIZMET_KALDIR.cmd`

## Nasil calisir?

Discord.exe normalde sistem agini kullanir ve Vodafone'da engellenir.
KutukDPI, Discord trafikini yerel ByeDPI proxy'sine (127.0.0.1:1080) yonlendirir.
drover DLL'i bunu Discord uygulamasina enjekte eder.

## Sorun giderme

Bkz. [DISCORD.txt](DISCORD.txt)

## Lisans

Apache 2.0 — bkz. [LICENSE](LICENSE), [CREDITS.md](CREDITS.md)
