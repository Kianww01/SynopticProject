class CodeBlock{
  
  private float cbX;
  private float cbY;
  
  private float cbWidth;
  private float cbHeight;
  
  private String cbText;
  private int cbTextFS;
  private color cbColour;
  
  private ArrayList<CodeBlock> codeBlocks;
  
  private int ifCondition;
  private int loopLength;
  
  private PImage cbImage;
 
  CodeBlock(float x, float y, float w, float h, String text, int fontSize, color c, int ifC, int lL, String img){
     cbX = x;
     cbY = y;
     cbWidth = w;
     cbHeight = h;
     cbText = text;
     cbTextFS = fontSize;
     cbColour = c;
     
     ifCondition = ifC;
     loopLength = lL;
     
     codeBlocks = new ArrayList<CodeBlock>();
     
     if(img != ""){
        cbImage = loadImage(img);
     }  
  }
  
  void showCodeBlock(){
    if(cbImage != null){
      imageMode(CENTER);
      image(cbImage,cbX,cbY,cbWidth,cbHeight);    
    } else{
      strokeWeight(1);
      fill(cbColour);
      rectMode(CENTER);
      rect(cbX, cbY, cbWidth, cbHeight);
    }
    
    fill(255);
    textSize(cbTextFS);
    textAlign(CENTER, CENTER);
    text(cbText, cbX, cbY);
  }
  
  public String getCBText(){
   return this.cbText; 
  }
  
  public void setCBText(String newValue){
    this.cbText = newValue; 
  }
  
  public void addToCodeBlocks(CodeBlock cb){
    codeBlocks.add(cb); 
  }
  
  public ArrayList<CodeBlock> getCodeBlocks(){
    return codeBlocks; 
  }
  
  public int getIfCondition(){
    return this.ifCondition;
  }
  
  public int getLoopLength(){
    return this.loopLength; 
  }
}
