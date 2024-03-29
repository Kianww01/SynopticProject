class Button{
  
  private float buttonWidth = 100;
  private float buttonHeight = 40;
  
  private float buttonX;
  private float buttonY;
  private String buttonText;
  private color buttonColour;
  private boolean isCodeBlock;
  
  boolean buttonDeleted;
 
  Button(float x, float y, String text, color c, boolean iCB){
    
    buttonX = x;
    buttonY = y;
    buttonText = text;
    buttonColour = c;
    isCodeBlock = iCB;
    buttonDeleted = false;
  }
  
  void showButton(){
    strokeWeight(1);
    fill(buttonColour);
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    fill(0);
    textSize(16);
    textAlign(CENTER);
    float tX = buttonX + (buttonWidth/2);
    float tY = buttonY + (buttonHeight/2)+5;
    text(buttonText, tX, tY);
  }
  
  boolean isClicked(){
    // Must be a codeblock to be deleted
    if(isCodeBlock == true){
      // Requires clicking horizontally closer to the center of the button to delete (accuracy could be improved)
      return dist(buttonX + 50, buttonY + 20, mouseX, mouseY) <= 25;
    } else{
     return false; 
    }
  }
}
