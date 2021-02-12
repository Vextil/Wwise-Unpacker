@echo off

set TYPE=%1
echo === Wwise_Unpacker v1.1 ===
echo.
echo -- Unpacking to '%TYPE%'

goto:start

rem ================= Methods
:UNPACK_WAV
  echo -- UNPACK_WAV
  mkdir Decoding > nul 2>&1
  mkdir WAV > nul 2>&1
  echo ... Running 'quickbms'
  FOR %%a IN ("Game Files\*.PCK") DO ("Tools\quickbms.exe" "Tools\wwise_pck_extractor.bms" "%%a" "Decoding")
  echo ... Running 'bnkextr'
  FOR %%b IN ("Game Files\*.BNK") DO ("Tools\bnkextr.exe" "%%b" & REN *.wav *.wem & MOVE *.wem "Decoding")
  echo ... Running 'vgmstream-cli'
  FOR %%a IN ("Decoding\*.WEM")   DO ("Tools\vgmstream-cli.exe" -o "WAV\%%~na.wav" "%%a" & echo.)
goto:eof

:UNPACK_MP3
  echo -- UNPACK_MP3
  mkdir MP3 > nul 2>&1
  rem call :UNPACK_WAV
  echo ... Running 'ffmpeg'
  FOR %%e IN (WAV\*.WAV) DO (echo Converting %%e & "Tools\ffmpeg.exe" -loglevel error -y -i "%%e" -acodec libmp3lame -q:a 0 -y "MP3\%%~ne.mp3" & DEL "%%e")
goto:eof


rem ================= Main
:start
if "%TYPE%"=="WAV" (
  call :UNPACK_WAV
)
if "%TYPE%"=="MP3" (
  call :UNPACK_MP3
)


rem ================= Footer
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