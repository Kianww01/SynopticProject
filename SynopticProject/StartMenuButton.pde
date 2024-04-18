class StartMenuButton extends Button{
  
  StartMenuButton(float x, float y, float w, float h, String text, int fontSize, color c, boolean active){
    super(x, y, w, h, text, fontSize, c, active);
  }
  
  @Override
    void onClick(){
      if(this.getBText() == "Level Select"){
        setCurrentScreen("LS");
        getLS().display();
      }
    }
}
