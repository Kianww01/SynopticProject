class LevelSelect{
  private int pageStartIndex = 0;
  private ArrayList<Level> levels;
  private ArrayList<LevelSelectButton> lsButtons;
  private ArrayList<LevelSelectButton> lsLevelButtons;
  
  LevelSelect(){
    levels = getLevels();
    
    lsButtons = new ArrayList<LevelSelectButton>();
    lsButtons.add(new LevelSelectButton(100,750,150,50,"Back To Start Menu",16,color(32,32,32), true));
    lsButtons.add(new LevelSelectButton(300,650,160,60,"Previous Page",24,color(32,32,32), false));
    lsButtons.add(new LevelSelectButton(1100,650,160,60,"Next Page",24,color(32,32,32), false));
    
    lsLevelButtons = new ArrayList<LevelSelectButton>();
    generateLevelButtons();
  }
  
  private void display(){
    background(255, 71, 77);
    resetLevelButtons();
    
    strokeWeight(1);
    fill(color(105,105,105));
    rectMode(CENTER);
    rect(700, 400, 1000, 600);
    
    for(int i = 0; i < lsButtons.size(); i++){
       if(lsButtons.get(i).getBText() == "Previous Page"){
         if(pageStartIndex > 0){
           lsButtons.get(i).showButton();
           lsButtons.get(i).setBActive(true);
         } else{
           lsButtons.get(i).setBActive(false); 
         }
       } 
       else if(lsButtons.get(i).getBText() == "Next Page"){
         if(pageStartIndex + 4 < levels.size()){
           lsButtons.get(i).showButton();
           lsButtons.get(i).setBActive(true);
         } else{
           lsButtons.get(i).setBActive(false); 
         }
       }
       else{
         lsButtons.get(i).showButton();       
       }
    }
    
    for(int i = 0; i < 4 && i < (lsLevelButtons.size() - pageStartIndex); i++){
      lsLevelButtons.get(i+pageStartIndex).showButton();
      lsLevelButtons.get(i+pageStartIndex).setBActive(true);
    }
  }
  
  private void buttonClicked(){
    for(int i = 0; i < lsButtons.size(); i++){
      if(lsButtons.get(i).isClicked() && lsButtons.get(i).getBActive() == true){
        lsButtons.get(i).onClick(); 
      } 
    }
    
    for(int i = 0; i < lsLevelButtons.size(); i++){
      if(lsLevelButtons.get(i).isClicked() && lsLevelButtons.get(i).getBActive() == true){
        lsLevelButtons.get(i).onClick(); 
        resetLevelButtons();
      }
    }
  }
    
  private void generateLevelButtons(){
    // Add level buttons based on where they should be on the page
    for(int i = 0; i < levels.size(); i++){
      if((i+1) % 4 == 1){
        lsLevelButtons.add(new LevelSelectButton(400,400,150,150,str(levels.get(i).getLevelNumber()),32,color(32,32,32),false));
      }
      else if((i+1) % 4 == 2){
        lsLevelButtons.add(new LevelSelectButton(600,400,150,150,str(levels.get(i).getLevelNumber()),32,color(32,32,32),false));
      }
      else if((i+1) % 4 == 3){
        lsLevelButtons.add(new LevelSelectButton(800,400,150,150,str(levels.get(i).getLevelNumber()),32,color(32,32,32),false));
      }
      else{
        lsLevelButtons.add(new LevelSelectButton(1000,400,150,150,str(levels.get(i).getLevelNumber()),32,color(32,32,32),false));
      }
    }
  }
   
  // Resets all level buttons to inactive
  private void resetLevelButtons(){
    for(int i = 0; i < lsLevelButtons.size(); i++){
      lsLevelButtons.get(i).setBActive(false);
    }
  }
   
  public int getPageStartIndex(){
    return this.pageStartIndex; 
  }
  
  public void setPageStartIndex(int newValue){
    this.pageStartIndex = newValue; 
  }
}
