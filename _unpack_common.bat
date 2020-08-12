@echo off
mkdir "Tools\Decoding"
mkdir "OGG"
mkdir "MP3"
mkdir "WAV"

set TYPE=%1
echo -- Unpacking to '%TYPE%'
@echo on

if "%TYPE%"=="WAV" (
FOR %%a IN ("Game Files\*.PCK") DO ("Tools\quickbms.exe" "Tools\wavescan.bms" "Game Files" "Tools\Decoding")
FOR %%b IN ("Game Files\*.BNK") DO ("Tools\bnkextr.exe" "%%b" & MOVE *.wav "Tools\Decoding")
FOR %%a IN ("Tools\Decoding\*.WEM") DO ("Tools\vgmstream-cli.exe" -o "WAV\%%~na.wav" "%%a")
)

if "%TYPE%"=="OGG" (
FOR %%a IN ("Game Files\*.PCK") DO ("Tools\quickbms.exe" "Tools\wavescan.bms" "Game Files" "Tools\Decoding")
FOR %%b IN ("Game Files\*.BNK") DO ("Tools\bnkextr.exe" "%%b" & MOVE *.wav "Tools\Decoding")
FOR %%c IN (Tools\Decoding\*.WAV) DO ("Tools\ww2ogg.exe" "%%c" --pcb Tools\packed_codebooks_aoTuV_603.bin & DEL "%%c")
FOR %%d IN (Tools\Decoding\*.OGG) DO ("Tools\revorb.exe" "%%d" & MOVE "%%d" "%TYPE%")
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

:choice

set /P c=Should I delete BNKs and PCKs from the 'Game Files' folder [Y/N]?
if /I "%c%" EQU "Y" goto :yes
if /I "%c%" EQU "N" goto :hella_no
goto :choice

:yes

FOR %%e IN ("Game Files\*.PCK") DO (DEL "%%e")
FOR %%f IN ("Game Files\*.BNK") DO (DEL "%%f")

echo Files deleted, enjoy your unpacked audio! -/u/Vextil ;)
pause 
exit

:hella_no

echo BNKs and PCKs kept, enjoy your unpacked audio! -/u/Vextil ;)

pause
exit

pause