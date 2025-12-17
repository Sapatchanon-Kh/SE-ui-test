*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    http://localhost:5173/

*** Keywords ***
Login to SE project
    [Arguments]  ${USERNAME}  ${PASSWORD}
    Open Browser    ${URL}  chrome
    Maximize Browser Window
    # 1. กรอก username
    Wait Until Element Is Visible  id=basic_sut_id    10s
    Input Text  id=basic_sut_id  ${USERNAME}
    # 2. กรอก password
    Wait Until Element Is Visible  id=basic_password    10s
    Input Text  id=basic_password  ${PASSWORD}
    # 3. คลิกปุ่ม Login
    Click Element  css=button[type="submit"]
    Sleep  10s

Project Proposal Page
    Wait Until Element Is Visible    xpath=//span[contains(text(), "ยื่นเสนอโครงงาน")]    10s
    Click Element    xpath=//span[contains(text(), "ยื่นเสนอโครงงาน")]
    Sleep  5s

Create New Proposal
    Wait Until Element Is Visible    xpath=//button[contains(., "สร้างคำขอเสนอโครงงานใหม่")]    10s
    Click Element    xpath=//button[contains(., "สร้างคำขอเสนอโครงงานใหม่")]
    Sleep  5s

กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน
    [Arguments]    ${TH_TITLE}    ${EN_TITLE}    ${ABSTRACT}
    Scroll Element Into View   xpath=//textarea[@placeholder='ระบุบทคัดย่อ...']
    # 1. กรอกชื่อภาษาไทย
    Wait Until Element Is Visible    xpath=//input[@placeholder='ระบุชื่อภาษาไทย...']    10s
    Input Text    xpath=//input[@placeholder='ระบุชื่อภาษาไทย...']    ${TH_TITLE}
    
    # 2. กรอกชื่อภาษาอังกฤษ
    Input Text    xpath=//input[@placeholder='Specify English title...']    ${EN_TITLE}
    
    # 3. กรอกบทคัดย่อ
    Input Text    xpath=//textarea[@placeholder='ระบุบทคัดย่อ...']    ${ABSTRACT}


กรอกรายละเอียดโครงงาน
    [Arguments]    ${BACKGROUND_INFO}  ${OBJECTIVES}  ${SCOPE}  ${EXPECTED_RESULTS}
    Wait Until Element Is Visible    xpath=//label[contains(., "ที่มาและความสำคัญ")]/following-sibling::textarea[1]    10s
    Input Text    xpath=//label[contains(., "ที่มาและความสำคัญ")]/following-sibling::textarea[1]    ${BACKGROUND_INFO}
    
    Wait Until Element Is Visible    xpath=//label[contains(., "วัตถุประสงค์")]/following-sibling::textarea[1]    10s
    Input Text    xpath=//label[contains(., "วัตถุประสงค์")]/following-sibling::textarea[1]    ${OBJECTIVES}

    Wait Until Element Is Visible    xpath=//label[contains(., "ขอบเขตของโครงงาน")]/following-sibling::textarea[1]    10s
    Input Text    xpath=//label[contains(., "ขอบเขตของโครงงาน")]/following-sibling::textarea[1]    ${SCOPE}

    Wait Until Element Is Visible    xpath=//label[contains(., "ประโยชน์ที่คาดว่าจะได้รับ")]/following-sibling::textarea[1]    10s
    Input Text    xpath=//label[contains(., "ประโยชน์ที่คาดว่าจะได้รับ")]/following-sibling::textarea[1]    ${EXPECTED_RESULTS}

กดปุ่มถัดไป
    Wait Until Element Is Visible    xpath=//button[contains(., "ถัดไป")]    10s
    Click Element    xpath=//button[contains(., "ถัดไป")]

กรอกข้อมูลแผนการดำเนินงานโครงงาน
    [Arguments]    ${ACTIVITY_NAME}    ${START_MONTH}    ${END_MONTH}
    # 1. กรอกชื่อภาษาไทย
    Wait Until Element Is Visible    xpath=//input[@placeholder='เช่น ศึกษาข้อมูล, พัฒนาระบบ...']    10s
    Input Text    xpath=//input[@placeholder='เช่น ศึกษาข้อมูล, พัฒนาระบบ...']    ${ACTIVITY_NAME}
    
    # 1. กรอกเดือนเริ่มต้น (ช่องที่ 1)
    Input Text    xpath=(//input[@type='number' and @min='1' and @max='12'])[1]    ${START_MONTH}
    
    # 2. กรอกเดือนสิ้นสุด (ช่องที่ 2)
    Input Text    xpath=(//input[@type='number' and @min='1' and @max='12'])[2]    ${END_MONTH}

กรอกประมาณการงบประมาณโครงงาน
    [Arguments]    ${ITEM_NAME}    ${DESCRITION}    ${PRICE_PER_ITEM}    ${QUANTITY}
    
    # 1. กรอกช่องข้อความแรก
    Input Text    xpath=(//input[not(@type='number')])[1]    ${ITEM_NAME}
    
    # 2. กรอกช่องข้อความที่สอง
    Input Text    xpath=(//input[not(@type='number')])[2]    ${DESCRITION}
    
    # 3. กรอกช่องตัวเลข (min=0)
    Input Text    xpath=//input[@type='number' and @min='0']    ${PRICE_PER_ITEM}
    
    # 4. กรอกช่องตัวเลข (min=1)
    Input Text    xpath=//input[@type='number' and @min='1']    ${QUANTITY}