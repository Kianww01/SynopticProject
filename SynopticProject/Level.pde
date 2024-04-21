class Level{
 
  private String levelInfo;
  private int levelNumber;
  
  // Stores initial input used for resetting
  private IntList levelInitialInput;
  private IntList levelInput;
  private IntList levelOutput;
  
  private int levelTimerLength;
  
  private StringList levelCodeBlockButtons;
  private int levelMinimumIfs;
  private int levelMinimumLoops;
  
  private ArrayList<LevelButton> levelGeneralButtons;
  private ArrayList<LevelButton> codeBlockButtons;
  private ArrayList<CodeBlock> codeBlocks;
  private ArrayList<CodeBlock> openConditionals;
  
  private int levelAttemptCounter;
  private IntList finalLevelOutput;
  
  private int storedValue;
  private int blocksAdded;
  
  Level(String lInfo, int lNum, IntList lInput, IntList lOutput, int lTimer, StringList lCodeBlocks, int lMinIfs, int lMinLoops){
    levelInfo = lInfo;
    levelNumber = lNum;
    levelInitialInput = new IntList();
    levelInput = lInput;
    for(int i = 0; i < levelInput.size(); i++){
      levelInitialInput.append(levelInput.get(i)); 
    }
    levelOutput = lOutput;
    levelTimerLength = lTimer;
    levelCodeBlockButtons = lCodeBlocks;
    levelMinimumIfs = lMinIfs;
    levelMinimumLoops = lMinLoops;
    levelAttemptCounter = 0;  
    storedValue = 404;
    
    codeBlockButtons = new ArrayList<LevelButton>();
    codeBlockButtons.add(new LevelButton(60,120,100,50,"Input",16,color(32,32,32),true));
    codeBlockButtons.add(new LevelButton(180,120,100,50,"Output",16,color(32,32,32),true));
    
    for(int i = 0; i < levelCodeBlockButtons.size(); i++){
      codeBlockButtons.add(new LevelButton(180+((codeBlockButtons.size() - 1)*120),120,100,50,levelCodeBlockButtons.get(i),16,color(32,32,32),true));
    }
    
    codeBlockButtons.add(new LevelButton(1140,220,100,50,"End current \nIf/Loop",16,color(32,32,32),true));
    
    codeBlocks = new ArrayList<CodeBlock>();
    openConditionals = new ArrayList<CodeBlock>();
       
    finalLevelOutput = new IntList();
  }
  
  private void loadLevel(){
    background(134,197,218);
    
    strokeWeight(2);
    
    rectMode(CENTER);
    fill(color(255,112,116));
    rect(600,40,1200,80);
    
    fill(color(0,0,0));
    textSize(20);
    textAlign(CENTER,CENTER);
    text(levelInfo,600,40);
    
    fill(color(134,197,218));
    rect(600,120,1200,80);
    // Draw Code Blocks
    generateCodeBlockButtons();
    
    fill(color(134,197,218));
    rect(1300,400,200,800);
    // Code Block Area
    
    fill(color(134,197,218));
    rect(600,240,800,80);
    
    // Loops input array and turns it into a string
    fill(color(0,0,0));
    String inputArrayStr = "Problem Input: ";
    for(int i = 0; i < levelInitialInput.size(); i++){
      inputArrayStr += levelInitialInput.get(i);
      
      if(i + 1 != levelInitialInput.size()){
        inputArrayStr += ", "; 
      }
    }    
    text(inputArrayStr,600,240);
    
    fill(color(134,197,218));
    rect(600,340,800,80);
    
    // Loops output array and turns it into a string
    fill(color(0,0,0));
    String outputArrayStr = "Expected Output: ";
    for(int i = 0; i < levelOutput.size(); i++){
      outputArrayStr += levelOutput.get(i);
      
      if(i + 1 != levelOutput.size()){
        outputArrayStr += ", ";
      }
    }
    text(outputArrayStr,600,340);
    
    fill(color(134,197,218));
    rect(600,540,800,80);
    
    String finalOutputArrayStr = "Final Output: ";
    for(int i = 0; i < finalLevelOutput.size(); i++){
      finalOutputArrayStr += finalLevelOutput.get(i);
      
      if(i + 1 != finalLevelOutput.size()){
        finalOutputArrayStr += ", "; 
      }
    }
    
    fill(color(0,0,0));
    text(finalOutputArrayStr,600,540);
    
    levelGeneralButtons = new ArrayList<LevelButton>();
    levelGeneralButtons.add(new LevelButton(100,750,150,50,"Back To Level Select",16,color(32,32,32), true));
    levelGeneralButtons.add(new LevelButton(1100,750,150,50,"Run Function",16,color(32,32,32), true));
    levelGeneralButtons.add(new LevelButton(925,750,150,50, "Reset",16,color(32,32,32),true));
    
    fill(color(0,0,0));
    textSize(16);
    text("Attempts: " + levelAttemptCounter,1140,175);
    
    generateLevelButtons();
    generateCodeBlocks(codeBlocks);
  }
  
  private void buttonClicked(){
    for(int i = 0; i < levelGeneralButtons.size(); i++){
      if(levelGeneralButtons.get(i).isClicked()){
        levelGeneralButtons.get(i).onClick();  
      }
    }
    
    for(int i = 0; i < codeBlockButtons.size(); i++){
      if(codeBlockButtons.get(i).isClicked()){
        codeBlockButtons.get(i).onClick(); 
      }
    }
  }
  
  private void generateLevelButtons(){
    for(int i = 0; i < levelGeneralButtons.size(); i++){
      levelGeneralButtons.get(i).showButton();
    }
  }
  
  private void generateCodeBlockButtons(){
    for(int i = 0; i < codeBlockButtons.size(); i++){
      codeBlockButtons.get(i).showButton(); 
    }
  }
  
  public int getLevelNumber(){
    return this.levelNumber; 
  }
  
  public void incrementAttemptCounter(){
    this.levelAttemptCounter++;
  }
  
  public void resetAttemptCounter(){
    this.levelAttemptCounter = 0; 
  }
  
  public void clearCodeBlocks(){
    this.codeBlocks.clear();
  }
  
  public void resetInput(){   
    levelInput.clear();
    
    for(int i = 0; i < levelInitialInput.size(); i++){
      levelInput.append(levelInitialInput.get(i));    
    }
  }
  
  public void resetFinalOutput(){
    finalLevelOutput.clear(); 
  }
  
  public void setStoredValue(int newValue){
    this.storedValue = newValue; 
  }
  
  public int getStoredValue(){
    return this.storedValue; 
  }
  
  public IntList getInput(){
    return this.levelInput;  
  }
  
  private void fail(String txt){
    println(txt);
  }
  
  private ArrayList<CodeBlock> getLevelCBs(){
    return this.codeBlocks; 
  }
  
  public void addCodeBlock(String blockType){
    if(blockType.toLowerCase().equals("input") || blockType.toLowerCase().equals("output")){
      CodeBlock cb = new CodeBlock(1280 + (openConditionals.size() * 15),40+(blocksAdded*45),150,35,blockType,16,color(32,32,32),0,0);
      if(openConditionals.size() > 0){
        openConditionals.get(openConditionals.size() - 1).addToCodeBlocks(cb);
      } else{
        codeBlocks.add(cb);     
      }    
      blocksAdded++;
    }
    
    loadLevel();
  }
  
  private void generateCodeBlocks(ArrayList<CodeBlock> cbArray){
    
    for(int i = 0; i < cbArray.size(); i++){
      cbArray.get(i).showCodeBlock(); 
      if(cbArray.get(i).getCBText().toLowerCase().equals("if") || cbArray.get(i).getCBText().toLowerCase().equals("loop")){
        cbArray.get(i).showCodeBlock();
        generateCodeBlocks(cbArray.get(i).getCodeBlocks());
      } 
    }
  }
    
  public void runFunction(ArrayList<CodeBlock> cbArray){
    for(int i = 0; i < cbArray.size(); i++){
      if(cbArray.get(i).getCBText().toLowerCase().equals("input")){
        if(levelInput.size() == 0){
          fail("You have failed! You can not input from an empty array! \n Please reset the level to try again!");
        } else{
           storedValue = levelInput.get(0);
           levelInput.remove(0);
        }
      } else if (cbArray.get(i).getCBText().toLowerCase().equals("output")){
        if(storedValue == 404){
          fail("You have failed! You do not have a value stored! \n Please reset the level to try again!"); 
        } else {
          finalLevelOutput.append(storedValue);
          storedValue = 404;
        }
      } else if (cbArray.get(i).getCBText().toLowerCase().equals("if")){
        if(storedValue == cbArray.get(i).getIfCondition()){
          runFunction(cbArray.get(i).getCodeBlocks());
        }
      } else if (cbArray.get(i).getCBText().toLowerCase().equals("loop")){
        for(int loopL = 0; loopL < cbArray.get(i).getLoopLength(); loopL++){
          runFunction(cbArray.get(i).getCodeBlocks());
        }
      }
    }
    
    loadLevel();
  }
}
