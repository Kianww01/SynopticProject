ArrayList<Button> buttons;
//ArrayList<String>

void setup(){
  size(1400, 800);
  background(173,216,230);
  
  strokeWeight(3);
  line(1100, 0, 1100, 800);
  line(0, 80, 1100, 80);
  
  buttons = new ArrayList<Button>();
  buttons.add(new Button(20, 20, "Input", color(255,0,0), false));
  buttons.add(new Button(125, 20, "Input2", color(0,255,0), false));
  buttons.add(new Button(230, 20, "Input3", color(255,0,0), false));
  buttons.add(new Button(335, 20, "Input4", color(0,255,0), false));
  buttons.add(new Button(440, 20, "Input5", color(255,0,0), false));
  buttons.add(new Button(545, 20, "Input6", color(0,255,0), false));
  buttons.add(new Button(650, 20, "Input7", color(255,0,0), false));
  buttons.add(new Button(755, 20, "Input8", color(0,255,0), false));
  buttons.add(new Button(860, 20, "Input9", color(0,255,0), false));
  buttons.add(new Button(965, 20, "Input10", color(0,255,0), false));
  
  showButtons();
}

void draw(){

  for(int i = 0; i < buttons.size(); i++){
    if(buttons.get(i).buttonDeleted == true){
      buttons.remove(i);
      resetScreen();
    }
  }

}

void mousePressed(){
  for(int i = 0; i < buttons.size(); i++){
    if(buttons.get(i).isClicked()){
      buttons.get(i).buttonDeleted = true;
    }
  }
}

void showButtons(){
  for(int i = 0; i < buttons.size(); i++){
    buttons.get(i).showButton();
  }
}

void resetScreen(){
  background(173,216,230);
  strokeWeight(3);
  line(1100, 0, 1100, 800);
  line(0, 80, 1100, 80);
  showButtons();
}
