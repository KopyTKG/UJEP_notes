from random import randint
player = int(input("Zadej ruku (K=0,P=1,N=2): "))
bot = randint(0,2)

# kamen <= papír <= nůžky <= kámen 
win = [(1,0),(0,2),(2,1)]

if (player, bot) in win:
    print("!!!!  Win  !!!!")
elif player == bot:
    print("!!!!  Draw  !!!!")
else:
    print("!!!!  Lose  !!!!")

print(f" -- {player=} {bot=}")