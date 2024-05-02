abstract class Button{
  
  private float bX;
  private float bY;
  
  private float bWidth;
  private float bHeight;
  
  private String bText;
  private int bTextFS;
  private color bColour;
  private color bFontColour;
  
  private PImage bImage;
  
  private boolean bActive;
  
  Button(float x, float y, float w, float h, String text, int fontSize, color c, boolean active, String img){
     bX = x;
     bY = y;
     bWidth = w;
     bHeight = h;
     bText = text;
     bTextFS = fontSize;
     bColour = c;
     bFontColour = color(255);
     bActive = active;
     
     if(img != ""){
        bImage = loadImage(img);
     }     
  }
  
  public void showButton(){
    if(bActive == false){
      imageMode(CENTER);
      image(loadImage("Assets/Buttons/Button16.png"),bX,bY,bWidth,bHeight);
    }  else if(bImage != null){
      imageMode(CENTER);
      image(bImage,bX,bY,bWidth,bHeight);         
    }  else{
      strokeWeight(1);
      fill(bColour);
      rectMode(CENTER);
      rect(bX, bY, bWidth, bHeight);  
    }
      
    fill(bFontColour);
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
  
  public void setColour(color newValue){
    this.bColour = newValue; 
  }
  
  public void setFontColour(color newValue){
    this.bFontColour = newValue; 
  }
}
