@ECHO OFF
echo KutukDPI hizmetini kaldirmak icin yonetici olarak calistirin.
echo Sag tik - Yonetici Olarak Calistir.
pause
sc stop "KutukDPI"
sc delete "KutukDPI"
sc stop "WinDivert" 2>nul
sc delete "WinDivert" 2>nul
sc stop "WinDivert14" 2>nul
sc delete "WinDivert14" 2>nul
echo Hizmet kaldirildi.
pause
