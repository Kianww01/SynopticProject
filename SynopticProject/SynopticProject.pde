String currentScreen; 

void setup(){
  size(1400, 800);
    
  currentScreen = "SM";
  StartMenu sm = new StartMenu();
  sm.display();
}
