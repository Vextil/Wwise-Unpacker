@echo off

mkdir Decoding > nul 2>&1
mkdir OGG > nul 2>&1
mkdir MP3 > nul 2>&1
mkdir WAV > nul 2>&1

set TYPE=%1

echo === Wwise_Unpacker v1.1 ===
echo.
echo -- Unpacking to '%TYPE%'
@echo on

if "%TYPE%"=="WAV" (
FOR %%a IN ("Game Files\*.PCK") DO ("Tools\quickbms.exe" "Tools\wwise_pck_extractor.bms" "%%a" "Decoding")
FOR %%b IN ("Game Files\*.BNK") DO ("Tools\bnkextr.exe" "%%b" & REN *.wav *.wem & MOVE *.wem "Decoding")
FOR %%a IN ("Decoding\*.WEM") DO ("Tools\vgmstream-cli.exe" -o "WAV\%%~na.wav" "%%a" & echo.)
)

if "%TYPE%"=="OGG" (
FOR %%a IN ("Game Files\*.PCK") DO ("Tools\quickbms.exe" "Tools\wavescan.bms" "%%a" "Decoding")
FOR %%b IN ("Game Files\*.BNK") DO ("Tools\bnkextr.exe" "%%b" & MOVE *.wav "Decoding")
FOR %%c IN (Decoding\*.WAV) DO ("Tools\ww2ogg.exe" "%%c" --pcb Tools\packed_codebooks_aoTuV_603.bin & DEL "%%c")
FOR %%d IN (Decoding\*.OGG) DO ("Tools\revorb.exe" "%%d" & MOVE "%%d" "%TYPE%")
)

if "%TYPE%"=="MP3" (
FOR %%e IN (MP3\*.OGG) DO ("Tools\ffmpeg.exe" -i "%%e" -acodec libmp3lame -q:a 0 -y "MP3\%%~ne.mp3" & DEL "%%e")
)

@echo off

echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    ((  '####@@!!$$    ))
echo        `#####@@!$$`  ))
echo     ((  '####@!!$:
echo    ((  ,####@!!$:   ))
echo        .###@!!$:
echo        `##@@!$:
echo         `#@!!$
echo   !@#    `#@!$:       @#$
echo    #$     `#@!$:       !@!
echo             '@!$:
echo         '`\   '!$: /`'
echo            '\  '!: /'
echo              '\ : /'
echo   -.'-/\\\-.'//.-'/:'\.'-.JrS'.'-=_\\
echo ' -.'-.\\'-.'//.-'.`-.'_\\-.'.-\'.-//
echo      Watch out, it's the tornado!
                                                                 
echo.
echo -------------------------------------------------------------

echo Unpack finished! Files should be in the '%TYPE%' folder

echo -------------------------------------------------------------
echo.

pause
