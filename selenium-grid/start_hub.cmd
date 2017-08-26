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

call set_common.cmd


echo %time% %info_tag% Starting selenium hub...
java -jar %selenium_server_jar% -role hub