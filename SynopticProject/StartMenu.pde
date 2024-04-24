class StartMenu{
  
  //Array of start menu buttons -> Display goes through list and displays
  ArrayList<StartMenuButton> smButtons;
  
  StartMenu(){
    smButtons = new ArrayList<StartMenuButton>();
    smButtons.add(new StartMenuButton(750,400,600,100,"Level Select",32,color(32,32,32), true));  
   
    // Potential Level Create Button
    //smButtons.add(new StartMenuButton(700,600,600,100,"Level Create",32,color(32,32,32))); 
    display();
  }
  
  private void display(){
     background(255, 71, 77);
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
