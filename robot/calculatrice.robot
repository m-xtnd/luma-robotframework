*** Settings ***
Library  ../calculatrice.py

*** Test Cases ***
NomDuTest
    [Documentation]  Test d'addition.
    ${nomVariable}    addition    5    3
    Should Be Equal As Numbers    ${nomVariable}    8

Test_Soustraction
    [Documentation]    Test soustraction.
    ${testSoustraction}    soustraction    5    2
    Should Be Equal As Numbers    ${testSoustraction}    3

Test_Multiplication
    [Documentation]    Test multiplication.
    ${testMultiplication}    multiplication    2    10
    Should Be Equal As Numbers    ${testMultiplication}    20

Test_Division
    [Documentation]    Test division.
    ${testDivision}    division    5    2
    Should Be Equal As Numbers    ${testDivision}    2.5

Test_Division_0
    [Documentation]    Test exception division par 0.
    ${testDivision_0}    division    5    0
    Should Be Equal As Strings    ${testDivision_0}    Division par 0 impossible.

