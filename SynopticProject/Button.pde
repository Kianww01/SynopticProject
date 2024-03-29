class Button{
  
  private float buttonWidth = 100;
  private float buttonHeight = 40;
  
  private float buttonX;
  private float buttonY;
  private String buttonText;
  private int buttonColour;
  private boolean isCodeBlock;
  
  private boolean buttonDeleted;
 
  Button(float x, float y, String text, int c, boolean iCB){
    
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
    fill(255);
    textSize(16);
    textAlign(CENTER);
    float tX = buttonX + (buttonWidth/2);
    float tY = buttonY + (buttonHeight/2)+5;
    text(buttonText, tX, tY);
  }
  
  boolean isClicked(){
    // Requires clicking horizontally closer to the center of the button to delete (accuracy could be improved)
    return dist(buttonX + 50, buttonY + 20, mouseX, mouseY) <= 25;
  }
  
  public float getButtonX(){
    return this.buttonX; 
  }
  
  public float getButtonY(){
    return this.buttonY;
  }
  
  public boolean getIsCodeBlock(){
    return this.isCodeBlock;
  }
  
  public boolean getButtonDeleted(){
    return this.buttonDeleted;
  }
}
