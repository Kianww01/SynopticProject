class LevelSelectButton extends Button{
  
  LevelSelectButton(float x, float y, float w, float h, String text, int fontSize, color c, boolean active){
    super(x, y, w, h, text, fontSize, c, active);
  }
  
  @Override
    void onClick(){
      if(this.getBText() == "Next Page"){
        // Handles going to the next page of levels
        getLS().setPageStartIndex(ls.getPageStartIndex() + 4);
        getLS().display();
      } 
      else if (this.getBText() == "Previous Page"){
        // Handles going to the previous page of levels
        getLS().setPageStartIndex(ls.getPageStartIndex() - 4);
        getLS().display();
      } 
      else if(this.getBText() == "Back To Start Menu"){
        // Handles returning to the main menu 
        setCurrentScreen("SM");
        getSM().display();
      } 
      else{
        // Handles Level Buttons
        setCurrentScreen("LVL");
        setCurrentLevel(this.getBText());
        getCurrentLevel().resetAttemptCounter();
        getCurrentLevel().clearCodeBlocks();
        getCurrentLevel().resetInput();
        getCurrentLevel().resetFinalOutput();
        getCurrentLevel().resetConditions();
        getCurrentLevel().resetFailConditions();
        getCurrentLevel().resetStoredValue();
        getCurrentLevel().enableButtons();
        getCurrentLevel().loadLevel();
      }
    }
}
