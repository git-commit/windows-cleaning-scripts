@echo Reinigung.cmd
@echo Startet die Datentraegerbereinigung mit den maximalen Optionen!
@echo Im Fenster der Datentraegerbereinigung alle Punkte in der 
@echo Liste anhaken und mit OK bestaetigen:
cleanmgr /sageset:65535 & cleanmgr /sagerun:65535
@echo.
@echo.
@echo Setzt den abgesicherten Modus mit Eingabeaufforderung:
bcdedit /set safeboot minimal
bcdedit /set safebootalternateshell yes
@echo.
@echo.
@echo Setzt die Shell für den abgesicherten Modus mit Eingabeaufforderung so, 
@echo dass der Wartungsbatch automatisch ausgefuehrt wird:
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" /v AlternateShell /t REG_SZ /d "wartung.cmd" /f
REM @echo.
REM @echo.
REM @echo Deaktiviert den Ruhezustand:
REM powercfg -h off
REM @echo.
REM @echo.
REM @echo Schaltet die Auslagerungsdatei ab:
REM REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /f
@echo.
@echo.
@echo Startet den Rechner in den zuvor aktivierten abgesicherten Modus, in dem dann der Wartungsbatch ausgefuehrt wird:
shutdown /r /t 0