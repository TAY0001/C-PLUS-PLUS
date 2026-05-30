.model medium
.stack 1024


.data
HOMEMENU     db 0dh, 0ah, "----Welcome to LaFe CAfe POS System----", 0Dh, 0Ah
             db "  1. Register account                  ", 0Dh, 0Ah
             db "  2. Login account                     ", 0Dh, 0Ah
             db "  0. Exit                              ", 0Dh, 0Ah
             db "---------------------------------------", 0Dh, 0Ah
             db "Please select a choice (1/2/0): $"

validMsg     db "Please type a valid number for option!$"

RegisteranduserMsg db 0dh, 0ah, "******Register Account********"
                   db 0dh, 0ah, "For your information, please enter 6 character for userID and Password!"
                   db 0Dh, 0ah, "UserID: $"
pwd db 0dh, 0ah, "Password: $"
RUserID db 6 dup(?)
RPwd db 6 dup(?)
LUser        db 0dh, 0ah, "******Login Account********"
             db 0dh, 0ah, "UserID: $"
LPwd         db 0dh, 0ah, "Password: $"
LUserId db 6 dup(0)
userID db "admin1$", 0
Lpassword db 6 dup(0)
password db "123456$", 0
RFailedMsg   db 0d,0ah ,"Register is failed!$"
RSuccessMsg  db 0dh, 0ah, "Your register is successful!$"
InvalidMsg   db "Your input is invalid. Please try it again!$"
LoginSuccess db 0dh, 0ah, "Login successful!$"
LoginFailedMsg db 0dh, 0ah, "Login Failed! Please try again.$"
exitmsg db 0dh, 0ah, "Do you want to exit Lafe Cafe Pos System (Y/N): $"

MenuList db 0dh, 0ah, "==== LaFe Cafe System Menu ====", 0Dh, 0Ah
         db "= 1. Ordering                 =", 0Dh, 0Ah
         db "= 0. Back to Home Menu        =", 0Dh, 0Ah
         db "===============================", 0Dh, 0Ah
         db "Please enter your choice (1/0): $"
MainCategory db 0dh, 0ah, "======== Ordering Menu ========", 0Dh, 0Ah
             db "= 1. Foods                    =", 0Dh, 0Ah
             db "= 2. Drinks                   =", 0Dh, 0Ah
             db "= 3. LaFe Series              =", 0Dh, 0Ah
             db "= 4. Back to System Menu      =", 0Dh, 0Ah
             db "===============================", 0Dh, 0Ah
             db "Please enter your choice (1/2/3/4): $"
FoodsMenu db 0dh, 0ah, "========== Foods Menu ==========", 0Dh, 0Ah
          db "= 1. Pastry                    =", 0Dh, 0Ah
          db "= 2. Cake                      =", 0Dh, 0Ah
          db "================================", 0Dh, 0Ah
          db "Please enter your choice (1/2): $"
PastryMenu db 0dh, 0ah, "========= Pastry Menu =========", 0Dh, 0Ah
           db "= 1. Croissant                =", 0Dh, 0Ah
           db "= 2. Donut                    =", 0Dh, 0Ah
           db "===============================", 0Dh, 0Ah
           db "Please enter your choice (1/2): $"
CakeMenu db 0dh, 0ah, "========== Cake Menu ==========", 0Dh, 0Ah
         db "= 1. Black Forest Cake        =", 0Dh, 0Ah
         db "= 2. Cheesecake               =", 0Dh, 0Ah
         db "===============================", 0Dh, 0Ah
         db "Please enter your choice (1/2): $"
DrinksMenu db 0dh, 0ah, "========= Drinks Menu =========", 0Dh, 0Ah
           db "= 1. Coffee & Espresso        =", 0Dh, 0Ah
           db "= 2. Tea & Chocolate          =", 0Dh, 0Ah
           db "= 3. Frappuccino              =", 0Dh, 0Ah
           db "===============================", 0Dh, 0Ah
           db "Please enter your choice (1/2/3): $"
CAEMenu db 0dh, 0ah, "==== Coffee & Espresso Menu ====", 0Dh, 0Ah
        db "= 1. Cold Foam Iced Espresso   =", 0Dh, 0Ah
        db "= 2. Caramel Macchiato         =", 0Dh, 0Ah
        db "================================", 0Dh, 0Ah
        db "Please enter your choice (1/2): $"
TACMenu db 0dh, 0ah, "===== Tea & Chocolate Menu =====", 0Dh, 0Ah
        db "= 1. Signature Hot Chocolate   =", 0Dh, 0Ah
        db "= 2. Freshly Brewed Tea        =", 0Dh, 0Ah
        db "================================", 0Dh, 0Ah
        db "Please enter your choice (1/2): $"
FrapMenu db 0dh, 0ah, "======= Frappuccino Menu =======", 0Dh, 0Ah
         db "= 1. Chocolate Cream Chip      =", 0Dh, 0Ah
         db "= 2. Green Tea Cream           =", 0Dh, 0Ah
         db "================================", 0Dh, 0Ah
         db "Please enter your choice (1/2): $"
LaFeMenu db 0dh, 0ah, "======= LaFe Series Menu =======", 0Dh, 0Ah
         db "= 1. Watermelon Latte          =", 0Dh, 0Ah
         db "= 2. Banana Latte              =", 0Dh, 0Ah
         db "================================", 0Dh, 0Ah
         db "Please enter your choice (1/2): $"
ItemQuantity db 0dh, 0ah, "Please enter the quantity of the item(1-99): $"
ContinueToOrder DB 0dh, 0ah, "Continue to order? (Y/N): $"

PaymentMethod db 0dh, 0ah, "******************************"
              db 0dh, 0ah, "*       Payment Method       *"
              db 0dh, 0ah, "*----------------------------*"
              db 0dh, 0ah, "* 1. Credit Card             *"
              db 0dh, 0ah, "* 2. E-wallet                *"
              db 0dh, 0ah, "* 3. Cash                    *"
              db 0dh, 0ah, "* 0. Cancel Payment          *"
              db 0dh, 0ah, "******************************"
              db 0dh, 0ah, "Please enter your choice (1-3) or 0 to cancel payment: $"
cardnumber db 0dh, 0ah, "Card Number (No spaces required): $"
ccname     db "Name on card: $"
expirydate    db "Expiry date (XX/XX): $"
cardcvc    db 0dh, 0ah, "CVC: $"
inputcn db 16 dup(?)
inputcvc   db 3 dup(?)
INPUTDATE LABEL BYTE
MAX5 db 5
ACT5 db ?
INPUTDATEDATA db 6, ?, 6 dup('0')
cancelledPayment db 0dh, 0ah, "Your payment is cancelled successfully!$"
InvalidQuantity db "Your quantity input is invalid. Please enter again.$"
total db 0dh, 0ah, "Total cash payment: RM$"
inputcash db 10, ?, 10 dup('$')
balancedisplay db 0dh, 0ah, "Total balance: $"
ewalletname db 0dh, 0ah, "Name e-wallet: $"
inputname db 40, ?, 40 dup('$') 
phonenumber db "Phone number (XXX-XXXXXXXX): $"
INPUTPN LABEL BYTE
MAX6 db 13
ACT6 db ?
INPUTPNDATA db 13, ?, 13 dup('0')
paymentsuccessfulmsg db "Your payment is successful!$"
unitprice db 10
tquantity db 0
price db "Total price is   .$"
price1 db "Total price is    .$"
service db "Total service tax is  . .$"
totalprice db "Total purchase amount is   .$"
totalprice1 db "Total purchase amount is    .$"
totalprice2 db "Total purchase amount is     .$"
AA LABEL BYTE
MAX db 5
ACT db ?
AADATA db 5 DUP('0')
ARRAY LABEL BYTE
MAX1 db 6
ACT1 db ?
ARRAYDATA db 6 DUP('0')
ARR LABEL BYTE
MAX2 db 6
ACT2 db ?
ARRDATA db 6 DUP('0')
CASH LABEL BYTE
MAX3 db 7
ACT3 db ?
CASHDATA db 7 DUP('$')
BALANCE LABEL BYTE
MAX4 db 5
ACT4 db ?
BALANCEDATA db 5 DUP('0')
paymentnumber db 0
Receipt db 0dh, 0ah, "************** Receipt **************", 0Dh, 0Ah
      db "*             LaFe Cafe             *", 0Dh, 0Ah
      db "*                                   *", 0Dh, 0Ah
      db "* Transaction Id: JJXB67I23N        *$"
date  db "* Order Date: $"
time  db "* Order Time: $"
asterisk db "              *$"
space1 db 0dh,0ah,"*                                   *$"
quan db 0Dh, 0Ah, "* Total Quantity Item:              *$"
prc db 0Dh, 0Ah, "* Total Price (RM)   :              *$"
space2 db 0Dh, 0Ah, "* --------------------------------- *$"
payment1 db 0Dh, 0Ah, "* Payment Method     :  Credit Card *$"
payment2 db 0Dh, 0Ah, "* Payment Method     :     E-wallet *$"
payment3 db 0Dh, 0Ah, "* Payment Method     :         Cash *$"
totalpayment db 0Dh, 0Ah, "* Total Payment (RM) :              *$"
balancedue db 0Dh, 0Ah, "* Balance Due (RM)   :              *$"
lrcpt db 0Dh, 0Ah, "*                                   *", 0Dh, 0Ah
      db "*          Check Closed             *", 0Dh, 0Ah
      db "*     Thank you for Purchasing      *", 0Dh, 0Ah
      db "*************************************$"
.code
;Display Date and Time Part
DISP PROC
MOV DL,BH     
ADD DL,30H    
MOV AH,02H     
INT 21H
MOV DL,BL     
ADD DL,30H     
MOV AH,02H     
INT 21H
RET
DISP ENDP      ;

MAIN PROC FAR

MOV AX, @data
MOV DS, AX

;display home menu
HMenu:                  
    mov ah,09h
    lea dx,HOMEMENU
    int 21h

    mov ah,01h
    int 21h

    mov bl,al
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    cmp bl, '1' 
    jne next
    jmp register

next:
    cmp bl ,'2'
    jne nextoption
    jmp login

nextoption:
    cmp bl, '0'
    jne valid
    jmp exitFromSystem

;display invalid option message and jump back to home menu
valid:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp HMenu

;display exit message to confirm user wants to exit
exitFromSystem:
    mov ah,09H
    lea dx, exitmsg
    int 21h
    
    mov ah, 01H
    int 21h
    
    cmp al, 59h
    jne secondoption
    jmp exit

secondoption:
    cmp al, 4Eh
    je gotohmenu
    jmp gotoexit

gotohmenu:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    je Hmenu

gotoexit:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H 
    mov ah,09H
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H 
    jmp exitFromSystem

;display register 
register:
    mov ah,09h
    lea dx,RegisteranduserMsg
    int 21h       

    mov di, offset RUserID
    mov cx, 0      
    mov bx, 6

;validate the user ID character
Rnext_char:
    mov ah, 01h      
    int 21h          
    cmp al, 0dh      
    je RvalidateUserID 
    cmp al, ' '      
    je gotoregister  
    mov [di], al     
    inc di          
    inc cx          
    cmp cx, bx      
    jl Rnext_char
    jmp RvalidateUserID   

RvalidateUserID:
    cmp cx, bx       
    jne RinvalidInput
    jmp Rcontinuepwd

;display invalid input message and jump back to register
gotoregister:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    mov ah, 09h
    lea dx, InvalidMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp register 

;display password
Rcontinuepwd:
    mov ah, 09h
    lea dx, pwd
    int 21h
    
    mov cx, 0 
    mov di, offset RPwd
    mov bx,6  

;validate the number of character in the password
Rnext_pwd:
    mov ah, 07h           
    int 21h               
    cmp al, 0dh           
    je Rvalidatepwd      
    cmp al, ' '            
    je gotoregister       
    mov [di], al           
    mov ah, 02h        
    mov dl, "*" 
    int 21h    
    inc di               
    inc cx                
    cmp cx, bx            
    jl Rnext_pwd         
    jmp Rvalidatepwd   

Rvalidatepwd:
    cmp cx,bx
    jne gotoregister
    jmp Rvalidation
;display invalid message and jump back to register
RinvalidInput:
    mov ah, 09h
    lea dx, InvalidMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp register      

;compare the userId with the constant that have been set
Rvalidation:
    mov si, offset RUserID
    mov di, offset userID
    mov cx, 6   

RcompareUserID:
    mov al, [si]        
    cmp al, [di]            
    jne RegisterFailed        
    inc si                    
    inc di                    
    cmp al, 0              
    loop RcompareUserID       
    jmp RSuccess

;display register failed message and jump back to Menu
RegisterFailed:
    mov ah, 09h
    lea dx, RFailedMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp HMenu        

;display register success message and jump to Login
RSuccess:
    mov ah,09H
    lea dx, RSuccessMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp login
    
;display login session
login:
    mov ah, 09h
    lea dx, LUser
    int 21h

    mov di, offset LUserID 
    mov cx, 0             
    mov bx, 6 

;validate the number of character for user id 
Lnext_char:
    mov ah, 01h          
    int 21h                
    cmp al, 0dh           
    je LvalidateUserID     
    cmp al, ' '          
    je gotologin         
    mov [di], al          
    inc di               
    inc cx                
    cmp cx, bx           
    jl Lnext_char
    jmp LvalidateUserID

LvalidateUserID:
    cmp cx, bx            
    jne LinvalidInput    
    jmp LcontinuePwd

;display password
LcontinuePwd:
    mov ah, 09h
    lea dx, LPwd
    int 21h

    mov di, offset Lpassword 
    mov cx, 0             
    mov bx, 6 

;validate the number of character for password
Lnext_pwd:
    mov ah, 07h           
    int 21h           
    cmp al, 0dh           
    je Lvalidatepwd      
    cmp al, ' '         
    je gotologin     
    mov [di], al        
    mov ah, 02h           
    mov dl, "*" 
    int 21h
    inc di              
    inc cx          
    cmp cx, bx           
    jl Lnext_pwd          
    jmp Lvalidatepwd    

Lvalidatepwd:
    cmp cx, bx            
    jne gotologin        
    jmp Lvalidation

;display invalid message and jump back to login 
LinvalidInput:
    mov ah, 09h
    lea dx, invalidMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp login  

gotologin:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    mov ah, 09h
    lea dx, invalidMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp login        
;compare user ID and password with the constant that had been set 
Lvalidation:
    mov si, offset LUserID
    mov di, offset UserID
    mov cx, 6       

LcompareUserID:
    mov al, [si]           
    cmp al, [di]            
    jne LoginFailed          
    inc si                      
    inc di                     
    cmp al, 0                  
    loop LcompareUserID        
    jmp LvalidationPassword

LvalidationPassword:
    mov si, offset password 
    mov di, offset Lpassword 
    mov cx, 6          

LcomparePassword:
    mov al, [si]               
    cmp al, [di]             
    jne LoginFailed           
    inc si                   
    inc di                    
    cmp al, 0                  
    loop LcomparePassword      
    jmp LoginSuccessMsg

;display login failed message and jump back to Home Menu
LoginFailed:
    mov ah, 09h
    lea dx, LoginFailedMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp HMenu

;display Login Successful message and jump to Second Menu
LoginSuccessMsg:
    mov ah, 09h
    lea dx, LoginSuccess
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToMenuList

;display system menu and ask user to enter
GoToMenuList:
    MOV AH,09H
    LEA DX,MenuList
    INT 21H

    MOV AH,01H 
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    je GoToOrderingMenu
    CMP BL,'0'
    jne valid2
    jmp HMenu

;display invalid option message and jump back to menu list
valid2:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToMenuList

;display invalid option message and jump back to ordering menu
valid3:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToOrderingMenu

;display invalid option message and jump back to menu list
valid4:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToFoodsMenu

;display ordering menu
GoToOrderingMenu:
    MOV AH,09H
    LEA DX,MainCategory
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE GoToFoodsMenu
    CMP BL,'2'
    JE DMenu
    CMP BL,'3'
    JE CLaFeMenu
    CMP BL,'4'
    JE BackToSystemMenu
    JMP valid3

BackToSystemMenu:
    JMP GoToMenuList

;display foods menu
GoToFoodsMenu:
    MOV AH,09H
    LEA DX,FoodsMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE GoToPastryMenu
    CMP BL,'2'
    JE GoToCakeMenu
    JMP valid4

;display pastry menu
GoToPastryMenu:
    MOV AH,09H
    LEA DX,PastryMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE cal
    CMP BL,'2'
    JE cal
    JMP valid5

DMenu:
     jmp GoToDrinksMenu

;display invalid option message and jump to pastry menu
valid5:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToPastryMenu

CLaFeMenu:
    JMP GoToLaFeMenu

;display cake menu
GoToCakeMenu:
    MOV AH,09H
    LEA DX,CakeMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE cal
    CMP BL,'2'
    JE cal
    JMP valid6

;display invalid option message and jump to cake menu
valid6:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToCakeMenu

;jump to calculate session 
cal:
    JMP calculate

;display drinks menu
GoToDrinksMenu:
    MOV AH,09H
    LEA DX,DrinksMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE GoToCAEMenu
    CMP BL,'2'
    JE GoToTACMenu
    CMP BL,'3'
    JE GoToFrapMenu
    JMP valid7

;display invalid option message and jump to drinks menu
valid7:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToDrinksMenu

;display coffee & espresso menu
GoToCAEMenu:
    MOV AH,09H
    LEA DX,CAEMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE cal
    CMP BL,'2'
    JE cal
    JMP valid8

;display invalid option message and jump to coffee & espresso menu
valid8:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToCAEMenu

;display tea & chocolate menu
GoToTACMenu:
    MOV AH,09H
    LEA DX,TACMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE calculate
    CMP BL,'2'
    JE calculate
    JMP valid9

;display frappuccino menu
GoToFrapMenu:
    MOV AH,09H
    LEA DX,FrapMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL

    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE calculate
    CMP BL,'2'
    JE calculate
    JMP valid10

;display LaFe series menu
GoToLaFeMenu:
    MOV AH,09H
    LEA DX,LaFeMenu
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL

    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    CMP BL,'1'
    JE calculate
    CMP BL,'2'
    JE calculate
    JMP valid11

;display invalid option message and jump to tea & chocolate menu
valid9:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToTACMenu

;display invalid option message and jump to frappuccino menu
valid10:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToFrapMenu

calculate:
    MOV AH,09H
    LEA DX,ItemQuantity
    INT 21H

    MOV AH, 0AH               ;input quantity
    LEA DX, ARRAY
    INT 21H

    CMP ARRAYDATA[0], '0'     ;verify quantity input is not three digits
    JA verifyquantity

verifyquantity2:              ;continue verify the quantity input proper or not
    CMP ARRAYDATA[0], '1'
    JB Invalid
    CMP ARRAYDATA[0], '9'
    JA Invalid
    CMP ARRAYDATA[0], '0'
    JE Invalid
    CMP ARRAYDATA[1], '0'      ;calculate the price for two digits quantity input 
    JAE next1
    JMP continuecalculate

next1:                         ;one of the step for process two digits quantity input calculation
    CMP ARRAYDATA[1], '9'
    JBE next2

verifyquantity:
    CMP ARRAYDATA[1], '0'
    JAE verifyquantity1
    JMP verifyquantity2

verifyquantity1:
    CMP ARRAYDATA[2], '0'
    JAE Invalid
    JMP verifyquantity2

continuecalculate:             ;calculate the price for one digit quantity input
    SUB ARRAYDATA[0], 30h
    MOV AL, ARRAYDATA[0]
    MOV BL, unitprice
    MUL BL

    MOV CL, 10
    DIV CL

    ADD AL, 30h
    ADD AH, 30h
    MOV price[15], AL
    MOV price[16], AH

    SUB AL, 30h
    SUB AH, 30h
    ADD ARRDATA[2], AL
    ADD ARRDATA[3], AH
    JMP ccontinuecalculate

Invalid:
    JMP ToInvalid

valid11:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp GoToLaFeMenu

next2:                      ;one of the step for process two digits quantity input calculation
    CMP ARRAYDATA[0], '1'
    JB Invalid
    JMP next3

ccontinuecalculate:         ;print the price for one digit quantity input
    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH, 09H
    LEA DX, price
    INT 21H

    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21h

    MOV AL, ARRAYDATA[0]
    ADD AADATA[2], AL
    CMP AADATA[2], '9'        ;addition for total quantity
    JA calculatequantity
    JMP ccontinuecalculate1

calculatequantity:
    SUB AADATA[2], 10           
    ADD AADATA[1], 1

    CMP AADATA[1], '9'
    JA calculatequantity11
    JMP ccontinuecalculate1

calculatequantity11:
    SUB AADATA[1], 10
    ADD AADATA[0], 1
    JMP ccontinuecalculate1

ccontinuecalculate1:
    CMP ARRDATA[2], '9'
    JA carry                ;make sure the total price is correct
    JMP ContinueOrder

next3:                      ;one of the step for process two digits quantity input calculation
    CMP ARRAYDATA[0], '9'
    JA ToInvalid
    JMP next4

carry:
    JMP carry1        ;distance too far need to use jmp

ToInvalid:
    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH,09H
    LEA DX,InvalidQuantity
    INT 21H
    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    JMP calculate

next4:                      ;one of the step for process two digits quantity input calculation
    CMP ARRAYDATA[2], '0'
    JAE ToInvalid
    JMP calculate1

calculate1:                 ;calculate the price for two digits quantity input 
    SUB ARRAYDATA[1], 30h
    MOV AL, ARRAYDATA[1]
    MOV BL, unitprice
    MUL BL

    MOV CL, 10
    DIV CL

    MOV DL, AL
    MOV DH, AH

    ADD DH, 30h
    MOV ARRDATA[3], DH

    SUB ARRAYDATA[0], 30h
    MOV AL, ARRAYDATA[0]
    MOV BL, unitprice
    MUL BL

    MOV CL, 10
    DIV CL

    ADD AH, DL

    ADD AL, 30h
    ADD AH, 30h

    MOV price1[15], AL
    MOV price1[16], AH
    MOV price1[17], DH

    SUB AL, 30h
    SUB AH, 30h
    SUB DH, 30h

    ADD ARRDATA[1], AL
    ADD ARRDATA[2], AH
    ADD ARRDATA[3], DH
    JMP con

calculatequantity1:
    SUB AADATA[2], 10           
    ADD AADATA[1], 1

    CMP AADATA[1], '9'
    JA calculatequantity2
    JMP continuecalculate1

calculatequantity2:
    SUB AADATA[1], 10
    ADD AADATA[0], 1
    JMP continuecalculate1

carry2:
    SUB ARRDATA[1], 10
    ADD ARRDATA[0], 1
    JMP ContinueOrder

carry1:
    ADD ARRDATA[1], 1
    SUB ARRDATA[2], 10

    CMP ARRDATA[1], '9'
    JA carry2               ;make sure the total price is correct
    JMP ContinueOrder

;comtinue the process
con:
    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH, 09H
    LEA DX, price1
    INT 21H

    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AL, ARRAYDATA[0]
    MOV BL, ARRAYDATA[1]
    ADD AADATA[1], AL           ;addition for total quantity
    ADD AADATA[2], BL

    CMP AADATA[2], '9'
    JA calculatequantity1       ;make sure the total quantity is correct

    CMP AADATA[1], '9'
    JA calculatequantity2       ;make sure the total quantity is correct
    JMP continuecalculate1

continuecalculate1:
    CMP ARRDATA[2], '9'         ;make sure the total price is correct
    JA carry1

    CMP ARRDATA[1], '9'
    JA carry2
    JMP ContinueOrder

ContinueOrder:
    MOV AH,09H              ;display continue to order message
    LEA DX,ContinueToOrder
    INT 21H

    MOV AH,01H
    INT 21H

    MOV BL,AL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    
    CMP BL,'Y'
    JE Order
    CMP BL,'N'
    JE cm
    MOV AH, 09H         ;display invalid input message
    LEA DX, invalidMsg
    INT 21H
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    JMP ContinueOrder

ToPayment: 
    jmp Payment   ;distance too far need to use jmp 

Order:
    JMP GoToOrderingMenu   ;distance too far need to use jmp 

cm:                     ;store the total purchase amount into the totalprice array
    CMP ARRDATA[0], '0'
    JA calc
    CMP ARRDATA[1], '0'
    JA calcu

    MOV AL, ARRDATA[2]
    MOV BL, ARRDATA[3]
    MOV totalprice[25], AL
    MOV totalprice[26], BL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH, 09H
    LEA DX, totalprice
    INT 21H
    JMP payment

calcu:
    CMP ARRDATA[1], '9'
    JBE calcu1

calc:
    CMP ARRDATA[0], '9'
    JBE calc1

calc1:  
    MOV AL, ARRDATA[0]
    MOV BL, ARRDATA[1]
    MOV CL, ARRDATA[2]
    MOV DL, ARRDATA[3]
    MOV totalprice2[25], AL
    MOV totalprice2[26], BL
    MOV totalprice2[27], CL
    MOV totalprice2[28], DL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH, 09H
    LEA DX, totalprice2
    INT 21H
    JMP payment

calcu1:      
    MOV AL, ARRDATA[1]
    MOV BL, ARRDATA[2]
    MOV CL, ARRDATA[3]
    MOV totalprice1[25], AL
    MOV totalprice1[26], BL
    MOV totalprice1[27], CL
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH, 09H
    LEA DX, totalprice1
    INT 21H
    JMP payment

;display payment method menu
Payment:
    mov ah, 09H
    lea dx, PaymentMethod
    int 21h

    mov ah, 01H
    int 21h
    mov bl,al
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    cmp bl, "1"
    je Cc
    cmp bl, '2'
    je gotoew
    cmp bl,'3'
    je gotocash
    cmp bl,'0'
    je gotocancelled
    jmp valid12

;display invalid option message and go to payment method menu
valid12:
    mov ah,09h
    lea dx, validMsg
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp Payment

gotoew:
    add paymentnumber, '2'
    jmp ewallet

gotocash:
    add paymentnumber, '3'
    jmp usecash

gotocancelled:
    jmp cancelled

;display card number
Cc:
    add paymentnumber, '1'
    mov ah,09H
    lea dx, cardnumber
    int 21h

    mov di, offset inputcn
    mov cx,0
    mov bx, 16

;validate the card number character
nextcn:
    mov ah,01h
    int 21h 
    cmp al,0Dh
    je validatecn
    cmp al, ' '
    je jumptocc
    cmp al, '0'
    jb jumptocc
    cmp al, '9'
    ja jumptocc
    mov [di], al          
    inc di                 
    inc cx                 
    cmp cx, bx               
    jl nextcn    
    jmp validatecn

jumptocc:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp ccInvalid

validatecn:
    cmp cx, bx                
    jne ccinvalid
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    je cardname

;display invalid input message and go to card number session
ccInvalid:
    mov ah,09H
    lea dx, InvalidMsg
    int 21h
    jmp Cc

;display name on card
cardname:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    mov ah,09H
    lea dx, ccname
    int 21h

    mov di, offset inputname
    mov cx,0

;validate the card name character
getchar:
    mov ah,01H
    int 21h
    cmp al, ' '
    je getchar
    cmp al, 0DH
    je validatename
    mov [di], al          
    inc di                 
    inc cx
    cmp cx, 30
    jge validatename
    jmp getchar

validatename:
    cmp cx,0
    jne carddate
    jmp cnameInvalid

;display invalid input message and jump to card name session
cnameInvalid:
    mov ah,09H
    lea dx, InvalidMsg
    int 21h
    jmp cardname

;display expiry date
carddate:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    mov ah,09H
    lea dx, expirydate
    int 21h

    mov di, offset INPUTDATE
    mov cx, 0
    mov bx, 5

;validate the expiry date character
getnumber:
    mov ah,01H
    int 21h
    cmp al, ' '
    je gotodate
    cmp al, 0DH
    je validatedate
    mov [di], al          
    inc di                 
    inc cx
    cmp cx, bx
    jl getnumber
    jmp validatedate

gotodate:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp dateInvalid

validatedate:
    cmp cx,5
    jne dateInvalid
    je dateformat

;display invalid input message and jump back to expiry date session
dateInvalid:
    mov ah,09H
    lea dx, InvalidMsg
    int 21h
    jmp carddate

dateInvalid2:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp dateInvalid

;validate the date format
dateformat:
    cmp byte ptr [INPUTDATE + 2], '/'
    je dateformat2
    jne gotodate

dateformat2:
    mov al, [INPUTDATE]  
    cmp al, '0'             
    jb dateInvalid2       
    cmp al, '1'        
    jb checkformonth    
    ja dateInvalid2
    je checkformonth2  

checkformonth:
    mov al, [INPUTDATE + 1] 
    cmp al, '0'            
    jb dateInvalid2      
    cmp al, '9'        
    ja dateInvalid2       
    jmp gotocvc   

checkformonth2:         
    mov al, [INPUTDATE]     
    cmp al, '0'            
    jb dateInvalid2          
    cmp al, '1'         
    ja dateInvalid2  
    mov al, [INPUTDATE + 1]  
    cmp al, '0'              
    jb dateInvalid2         
    cmp al, '2'            
    ja dateInvalid2
    
gotocvc:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp cvc

;display cvc
cvc:
    mov ah, 09h
    lea dx, cardcvc
    int 21h
        
    mov cx, 0 
    mov di, offset inputcvc
    mov bx, 3

;validate the cvc character
nextcvc:
    mov ah, 07h            
    int 21h                
    cmp al, 0dh            
    je validatecvc      
    cmp al, ' '            
    je validatecvc          
    mov ah, 02h            
    mov dl, "*" 
    int 21h    
    mov [di], al          
    inc di                 
    inc cx                
    cmp cx, bx 
    jg validatecvc             
    jmp nextcvc             

validatecvc:
    cmp cx,bx
    jne cvcInvalid
    jmp gotopaymentsuccess

gotopaymentsuccess:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp PaymentSuccessful

;display invalid input message and go to cvc session
cvcInvalid:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    mov ah,09H
    lea dx, InvalidMsg
    int 21h
    jmp cvc

;display ewallet name
ewallet:
    mov ah,09H
    lea dx ,ewalletname
    int 21h

    mov di, offset inputname
    mov cx,0

;validate the ewallet name character
E_getchar:
    mov ah,01H
    int 21h
    cmp al, ' '
    je E_getchar
    cmp al, 0DH
    je evalidatename
    mov [di], al          
    inc di                 
    inc cx
    cmp cx, 30
    jge evalidatename
    jmp E_getchar

evalidatename:
    cmp cx,0
    jne pn
    jmp enameInvalid

;display invalid input message and go to ewallet name session
enameInvalid:
    mov ah,09H
    lea dx, InvalidMsg
    int 21h
    jmp ewallet

;display phone number
pn:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    mov ah,09H
    lea dx, phonenumber
    int 21h

    mov cx,0
    mov di, offset INPUTPN
    mov bx, 12

;validate the phone number character
nextpn:
    mov ah,01h
    int 21h 
    cmp al, ' '
    je gotopn
    cmp al, '0'
    jae nextpn2

nextpn2:
    cmp al, '9'
    jbe nextpn3
    cmp al, '-'
    je nextpn3
    jmp gotopn

nextpn3:
    cmp al,0Dh
    je validatepn
    mov [di], al          
    inc di                 
    inc cx                 
    cmp cx, bx  
    jl nextpn
    jmp validatepn                        

validatepn:
    cmp cx, 12                
    jne validatepn2
    je pnformat

validatepn2:
    cmp cx, 11
    jne pninvalid
    je pnformat2

gotopn:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    je pnInvalid

;display invalid input message and jump back to phone nmuber session
pnInvalid:
    mov ah,09H
    lea dx, InvalidMsg
    int 21h
    jmp pn

;validate the phone number format
pnformat:
    cmp byte ptr [INPUTPN + 3], '-'
    jne gotopn
    jmp gotopaymentsuccess

pnformat2:
    cmp byte ptr [INPUTPN + 3], '-'
    jne pnInvalid
    jmp PaymentSuccessful

usecash:
    mov ah,09H             ;display total cash payment
    lea dx, total
    int 21h

    mov ah, 0ah
    lea dx, CASH
    int 21h

    CMP CASHDATA[0], '1'
    JB invalidcash
    CMP CASHDATA[0], '9'
    JA invalidcash
    CMP CASHDATA[1], '0'
    JB invalidcash
    CMP CASHDATA[1], '9'
    JA invalidcash
    CMP ARRDATA[1], '0'     ;verify the cash input is not less than the total purchase amount
    JE verifycash
    CMP ARRDATA[0], '0'     ;verify the cash input is not less than the total purchase amount
    JE verifycash1
    CMP ARRDATA[0], '0'     ;verify the cash input is not less than the total purchase amount
    JA verifycash2

verifycash2:                ;verify four digits cash input
    CMP CASHDATA[4], '$'
    JE invalidcash
    MOV AL, CASHDATA[2]
    CMP AL, ARRDATA[2]
    JL continueverify2
    MOV BL, CASHDATA[1]
    CMP BL, ARRDATA[1]
    JL continueverify3
    JMP continuecash 

continueverify2:             ;continue process of verifycash2
    MOV BL, CASHDATA[1]
    CMP BL, ARRDATA[1]
    JLE continueverify21
    CMP BL, ARRDATA[1]
    JG continueverify22
    JMP continuecash

invalidcash:
    jmp cashInvalid

continueverify3:        ;continue process of verifycash2
    MOV AL, CASHDATA[0]
    CMP AL, ARRDATA[0]
    JLE invalidcash
    JMP continuecash

continueverify21:       ;continue process of continueverify2
    MOV AL, CASHDATA[0]
    CMP AL, ARRDATA[0]
    JLE invalidcash
    JMP continuecash

continueverify22:       ;continue process of continueverify2
    MOV AL, CASHDATA[0]
    CMP AL, ARRDATA[0]
    JL invalidcash
    JMP continuecash

verifycash1:
    JMP toverifycash1

verifycash:                 ;verify two digits cash input
    MOV AL, CASHDATA[0]
    CMP AL, ARRDATA[2]
    JL continueverifycash
    JMP continuecash

continueverifycash:
    CMP CASHDATA[3], '$'
    JE invalidcash
    JMP continuecash

toverifycash1:                ;verify three digits cash input
    CMP CASHDATA[3], '$'
    JE invalidcash
    MOV AL, CASHDATA[1]
    CMP AL, ARRDATA[2]
    JL continueverify1
    MOV BL, CASHDATA[0]
    CMP BL, ARRDATA[1]
    JL continueverifycash1
    JMP continuecash

continueverifycash1:
    CMP CASHDATA[4], '$'
    JE invalidcash
    JMP continuecash

;display invalid input message and go to cash session
cashInvalid:
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    MOV AH, 09h
    LEA DX, InvalidMsg
    INT 21H
    MOV CASHDATA[0], '$'
    MOV CASHDATA[1], '$'
    MOV CASHDATA[2], '$'
    MOV CASHDATA[3], '$'
    MOV CASHDATA[4], '$'
    MOV CASHDATA[5], '$'
    JMP usecash

continuecash:           ;continue verify the cash input proper or not
    CMP ARRDATA[0], '0'
    JA calculatebalance
    CMP ARRDATA[1], '0'
    JA calculatebalance1
    CMP ARRDATA[2], '0'
    JA calculatebalance2

continueverify1:         ;continue process of verifycash1
    CMP CASHDATA[4], '$'
    JE ccontinueverify1
    JMP continuecash

ccontinueverify1:
    MOV BL, CASHDATA[0]
    CMP BL, ARRDATA[1]
    JLE cashInvalid
    JMP continuecash

calculatebalance2:      ;calculate balance for two digits total purchase amount
    CMP CASHDATA[3], '$'
    JE ccalculatebalance2

    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]
    MOV CL, CASHDATA[2]

    SUB CL, ARRDATA[3]
    MOV BALANCEDATA[3], CL

    ADD BL, 10
    SUB BL, ARRDATA[2]
    MOV BALANCEDATA[2], BL

    SUB AL, 1
    MOV BALANCEDATA[0], AL
    jmp PaymentSuccessful

calculatebalance:
    JMP calculatebalanceto

ccalculatebalance2:     
    CMP CASHDATA[4], '$'
    JE ccalculatebalance22

ccalculatebalance22:     ;continue process of calculatebalance1 when the total amount is two digits and cash input is two digits
    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]

    SUB BL, ARRDATA[3]
    MOV BALANCEDATA[3], BL

    SUB AL, ARRDATA[2]
    MOV BALANCEDATA[2], AL
    jmp PaymentSuccessful

calculatebalance1:      ;calculate balance for three digits total purchase amount
    CMP CASHDATA[4], '$'
    JE ccalculatebalance1    

    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]
    MOV CL, CASHDATA[2]
    MOV DL, CASHDATA[3]

    SUB DL, ARRDATA[3]
    MOV BALANCEDATA[3], DL

    CMP CL, ARRDATA[2]
    JL balance6

    SUB CL, ARRDATA[2]
    MOV BALANCEDATA[2], CL

    ADD BL, 10
    SUB BL, ARRDATA[1]
    MOV BALANCEDATA[1], BL

    SUB AL, 1
    MOV BALANCEDATA[0], AL
    jmp PaymentSuccessful

balance6:
    JMP balance66

calculatebalanceto:         ;calculate balance for four digits total purchase amount
    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]
    MOV CL, CASHDATA[2]
    MOV DL, CASHDATA[3]

    SUB DL, ARRDATA[3]
    MOV BALANCEDATA[3], DL

    CMP CL, ARRDATA[2]
    JL balance3

    CMP BL, ARRDATA[1]
    JL balance4

    SUB CL, ARRDATA[2]
    MOV BALANCEDATA[2], CL

    SUB BL, ARRDATA[1]
    MOV BALANCEDATA[1], CL

    SUB AL, ARRDATA[0]
    MOV BALANCEDATA[0], CL
    jmp PaymentSuccessful

    ccalculatebalance1:
    JMP ccalculatebalance11

balance66:              ;continue process of calculatebalance1
    ADD CL, 10
    SUB CL, ARRDATA[2]
    MOV BALANCEDATA[2], CL

    SUB BL, 1
    ADD BL, 10
    SUB BL, ARRDATA[1]
    MOV BALANCEDATA[1], BL

    SUB AL, 1
    MOV BALANCEDATA[0], AL
    jmp PaymentSuccessful

balance4:
    JMP balance44

balance3:               ;continue process of calculatebalanceto
    ADD CL, 10
    SUB CL, ARRDATA[2]
    MOV BALANCEDATA[2], CL

    CMP BL, ARRDATA[1]
    JL balance5

    SUB BL, 1
    SUB BL, ARRDATA[1]
    MOV BALANCEDATA[1], BL

    SUB AL, ARRDATA[0]
    MOV BALANCEDATA[0], AL
    jmp PaymentSuccessful

balance2:               ;continue process of ccalculatebalance11
    ADD BL, 10
    SUB BL, ARRDATA[2]
    MOV BALANCEDATA[2], BL

    SUB AL, 1
    SUB AL, ARRDATA[1]
    MOV BALANCEDATA[1], AL
    jmp PaymentSuccessful

balance5:             ;continue process of balance3
    SUB BL, 1
    ADD BL, 10
    SUB BL, ARRDATA[1]
    MOV BALANCEDATA[1], BL

    SUB AL, 1
    SUB AL, ARRDATA[0]
    MOV BALANCEDATA[0], AL
    jmp PaymentSuccessful

balance44:              ;continue process of calculatebalanceto
    SUB CL, ARRDATA[2]
    MOV BALANCEDATA[2], CL

    ADD BL, 10
    SUB BL, ARRDATA[1]
    MOV BALANCEDATA[1], BL

    SUB AL, 1
    SUB AL, ARRDATA[0]
    MOV BALANCEDATA[0], AL
    jmp PaymentSuccessful

ccalculatebalance11:    ;continue process of calculatebalance1 when the total amount is three digits and cash input is three digits
    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]
    MOV CL, CASHDATA[2]

    SUB CL, ARRDATA[3]
    MOV BALANCEDATA[3], CL

    CMP BL, ARRDATA[2]
    JL balance2

    SUB BL, ARRDATA[2]
    MOV BALANCEDATA[2], BL

    SUB AL, ARRDATA[1]
    MOV BALANCEDATA[1], AL
    jmp PaymentSuccessful

cancelled:
    mov ah,09H
    lea dx, cancelledPayment
    int 21h
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    MOV ARRDATA[0], '0'
    MOV ARRDATA[1], '0'
    MOV ARRDATA[2], '0'
    MOV ARRDATA[3], '0'
    jmp GoToOrderingMenu

PaymentSuccessful:
    mov ah,09H
    lea dx, paymentsuccessfulmsg
    int 21h
    jmp ToReceipt

ToReceipt:                  ;print receipt
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    MOV AH, 09H
    LEA DX, Receipt
    INT 21H

    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H
    jmp printdateNtime

continuereceipt:            ;continue to print the receipt
    MOV ah,09H
    lea dx,space1
    int 21h

    CMP AADATA[0], '0'
    JA tolink

    CMP AADATA[1], '0'
    JA tolink1

    JMP link

tolink:
    CMP ARRDATA[0], '9'
    JBE link2
 
tolink1:
    CMP ARRDATA[0], '1'
    JBE link1

printdateNtime:
    ;Hour Part
    mov ah, 09h
    lea dx, time
    int 21h

HOUR:
    MOV AH,2CH              ; To get System Time
    INT 21H
    MOV AL,CH               ; Hour is in CH   
    AAM                     ;adjust to base 10 
    MOV BX,AX
    CALL DISP

    MOV DL,':'
    MOV AH,02H              ; To Print : in DOS
    INT 21H

;Minutes Part
MINUTES:
    MOV AH,2CH              ; To get System Time
    INT 21H
    MOV AL,CL               ; Minutes is in CL
    AAM
    MOV BX,AX
    CALL DISP

    MOV DL,':'              ; To Print : in DOS
    MOV AH,02H
    INT 21H

;Seconds Part
Seconds:
    MOV AH,2CH              ; To get System Time
    INT 21H
    MOV AL,DH               ; Seconds is in DH
    AAM
    MOV BX,AX
    CALL DISP

    JMP continuetime

link2:
    JMP links2

link1:
    JMP linkf1

link:
    JMP linkto

continuetime:
    Mov ah, 09H
    lea dx, asterisk
    int 21h

    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    mov ah, 09h
    lea dx, date
    int 21h

DAY:
    MOV AH,2AH                  ; To get System Date
    INT 21H
    MOV AL,DL                   ; Day is in DL
    AAM
    MOV BX,AX
    CALL DISP

    MOV DL,'/'
    MOV AH,02H                  ; To Print / in DOS
    INT 21H

;Month Part
MONTH:
    MOV AH,2AH                  ; To get System Date
    INT 21H
    MOV AL,DH                   ; Month is in DH
    AAM
    MOV BX,AX
    CALL DISP

    MOV DL,'/'                  ; To Print / in DOS
    MOV AH,02H
    INT 21H

;Year Part
YEAR:
    MOV AH,2AH                  ; To get System Date
    INT 21H
    ADD CX,0F830H               ; To negate the effects of 16bit value,
    MOV AX,CX                   
    AAM
    MOV BX,AX
    CALL DISP

    Mov ah, 09H
    lea dx, asterisk
    int 21h

    jmp continuereceipt

linkto:             ;store one digits and two digits total purchase amount into the array
    MOV BL, AADATA[2]
    MOV quan[36], BL

    MOV AL, ARRDATA[2]
    MOV BL, ARRDATA[3]
    MOV prc[35], AL
    MOV prc[36], BL
    JMP rep1

linkf1:             ;store two digits and three digits total purchase amount into the array
    MOV AL, AADATA[1]
    MOV BL, AADATA[2]
    MOV quan[35], AL
    MOV quan[36], BL

    MOV AL, ARRDATA[1]
    MOV BL, ARRDATA[2]
    MOV CL, ARRDATA[3]
    MOV prc[34], AL
    MOV prc[35], BL
    MOV prc[36], CL
    JMP rep1

links2:             ;store three digits and four digits total purchase amount into the array
    MOV AL, AADATA[0]
    MOV BL, AADATA[1]
    MOV CL, AADATA[2]
    MOV quan[34], AL
    MOV quan[35], BL
    MOV quan[36], CL

    MOV AL, ARRDATA[0]
    MOV BL, ARRDATA[1]
    MOV CL, ARRDATA[2]
    MOV DL, ARRDATA[3]
    MOV prc[33], AL
    MOV prc[34], BL
    MOV prc[35], CL
    MOV prc[36], DL
    JMP rep1

rep1:
    MOV AH, 09H
    LEA DX, quan
    INT 21H

    MOV AH, 09H
    LEA DX, prc
    INT 21H

    MOV AH, 09H
    LEA DX, space2
    INT 21H

    CMP paymentnumber, '1'
    JE printcc

    CMP paymentnumber, '2'
    JE printewallet

    CMP paymentnumber, '3'
    JE printcash

printcc:
    MOV AH, 09h
    LEA DX, payment1
    INT 21H
    JMP continueverify

printewallet:
    MOV AH, 09h
    LEA DX, payment2
    INT 21H
    JMP continueverify

continueverify:         ;verify how many digits of balance in order to store balance into array properly
    CMP ARRDATA[0], '0'
    JA verify
    CMP ARRDATA[1], '0'
    JA verify2

    MOV AL, ARRDATA[2]      ;store the two digits cash input into array for credit card and e-wallet payment method
    MOV BL, ARRDATA[3]
    MOV totalpayment[35], AL
    MOV totalpayment[36], BL
    JMP continuedisplay

printcash:
    MOV AH, 09h
    LEA DX, payment3
    INT 21H
    JMP displayreceipt

verify:
    CMP ARRDATA[0], '9'
    JBE verify1

verify2:
    CMP ARRDATA[1], '9'
    JBE verify3

verify1:                    ;store the four digits cash input into array for credit card and e-wallet payment method
    MOV AL, ARRDATA[0]
    MOV BL, ARRDATA[1]
    MOV CL, ARRDATA[2]
    MOV DL, ARRDATA[3]
    MOV totalpayment[33], AL
    MOV totalpayment[34], BL
    MOV totalpayment[35], CL
    MOV totalpayment[36], DL
    JMP continuedisplay

verify3:                    ;store the three digits cash input into array for credit card and e-wallet payment method
    MOV AL, ARRDATA[1]
    MOV BL, ARRDATA[2]
    MOV CL, ARRDATA[3]
    MOV totalpayment[34], AL
    MOV totalpayment[35], BL
    MOV totalpayment[36], CL
    JMP continuedisplay

displayreceipt:
    CMP CASHDATA[3], '0'
    JAE displayverify
    CMP CASHDATA[2], '0'
    JAE displayverify2

    MOV AL, CASHDATA[0]      ;store the two digits cash input into array for cash payment method
    MOV BL, CASHDATA[1]
    MOV totalpayment[35], AL
    MOV totalpayment[36], BL
    JMP continuedisplay

displayverify:
    CMP CASHDATA[3], '9'
    JBE displayverify1

displayverify1:             ;store the four digits cash input into array for cash payment method
    MOV AL, '0'
    MOV BL, '0'
    MOV CL, '0'
    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]
    MOV CL, CASHDATA[2]
    MOV DL, CASHDATA[3]
    MOV totalpayment[33], AL
    MOV totalpayment[34], BL
    MOV totalpayment[35], CL
    MOV totalpayment[36], DL
    JMP continuedisplay

displayverify2:
    CMP CASHDATA[2], '9'
    JBE displayverify3

displayverify3:             ;store the three digits cash input into array for cash payment method
    MOV AL, CASHDATA[0]
    MOV BL, CASHDATA[1]
    MOV CL, CASHDATA[2]
    MOV totalpayment[34], AL
    MOV totalpayment[35], BL
    MOV totalpayment[36], CL
    JMP continuedisplay

continuebalance1:
    CMP BALANCEDATA[3], '0'
    JA continuetobalance1
    MOV AL, BALANCEDATA[3]
    MOV balancedue[36], AL
    JMP displayreceipt1

continuetobalance1:
    CMP BALANCEDATA[3], '9'
    JBE continuetobalance11

continuetobalance11:
    MOV AL, BALANCEDATA[3]     ;store one digit balance into array
    MOV balancedue[36], AL
    JMP displayreceipt1

continuebalance2:          ;store two digits balance into array
    MOV AL, BALANCEDATA[2]
    MOV BL, BALANCEDATA[3]
    MOV balancedue[35], AL
    MOV balancedue[36], BL
    JMP displayreceipt1

continuedisplay:        ;continue to print the receipt
    MOV AH, 09h
    LEA DX, totalpayment
    INT 21H

    CMP paymentnumber, '1'
    JE balancezero

    CMP paymentnumber, '2'
    JE balancezero

    ADD BALANCEDATA[1], 30H
    ADD BALANCEDATA[2], 30H
    ADD BALANCEDATA[3], 30H
    CMP BALANCEDATA[2], '0'
    JE continuebalance1
    CMP BALANCEDATA[2], '0'
    JNE continuebalance2

balancezero:                 ;store zero value balance into array
    MOV AL, 0
    ADD AL, 30H 
    MOV balancedue[36], AL
    JMP displayreceipt1

displayreceipt1:
    MOV AH, 09h 
    LEA DX, balancedue
    INT 21H

    MOV AH, 09H
    LEA DX, lrcpt
    INT 21H

    MOV ARRAYDATA[0], '0'
    MOV ARRAYDATA[1], '0'
    MOV ARRAYDATA[2], '0'

    MOV ARRDATA[0], '0'
    MOV ARRDATA[1], '0'
    MOV ARRDATA[2], '0'
    MOV ARRDATA[3], '0'

    MOV AADATA[0], '0'
    MOV AADATA[1], '0'
    MOV AADATA[2], '0'

    MOV CASHDATA[0], '$'
    MOV CASHDATA[1], '$'
    MOV CASHDATA[2], '$'
    MOV CASHDATA[3], '$'
    MOV CASHDATA[4], '$'
    MOV CASHDATA[5], '$'

    MOV BALANCEDATA[0], '$'
    MOV BALANCEDATA[1], '$'
    MOV BALANCEDATA[2], '$'
    MOV BALANCEDATA[3], '$'

    MOV price1[15], '0'
    MOV price1[16], '0'
    MOV price1[17], '0'

    MOV quan[34], ' '
    MOV quan[35], ' '
    MOV quan[36], ' '

    MOV prc[33], ' '
    MOV prc[34], ' '
    MOV prc[35], ' '
    MOV prc[36], ' '

    MOV totalpayment[33], ' '
    MOV totalpayment[34], ' '
    MOV totalpayment[35], ' '
    MOV totalpayment[36], ' '

    MOV balancedue[34], ' '
    MOV balancedue[35], ' '
    MOV balancedue[36], ' '

    MOV AL, paymentnumber
    SUB paymentnumber, AL

    ;add newline
    MOV AH,02h
    MOV DL,0Dh
    INT 21H
    MOV DL, 0Ah
    INT 21H

    JMP GoToMenuList

Exit:
    MOV AH,4ch
    INT 21H

endprogram:
    MAIN ENDP
    END MAIN