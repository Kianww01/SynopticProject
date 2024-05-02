class LevelButton extends Button{
 
  LevelButton(float x, float y, float w, float h, String text, int fontSize, color c, boolean active, String img){
    super(x, y, w, h, text, fontSize, c, active, img);
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
      getCurrentLevel().resetConditions();
      getCurrentLevel().resetFailConditions();
      getCurrentLevel().resetStoredValue();
      getCurrentLevel().enableButtons();
      getCurrentLevel().loadLevel(); 
    } else if(this.getBText() == "Run Function"){
      getCurrentLevel().runFunction(getCurrentLevel().getLevelCBs(), true); 
    } else if(this.getBText() == "End current \nIf/Loop"){
      getCurrentLevel().closeCurrentConditional();
      getCurrentLevel().loadLevel();
    }
    else{
      getCurrentLevel().addCodeBlock(this.getBText()); 
    }
  }
}
