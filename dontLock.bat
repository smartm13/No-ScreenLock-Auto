@if (@CodeSection == @Batch) @then

if "%1"=="yes" goto direct
 
echo CreateObject("Wscript.Shell").Run "" ^& WScript.Arguments(0) ^& "", 0, False >%tmp%\inv.vbs

wscript.exe %tmp%\inv.vbs "%~f0 yes"

del /q %tmp%\inv.vbs > NUL
goto :EOF

:direct
set delstop=del /q /f %tmp%\%~n0exit.txt > NUL
echo echo HOLA ^>%tmp%\%~n0exit.txt > %~p0\%~n0stop.bat
%delstop%
:init
cd \Users\%username%\Desktop\NoLock\
set /a Tot=15
set /a each=10
:LOOP
mouse moveby 0x-1
mouse moveby 0x1

:waitinit
set /a t=1
:wait
REM wait timeout/ping lines
ping -n %each% -w 1 127.0.0.1 > NUL
set /a t=%t%+1

if exist %tmp%\%~n0exit.txt ( 
%delstop%
goto ender
)
if %t% GEQ %Tot% (
goto :LOOP
)
else (
goto wait
)
:ender

@end
// JScript section
 
var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));

