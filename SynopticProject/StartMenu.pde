class StartMenu{
  
  Button levelSelectButton;
  
  StartMenu(){
     
  }
  
  void display(){
     background(255, 71, 77);
     levelSelectButton = new Button(700, 400, 600, 100, "Level Select", 32, color(32,32,32));
     levelSelectButton.showButton();
  }
  
}
