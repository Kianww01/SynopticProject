ArrayList<Button> buttons;
final StringList buttonTypes = new StringList("Input", "Output", "Add", "Subtract", "Remainder", "Multiply", "If", "Loop", "End", "Store");
final IntList buttonTypeColours = new IntList("200", "180", "160", "140", "200", "180", "160", "200", "180", "160");
IntDict colourDict; 

void setup(){
  size(1400, 800);
  
  background(173,216,230);

  colourDict = new IntDict();
  println(buttonTypes);
  println(buttonTypeColours);
  
  for(int i = 0; i < buttonTypes.size(); i++){
    colourDict.set(buttonTypes.get(i), buttonTypeColours.get(i));
  }
  
  println(colourDict);
  
  strokeWeight(3);
  line(1100, 0, 1100, 800);
  line(0, 80, 1100, 80);
  
  int x = 20;
  int y = 20;
  
  buttons = new ArrayList<Button>();
  
  //for(int i = 0; i < buttonTypes.size(); i++){
  //  buttons.add(new Button(x, y, buttonTypes.get(i),colourDict.get(buttonTypes.get(i)), false));
  //  println(colourDict.get(buttonTypes.get(i)));
  //  x += 105;
  //}
  
  buttons.add(new Button(20, 20, "Input", color(200,0,0), false));
  buttons.add(new Button(125, 20, "Output", color(180,0,0), false));
  buttons.add(new Button(230, 20, "Add", color(0,200,0), false));
  buttons.add(new Button(335, 20, "Subtract", color(0,180,0), false));
  buttons.add(new Button(440, 20, "Remainder", color(0,160,0), false));
  buttons.add(new Button(545, 20, "Multiply", color(0,140,0), false));
  buttons.add(new Button(650, 20, "If", color(0,0,200), false));
  buttons.add(new Button(755, 20, "Loop", color(0,0,180), false));
  buttons.add(new Button(860, 20, "End", color(0,0,160), false));
  buttons.add(new Button(965, 20, "Store", color(0,0,140), false));
  
  showButtons();
}

void draw(){

  for(int i = 0; i < buttons.size(); i++){
    if(buttons.get(i).getButtonDeleted() == true){
      buttons.remove(i);
      resetScreen();
    }
  }

}

void mousePressed(){
  for(int i = 0; i < buttons.size(); i++){
    // Must be a codeblock to be deleted
    if(buttons.get(i).isClicked() && buttons.get(i).getIsCodeBlock()){
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
