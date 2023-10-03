import oddAndEven
import unittest

class OddOrEvenTest (unittest.TestCase):
    def test_OddOrEvenTest(self):
     ##Arrange
     a = int(5)
    
     ##Act
     result = oddAndEven.OddOrEven(a)
     print(result)

     ##Assert
     self.assertEqual(result, 9)


if(__name__ ==  "__main__"):
   unittest.main()