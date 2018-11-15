class Gauge extends UIobject{
  
  /**
  * x,y coordinate of center
  * of graphic
  */
  private int[] center;
  
  /**
  * name of Gauge
  */
  private String name;
  
  /**
  * value stored by Gauge
  */
  private float[] value = {0};
  
  /**
  * Max and min values 
  * the Gauge is expecting 
  * to record
  */
  private int mapMax;
  private int mapMin;
  
  /**
  * The primeColor of the gauge
  * is the background. The 
  * secondColor is the color of 
  * the bar that moves when values
  * are changing. 
  */
  private int secondColor;
  private int primeColor;
  
  /**
  * The size of the Gauge
  */
  private static final int diameter = 150;
  
  /**
  * Constructs a Gauge object by giving:
  * @param name, the name of the Gauge
  * @param centerX, the x coordinate of 
  * the center
  * @param mapMin, the smalles value expected
  * to be recieved
  * @param, mapMax, the max value expected 
  * to be recieved
  */
  Gauge(String name, int centerX, int centerY, int mapMin, int mapMax){
    this.name = name;
    this.mapMax = mapMax;
    this.mapMin = mapMin;
    this.center = new int[] {centerX, centerY};
    secondColor = #ffffff;
    primeColor = 0;
    value[0] = (mapMax + mapMin)/2;
  }
  
  /**
  * resets the center of the Gauge
  */ 
  public void setCenter(int centerX,int centerY){
    center = new int[] {centerX, centerY};
  }
  
  /**
  * Returns the value of the Gauge
  */ 
  public void setValues(float[] values){
    if(values[0] < mapMin){
      this.value[0] = mapMin;
    }
    else if(values[0] > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values[0];
    }
  }
  
  public void setValues(int values[]){
    if(values[0] < mapMin){
      this.value[0] = mapMin;
    }
    else if(values[0] > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values[0];
    }
  }
  
  public void setValues(int values){
    if(values < mapMin){
      this.value[0] = mapMin;
    }
    else if(values > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values;
    }
  }
  
  public void setValues(float values){
    if(values < mapMin){
      this.value[0] = mapMin;
    }
    else if(values > mapMax){
      this.value[0] = mapMax;
    }
    else{
      this.value[0] = values;
    }
  }
  
  /**
  * Draws the Gauge
  */
  public void drawUI(){
    colorMode(RGB);
    strokeWeight(10);
    stroke(primeColor);
    noFill();
    arc(center[0], center[1], diameter, diameter, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI);
    
    stroke(secondColor);
    float stop = map(value[0], mapMin, mapMax, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI);
    arc(center[0], center[1], diameter, diameter, HALF_PI+QUARTER_PI, stop);
    
    fill(secondColor);
    textAlign(CENTER);
    textSize(12);
    
    text(name + ": " + String.format("%.2f", value[0]), center[0], center[1]);
  }
  
  /**
  * returns values stored by the Gauge
  */
  public float[] getValues(){
    return value;
  }
  
  /**
  * returns the center
  */
  public int[] getCenter(){
    return center;
  }
  
  /**
  * Returns name
  */
  public String getN(){
    return name;
  }
  
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
