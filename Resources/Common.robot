*** Settings ***
Library           Selenium2Library
Library           SauceLabs.py

*** Variables ***
@{_tmp}           browserName: %{SELENIUM_BROWSER},    platform: %{SELENIUM_PLATFORM},    version: %{SELENIUM_VERSION},    name: %{JENKINS_BUILD_NUMBER}    build: %{JENKINS_BUILD_NUMBER}
${BROWSER}        %{SELENIUM_BROWSER}
${CAPABILITIES}    ${EMPTY.join(${_tmp})}
${KEY}            %{SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}
${REMOTE_URL}     http://${KEY}@ondemand.saucelabs.com:80/wd/hub

*** Keywords ***
Open test browser
    Open browser    https://www.tn.com.ar    browser=${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${CAPABILITIES}
    Comment    Log To Console    SauceOnDemandSessionID=<${SAUCE_SESSION_ID}> job-name=<%JENKINS_BUILD_NUMBER>

Close test browser
    Comment    Run keyword if    '${REMOTE_URL}' != ''    Report Sauce status    ${TEST_NAME}    ${TEST_STATUS}
    ${sauceSessionId}=    Report Sauce status    ${TEST_NAME}    ${TEST_STATUS}
    Log To Console    ${sauceSessionId]}
    Close all browsers

Wait
    sleep    10s
