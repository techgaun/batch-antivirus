@ECHO off
::Batch Antivirus By Sam207
::Version 0.0.2
::Coder: sam207 aka 5ilik0n [Samar Dhwoj Acharya]
::E-mail: samar_acharya[at]hotmail[dot]com
::Blog: http://www.techgaun.com
::Site: http://www.nepali.netau.net
::What will be on next version => startup cleanup, disk cleanup, defragmentation & I dunno what would be more
::When will next version be released => I dunno [depends in my mood]
REM Disclaimer: This is not intended to make any damage to the system
REM This tool is made in the hope that it would help many people out there
REM Any kind of comments and suggestions are heartily welcomed via e-mail
REM In many case, it is good to run in safe mode to ensure virus removal
REM I am not responsible for any damage you may face because of using this
REM Please notify me of any bugs you find in this code, I haven't tested it much...
REM Every one allowed to modify this batch file without my permission
REM Free to share until the above comments are present in the file
COLOR 0f
TITLE Batch Antivirus By sam207
CLS
::For Win NT systems::
::Tested under WinXP only
::Modify this if you want to try on other system at ur own risk
IF NOT "%OS%"=="Windows_NT" (
	ECHO.
	ECHO Not tested for other OS than WinXP
	ECHO Edit this code to work for other OS at your risk
	ECHO Quitting...
	PAUSE
	EXIT
   )
::starting part

:START
CLS
ECHO.
ECHO ::::::::::::::: Batch Antivirus By Sam207:::::::::::::::
ECHO :::::::::::::: http://www.techgaun.com :::::::::::::::::
ECHO ::::::::::: coolsamar207[at]gmail[dot]com   ::::::::::::
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Read program instructions carefully
PAUSE
COLOR 76
ECHO *This program will try to eliminate virus from Pen Drive and hard drives
ECHO *Use at your own risk and remember not to delete your files accidentally..
ECHO *First, try to delete autorun.inf from first option and rm other virii...
ECHO *I am not responsible for any damage that might happen to your pc/pen drive
ECHO *While entering drive, make sure you enter correctly. EG: f:\ or g:\
ECHO.
PAUSE
GOTO SELECTDRIVE

::Credits for developer

:CREDITS
CLS
ECHO.
ECHO.
ECHO 	##############################
ECHO 	# Coded by sam207 from Nepal #
ECHO 	# Name: Samar Dhwoj Acharya  #
ECHO 	##############################
ECHO.
PAUSE
GOTO MAINMENU

::Drive selection part

:SELECTDRIVE
CLS
COLOR 3f
ECHO.
ECHO	DRIVE SELECTION
SET /p _drive= Enter drive letter of your pendrive correctly(eg k:\):
IF %ERRORLEVEL% GTR 0 (
	ECHO Please Enter valid parameter
	ECHO.
	PAUSE
	GOTO SELECTDRIVE
	)
IF NOT EXIST %_drive% (
	ECHO.
	ECHO Drive you entered doesnt exist or has wrong format
	ECHO Please RETRY
	ECHO.
	PAUSE
	GOTO SELECTDRIVE
	)
CLS
COLOR 70
ECHO Batch Antivirus Working On %_drive%
ECHO.
PAUSE

::Main menu part of the program

:MAINMENU
CLS
COLOR 8f
ECHO				Batch Antivirus By Sam207
ECHO				SELECT DRIVE: %_drive%
ECHO			Options:
ECHO			[ 1 ]: Change Drive
ECHO			[ 2 ]: Delete Autorun.inf
ECHO			[ 3 ]: Make all files and folders visible
ECHO			[ 4 ]: Check for bad sectors and repair
ECHO			[ 5 ]: Delete all files of specific size
ECHO			[ 6 ]: Delete suspected hidden virii like files
ECHO			[ 7 ]: View system info
ECHO			[ 8 ]: De-activate some virus processes
ECHO			[ 9 ]: Clean/repair registry
ECHO			[ 10 ]: Delete some virii
ECHO			[ 11 ]: Credits/Developer
ECHO			[ 12 ]: Exit
ECHO.
SET /p _choice=			Enter your choice: 

IF /I "%_choice%" == "1" (
	GOTO OPTION1
	)

IF /I "%_choice%" == "2" (
	GOTO OPTION2
	)
	
IF /I "%_choice%" == "3" (
	GOTO OPTION3
	)
	
IF /I "%_choice%" == "4" (
	GOTO OPTION4
	)
	
IF /I "%_choice%" == "5" (
	GOTO OPTION5
	)
	
IF /I "%_choice%" == "6" (
	GOTO OPTION6
	)
	
IF /I "%_choice%" == "7" (
	GOTO OPTION7
	)
	
IF /I "%_choice%" == "8" (
	GOTO OPTION8
	)

IF /I "%_choice%" == "9" (
	GOTO OPTION9
	)
	
IF /I "%_choice%" == "10" (
	GOTO OPTION10
	)
	
IF /I "%_choice%" == "11" (
	GOTO OPTION11
	)
	
IF /I "%_choice%" == "12" (
	GOTO OPTION12
	)
	
	
CLS
ECHO.
ECHO Invalid choice
ECHO Please give proper choice
PAUSE
GOTO MAINMENU
	
::First option for changing drive

:OPTION1
GOTO SELECTDRIVE

::Second option for deleting autorun.inf

:OPTION2
CLS
ECHO [ 1 ]: Delete autorun.inf from drive
IF EXIST %_drive%autorun.inf (
	ECHO Autorun file found
	ECHO Will be deleted...
	DEL /f /a %_drive%autorun.inf
	ECHO.
	ECHO Wait few seconds
	PAUSE
	IF EXIST %_drive%autorun.inf (
		ECHO Autorun.inf still exists
		ECHO Seems there's already an active virus in ur system
		ECHO Taskkill Or Clean it
		PAUSE
		GOTO MAINMENU
		) ELSE (
		ECHO.
		ECHO Autorun file successfully deleted
		PAUSE
		GOTO MAINMENU
		)
	) ELSE (
	ECHO Autorun.inf file doesn't exist
	PAUSE
	GOTO MAINMENU
	)
ECHO.
PAUSE
GOTO MAINMENU

::Third option for changing attributes of all files and folders in the pendrive

:OPTION3
CLS
ECHO [ 2 ]: Make all files and folders visible
ECHO Takes time according to number of files
ECHO Wait a few seconds...
ECHO.
ATTRIB -S -H %_drive%*.* /D /S
ECHO All files/folders made visible
ECHO.
PAUSE
GOTO MAINMENU

::Fourth option for checking bad sectors and repairing the drive
:OPTION4
CLS
ECHO [ 4 ]: Check for bad sectors and repair
ECHO This option will run chkdsk utility
ECHO Your drive will be unmounted
CHKDSK /f %_drive%
ECHO.
ECHO repairing finished
PAUSE
GOTO MAINMENU

::Fifth option for deleting files of specific size

:OPTION5
CLS
ECHO [ 5 ]: Delete all files of specific size
ECHO.
ECHO You will have to give the value of one file in bytes
ECHO Right click file and view properties to get size in bytes
SET /p _fsize= Enter the file size in bytes: 
::This feature needs more update & better idea(if you have)...
GOTO SEARCHANDDEL
:SEARCHANDDEL
ECHO.
ECHO.
ECHO Looking files of size %_fsize% bytes . . .
FOR /R %_drive% %%X IN (*) DO (
	IF %%~zX == %_fsize% (
		ECHO.
		ECHO %%~ftzaX %%~zX
		DEL "%%~fX" /P /F /A
		)
	)
ECHO.
ECHO.
PAUSE
GOTO MAINMENU

::Sixth option for deleting suspected hidden exe files

:OPTION6
CLS
ECHO [ 6 ]: Delete suspected hidden exe files
ECHO This deletes suspected hidden exe files in root directory
ECHO.
attrib -s -h C:\NTDETECT.COM
attrib -s -h C:\autoexec.bat
DEL /f /s /ah %_drive%*.exe
DEL /f /s /ah %_drive%*.com
DEL /f /s /ah %_drive%*.cmd
DEL /f /s /ah %_drive%*.bat
DEL /f /s /ah %_drive%*.vbs
DEL /f /s /ah %_drive%*.pif
DEL /f /s /ah %_drive%*.vmx
DEL /f /s /ah %windir%\autorun.inf
DEL /f /s /ah %windir%\system32\autorun.inf
attrib +s +h C:\NTDETECT.COM
attrib +s +h C:\autoexec.bat
ECHO.
ECHO DONE...
PAUSE
GOTO MAINMENU

::seventh option for viewing systeminfo

:OPTION7
CLS
ECHO [ 7 ]: View system info
ECHO Shows the important system informations
PAUSE
ECHO.
SYSTEMINFO
ECHO.
ECHO DONE...
PAUSE
GOTO MAINMENU

::Eighth option for deactivating few virus processes

:OPTION8
CLS
ECHO [ 8 ]: De-activate some virus processes
ECHO This option will end processes of some common virii.
ECHO The error means that virii is not present
PAUSE
taskkill /f /im svichossst.exe
taskkill /f /im RVHOST.exe
taskkill /f /im SCVHSOT.exe
taskkill /f /im smss.exe
taskkill /f /im msmsgs.exe
taskkill /f /im SSVICHOSST.exe
taskkill /f /im user.exe
taskkill /f /im scvhosts.exe
taskkill /f /im "Windows Explorer.exe"
taskkill /f /im a.dll.vbs
taskkill /f /im amvo.exe
taskkill /f /im trojan.exe
taskkill /f /im setupsnk
taskkill /f /im prodigys323.dll
taskkill /f /im avpo.exe
taskkill /f /im _Se.exe
taskkill /f /im isass.exe
taskkill /f /im flash.10.exe
taskkill /f /im ckvo0.dll
taskkill /f /im kavo.exe
taskkill /f /im fun.exe
taskkill /f /im dc.exe
taskkill /f /im Other.exe
ECHO.
ECHO Done...
PAUSE
GOTO MAINMENU

::Ninth option for clearing registry

:OPTION9
ClS
ECHO			[ 9 ]: Clean/repair registry
ECHO			This will try to repair your system registry
ECHO			You will need administrative privilege
ECHO			I'll update it with more registry options
ECHO.
ECHO			   [ 1 ]: Disable autorun
ECHO			   [ 2 ]: Enable folder options
ECHO			   [ 3 ]: Enable hidden files and folders
ECHO			   [ 4 ]: Enable task manager
ECHO			   [ 5 ]: Enable registry tools
ECHO			   [ 6 ]: Back To Main Menu
ECHO.
SET /p _regoption=		Enter your choice: 
IF /I "%_regoption%" == "1" (
	GOTO _REGOPT1
	)
	
IF /I "%_regoption%" == "2" (
	GOTO _REGOPT2
	)
	
IF /I "%_regoption%" == "3" (
	GOTO _REGOPT3
	)
	
IF /I "%_regoption%" == "4" (
	GOTO _REGOPT4
	)
	
IF /I "%_regoption%" == "5" (
	GOTO _REGOPT5
	)
	
IF /I "%_regoption%" == "6" (
	GOTO _REGOPT6
	)
	
CLS
ECHO Invalid Choice
ECHO Please RETRY...
PAUSE
GOTO OPTION9
	
::Registry parts here

:_REGOPT1
ECHO.
ECHO Disabling autorun of USB drives...
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoDriveTypeAutoRun"=dword:0000009f>>temp.reg
REG import temp.reg
del /f temp.reg
PAUSE
GOTO OPTION9

:_REGOPT2
ECHO.
ECHO Enabling folder options...
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoFolderOptions"=->>temp.reg
ECHO 
PAUSE
GOTO OPTION9

:_REGOPT3
ECHO.
ECHO Enabling hidden files, extensions and folders...
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>temp.reg
ECHO "HideFileExt"=dword:00000000>>temp.reg
ECHO "Hidden"=dword:00000002>>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt]>>temp.reg
ECHO "UncheckedValue"=dword:00000000>>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden]>>temp.reg
ECHO "UncheckedValue"=dword:00000001>>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt]>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
ECHO "DefaultValue"=dword:00000001>>temp.reg
ECHO "Text"="@shell32.dll,-30503">>temp.reg
ECHO "Type"="checkbox">>temp.reg
REG import temp.reg
del /f temp.reg
PAUSE
GOTO OPTION9

:_REGOPT4
ECHO.
ECHO Enabling task manager...
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>temp.reg
ECHO "DisableTaskMgr"=dword:00000000>>temp.reg
REG import temp.reg
del /f temp.reg
PAUSE
GOTO OPTION9

:_REGOPT5
ECHO.
ECHO Enabling registry tools...
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>temp.reg
ECHO "DisableRegistryTools"=dword:00000000>>temp.reg
REG import temp.reg
del /f temp.reg
PAUSE
GOTO OPTION9

:_REGOPT6
GOTO MAINMENU

::Tenth option for removing some specific virii

:OPTION10
CLS
ECHO			[ 10 ]: Delete some virii
ECHO			Not all virii are removed by this...
ECHO			But it will delete specific virii listed below.
ECHO.
ECHO			    [ 1 ]: dynrn6e.cmd
ECHO			    [ 2 ]: 1rfw8hjr.com
ECHO			    [ 3 ]: isass virus
ECHO			    [ 4 ]: Kinza virus
ECHO			    [ 5 ]: Funny scandal
ECHO			    [ 6 ]: System.exe
ECHO			    [ 7 ]: SSVICHOSST.exe
ECHO			    [ 8 ]: Macromedia Flash
ECHO			    [ 9 ]: IPH virus
ECHO			    [ 10 ]: Return to main menu
ECHO.
SET /p _virusopt=			  Enter your choice: 
IF /I "%_virusopt%" == "1" (
	GOTO VIRUS1
	)

IF /I "%_virusopt%" == "2" (
	GOTO VIRUS2
	)
	
IF /I "%_virusopt%" == "3" (
	GOTO VIRUS3
	)
	
IF /I "%_virusopt%" == "4" (
	GOTO VIRUS4
	)
	
IF /I "%_virusopt%" == "5" (
	GOTO VIRUS5
	)
	
IF /I "%_virusopt%" == "6" (
	GOTO VIRUS6
	)
	
IF /I "%_virusopt%" == "7" (
	GOTO VIRUS7
	)
	
IF /I "%_virusopt%" == "8" (
	GOTO VIRUS8
	)
	
IF /I "%_virusopt%" == "9" (
	GOTO VIRUS9
	)
	
IF /I "%_virusopt%" == "10" (
	GOTO MAINMENU
	)
	
	
CLS
ECHO Invalid choice
ECHO Please RETRY...
PAUSE
GOTO OPTION10
	
:VIRUS1
CLS
ECHO This will delete dynrn6e.cmd virus from your pc
ECHO.
PAUSE
DEL /f /a %windir%\system32\kavo.exe
DEL /f /a %windir%\system32\kavo0.dll
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>temp.reg
ECHO "Hidden"=dword:00000001>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoDriveTypeAutoRun"=dword:0000000C>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>temp.reg
ECHO "kava"=->>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL]>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
REG import temp.reg
DEL /f temp.reg
ECHO.
ECHO Done...
PAUSE
GOTO OPTION10	

:VIRUS2
CLS
ECHO This will delete 1rfw8hjr.com virus from your PC
ECHO.
PAUSE
DEL /f /a C:\autorun.inf
DEL /f /a D:\autorun.inf
DEL /f /a E:\autorun.inf
DEL /f /a F:\autorun.inf
DEL /f /a "C:\1rfw8hjr.com"
DEL /f /a "D:\1rfw8hjr.com"
DEL /f /a "E:\1rfw8hjr.com"
DEL /f /a "F:\1rfw8hjr.com"
DEL /f /a C:\ov.cmd
DEL /f /a D:\ov.cmd
DEL /f /a E:\ov.cmd
DEL /f /a F:\ov.cmd
DEL /f /a %windir%\system32\ckvo1.dll
DEL /f /a %windir%\system32\ckvo0.dll
DEL /f /a %windir%\system32\ckvo.exe
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoDriveTypeAutoRun"=dword:0000012E>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>temp.reg
ECHO "kamsoft"=->>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL]>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
REG import temp.reg
DEL /f temp.reg
ECHO.
ECHO Done...
ECHO Delete autorun, 1rfw8hjr.com and ov.cmd from other drives too.
PAUSE
GOTO OPTION10

:VIRUS3
CLS
ECHO This will delete isass virus from your pc
ECHO.
PAUSE
TASKKILL /F /IM isass.exe
DEL /f /a %windir%\system32\isass.exe
ECHO.
ECHO Registry restore under construction
ECHO.
PAUSE
GOTO OPTION10

:VIRUS4
CLS
ECHO This will delete kinza virus from your pc
ECHO.
PAUSE
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
taskkill /F /T /IM wscript.exe
taskkill /F /T /IM imapd.exe
taskkill /F /T /IM dxdlg.exe
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>temp.reg
ECHO "Shell"="Explorer.exe">>temp.reg
ECHO "Userinit"="C:\\WINDOWS\\system32\\userinit.exe">>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden]>>temp.reg
ECHO "ValueName"="ShowSuperHidden">>temp.reg
ECHO "CheckedValue"=dword:00000000>>temp.reg
ECHO "UncheckedValue"=dword:00000001>>temp.reg
ECHO "DefaultValue"=dword:00000000>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\Policy\DontShowSuperHidden]>>temp.reg
ECHO @="">>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN]>>temp.reg
ECHO "CheckedValue"=dword:00000002>>temp.reg
ECHO "ValueName"="Hidden">>temp.reg
ECHO "DefaultValue"=dword:00000002>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL]>>temp.reg
ECHO "ValueName"="Hidden">>temp.reg
ECHO "DefaultValue"=dword:00000002>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
REG import temp.reg
DEL /f temp.reg
DEL /a /f %windir%\system32\boot.vbs
DEL /a /f %windir%\system32\wproxp.exe
DEL /a /f %windir%\system32\isetup.exe
DEL /a /f %windir%\system32\imapd.exe 
DEL /a /f %windir%\system32\ActMon.ini
DEL /a /f %windir%\system32\dxdlg.exe
DEL /a /f %windir%\system32\imapde.dll
DEL /a /f %windir%\system32\imapdd.dll
DEL /a /f %windir%\system32\imapdc.dll
DEL /a /f %windir%\system32\imapdb.exe
DEL /a /f %windir%\system32\imapd.exe
DEL /a /f %windir%\system32\imapdb.dll
DEL /a /f %windir%\system32\imapdb.exe
DEL /a /f %windir%\system32\Kinza.exe
ECHO.
ECHO Done...
PAUSE
GOTO OPTION10

:VIRUS5
CLS
ECHO This will delete Funny scandal virus from your pc
ECHO If doesn't work run in safe mode too...
ECHO.
PAUSE
TASKKILL /F /T /IM "killer.exe"
TASKKILL /F /T /IM "Funny UST Scandal.exe"
TASKKILL /F /T /IM "Funny UST Scandal.avi.exe"
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>temp.reg
ECHO "DisableRegistryTools"=dword:00000000>>temp.reg
ECHO "DisableTaskMgr"=dword:00000000>>temp.reg
ECHO "DisableRun"=dword:00000000>>temp.reg
ECHO "NoDispCPL"=dword:00000000>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoFolderOptions"=->>temp.reg
ECHO "DisallowRun"=dword:00000000>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot]>>temp.reg
ECHO "AlternateShell"="cmd.exe">>temp.reg
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL]>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>temp.reg
ECHO "Shell"="Explorer.exe">>temp.reg
REG import temp.reg
DEL /f temp.reg
DEL "%windir%\autorun.inf" /f /a
DEL "%windir%\smss.exe" /f /a
DEL "%windir%\killer.exe" /f /a
DEL "%windir%\Funny UST Scandal.*" /f /a
DEL /f /a C:\log
DEL /f /a D:\log
DEL /f /a "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\lsass.exe"
DEL /f /a "D:\Documents and Settings\All Users\Start Menu\Programs\Startup\lsass.exe"
DEL /f /a "C:\autorun.inf"
DEL /f /a "C:\smss.exe"
DEL /f /a "C:\Funny UST Scandal.*"
DEL /f /a "D:\autorun.inf"
DEL /f /a "D:\smss.exe"
DEL /f /a "D:\Funny UST Scandal.*"
DEL /f /a "E:\autorun.inf"
DEL /f /a "E:\smss.exe"
DEL /f /a "E:\Funny UST Scandal.*"
DEL /f /a "F:\autorun.inf"
DEL /f /a "F:\smss.exe"
DEL /f /a "F:\Funny UST Scandal.*"
ECHO.
ECHO Done...
ECHO If you have more drives, delete the virii prototypes from other drives
PAUSE
GOTO OPTION10

:VIRUS6
CLS
ECHO This will delete System.exe virus from your pc
ECHO.
PAUSE
TASKKILL /f /im /t msmsgs.exe
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>temp.reg
ECHO "HideFileExt"=dword:00000000>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>temp.reg
ECHO "GlobalUserOffline"=->>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoDriveTypeAutoRun"=dword:0000012E>>temp.reg
ECHO "NoFind"=->>temp.reg
ECHO "NoFolderOptions"=->>temp.reg
ECHO [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\system]>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>temp.reg
ECHO "Msmsgs"=->>temp.reg
ECHO "SYS1"=->>temp.reg
ECHO "SYS2"=->>temp.reg
ECHO "SYS3"=->>temp.reg
ECHO "SYS4"=->>temp.reg
ECHO [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_PROCEXP100\0000\Control]>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\ESENT]>>temp.reg
ECHO  "CategoryMessageFile"=hex(2):63,00,3A,00,5C,00,77,00,69,00,6E,00,64,00,6F,00,\>>temp.reg
ECHO   77,00,73,00,5C,00,73,00,79,00,73,00,74,00,65,00,6D,00,33,00,32,00,5C,00,45,\>>temp.reg
ECHO   00,53,00,45,00,4E,00,54,00,2E,00,64,00,6C,00,6C,00,00,00>>temp.reg
ECHO "EventMessageFile"=hex(2):63,00,3A,00,5C,00,77,00,69,00,6E,00,64,00,6F,00,77,\>>temp.reg
ECHO  00,73,00,5C,00,73,00,79,00,73,00,74,00,65,00,6D,00,33,00,32,00,5C,00,45,00,\>>temp.reg
ECHO   53,00,45,00,4E,00,54,00,2E,00,64,00,6C,00,6C,00,00,00>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kmixer\Enum]>>temp.reg
ECHO "0"="SW\\{b7eafdc0-a680-11d0-96d8-00aa0051e51d}\\{9B365890-165F-11D0-A195-0020AFD156E4}">>temp.reg
ECHO "Count"=dword:00000001>>temp.reg
ECHO "NextInstance"=dword:00000001>>temp.reg
REG import temp.reg
DEL /f temp.reg
DEL /f /a C:\autorun.inf
DEL /f /a C:\system.exe
DEL /f /a D:\autorun.inf
DEL /f /a D:\system.exe
DEL /f /a E:\autorun.inf
DEL /f /a E:\system.exe
DEL /f /a %windir%\system32\msmsgs.exe
DEL /f /a %windir%\autorun.inf
ECHO.
ECHO Done...
ECHO Delete virii prototypes if there are more drives
PAUSE
GOTO OPTION10

:VIRUS7
CLS
ECHO This will delete SSVICHOSST.exe virus from your pc
ECHO.
PAUSE
TASKKILL /f /t /im ssvichosst.exe
ECHO Windows Registry Editor Version 5.00>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoDriveTypeAutoRun"=dword:0000012E>>temp.reg
ECHO "NoFind"=->>temp.reg
ECHO "NoFolderOptions"=->>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL]>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
ECHO "DefaultValue"=dword:00000002>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN]>>temp.reg
ECHO "CheckedValue"=dword:00000002>>temp.reg
ECHO "DefaultValue"=dword:00000002>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon]>>temp.reg
ECHO "Shell"="Explorer.exe">>temp.reg
ECHO "Userinit"="%windir%\system32\userinit.exe">>temp.reg
REG import temp.reg
DEL /f temp.reg
DEL /f /a /q %windir%\ssvichosst.exe
DEL /f /a /q %windir%\system32\ssvichosst.exe
ECHO.
ECHO Done...
PAUSE
GOTO OPTION10


:VIRUS8
CLS
ECHO This will delete Macromedia flash virus from your pc
ECHO.
PAUSE
TASKKILL /f /t /im flash.10.exe
TASKKILL /f /t /im macromedia.10.exe
DEL /f /a "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\(empty).empty"
DEL /f /a "C:\Program Files\Common Files\Microsoft Shared\DAO\msn.msn"
DEL /f /a "C:\Program Files\Common Files\Microsoft Shared\macromedia.10.exe"
DEL /f /a %windir%\system32\cmd.com
DEL /f /a %windir%\system32\dxdiag.com
DEL /f /a %windir%\system32\flash.10.com
DEL /f /a %windir%\system32\JambanMu.com
DEL /f /a %windir%\system32\msconfig.com
DEL /f /a %windir%\system32\ping.com
DEL /f /a %windir%\system32\regedit.com
ECHO.
ECHO Registry repair under construction
ECHO.
ECHO Done...
PAUSE
GOTO OPTION10

:VIRUS9
CLS
ECHO This will delete IPH virus from your pc
ECHO.
PAUSE
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
TASKKILL /f /im iph.exe
del %windir%\iph.exe
del %windir%\system.bat
::shutdown -a
ECHO.
ECHO Done...
PAUSE
GOTO OPTION10

::Eleventh option for viewing credits/developers information

:OPTION11
GOTO CREDITS

::Twelvth option for exiting the program

:OPTION12
CLS
ECHO Coded by Samar Dhwoj Acharya
ECHO From Nepal
ECHO E-mail: coolsamar207[at]gmail[dot]com
ECHO Weblog: www.techgaun.com
ECHO Also visit www.nepali.netau.net
ECHO And www.smshell.hostei.com
ECHO N3P4L1 H4CK3RZ 4R3 NO7 D34D, 7H3Y 4R3 UND3RGROUND 4ND M1GH7 B3 @ UR R007
ECHO EXITING...
ECHO.
PAUSE
EXIT
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::			End of file batch antivirus by sam207				:::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
