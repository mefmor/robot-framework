@echo off

echo ==============================================================================
echo ====                                                                      ====
echo ====                         Mozilla Firefox Node                         ====
echo ====                                                                      ====
echo ====                                                                      ====
echo ====                       Powered by Selenium Grid                       ====
echo ====                                                                      ====
echo ==============================================================================

set info_tag=[ INFO ]
set error_tag=[ ERROR ]
set selenium_server_jar=.\selenium-server-standalone-3.4.0.jar

set hub_host=localhost
set hub_port=4444
set ff_driver_path=.\drivers\geckodriver-x32-0.18.0.exe
set ff_node_port=5555

echo %time% %info_tag% Trying to find selenium server...
if not exist %selenium_server_jar% (
	echo %time% %error_tag% Selenium server jar not found by path %selenium_server_jar%
	pause
	exit
)

echo %time% %info_tag% Selenium server jar found by path %selenium_server_jar%

echo %time% %info_tag% Trying to find Geckodriver...
if not exist %ff_driver_path% (
	echo %time% %error_tag% Geckodriver not found by path %ff_driver_path%
	pause
	exit
)

echo %time% %info_tag% Geckodriver found by path %ff_driver_path%

echo %time% %info_tag% Starting firefox node...
java -Dwebdriver.gecko.driver=%ff_driver_path% -jar %selenium_server_jar% -role webdriver -hub http://%hub_host%:%hub_port%/grid/register -port %ff_node_port% -browser browserName=firefox

if %errorlevel% neq 0 (
    echo %time% %error_tag% Starting node finished with error
    pause
)