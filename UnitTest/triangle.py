def TriangleProblem(a,b,c):
 
 #Made by Catarina 

    try:
        int(a)
        int(b)
        int(c)
        val = True
    except ValueError:
        val = False
        return "Value is not valid"


    #equilateral (all three pages are the same length
    if a <= 0 or b <= 0 or c <= 0:
        return "Error: Cannot form a triangle with these values"
    
    elif a + b < c or b + c < a or a + c < b:
        return "Error: Cannot form a triangle with these values"

    elif(a == b and b == c):
        return "equilateral"
    
    #isosceles (two sides are the same length - the third side is different in length than the others)
    elif(a == b or b == c or a == c):
        return "isosceles"
    
    #irregular (all sides have different lengths).
    elif( a != b and b != c or a != c):
        return "irregular"
