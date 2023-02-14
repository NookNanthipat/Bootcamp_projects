win <- 0
lose <- 0
tie <- 0
play_attemp <- 0

shap.df <- data.frame(shap.id   = c(1, 2, 3),
                      shap.name = c("rock", "paper", "scissors"),
                      stringsAsFactors = FALSE)

print("Hello There!")

print("Welcome to Pao Ying Chub game!")

print("What is your name? ")
play_name <- readLines("stdin", n=1)
print(paste("Hi,", play_name))

print("Type 'ready' to start the game!")
read <- readLines("stdin", n=1)
if(read == "ready") {
  print("Great, let the game begin!")

  while(play_attemp < 99) {
  print(" '1' for rock, '2' for paper and '3' scissors.")
  print("What will you choose?")
  shap_1 <- readLines("stdin", n=1)
  play_shap <- shap.df$shap.name[shap.df$shap.id == shap_1]
  print(paste("You choose",play_shap,"!"))
  
  comp_action <- sample(c("rock", "paper", "scissors"), 1)
  print(paste("Computer choose",comp_action,"!"))
    if(play_shap == "rock"     & comp_action == "scissors" ||
       play_shap == "paper"    & comp_action == "rock" ||
       play_shap == "scissors" & comp_action == "paper") {
       print("You win!")
       win <- win + 1
       play_attemp <- play_attemp + 1
       print("Do you want to play again? [yes/no]")
       next_action <- readLines("stdin", n=1)
       print(paste("Your answer is",next_action,"!"))
       if(next_action == "yes") {
          print("Let the game begin!") 
       } else {
          print("See you again later.")
          print("Please see your score as below:")
          print(paste("win =",win))
          print(paste("lose =",lose))
          print(paste("tie =",tie))
          break
      }
  } else if(play_shap == "rock"     & comp_action == "paper" ||
            play_shap == "paper"    & comp_action == "scissors" ||
            play_shap == "scissors" & comp_action == "rock") {
            print("You lose!") 
            lose <- lose + 1
            play_attemp <- play_attemp + 1
            print("Do you want to play again? [yes/no]")
            next_action <- readLines("stdin", n=1)
            print(paste("Your answer is",next_action,"!"))
            if(next_action == "yes") {
               print("Let the game begin!") 
            } else {
               print("See you again later.")
               print("Please see your score as below:")
               print(paste("win =",win))
               print(paste("lose =",lose))
               print(paste("tie =",tie))
               break
            }
  } else if(play_shap == "rock"     & comp_action == "rock" ||
            play_shap == "paper"    & comp_action == "paper" ||
            play_shap == "scissors" & comp_action == "scissors") {
            print("It's a tie.")
            tie <- tie + 1
            play_attemp <- play_attemp + 1
            print("Do you want to play again? [yes/no]")
            next_action <- readLines("stdin", n=1)
            print(paste("Your answer is",next_action,"!"))
            if(next_action == "yes") {
               print("Let the game begin!") 
            } else {
               print("See you again later.")
               print("Please see your score as below:")
               print(paste("win =",win))
               print(paste("lose =",lose))
               print(paste("tie =",tie))
               break
            }
    }
  }    
} else {
  print("Okay, let's do it some other time.")
}


    
    
