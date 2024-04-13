class LevelSelectButton extends Button{
  
  LevelSelectButton(float x, float y, float w, float h, String text, int fontSize, color c, boolean active){
    super(x, y, w, h, text, fontSize, c, active);
  }
  
  @Override
    void onClick(){
      if(this.getBText() == "Next Page"){
        // Handles going to the next page of levels
        ls.setPageStartIndex(ls.getPageStartIndex() + 4);
        ls.display();
      } 
      else if (this.getBText() == "Previous Page"){
        // Handles going to the previous page of levels
        ls.setPageStartIndex(ls.getPageStartIndex() - 4);
        ls.display();
      } 
      else if(this.getBText() == "Back To Start Menu"){
        // Handles returning to the main menu 
        currentScreen = "SM";
        sm.display();
      }
      else{
        // Handles Level Buttons
        println(this.getBText());
      }
    }
}
