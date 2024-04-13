class Level{
 
  private String levelInfo;
  private int levelNumber;
  private IntList levelInput;
  private IntList levelOutput;
  private int levelTimerLength;
  private StringList levelCodeBlocks;
  private int levelMinimumIfs;
  private int levelMinimumLoops;
  
  private boolean currentLevel = false;
  
  // Placed Code Block Array
  
  Level(String lInfo, int lNum, IntList lInput, IntList lOutput, int lTimer, StringList lCodeBlocks, int lMinIfs, int lMinLoops){
    levelInfo = lInfo;
    levelNumber = lNum;
    levelInput = lInput;
    levelOutput = lOutput;
    levelTimerLength = lTimer;
    levelCodeBlocks = lCodeBlocks;
    levelMinimumIfs = lMinIfs;
    levelMinimumLoops = lMinLoops;
  }
  
  public void loadLevel(){
    
  }
  
  public int getLevelNumber(){
    return this.levelNumber; 
  }
  
  public boolean getCurrentLevel(){
    return this.currentLevel; 
  }
  
  public void setCurrentLevel(boolean newValue){
    this.currentLevel = newValue; 
  }
}
