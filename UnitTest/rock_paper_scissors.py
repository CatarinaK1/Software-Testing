import random

#Made by Catarina Kaucher


def rock_paper_scissors(user_choice, adversary):

    #print(f"computer: {adversary}, User: {user_choice}")
    
    if(user_choice == adversary):
        return f"It's a tie! Both players chose {user_choice}."

    elif (user_choice == "scissors"):
        if(adversary == "rock"):
            return "Rock destroys scissors. You lost!"
        else:
            return "Scissors beats paper. You won!"

    elif (user_choice == "rock"):
        if(adversary == "paper"):
            return "Paper beats rock. You lost!"
        
        else:
            return "Rock destroys scissors. You won!"

    elif(user_choice == "paper"):
        if(adversary == "scissors"):
            return "Scissors beats paper. You lost!"
        else:
           return "Paper beats rock. You won!"
    
    else:
        return "Invalid input"