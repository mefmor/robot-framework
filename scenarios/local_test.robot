*** Settings ***
Documentation   This test will open local page in browser
...
...
Library    Selenium2Library

*** Variables ***
${SITE}              file:///${CURDIR}/test.html
${HUB}               http://localhost:4444/wd/hub
${SEARCH_REQUEST}    Robot Framework

*** Test Cases ***
Open local page in FF
    Open Browser    ${SITE}    ff    None    ${HUB}
    Page Should Contain    Test page
    Close All Browsers