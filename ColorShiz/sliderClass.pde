class Slider extends UIobject{
  
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
  private int sliderHeight = 6;
  
  /**
  * lenght and height of the
  * bar that is dragged by
  * the user
  */
  private int dragBarLength = 10;
  private int dragBarHeight = 50;
  
  /**
  * The max and min values
  * that the Slider can store
  */
  private int mapMin;
  private int mapMax;
  
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
  * designated colors of the
  * Slider graphic. primColor 
  * is the long horizontal bar, 
  * secondColor is the smaller
  * bar that is dragged by the
  * user. strokeColor is the 
  * outline color of the graphic. 
  */
  private int primeColor;
  private int secondColor;
  private int strokeColor;
  
  /**
  * text size is 15 by default
  */
  private int sizeText;
  
  /**
  * Creates a Slider object.
  * @param String name, name of Slider
  * @param int centerX, x coordinate
  * @param int centerY, y coordinate
  * @param int sliderLength, length of slider
  * @param int mapMin, min expected value
  * @param int mapMax, max expected value
  */
  public Slider(String name, int centerX, int centerY, int sliderLength, int mapMin, int mapMax){
    this.name = name;
    center = new int[] {centerX, centerY};
    barPos = new int[] {centerX, centerY};
    this.sliderLength = sliderLength;
    this.mapMin = mapMin;
    this.mapMax = mapMax;
    
    int xMax = center[0] + sliderLength/2;
    int xMin = center[0] - sliderLength/2;
    value[0] = map(barPos[0], xMin, xMax, mapMin, mapMax);
    prevFrame = mouseX;
    
    primeColor = #ffffff;
    secondColor = #ffffff;
    strokeColor = 0;
    sizeText = 15;
  }
  
  /**
  * Resets the Slider's height
  */
  public void setSliderHeight(int sliderHeight){
    this.sliderHeight = sliderHeight;
  }
  
  /**
  * Resets slider length
  */
  public void setSliderLength(int sliderLength){
    this.sliderLength = sliderLength;
  }
  
  /**
  * resets dragBarLength
  */
  public void setDragBarLength(int dragBarLength){
    this.dragBarLength = dragBarLength;
  }
  
  /**
  * resets dragBarHeight
  */
  public void setDragBarHeight( int dragBarHeight){
    this.dragBarHeight = dragBarHeight;
  }
  
  /**
  * draws the UI
  */
  public void drawUI(){
    strokeWeight(1);
    colorMode(RGB);
    
    rectMode(CENTER);
    
    int xMax = center[0] + sliderLength/2;
    int xMin = center[0] - sliderLength/2;
    
    //Sometimes the mouse is dragged faster than the
    //frames refresh. This makes it easier to drag to
    //max or min values
    currentFrame = mouseX;
    int mouseV = abs(prevFrame - currentFrame);
    prevFrame = mouseX;
    
    int yThresh = dragBarHeight/2;
    
    prevFrame = mouseX;
    
    
    if(mousePressed == true){
      if(mouseX < xMax + mouseV && mouseX > xMin - mouseV){
           if(mouseY < barPos[1] + yThresh && mouseY > barPos[1] - yThresh){
              barPos[0] = mouseX;
          }
        }
      }
       
    if(barPos[0] > xMax){
      barPos[0] = xMax;
    }
    else if(barPos[0] < xMin){
      barPos[0] = xMin;
    }
    
    value[0] = map(barPos[0], xMin, xMax, mapMin, mapMax);
    
    stroke(strokeColor);
    
    fill(primeColor);
    rect(center[0], center[1], sliderLength, sliderHeight);
    
    textAlign(CENTER);
    textSize(sizeText);
    text(name + ": " + String.format("%.2f", value[0]), center[0], center[1] - (dragBarHeight/2 + 15));
    
    fill(secondColor);
    rect(barPos[0], barPos[1], dragBarLength, dragBarHeight);
    
  }
  
  /**
  * returns stored values
  */
  public float[] getValues(){
    return value;
  }
  
  /**
  * resets stroke color
  */
  void setStroke(int strokeColor){
    this.strokeColor = strokeColor;
  }
  
  /**
  * returns the name of the Slider
  */
  public String getN(){
    return name;
  }
  
  /**
  * resets the center
  */
  public void setCenter(int centerX, int centerY){
    center = new int[] {centerX, centerY};
  }
  
  /**
  * returns the center
  */
  public int[] getCenter(){
    return center;
  }
  
  /**
  * resets the value stored by the Slider
  */
  public void setValues(float[] values){
    int xMax = center[0] + sliderLength/2;
    int xMin = center[0] - sliderLength/2;
    if(values[0] < mapMin){
      this.value[0] = mapMin;
    }
    else if(values[0] > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values[0];
    }
    barPos[0] = (int) map(values[0], xMin, xMax, mapMin, mapMax);
  }
  
  public void setValues(int values[]){
    int xMax = center[0] + sliderLength/2;
    int xMin = center[0] - sliderLength/2;
    if(values[0] < mapMin){
      this.value[0] = mapMin;
    }
    else if(value[0] > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values[0];
    }
    barPos[0] = (int) map(values[0], xMin, xMax, mapMin, mapMax);
  }
  
  public void setValues(int values){
    int xMax = center[0] + sliderLength/2;
    int xMin = center[0] - sliderLength/2;
    if(values < mapMin){
      this.value[0] = mapMin;
    }
    else if(values > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values;
    }
    barPos[0] = (int) map(values, xMin, xMax, mapMin, mapMax);
  }
  
  public void setValues(float values){
    int xMax = center[0] + sliderLength/2;
    int xMin = center[0] - sliderLength/2;
    if(values < mapMin){
      this.value[0] = mapMin;
    }
    else if(values > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values;
    }
    barPos[0] = (int) map(values, xMin, xMax, mapMin, mapMax);
  }
  
  //Set the second color
  public void setSecondColor(int secondColor){
    this.secondColor = secondColor;
  }
  
  //allows you to use fill(int) with the
  // #ffffff rgb format as a single variable
  // this can also be done by bit shifting
  public void setSecondColor(int r, int g, int b){
    secondColor = ((0xff000000 + r*0x10000 + g*0x100 + b) + 0xffffffff) + 1;
  }
  
  public void setSecondColor(float r, float g, float b){
    int R = (int) r;
    int G = (int) g;
    int B = (int) b;
    secondColor = ((0xff000000 + R * 0x10000 + G * 0x100 + B) + 0xffffffff) + 1;
  }
  
  public void setPrimeColor(int secondColor){
    this.primeColor = secondColor;
  }
  
  //allows you to use fill(int) with the
  // #ffffff rgb format as a single variable
  // this can also be done by bit shifting
  public void setPrimeColor(int r, int g, int b){
    primeColor = ((0xff000000 + r*0x10000 + g*0x100 + b) + 0xffffffff) + 1;
  }
  
  public void setPrimeColor(float r, float g, float b){
    int R = (int) r;
    int G = (int) g;
    int B = (int) b;
    primeColor = ((0xff000000 + R * 0x10000 + G * 0x100 + B) + 0xffffffff) + 1;
  }
  
  /**
  * resets the size of the text
  */ 
  public void setTextSize(int sizeText){
    this.sizeText = sizeText;
  }
}
