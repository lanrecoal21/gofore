*** Settings ***
Documentation  varibles and keywords Almedia tasks
Library  SeleniumLibrary


*** Variables ***
${URL}  https://www.almamedia.fi
${ACC_COOKIES_BTN}  id=almacmp-modalConfirmBtn
${PALVELUT_TAB}  xpath=//ul[@class="nav navbar-nav"]//li[@class="alma-dropdown alma-trigger"][3]
${TUOTTEET_PALVELUT}  xpath=//a[text() = 'Tuotteet ja palvelut']
${KOTIKOKKIT_BTN}  xpath=//img[@title="Kotikokki_logo_370x370"]
${KOTIKOKKIT_SEARCH_FIELD}  xpath=//input[@id="recipe-search-free-text"]
${KOTIKOKKIT_SEARCH_BTN}  xpath=//a[@id="recipe-search-free-text-submit"]
${PASTA_RADIOBTN}  xpath=//input[@data-alias="pasta"]
${MIXEDMEAT_CHECKBOX}  xpath=//input[@data-alias="mixedmeat"]
${SEARCH_RESULT_PLACEHOLDER}  id=search-results-amount

*** Keywords ***
Go to home page and accept cookies
    Open Browser  ${URL}   Edge
    Maximize Browser Window
    Wait and Click Element  ${ACC_COOKIES_BTN}

Navigate to Kotikokkit home page
    Wait and Click Element     ${PALVELUT_TAB}
    Wait and Click Element  ${TUOTTEET_PALVELUT}
    Wait and Click Element   ${KOTIKOKKIT_BTN}

Enter dish type and click the search button
   [Arguments]  ${dish}
   Switch Window  locator=NEW
   Wait and Click Element    ${KOTIKOKKIT_SEARCH_FIELD}
   Wait and Input Text  ${KOTIKOKKIT_SEARCH_FIELD}   ${dish}
   Wait and Click Element   ${KOTIKOKKIT_SEARCH_BTN}


Select dish types and assert results
   Wait and Click Element   ${PASTA_RADIOBTN}
   Wait and Click Element   ${MIXEDMEAT_CHECKBOX}
   Element Text Should Not Be    ${SEARCH_RESULT_PLACEHOLDER}    0


Wait and Input Text
  [Documentation]  Wait for element to be visible and enabled before interaction
  [Arguments]  ${selector}  ${text}  ${timeouts}=10s
  Wait Until Element is Enabled  ${selector}
  Input Text  ${selector}  ${text}


Wait and Click Element
  [Documentation]  Wait for element to be visible and enabled before interaction
  [Arguments]  ${selector}  ${timeouts}=10s
  Wait Until Element is Enabled  ${selector}
  Click Element  ${selector}
