*** Settings ***
Test Setup        Common.Open test browser
Test Teardown     Common.Close test browser
Resource          ../Resources/Common.robot

*** Variables ***

*** Test Cases ***
Prueba Tn En Saucelabs
    [Setup]    Open test browser
    Page should contain    Todo Noticias
    Wait
    [Teardown]    Close test browser
