@echo off

title IE Node

echo ==============================================================================
echo ====                                                                      ====
echo ====                        Internet Explorer Node                        ====
echo ====                                                                      ====
echo ====                                                                      ====
echo ====                       Powered by Selenium Grid                       ====
echo ====                                                                      ====
echo ==============================================================================


call set_common.cmd

set hub_host=localhost
set hub_port=4444
set ie_driver_path=.\drivers\IEDriverServer-x32-3.4.0.exe
set ie_node_port=7777


echo %time% %info_tag% Trying to find IE driver...
if not exist %ie_driver_path% (
	echo %time% %error_tag% IE driver not found by path %ie_driver_path%
	pause
	exit
)

echo %time% %info_tag% IE driver found by path %ie_driver_path%

echo %time% %info_tag% Starting IE node...
java -Dwebdriver.ie.driver=%ie_driver_path% -jar %selenium_server_jar% -port %ie_node_port% -role node -hub http://%hub_host%:%hub_port%/grid/register -browser "browserName=internet explorer,version=10,platform=WINDOWS"

if %errorlevel% neq 0 (
    echo %time% %error_tag% Starting node finished with error
    pause
)