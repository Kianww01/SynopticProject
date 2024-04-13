String currentScreen; 
StartMenu sm;
LevelSelect ls;
ArrayList<Level> levels;

void setup(){
  size(1400, 800);
    
  loadLevels();
    
  currentScreen = "SM";
  sm = new StartMenu();
  ls = new LevelSelect(levels);
}

void draw(){

}

void mousePressed(){
  // Checks for clicks depending on current screen
  if(currentScreen == "SM"){
    sm.buttonClicked();
  }
  else if(currentScreen == "LS"){
    ls.buttonClicked();  
  }
}

void loadLevels(){
  // Handles Level Loading on Loadup
  JSONObject levelsObj = loadJSONObject("paginationTest.json");
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
    
    int levelTimerLength = level.getInt("timerLength");
    
    JSONArray levelCodeBlocks = level.getJSONArray("availableCodeBlocks");
    StringList levelCodeBlocksList = new StringList();
    
    for(int j = 0; j < levelCodeBlocks.size(); j++){
      levelCodeBlocksList.append(levelCodeBlocks.getString(j)); 
    }
    
    int levelMinIfs = level.getInt("minimumIfsUsed");
    int levelMinLoops = level.getInt("minimumLoopsUsed");
    
    
    levels.add(new Level(levelInfo, i + 1,levelInputList, levelOutputList, levelTimerLength, levelCodeBlocksList, levelMinIfs, levelMinLoops));
  }
}
