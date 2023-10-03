
def OddOrEven(number):
    #number = input("Input a number")
    
    while(number != 1):

        if(number %  2 == 0):

            number = number/2

        else:
            number = (number * 3) + 1
        
    return number


print(OddOrEven(256))