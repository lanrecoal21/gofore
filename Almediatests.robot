*** Settings ***
Documentation    Suite description
Library   SeleniumLibrary
Resource  variable_keywords.robot

*** Test Cases ***
Add Ingredients to shopping ist
    Go to home page and accept cookies
    Navigate to Kotikokkit home page
    Enter dish type and click the search button  makaronilaatikko
    Select dish types and assert results


    
