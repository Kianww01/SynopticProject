private String currentScreen; 
private StartMenu sm;
private LevelSelect ls;
private ArrayList<Level> levels;
private Level currentLevel;
private final char[] validInput = {'1','2','3','4','5','6','7','8','9'};

void setup(){
  size(1500,1000);
    
  loadLevels();
    
  currentScreen = "SM";
  sm = new StartMenu();
  ls = new LevelSelect();
}

// Needed for mousePressed
void draw(){

}

void mousePressed(){
  // Checks for clicks depending on current screen
  if(currentScreen == "SM"){
    sm.buttonClicked();
  }
  else if(currentScreen == "LS"){
    ls.buttonClicked();  
  } else if(currentScreen == "LVL"){
    currentLevel.buttonClicked();
  }
}

void keyPressed(){
  // array of accetable inputs
  // if array.contains(input) && currentLevel.awaitingInput == true then updateLevelIfInput
  for(char valid : validInput){
    if(valid == key){
      if(currentLevel.getAwaitingIfCondition() == true){
        currentLevel.generateIfBlock(int(key) - int('0'));
      } else if(currentLevel.getAwaitingLoopLength() == true){
        currentLevel.generateLoopBlock(int(key) - int('0')); 
      }
    }
  }
}

void loadLevels(){
  // Handles Level Loading on Loadup
  JSONObject levelsObj = loadJSONObject("levels.json");
  JSONArray levelsArray = levelsObj.getJSONArray("levels");
  levels = new ArrayList<Level>();
  
  // Loops through the array to find all levels
  for(int i = 0; i < levelsArray.size(); i++){
    // Stores the current level as an object
    JSONObject level = levelsArray.getJSONObject(i);
    // Stores the current level values
    String levelInfo = level.getString("levelInfo");
    
    JSONArray levelInput = level.getJSONArray("levelInput");
    IntList levelInputList = new IntList();
    
    for(int j = 0; j < levelInput.size(); j++){
      levelInputList.append(levelInput.getInt(j));
    }
    
    JSONArray levelOutput = level.getJSONArray("levelExpectedOutput");
    IntList levelOutputList = new IntList();
    
    for(int j = 0; j < levelOutput.size(); j++){
      levelOutputList.append(levelOutput.getInt(j)); 
    }
    
    String levelLockedString = level.getString("levelLocked");
    boolean levelLocked;
    
    if(levelLockedString.toLowerCase().equals("false")){
      levelLocked = false;
    } else{
      levelLocked = true;
    }
    
    JSONArray levelCodeBlocks = level.getJSONArray("availableCodeBlocks");
    StringList levelCodeBlocksList = new StringList();
    
    for(int j = 0; j < levelCodeBlocks.size(); j++){
      levelCodeBlocksList.append(levelCodeBlocks.getString(j)); 
    }
    
    int levelMinIfs = level.getInt("minimumIfsUsed");
    int levelMinLoops = level.getInt("minimumLoopsUsed");
    
    
    levels.add(new Level(levelInfo, i + 1,levelInputList, levelOutputList, levelCodeBlocksList, levelMinIfs, levelMinLoops, levelLocked));
  }
}

public void setCurrentScreen(String newValue){
  currentScreen = newValue;
}

public void setCurrentLevel(String newValue){
  for(int i = 0; i < levels.size(); i++){
    if(levels.get(i).levelNumber == int(newValue)){
      currentLevel = levels.get(i);
    }
  }
}

public StartMenu getSM(){
  return this.sm; 
}

public LevelSelect getLS(){
  return this.ls; 
}

public ArrayList<Level> getLevels(){
  return this.levels;
}

public Level getCurrentLevel(){
  return this.currentLevel; 
}
