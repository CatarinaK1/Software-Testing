import unittest
import triangle as t

#Made by Catarina Kaucher

class MyTriangleTest (unittest.TestCase):

    def test_ifTriangleIsEquilateral(self):
        #Test 1
        #Arrange
        a = int(7)
        b = int(7)
        c = int(7)
        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "equilateral")
    
    def test_ifTriangleIsIsosceles_A_And_B(self):
        #Test 2
        #Arrange
        a = int(8)
        b = int(8)
        c = int(9)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "isosceles")

    def test_ifTriangleIsIsosceles_B_And_C(self):
        #Test 3
        #Arrange
        a = int(8)
        b = int(9)
        c = int(9)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "isosceles")

    def test_ifTriangleIsIsosceles_A_And_C(self):
        #Test 4
        #Arrange
        a = int(8)
        b = int(9)
        c = int(8)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "isosceles")

        #Wrong Test
        #self.assertEqual(result, "irregular")


    def test_IfTriangleIsIrregular(self):
        #Test 5
        #Arrange
        a = int(9)
        b = int(6)
        c = int(8)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "irregular")

        #Wrong Test
        #self.assertEqual(result, "isosceles")
    
    def test_IfTriangleError(self):
        #Test 6
        #Arrange
       
        a = "a"
        b = int(8)
        c = int(8)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "Value is not valid")

    def test_IfTriangleErrorInvalidIrregular(self):
        #Test 7
       #Arrange
        a = int(9)
        b = int(8)
        c = "c"

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "Value is not valid")

    def test_IfTriangleNegativeError(self):
        #Test 8
       #Arrange
        a = int(-8)
        b = int(8)
        c = int(8)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "Error: Cannot form a triangle with these values")


    def test_IfTriangleNegativeIrregularError(self):
        #Test 9
       #Arrange
        a = int(8)
        b = int(7)
        c = int(-9)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "Error: Cannot form a triangle with these values")

    def test_IfTriangleValueIsZeroError(self):
        #Test 10
       #Arrange
        a = int(8)
        b = int(7)
        c = int(0)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "Error: Cannot form a triangle with these values")

    def test_IfTriangleIsPossible(self):
        #Test 11
       #Arrange
        a = int(2)
        b = int(2)
        c = int(8)

        #Act
        result = t.TriangleProblem(a, b, c)

        #Assert
        self.assertEqual(result, "Error: Cannot form a triangle with these values")

    


if(__name__ == "__main__"):
    unittest.main()