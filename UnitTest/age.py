#age = int(input("What is your age?"))

def DefineAge(age):
    if(age < 18 and age > 0 ):
        return "You are a child"

    elif(age < 70):
        return"You are an adult"
    
    elif( age > 70):
        return "You are a pensioner"

    else:
        return "Error age invalid"
    
