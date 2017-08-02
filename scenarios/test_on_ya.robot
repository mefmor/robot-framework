*** Settings ***
Documentation   This test will open browser on yandex page
...
...
Library    Selenium2Library

*** Variables ***
${SITE}              http://ya.ru
${HUB}               http://localhost:4444/wd/hub
${SEARCH_REQUEST}    Robot Framework

*** Test Cases ***
Open yandex in FF
    Open Browser    ${SITE}    ff    None    ${HUB}
    Input Text    xpath=//input[@id='text']    ${SEARCH_REQUEST}
    Click Button    xpath=//button[@role="button" and @type="submit"]
    Page Should Contain    ${SEARCH_REQUEST}
    Close All Browsers