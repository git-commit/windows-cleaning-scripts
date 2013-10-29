@echo Wartung.cmd
@echo Achtung: Diese Wartungsoperationen koennen einige Zeit in Anspruch nehmen!
@echo Den Rechner nicht abschalten - auch wenn er scheinbar nichts mehr tut.
@echo.
@echo.
@echo Entfernt den Abgesicherten Modus mit Eingabeaufforderung und setzt den normalen Start:
bcdedit /deletevalue safeboot
bcdedit /deletevalue safebootalternateshell
@echo.
@echo.
@echo Setzt die originale Einstellung für AlternateShell:
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" /v AlternateShell /t REG_SZ /d "cmd.exe" /f
REM @echo.
REM @echo.
REM @echo Setzt die Auslagerungsdatei wieder auf 4 GB Groesse:
REM REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "c:\pagefile.sys 4096 4096" /f
@echo.
@echo.
@echo Setzt einen Dateisystemcheck in Gang, der beim Neustart durchgefuehrt wird:
echo j | chkdsk /f
@echo.
@echo.
@echo Loescht die gespeicherten Patches aus C:\Windows\Installer:
del /f /s c:\windows\installer\*.msp
@echo.
@echo.
@echo Entfernt das Verzeichnis $PatchCache$ aus C:\Windows\Installer:
rd /s /q c:\windows\installer\$patchcache$
@echo.
@echo.
@echo Loescht die Precompiled Inf Files (*.pnf) aus C:\Windows\Inf und seinen Unterverzeichnissen:
del /f /s c:\windows\inf\*.pnf
@echo.
@echo.
@echo Fuehrt einen Systemdateicheck durch:
sfc /scannow
@echo.
@echo.
@echo Defragmentiert die Festplatten:
defrag /c /u /v /x
@echo.
@echo.
@echo Startet den Rechner neu:
shutdown /r /t 0