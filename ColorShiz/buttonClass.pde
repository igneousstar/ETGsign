class Button extends UIobject{
  
  /**
  * Name of the button
  */
  private String name;
  
  /*
  * x,y coordinate of the
  * center of the graphic
  */
  private int center[];
  
  /**
  * Color of border
  */ 
  private int strokeColor;
  
  /**
  * primeColor is the middle
  * of the botton when not 
  * pressed and secondColor
  * is the outer color when
  * not pressed
  */
  private int primeColor;
  private int secondColor;
  
  /**
  * Variables to keep track of
  * button pressing. 
  */
  private boolean pressed;
  private boolean toggle;
  
  /**
  * size of the button
  */
  private static final int diameter = 50;
  
  /*
  * Creates a button object
  * @param String name is the name
  * @param xPos is x position of the center
  * @param yPos is y position of the center
  */ 
  Button(String name, int xPos, int yPos){
    this.name = name;
    center = new int[] {xPos, yPos};
    
    pressed = false;
    
    strokeColor = 0;
    primeColor = #ffffff;
    secondColor = 0;
  }
  
  /**
  * Draws the button
  */
  void drawUI(){
    colorMode(RGB);
    strokeWeight(1);
    
    ellipseMode(CENTER);
    
    textAlign(CENTER);
    textSize(12);
    
    fill(primeColor);
    text(name, center[0], center[1] - (diameter - 20));
    
    if(mousePressed && !toggle &&
       (sq(mouseX - center[0]) + sq(mouseY - center[1]) <= sq(diameter)/2)){
      pressed = !pressed;
      
    }
    
    if(pressed){
        stroke(strokeColor);
        
        fill(primeColor);
        ellipse(center[0], center[1], diameter, diameter);
        
        fill(secondColor);
        ellipse(center[0], center[1], diameter - 10, diameter - 10);
        text("OFF", center[0], center[1] + diameter - 10);
    }
    if(!pressed){
        stroke(strokeColor);
        
        fill(secondColor);
        ellipse(center[0], center[1], diameter, diameter);
        
        fill(primeColor);
        ellipse(center[0], center[1], diameter - 10, diameter - 10);
        text("ON", center[0], center[1] + diameter - 10);
    }
    toggle = mousePressed;
  }
  
  /**
  * returns value of the button
  */
  public float[] getValues(){
    if(pressed == false){
      return new float[] {1};
    }
    else{
      return new float[] {0};
    }
  }
  
  /** 
  * returns name of button
  */
  public String getN(){
    return name;
  }
  
  /**
  * resets the center of the button
  */ 
  public void setCenter(int centerX, int centerY){
    center = new int[] {centerX, centerY};
  }
  
  /**
  * returns center of the button
  */
  public int[] getCenter(){
    return center;
  }
  
  /**
  * resets the value of the button
  */
  public void setValues(float[] values){
    if(values[0] >= 1){
      pressed = true;
    }
    else if(values[0] <= 0){
      pressed = false;
    }    
  }
  
  public void setValues(int values[]){
    if(values[0] >= 1){
      pressed = true;
    }
    else if(values[0] <= 0){
      pressed = false;
    }    
  }
  
  public void setValues(int values){
    if(values >= 1){
      pressed = true;
    }
    else if(values <= 0){
      pressed = false;
    }    
  }
  
  public void setValues(float values){
    if(values >= 1){
      pressed = true;
    }
    else if(values <= 0){
      pressed = false;
    }    
  }
  
  /**
  * sets second color
  */
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
  
  public void setPrimeColor(int primeColor){
    this.primeColor = primeColor;
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
  
}
