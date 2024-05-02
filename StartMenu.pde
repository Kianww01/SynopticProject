class StartMenu{
  
  //Array of start menu buttons -> Display goes through list and displays
  ArrayList<StartMenuButton> smButtons;
  
  StartMenu(){
    smButtons = new ArrayList<StartMenuButton>();
    smButtons.add(new StartMenuButton(750,350,600,100,"Level Select",32,color(32,32,32), true, "Assets/Buttons/Button01.png"));  
           
    // Potential Level Create Button
    //smButtons.add(new StartMenuButton(700,600,600,100,"Level Create",32,color(32,32,32))); 
    display();
  }
  
  private void display(){
    background(#D4ECF2);
    
    textAlign(CENTER,CENTER);
    textSize(96);
    fill(0);
    text("BLOCKLOGIC",750,100);
    textSize(36);
    text("An Educational Problem Solving Game - The Basics of Programming!",750,160);
    
    text("Instructions - READ BEFORE CONTINUING!",750,500);
    textSize(28);
    text("At the top of the level you will find important information, be sure to read it before attempting the level!\nEach level will have a problem in the form of a set of numbers and an expected answer\nUse the codeblocks provided on each level to get the required output\nSome levels will have additional requirements like Minimum If Blocks or Minimum Loop Blocks",750,600);
    
    for(int i = 0; i < smButtons.size(); i++){
      smButtons.get(i).showButton();  
    }   
  }
  
  private void buttonClicked(){
    for(int i = 0; i < smButtons.size(); i++){
      if(smButtons.get(i).isClicked() && smButtons.get(i).getBActive() == true){
        smButtons.get(i).onClick(); 
      } 
    }
  }
}
