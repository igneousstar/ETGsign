/**
* This class is used to select a hue
* from 0-255
* It is a verticle slider
*/



class vertSatSel extends UIobject{
  /**
  * name of the Slider
  */
  private String name;
  
  /**
  * where the sliding bar
  * of the slider is located
  */
  private int[] barPos;
  
  /**
  * x,y coordinate for the center
  * of the graphic
  */
  private int[] center;
  
  /**
  * the length of the slider
  * along with the height
  */
  private int sliderLength;
  private int sliderWidth;
  
  /**
  * lenght and height of the
  * bar that is dragged by
  * the user
  */
  private int dragBarLength;
  private int dragBarHeight = 10;
  
  /**
  * The max and min values
  * that the Slider can store
  */
  private int mapMin = 0;
  private int mapMax = 255;
  
  /**
  * value stored in the Slider
  */
  private float[] value = {0};
  
  /**
  * helps prevent issues with 
  * dragging the mouse. These
  * issues are often caused by
  * Moving the mouse faster than 
  * the frame rate can handle
  */
  private int prevFrame;
  private int currentFrame;
  
  /**
  * Pirme color is the color of the 
  * drag bar
  */
  private int primeColor;
  private int secondColor;
  
  public vertSatSel(String name, int centerX, int centerY, int sliderLength, int sliderWidth){
    center = new int[] {centerX, centerY};
    this.sliderLength = sliderLength;
    this.sliderWidth = sliderWidth;
    this.name = name;
    barPos = new int[] {centerX, centerY};
    dragBarLength = sliderWidth + 10;
    primeColor = 0;
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
    colorMode(HSB, 255); 
    for (float i = 0; i < sliderLength; i++) {
    for (float j = 0; j < sliderWidth; j++) {
      stroke(primeColor, map(i, 0, sliderLength, 0, 255), 255);
      point(j+center[0]-0.5*sliderWidth, i+center[1]-0.5*sliderLength);
  }
  
  rectMode(CENTER);
    
    int yMax = center[1] + sliderLength/2;
    int yMin = center[1] - sliderLength/2;
    
    //Sometimes the mouse is dragged faster than the
    //frames refresh. This makes it easier to drag to
    //max or min values
    currentFrame = mouseY;
    int mouseV = abs(prevFrame - currentFrame);
    prevFrame = mouseY;
    
    int yThresh = dragBarLength/2;
    
    prevFrame = mouseY;
    
    
    if(mousePressed == true){
      if(mouseY < yMax + mouseV && mouseY > yMin - mouseV){
           if(mouseX < barPos[0] + yThresh && mouseX > barPos[0] - yThresh){
              barPos[1] = mouseY;
          }
       }
      }
       
    if(barPos[1] > yMax){
      barPos[1] = yMax;
    }
    else if(barPos[1] < yMin){
      barPos[1] = yMin;
    }
    
    value[0] = map(barPos[1], yMin, yMax, mapMin, mapMax);
    
    stroke(0);
    strokeWeight(4);
    
    noFill();
    rect(barPos[0], barPos[1], dragBarLength, dragBarHeight);
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
  * Used to set the HUE in HSB Color mode
  */
  void setPrimeColor(int primeColor){
    this.primeColor = primeColor;
  }
  
  /**
  * Sets the primary color with R, B, and B values
  */
  void setPrimeColor(int r, int g, int b){
    
  }
  void setPrimeColor(float r, float g, float b){
    
  }
  
 
  
  /**
  * Sets the secondary color of the UI
  * graphic with the #ffffff format
  * where each ff, in the sequence is
  * a hexadecimal representing r, g, 
  * and b values repsectively. 
  */
  void setSecondColor(int secondColor){
    
  }
  
  /**
  * Sets the secondary color with R, B, and B values
  */
  void setSecondColor(int r, int g, int b){
    
  }
  void setSecondColor(float r, float g, float b){
    
  }
  
}
