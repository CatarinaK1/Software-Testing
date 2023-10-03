# Write a program that prints the numbers from 1 to 100. But for
# multiples of three print “Fizz” instead of the number and for the
# multiples of five print “Buzz”. For numbers which are multiples
# of both three and five print “FizzBuzz”.

def FizzBuzz():

    for i in range(101):
        
        print(i)
        if(i %3 == 0):
            print("Fizz")

        if (i % 5 == 0):
            print("Buzz")
        
        if(i % 3 == 0 and i % 5 == 0):
            print("FizzBuzz")
        
    

FizzBuzz()