import unittest
import calculator


class MyCalculatorTest (unittest.TestCase):
    def test_CalculateSumOfIntegers_A_and_B_AssignCalculatedValueTo_c(self):
     ##Arrange
     a = int(5)
     b = int(6)

     ##Act
     result = calculator.addition(a,b)

     ##Assert
     self.assertEqual(result, 11)

    
    def test_CalculateRemainderOfIntegers_A_and_B_AssignCalculatedValueTo_c(self):
     ##Arrange
     a = int(7)
     b = int(6)

     ##Act
     result = calculator.subtraction(a,b)

     ##Assert
     self.assertEqual(result, 1)
    
    def test_CalculateProductOfIntegers_A_and_B_AssignCalculatedValueTo_c(self):
     ##Arrange
     a = int(6)
     b = int(6)

     ##Act
     result = calculator.multiplication(a,b)

     ##Assert
     self.assertEqual(result, 36)

    def test_CalculateQuotientOfIntegers_A_and_B_AssignCalculatedValueTo_c(self):
     ##Arrange
     a = int(8)
     b = int(4)

     ##Act
     result = calculator.division(a,b)

     ##Assert
     self.assertEqual(result, 2)

if(__name__ ==  "__main__"):
   unittest.main()
