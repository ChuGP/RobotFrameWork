*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Test Teardown    Close Browser
*** Variables ***
${browser} =    chrome
${youtubeURL} =    https://www.youtube.com/?gl=TW&hl=zh-TW
${shortPeriodOfTime} =   3s
*** Test Cases ***
SearcTest
    Open Youtube
    Input Text After It Is Visible    xpath://input[contains(@id,"search")]    RobotFramework
    Click Button After It Is Visible    xpath://button[@id="search-icon-legacy"]
    Click Element After It Is Visible    xpath://paper-button[@aria-label="搜尋篩選器"]//yt-icon
    Click Element After It Is Visible    xpath://yt-formatted-string[normalize-space()="觀看次數"]
    Pause Execution    
    
*** Keywords ***    
Open Youtube
    Open Browser    ${youtubeURL}    ${browser}
    Maximize Browser Window
    
Input Text After It Is Visible 
    [Arguments]    ${locator}    ${text}
    Wait Until Page Contains Element    ${locator}    timeout=${shortPeriodOfTime}
    Wait Until Element Is Visible    ${locator}    timeout=${shortPeriodOfTime}
    Input Text      ${locator}    ${text}

Click Button After It Is Visible
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    timeout=${shortPeriodOfTime}
    Wait Until Element Is Visible    ${locator}    timeout=${shortPeriodOfTime}
    Click Button      ${locator}

Click Element After It Is Visible
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    timeout=${shortPeriodOfTime}
    Wait Until Element Is Visible    ${locator}    timeout=${shortPeriodOfTime}
    Click Element      ${locator}
    
    
    
   