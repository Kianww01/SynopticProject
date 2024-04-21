class LevelButton extends Button{
 
  LevelButton(float x, float y, float w, float h, String text, int fontSize, color c, boolean active){
    super(x, y, w, h, text, fontSize, c, active);
  }
  
  @Override
  void onClick(){
    if(this.getBText() == "Back To Level Select"){
      setCurrentScreen("LS");
      getCurrentLevel().clearCodeBlocks();
      getCurrentLevel().resetInput();
      getCurrentLevel().resetFinalOutput();
      getLS().display();
    } else if(this.getBText() == "Reset"){
       getCurrentLevel().incrementAttemptCounter();
       getCurrentLevel().clearCodeBlocks();
       getCurrentLevel().resetInput();
       getCurrentLevel().resetFinalOutput();
       getCurrentLevel().loadLevel();       
    } else if(this.getBText() == "Run Function"){
      getCurrentLevel().runFunction(getCurrentLevel().getLevelCBs()); 
    } else{
      getCurrentLevel().addCodeBlock(this.getBText()); 
    }
  }
}
