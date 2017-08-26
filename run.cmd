@echo off

title RF Tool

echo ==============================================================================
echo ====                                                                      ====
echo ====                               RF Tool                                ====
echo ====                                                                      ====
echo ====                                                                      ====
echo ====                      Powered by Robot Framework                      ====
echo ====                                                                      ====
echo ==============================================================================

set info_tag=[ INFO ]
set error_tag=[ ERROR ]
set ini_file=run.ini

if not exist %ini_file% (
	echo %time% %error_tag% File %ini_file% with settings are absent
	pause
	exit
)

rem Parse ini file
FOR /F "tokens=*" %%A IN ('type "%ini_file%"') DO SET %%A

echo %time% %info_tag% Cleaning old results...

if exist %results_folder% (
	echo %time% %info_tag% Removing old results...
	del %results_folder% /Q
	echo %time% %info_tag% Results have been deleted
) else (
	echo %time% %info_tag% Old results are absent
)

if not exist %scenarios_src% (
	echo %time% %error_tag% Scenarios sources are absent by path %scenarios_src%
	pause
	exit
)

echo %time% %info_tag% Starting AT...
java -cp %libraries_folder%\* org.robotframework.RobotFramework -d %results_folder% %scenarios_src%

if %errorlevel% neq 0 (
    echo %time% %error_tag% Starting AT finished with errors
    pause
)

start %results_folder%\report.html