*** Settings ***
Library     AppiumLibrary
Library     DebugLibrary


*** Variables ***
${REMOTE_URL}    http://localhost:4723/wd/hub
${APP_PATH}      /${you_path}/app-release.apk


*** Test Cases ***
TC001 Open Application
    Open Application    ${REMOTE_URL}    platformName=Android    deviceName=Pixel 3a    app=${APP_PATH}  noReset=true

TC002 Add New Todo
    Click Element    com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait until element is visible    com.avjindersinghsekhon.minimaltodo:id/userToDoEditText   15s
    Input Text       com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    create test script
    Click Element    com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains    com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview   15s    
    ${titleTextAdd}  Get text    com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview
    Should Be Equal As Strings    ${titleTextAdd}    Create test script

TC003 Edit Todo list and Set Remind
    Click Element   com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview
    Wait until element is visible   com.avjindersinghsekhon.minimaltodo:id/userToDoEditText   15s
    Clear Text  com.avjindersinghsekhon.minimaltodo:id/userToDoEditText 
    Input Text  com.avjindersinghsekhon.minimaltodo:id/userToDoEditText    create test script Todo
    Click Element   com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
    Click Element   com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText
    Click Element   //android.view.View[@content-desc="26 September 2025"]
    Click Element   com.avjindersinghsekhon.minimaltodo:id/ok
    Click Element   com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains    com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview   15s  
    ${titleTextEdit}  Get text    com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview 
    Should Be Equal As Strings    ${titleTextEdit}    Create test script Todo 

TC004 Delete Todo
    Swipe    start_x=850    start_y=300    end_x=50    end_y=300    duration=1200ms

TC005 Open Night Mode
    Click Element   //android.widget.ImageView[@content-desc="More options"]
    Wait until element is visible   //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element   //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element   android:id/checkbox
    Click Element   //android.widget.ImageButton[@content-desc="Navigate up"]

TC006 Night Mode is off
    Wait until element is visible   //android.widget.ImageView[@content-desc="More options"]
    Click Element   //android.widget.ImageView[@content-desc="More options"]
    Wait until element is visible   //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element   //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element   android:id/checkbox
    Click Element   //android.widget.ImageButton[@content-desc="Navigate up"]





