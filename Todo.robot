*** Settings ***

Library          SeleniumLibrary
Library           String

*** Variables ***
${url}          https://todo-list-login.firebaseapp.com/
${browser}      chrome
${Username}     Rockaustin1234
${email}        wanhawk0714@gmail.com
${password}     H@wk123456



*** Test Cases ***
To do App
    open browser       ${url}      ${browser}
    title should be    Todo App
    maximize browser window
    click element       //a[@class='btn btn-social btn-github']
    switch window         New
    sleep    3
    input text      //input[@name="login"]           ${Username}
    input text      //input[@name="password"]              ${password}
    click element    //input[@name='commit']
    sleep    3
    switch window    Main

#add to do list
    WAIT UNTIL PAGE CONTAINS ELEMENT    //input[@ng-model='home.list']
    input text          //input[@ng-model='home.list']       Cycle
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text          //input[@ng-model='home.list']       Date
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text         //input[@ng-model='home.list']        Run
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text          //input[@ng-model='home.list']        Shop
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text          //input[@ng-model='home.list']        Drive
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text         //input[@ng-model='home.list']          Jump
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text         //input[@ng-model='home.list']           Sleep
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text         //input[@ng-model='home.list']           Gaming
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text         //input[@ng-model='home.list']           Jog
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']
    input text         //input[@ng-model='home.list']           Swim
    click button       //button[@class='btn btn-success btn-block glyphicon glyphicon-plus task-btn']

#log out and log in
    click button        //button[@class='btn btn-default']

    click element       //a[@class='btn btn-social btn-github']
#delete to do list
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep    5
    click button        //li[10]//div[1]//div[2]//button[1]
    click button        //li[9]//div[1]//div[2]//button[1]
    click button        //li[8]//div[1]//div[2]//button[1]
    click button        //li[7]//div[1]//div[2]//button[1]
    click button        //li[6]//div[1]//div[2]//button[1]


#verify list
    page should contain    Cycle
    page should contain    Date
    page should contain    Run
    page should contain    Shop
    page should contain    Drive
    page should not contain    Jump
    page should not contain    Sleep
    page should not contain     Gaming
    page should not contain     Jog
    page should not contain     Swim

    close all browsers