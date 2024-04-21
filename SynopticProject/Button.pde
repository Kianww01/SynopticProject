abstract class Button{
  
  private float bX;
  private float bY;
  
  private float bWidth;
  private float bHeight;
  
  private String bText;
  private int bTextFS;
  private color bColour;
  
  private boolean bActive;
  
  Button(float x, float y, float w, float h, String text, int fontSize, color c, boolean active){
     bX = x;
     bY = y;
     bWidth = w;
     bHeight = h;
     bText = text;
     bTextFS = fontSize;
     bColour = c;
     bActive = active;
  }
  
  public void showButton(){
    strokeWeight(1);
    fill(bColour);
    rectMode(CENTER);
    rect(bX, bY, bWidth, bHeight);
    fill(255);
    textSize(bTextFS);
    textAlign(CENTER, CENTER);
    text(bText, bX, bY);
  }
  
  public boolean isClicked(){
    return (mouseX > (bX - (bWidth/2)) && mouseX < (bX + (bWidth/2)) && mouseY > (bY - (bHeight/2)) && mouseY < (bY + (bHeight/2)));
  }
  
  abstract void onClick();
  
  public String getBText(){
   return this.bText; 
  }
  
  public void setBText(String newValue){
    this.bText = newValue; 
  }
  
  public boolean getBActive(){
    return this.bActive;
  }
  
  public void setBActive(boolean newValue){
    this.bActive = newValue;
  }
}
