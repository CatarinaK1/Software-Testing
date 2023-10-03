import calculator as c
from calculator import addition

operand = "start"

while (operand != "exit"):

    operand = input("Do you want to '+', '-', '*' or '/' or 'exit' will end the app" )
    if (operand != "exit"):

        if(operand == '+' or operand == '-'or operand == '*'or operand == '/'):

            numberGiven= False
            numberGiven2= False
            while(not numberGiven):
                try:
                    number1 = int(input("Give a number : "))
                    numberGiven = True
                except Exception:
                    print("Number is not valid")
            
            while(not numberGiven2):
                try:
                    number2 = int(input("Give a second number "))
                    numberGiven2 = True
                except Exception:
                    print("Number is not valid")
            
            #number1 = int(input("Give a number : "))

            #number2 = int(input("Give a second number : "))

            match operand:
                case '-':
                    print(c.subtraction(number1,number2))
            
                case '+':
                    print(addition(number1,number2))
                case '*':
                    print(c.multiplication(number1,number2))
                case '/':
                    print(c.division(number1,number2))
    else:
        print("Thank you for using this app")