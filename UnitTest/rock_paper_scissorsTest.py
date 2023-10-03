import unittest
import rock_paper_scissors as rps

#Made by Catarina Kaucher
 

class MyRockPaperScissorsTest(unittest.TestCase):

    def test_if_User_Chooses_Paper_Win(self):
        #Arrange
        user = "paper"
        computer = "rock"

        #Act
        result = rps.rock_paper_scissors(user, computer)

        #Assert
        self.assertEqual(result, "Paper beats rock. You won!")

    def test_if_User_Chooses_Paper_Loses(self):
        #Arrange
        user = "paper"
        computer = "scissors"
        
        #Act
        result = rps.rock_paper_scissors(user, computer)

        #Assert
        self.assertEqual(result, "Scissors beats paper. You lost!")

    def test_if_User_Chooses_Rock_Win(self):
        #Arrange
        user = "rock"
        computer = "scissors"

       #Act
        result = rps.rock_paper_scissors(user, computer)
       
        #Assert
        self.assertEqual(result, "Rock destroys scissors. You won!")

    def test_if_User_Chooses_Rock_Loses(self):
        #Arrange
        user = "rock"
        computer = "paper"

       #Act
        result = rps.rock_paper_scissors(user, computer)
       
        #Assert
        self.assertEqual(result, "Paper beats rock. You lost!")



    def test_if_User_Chooses_Scissors_Win(self):
        #Arrange
        user = "scissors"
        computer = "paper"
         

       #Act
        result = rps.rock_paper_scissors(user, computer)
       
        #Assert
        self.assertEqual(result, "Scissors beats paper. You won!")

    def test_if_User_Chooses_Scissors_Loses(self):
        #Arrange
        user = "scissors"
        computer = "rock"

       #Act
        result = rps.rock_paper_scissors(user, computer)
       
        #Assert
        self.assertEqual(result, "Rock destroys scissors. You lost!")

    def test_if_Its_A_Tie(self):
        
        #Arrange
        user = "paper"
        computer = "paper"

        #Act
        result = rps.rock_paper_scissors(user, computer)

        #Assert
        self.assertEqual(result, f"It's a tie! Both players chose {user}.")
        
        #Wrong Test
        #self.assertEqual(result, "Paper beats rock. You won!")

    def test_if_user_input_fail(self):
        #Arrange
        user = "fff"
        computer = "paper"

        #Act
        result = rps.rock_paper_scissors(user, computer)

        #Assert
        self.assertAlmostEqual(result,"Invalid input")

        #Wrong Test
        #self.assertEqual(result, "Paper beats rock. You won!")






if(__name__ == "__main__"):
    unittest.main()