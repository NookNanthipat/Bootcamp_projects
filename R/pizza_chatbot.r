# chatbot (rule-based)
# ordering pizza
# 8-10 dialogues

size_list <- c("1.Large" , "2.Medium" , "3.Small")
crust_list <- c("1.Classic Crust" , "2.Thin n Crispy Crust" , "3.Cheesy Crust")
topping_list <- c("1.Hawaiian" , "2.Meet Lover's" , "3.Seafood Mania")
sidemenu_list <- c("1.Cesar Salad" , "2.Cheese Stick" , "3. Spicy Buffalo Wings")
delivery_list <- c("1.Home Delivery" , "2.Self Pick-Up")
payment_list <- c("1.Cash" , "2.Credit Card")


#welcome message
print("Welcome to Pizza Co.")
print("What's your name?: ")
cust_name <- as.character(readLines("stdin" , n=1))
print(paste("Hi", cust_name))
print("It's Pizza time.. Let's start!")
  
  price <- 0

  attempt <- F
  while (attempt != T){
    
    # select size
    print("Step 1 - Select the pizza size")
    print(size_list[1:3])
    print("Size: ")
    pizza_size <- as.numeric(readLines("stdin" , n=1))
    
    # check correct size
    if(pizza_size == 1) {
      pizza_size <- ("Large")
      price <- price + 200
      attempt <- T
      
    } else if(pizza_size == 2) {
      pizza_size <- ("Medium")
      price <- price + 150
      attempt <- T
    
    } else if(pizza_size == 3){
      pizza_size <- ("Small")
      price <- price + 100
      attempt <- T
    
    } else {
        attempt <- F
        print("Please select no. between 1 to 3")
    }
  }

  
  attempt <- F
  while (attempt != T){

    # select crust
    print("Step 2 - Select the crust type")
    print(crust_list[1:3])
    print("Crust Type: ")
    pizza_crust <- as.numeric(readLines("stdin" , n=1))


    # check correct crust
    if(pizza_crust == 1) {
      pizza_crust <- ("Classic Crust")
      price <- price + 50
      attempt <- T
      
    } else if(pizza_crust == 2) {
      pizza_crust <- ("Thin n Crispy Crust")
      price <- price + 50
      attempt <- T
      
    } else if(pizza_crust == 3) {
      pizza_crust <- ("Cheesy Crust")
      price <- price + 50
      attempt <- T
      
    } else {
      attempt <- F
      print("Please select no. between 1 to 3")
    }
  }


  attempt <- F
  while (attempt != T) {

    # select topping
    print("Step 3 - Select the topping")
    print(topping_list[1:3])
    print("Topping: ")
    pizza_topping <- as.numeric(readLines("stdin" , n=1))


    # check correct topping
    if(pizza_topping == 1) {
      pizza_topping <- ("Hawaiian")
      price <- price + 100
      attempt <- T
    
    } else if(pizza_topping == 2) {
      pizza_topping <- ("Meet Lover's")
      price <- price + 100
      attempt <- T
      
    } else if(pizza_topping == 3) {
      pizza_topping <- ("Seafood Mania")
      price <- price + 150
      attempt <- T
      
    } else {
      attempt <- F
      print("Please select no. between 1 to 3")
    }
  }

    
  attempt <- F
  while (attempt != T){
    
    # select sidemenu
    print("Step 4 - Select Side Menu")
    print(sidemenu_list[1:3])
    print("Side Menu: ")
    sidemenu_order <- as.numeric(readLines("stdin" , n=1))
    
    # check sidemenu
    if(sidemenu_order == 1) {
      sidemenu_order <- ("Cesar Salad")
      price <- price + 100
      attempt <- T
    
    } else if(sidemenu_order == 2) {
      sidemenu_order <- ("Cheese Stick")
      price <- price + 100
      attempt <- T
    
    } else if(sidemenu_order == 3){
      sidemenu_order <- ("Spicy Buffalo Wings")
      price <- price + 120
      attempt <- T
      
    } else {
        attempt <- F
        print("Please select no. between 1 to 3")
    }
  }

  print("---------------------------------------")
  print("---------------------------------------")
  
  #summarize order
  print("Here is your order")
  print(paste("A" , pizza_size , "size" , pizza_topping , "with" , pizza_crust))
  print(paste("and" , sidemenu_order))
  print(paste("Total Price =" , price , "Baht"))
  
  print("---------------------------------------")
  print("---------------------------------------")

  
  attempt <- F
  while (attempt != T) {
  
    # payment method
    print("Choose the Payment Method..")
    print(payment_list[1:2])
    print("Payment Method: ")
    payment_method <- as.numeric(readLines("stdin" , n=1))
    
    # check payment method
    if(payment_method == 1) {
      print("OK. You prefer to pay by Cash")
      attempt <- T
    
    } else if(payment_method == 2) {
      print("OK. You prefer to pay by Credit Card")
      attempt <- T
      
    } else {
      attempt <- F
      print("Please select no. between 1 to 2")
    }
  }
  
    
  attempt <- F
  while (attempt != T) {
    
    # delivery method
    print("Choose Delivery Method..")
    print(delivery_list[1:2])
    print("Delivery Method: ")
    delivery_method <- as.numeric(readLines("stdin" , n=1))
    
    
    # check delivery method
    if(delivery_method == 1) {
      print("Please enter your address: ")
      address <- as.character(readLines("stdin" , n=1))
      print(paste("Great. Your order from Pizza Co. will be delivered to" , address , "in 15-30 minutes."))
      attempt <- T
      
    } else if(delivery_method == 2) {
      print("Sure. You can grab your order at Pizza Co. in 30 minutes")
      attempt <- T
    
    } else {
      attempt <- F
      print("Please select no. between 1 to 2")
    }
  }
  print("Thank you very much. Have a Nice Day.")
