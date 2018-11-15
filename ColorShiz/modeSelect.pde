/**
* This class is used to select a hue
* from 0-255
* It is a verticle slider
*/



class modeSelect extends UIobject{
  /**
  * name of the Slider
  */
  private String name;
  
  /**
  * names of all the modes
  */
  private String[] modeNames;
  
  /**
  * x,y coordinate for the center
  * of the top button in the graphic
  */
  private int[] center;
  
  /**
  * returns which mode is selected
  */
  private float[] value = {0};
  
  /**
  * the size of the text
  */
  private int sizeText;
  
  /**
  * the height of the buttons
  */
  private int buttonHeight;
  
  /**
  * width of the buttons
  */
  private int buttonWidth;
  
  /**
  * Colors for the differnt parts of the buttons
  */
  private int outLine;
  private int buttonPressed;
  private int buttonHover;
  private int button; 
  
  private int modeSelected = 0;
  
  public modeSelect(String name, String modeNames[],int centerX, int centerY){
    center = new int[] {centerX, centerY};
    this.name = name;
    this.modeNames = new String[modeNames.length];
    for(int i = 0; i < modeNames.length; i++){
      this.modeNames[i] = modeNames[i];
    }
    sizeText = 25;
    outLine = #666666;
    buttonPressed = #444444;
    buttonHover = #555555;
    button = #aaaaaa;
    
    buttonHeight = 60;
    buttonWidth = 200;
  }
  
  /**
  * resets the center
  */
  void setCenter(int centerX,int centerY){
    center[0] = centerX;
    center[1] = centerY;
  }
  
  /**
  * sets the values of the object
  */
  void setValues(float values[]){
    value[0] = values[0];
  }
  
  void setValues(int values[]){
    value[0] = values[0];
  }
  
  void setValues(int values){
    value[0] = values;
  }
  
  void setValues(float values){
    value[0] = values;
  }
  
  /**
  * Draws the interactive part 
  * of the UI
  */
  void drawUI(){
    colorMode(RGB); 
    rectMode(CENTER);
    textMode(CENTER);
    strokeWeight(5);
    stroke(outLine);
    textSize(sizeText);
    
    //is in the x range of the buttons
    for(int i = 0; i < modeNames.length; i++){
      
      //check to see which button is being pressed
      if((mouseY < center[1] + (0.5*buttonHeight + i*buttonHeight))&& (mouseY > center[1] - 0.5*buttonHeight + i*buttonHeight)&&
         (mouseX < center[0] + 0.5*buttonWidth) && (mouseX > center[0] - 0.5*buttonWidth)){
           
        if(mousePressed){
          modeSelected = i;
          value[0] = i;
        }
        fill(buttonHover);
        rect(center[0], center[1] + i*buttonHeight, buttonWidth, buttonHeight);
        fill(#ffffff);
        text(modeNames[i], center[0], center[1] + i*buttonHeight);
      }
      else if(i == modeSelected){
        fill(buttonPressed);
        rect(center[0], center[1] + i*buttonHeight, buttonWidth, buttonHeight);
        fill(#ffffff);
        text(modeNames[i], center[0], center[1] + i*buttonHeight);
      }
      else{
        fill(button);
        rect(center[0], center[1] + i*buttonHeight, buttonWidth, buttonHeight);
        fill(0);
        text(modeNames[i], center[0], center[1] + i*buttonHeight);
      }
     
    }
  }
  
  /**
  * Returns the values stored
  * in the object
  */
  float[] getValues(){
    return value;
  }
  
  /**
  * Returns the center of the
  * UI graphic
  */ 
  int[] getCenter(){
    return center;
  }
  
  /**
  * Returns the name of the
  * UI graphic
  */
  String getN(){
    return name;
  }
  
  /**
  * Sets the primary color of the UI
  * graphic with the #ffffff format
  * where each ff, in the sequence is
  * a hexadecimal representing r, g, 
  * and b values repsectively. 
  */
  void setPrimeColor(int primeColor){
    buttonPressed = primeColor;
  }
  
  /**
  * Sets the primary color with R, B, and B values
  */
  void setPrimeColor(int r, int g, int b){
    buttonPressed = ((0xff000000 + r * 0x10000 + g * 0x100 + b) + 0xffffffff) + 1;
  }
  void setPrimeColor(float r, float g, float b){
    int R = (int) r;
    int G = (int) g;
    int B = (int) b;
    buttonPressed = ((0xff000000 + R * 0x10000 + G * 0x100 + B) + 0xffffffff) + 1;
  }
  
 
  
  /**
  * Sets the secondary color of the UI
  * graphic with the #ffffff format
  * where each ff, in the sequence is
  * a hexadecimal representing r, g, 
  * and b values repsectively. 
  */
  void setSecondColor(int secondColor){
    buttonHover = secondColor;
  }
  
  /**
  * Sets the secondary color with R, B, and B values
  */
  void setSecondColor(int r, int g, int b){
    buttonHover = ((0xff000000 + r * 0x10000 + g * 0x100 + b) + 0xffffffff) + 1;
  }
  void setSecondColor(float r, float g, float b){
    int R = (int) r;
    int G = (int) g;
    int B = (int) b;
    buttonHover = ((0xff000000 + R * 0x10000 + G * 0x100 + B) + 0xffffffff) + 1;
  }
  
}
