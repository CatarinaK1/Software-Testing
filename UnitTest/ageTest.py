import unittest
import age

class MyAgeTEst(unittest.TestCase):
    
    def test_SendValueForChild_And_CheckResponse(self):
     #Arrange

        a = int(7)
        #Act
        result = age.DefineAge(a)

        #Assert
        self.assertEqual(result, "You are a child")

    def test_SendValueForAdult_And_CheckResponse(self):
        #Arrange

        a = int(7)
        #Act
        result = age.DefineAge(a)

        #Assert
        self.assertEqual(result, "You are a child")

if(__name__ == "__main__"):
    unittest.main()
