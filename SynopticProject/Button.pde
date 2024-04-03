class Button{
  
  private float bX;
  private float bY;
  
  private float bWidth;
  private float bHeight;
  
  private String bText;
  private int bTextFS;
  private color bColour;
  
  Button(float x, float y, float w, float h, String text, int fontSize, color c){
     bX = x;
     bY = y;
     bWidth = w;
     bHeight = h;
     bText = text;
     bTextFS = fontSize;
     bColour = c;
  }
  
  void showButton(){
    strokeWeight(1);
    fill(bColour);
    rectMode(CENTER);
    rect(bX, bY, bWidth, bHeight);
    fill(255);
    textSize(bTextFS);
    textAlign(CENTER, CENTER);
    text(bText, bX, bY);
  }
}
