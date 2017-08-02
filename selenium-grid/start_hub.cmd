@echo off

title Selenium Hub

echo ==============================================================================
echo ====                                                                      ====
echo ====                             Selenium Hub                             ====
echo ====                                                                      ====
echo ====                                                                      ====
echo ====                       Powered by Selenium Grid                       ====
echo ====                                                                      ====
echo ==============================================================================

set info_tag=[ INFO ]
set error_tag=[ ERROR ]
set selenium_server_jar=.\selenium-server-standalone-3.4.0.jar

echo %time% %info_tag% Trying to find selenium server...
if not exist %selenium_server_jar% (
	echo %time% %error_tag% Selenium server jar not found by path %selenium_server_jar%
	pause
	exit
)

echo %time% %info_tag% Selenium server jar found by path %selenium_server_jar%


echo %time% %info_tag% Starting selenium hub...
java -jar %selenium_server_jar% -role hub