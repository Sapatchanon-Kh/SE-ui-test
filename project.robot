*** Settings ***
Library    SeleniumLibrary
Resource   project_resource.resource
Test Teardown   Close Browser

*** Variables ***
${USERNAME}  B6712123
${PASSWORD}  123

*** Test Cases ***
ไม่ใส่บทคัดย่อแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    ${EMPTY}
    กดปุ่มถัดไป
    Sleep  5s
    # 1. รับข้อความจาก Alert มาเก็บในตัวแปร ${alert_message} แล้วกด OK (ACCEPT)
    ${alert_message}=    Handle Alert    action=ACCEPT
    # 2. เช็คว่าในข้อความที่ได้มา มีคำว่า "กรุณาระบุ 'บทคัดย่อ'" ผสมอยู่ไหม
    Should Contain    ${alert_message}    กรุณาระบุ 'บทคัดย่อ'
    Sleep  2s
    Close Browser

ไม่ใส่ชื่อโครงงานภาษาไทยแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน     ${EMPTY}    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    Sleep  5s
    # 1. รับข้อความจาก Alert มาเก็บในตัวแปร ${alert_message} แล้วกด OK (ACCEPT)
    ${alert_message}=    Handle Alert    action=ACCEPT
    # 2. เช็คว่าในข้อความที่ได้มา มีคำว่า "กรุณาระบุ 'บทคัดย่อ'" ผสมอยู่ไหม
    Should Contain    ${alert_message}    กรุณาระบุ 'ชื่อโครงงาน (ภาษาไทย)'
    Sleep  2s
    Close Browser

ใส่ชื่อโครงงานภาษาไทยที่มีภาษาอังกฤษผสมแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน     โครงงานทดสอบ Auto    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    Sleep  5s
    # 1. รับข้อความจาก Alert มาเก็บในตัวแปร ${alert_message} แล้วกด OK (ACCEPT)
    ${alert_message}=    Handle Alert    action=ACCEPT
    # 2. เช็คว่าในข้อความที่ได้มา มีคำว่า "กรุณาระบุ 'บทคัดย่อ'" ผสมอยู่ไหม
    Should Contain    ${alert_message}    ชื่อโครงงาน (ภาษาไทย) ต้องเป็นภาษาไทยเท่านั้น (ห้ามมีภาษาอังกฤษ)
    Sleep  2s
    Close Browser

ไม่ใส่ชื่อโครงงานภาษาอังกฤษแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน     โครงงานทดสอบอัตโนมัติ    ${EMPTY}    Automated Testing Project Abstract
    กดปุ่มถัดไป
    Sleep  5s
    # 1. รับข้อความจาก Alert มาเก็บในตัวแปร ${alert_message} แล้วกด OK (ACCEPT)
    ${alert_message}=    Handle Alert    action=ACCEPT
    # 2. เช็คว่าในข้อความที่ได้มา มีคำว่า "กรุณาระบุ 'บทคัดย่อ'" ผสมอยู่ไหม
    Should Contain    ${alert_message}    กรุณาระบุ 'Project Title (English)'
    Sleep  2s
    Close Browser

ใส่ชื่อโครงงานภาษาอังกฤษที่มีภาษาไทยผสมแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน     โครงงานทดสอบอัตโนมัติ    โครงงาน Automated Testing    Automated Testing Project Abstract
    กดปุ่มถัดไป
    Sleep  5s
    # 1. รับข้อความจาก Alert มาเก็บในตัวแปร ${alert_message} แล้วกด OK (ACCEPT)
    ${alert_message}=    Handle Alert    action=ACCEPT
    # 2. เช็คว่าในข้อความที่ได้มา มีคำว่า "กรุณาระบุ 'บทคัดย่อ'" ผสมอยู่ไหม
    Should Contain    ${alert_message}    Project Title (English) ต้องเป็นภาษาอังกฤษเท่านั้น (ห้ามมีภาษาไทย)
    Sleep  2s
    Close Browser

ไม่ใส่ที่มาแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ${EMPTY}    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    กรุณาระบุ 'ที่มาและความสำคัญ'
    Sleep  2s
    Close Browser

ไม่ใส่วัตถุประสงค์แล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    ${EMPTY}    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    กรุณาระบุ 'วัตถุประสงค์'
    Sleep  2s
    Close Browser

ไม่ใส่ขอบเขตแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ${EMPTY}    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    กรุณาระบุ 'ขอบเขตของโครงงาน'
    Sleep  2s
    Close Browser

ไม่ใส่ประโยชน์ที่คาดว่าจะได้รับแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ${EMPTY}
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    กรุณาระบุ 'ประโยชน์ที่คาดว่าจะได้รับ'
    Sleep  2s
    Close Browser

ไม่ใส่แผนการดำเนินงานแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ${EMPTY}  ${EMPTY}  ${EMPTY}
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    กรุณาระบุชื่อกิจกรรม
    Sleep  2s
    Close Browser

ใส่เดือนเริ่มต้นเกินช่วงแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  15  11
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    เดือนเริ่มต้นต้องน้อยกว่าหรือเท่ากับเดือนสิ้นสุด
    Should Contain    ${alert_message}    เดือนเริ่มต้นต้องอยู่ในช่วง 1 ถึง 12
    Sleep  2s
    Close Browser

ใส่เดือนสิ้นสุดเกินช่วงแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  12  13
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    เดือนสิ้นสุดต้องอยู่ในช่วง 1 ถึง 12
    Sleep  2s
    Close Browser

ใส่เดือนเริ่มต้นน้อยกว่าช่วงแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  -4  11
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    เดือนเริ่มต้นต้องอยู่ในช่วง 1 ถึง 12
    Sleep  2s
    Close Browser

ใส่เดือนสิ้นสุดน้อยกว่าช่วงแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  11  -9
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    เดือนเริ่มต้นต้องน้อยกว่าหรือเท่ากับเดือนสิ้นสุด
    Should Contain    ${alert_message}    เดือนสิ้นสุดต้องอยู่ในช่วง 1 ถึง 12
    Sleep  2s
    Close Browser

ไม่กรอกประมาณงบประมาณแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  1  3
    กดปุ่มถัดไป
    กรอกประมาณการงบประมาณโครงงาน   ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    กรุณาระบุชื่อสินค้า
    Sleep  2s
    Close Browser

กรอกประมาณงบประมาณราคาติดลบแล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  1  3
    กดปุ่มถัดไป
    กรอกประมาณการงบประมาณโครงงาน   Rasberry Pi  RAM 16GB  -100  ${EMPTY}
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    ราคาต้องไม่ติดลบ
    Sleep  2s
    Close Browser

กรอกประมาณงบประมาณกรอกจำนวนน้อยกว่า 0 แล้วกดถัดไป
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  1  3
    กดปุ่มถัดไป
    กรอกประมาณการงบประมาณโครงงาน   Rasberry Pi  RAM 16GB  3000  -3
    กดปุ่มถัดไป
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    จำนวนต้องมากกว่า 0
    Sleep  2s
    Close Browser

SUCCESS CASE
    Login to SE project  ${USERNAME}  ${PASSWORD}
    Project Proposal Page
    Create New Proposal
    กรอกข้อมูลทั่วไปเกี่ยวกับโครงงาน    โครงงานทดสอบอัตโนมัติ    Automated Testing Project    Automated Testing Project Abstract
    กดปุ่มถัดไป
    กรอกรายละเอียดโครงงาน   ที่มาของโครงงานทดสอบอัตโนมัติ    วัตถุประสงค์ของโครงงานทดสอบอัตโนมัติ    ขอบเขตของโครงงานทดสอบอัตโนมัติ    ผลลัพธ์ที่คาดหวังจากโครงงานทดสอบอัตโนมัติ
    กดปุ่มถัดไป
    กรอกข้อมูลแผนการดำเนินงานโครงงาน  ศึกษาค้นคว้า  1  3
    กดปุ่มถัดไป
    กรอกประมาณการงบประมาณโครงงาน   Rasberry Pi  RAM 16GB  3000  1
    กดปุ่มถัดไป
    Scroll Element Into View  xpath=//button[@type='button' and contains(., "ยืนยันและเสนอโครงงาน")]
    Wait Until Element Is Visible  xpath=//button[@type='button' and contains(., "ยืนยันและเสนอโครงงาน")]
    Click Element  xpath=//button[@type='button' and contains(., "ยืนยันและเสนอโครงงาน")]
    Alert Should Be Present    action=ACCEPT
    Sleep  5s
    ${alert_message}=    Handle Alert    action=ACCEPT
    Should Contain    ${alert_message}    ยื่นเสนอโครงงานสำเร็จ!
    Sleep  2s
    Close Browser

