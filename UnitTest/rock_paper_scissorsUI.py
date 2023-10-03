import rock_paper_scissors as rps
import random

#Made by Catarina Kaucher

list = ["rock", "paper", "scissors"]

adversary = random.choice(list)
#adversary = list[random.randint(0,2)]
  

print("Let's play a game")


user_choice = input("Rock, Paper or Scissors?")
user_choice =  user_choice.lower()
    
Result = rps.rock_paper_scissors(user_choice, adversary)
    
print(Result)
