@echo off
@setlocal EnableDelayedExpansion
title SigortamRahat - Musteri Klasor Arsivleyici v1.0
color 0B
mode con: cols=85 lines=32

:MENU
cls
echo ====================================================================================
echo  ##################################################################################
echo  ##                                                                              ##
echo  ##    [+]  S I G O R T A M R A H A T  ^|  M U S T E R I   A R S I V I  [+]       ##
echo  ##                                                                              ##
echo  ##    Mimari ve Gelistirme : Batuhan Bayatli                                    ##
echo  ##    Sistem               : Profesyonel Acente Klasor Yonetim Motoru           ##
echo  ##                                                                              ##
echo  ##################################################################################
echo ====================================================================================
echo.
echo   Bu arac, acenteniz icin standart musteri arsiv klasor hiyerarsisini tek tikla
echo   bulundugu dizinde eksiksiz olarak olusturur.
echo.
echo ------------------------------------------------------------------------------------
echo   [1] Yeni Musteri Klasor Seti Olustur
echo   [2] Toplu Musteri Klasor Seti Olustur (musteri_listesi.txt ile)
echo   [3] Klasor Standart Mimarisi Hakkinda Bilgi
echo   [4] Cikis
echo ------------------------------------------------------------------------------------
echo.
set "secim="
set /p secim="  Seciminiz [1-4]: "

if "%secim%"=="1" goto TEK_MUSTERI
if "%secim%"=="2" goto TOPLU_MUSTERI
if "%secim%"=="3" goto HAKKINDA
if "%secim%"=="4" goto CIKIS
goto MENU

:TEK_MUSTERI
cls
echo ====================================================================================
echo                   SIGORTAMRAHAT - YENI MUSTERI KLASOR OLUSTURMA
echo ====================================================================================
echo.
set "m_ad="
set /p m_ad="  >> Musteri Adi Soyadi / Ticari Unvan : "
if "%m_ad%"=="" goto TEK_MUSTERI

set "m_kimlik="
set /p m_kimlik="  >> TCKN / VKN / Pasaport No          : "
if "%m_kimlik%"=="" set "m_kimlik=BELIRTILMEDI"

set "HEDEF_KLASOR=%m_ad% - %m_kimlik%"

echo.
echo  ----------------------------------------------------------------------------------
echo   Olusturuluyor: %HEDEF_KLASOR%
echo  ----------------------------------------------------------------------------------

mkdir "%HEDEF_KLASOR%\01_Teklifler" 2>nul
mkdir "%HEDEF_KLASOR%\02_Policeler\Trafik_Kasko" 2>nul
mkdir "%HEDEF_KLASOR%\02_Policeler\DASK_Konut_Isyeri" 2>nul
mkdir "%HEDEF_KLASOR%\02_Policeler\Saglik_TSS_OSS" 2>nul
mkdir "%HEDEF_KLASOR%\02_Policeler\Diger_Branslar" 2>nul
mkdir "%HEDEF_KLASOR%\03_Kimlik_Ruhsat_Tapu" 2>nul
mkdir "%HEDEF_KLASOR%\04_Hasar_ve_Tazminat" 2>nul
mkdir "%HEDEF_KLASOR%\05_Zeyilname_ve_Iptaller" 2>nul
mkdir "%HEDEF_KLASOR%\06_Muhasebe_Makbuz_Dekont" 2>nul

(
echo ========================================================
echo               SIGORTAMRAHAT MUSTERI KARTI
echo ========================================================
echo Musteri Unvan   : %m_ad%
echo Kimlik/Vergi No : %m_kimlik%
echo Olusturma Tarihi: %date% %time%
echo Gelistirici     : Batuhan Bayatli ^| SigortamRahat
echo ========================================================
echo Notlar:
echo - Policeleri ilgili brans alt klasorune aktariniz.
echo - Hasar evraklarini tarih sirasiyla 04 klasorune ekleyiniz.
) > "%HEDEF_KLASOR%\Musteri_Bilgi_Karti.txt"

echo.
echo   [OK] Musteri klasor seti ve alt dizinler basariyla olusturuldu!
echo.
echo ====================================================================================
pause
goto MENU

:TOPLU_MUSTERI
cls
echo ====================================================================================
echo                   SIGORTAMRAHAT - TOPLU MUSTERI KLASORU OLUSTURMA
echo ====================================================================================
echo.
echo   Ayni dizinde 'musteri_listesi.txt' adinda bir dosya olmalidir.
echo   Her satira bir musteri adi yazarak toplu klasor acabilirsiniz.
echo.
if not exist "musteri_listesi.txt" (
    echo   [!] 'musteri_listesi.txt' dosyasi bulunamadi. Ornek bir dosya olusturuluyor...
    (
        echo Ahmet Yilmaz
        echo Mehmet Demir
        echo Ayse Kaya
    ) > "musteri_listesi.txt"
    echo   [OK] 'musteri_listesi.txt' olusturuldu. Duzenleyip tekrar calistirabilirsiniz.
    echo.
    pause
    goto MENU
)

echo   Islem baslatiliyor...
for /f "usebackq tokens=* delims=" %%A in ("musteri_listesi.txt") do (
    if not "%%A"=="" (
        mkdir "%%A\01_Teklifler" 2>nul
        mkdir "%%A\02_Policeler" 2>nul
        mkdir "%%A\03_Kimlik_Ruhsat_Tapu" 2>nul
        mkdir "%%A\04_Hasar_ve_Tazminat" 2>nul
        mkdir "%%A\05_Zeyilname_ve_Iptaller" 2>nul
        mkdir "%%A\06_Muhasebe_Makbuz_Dekont" 2>nul
        echo   [+] Klasor olusturuldu: %%A
    )
)
echo.
echo   [OK] Listedeki tum musteriler icin standart klasorler olusturuldu!
echo.
pause
goto MENU

:HAKKINDA
cls
echo ====================================================================================
echo                           STANDART ARSIV MIMARISI
echo ====================================================================================
echo.
echo   01_Teklifler             : Verilen fiyat teklifleri ve calismalar
echo   02_Policeler             : Kesilen police PDF'leri (Brans alt klasorlu)
echo   03_Kimlik_Ruhsat_Tapu    : Musteri belgeleri, ruhsat fotokopisi, DASK belgeleri
echo   04_Hasar_ve_Tazminat     : Kaza tutanaklari, fotograflar, ekspertiz raporlari
echo   05_Zeyilname_ve_Iptaller : Adres/plaka degisikligi, iptal zeyilleri
echo   06_Muhasebe_Makbuz_Dekont: Tahsilat makbuzlari, odeme dekontlari
echo.
echo   Tasarim ve Gelistirme : Batuhan Bayatli
echo   Platform              : SigortamRahat
echo ====================================================================================
echo.
pause
goto MENU

:CIKIS
cls
echo.
echo   SigortamRahat - Batuhan Bayatli iyi calismalar diler!
timeout /t 2 >nul
exit