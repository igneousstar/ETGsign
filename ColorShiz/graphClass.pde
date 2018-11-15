import java.util.ArrayList;

class Graph extends UIobject{
  
  /**
  * primeColor is the color
  * of the Graph's border
  * secondColor is the color 
  * of the Graph's Text
  */
  private int primeColor;
  private int secondColor;
  
  /**
  * x, y coordinate of the 
  * center of the Graph
  */
  private int[] center;
  
  /**
  * name of the Graph
  */ 
  private String name;
  
  /**
  * Values stored in Graph
  */
  private float[] values;
  
  /**
  * hieght and width of graph
  * given in pixels
  */ 
  private int graphHieght;
  private int graphWidth;
  
  /**
  * rate in milliseconds in which the graph
  * updates the its values visually 
  */
  private static final int timeSpacing = 50;
  
  /**
  * timer for updating the Graph
  */
  long time;
  
  /**
  * Time span displayed on the graph
  * given in milliseconds. 
  */ 
  int maxTime;
  
  /**
  * Colors and names
  * of the lines
  */
  int[] lineColors;
  String[] lineNames;
  
  /**
  * line values recordered alongside
  * times they were recorded
  */
  float[][] lineValues;
  
  /**
  * Creates a graph that displays
  * all the float values[] in 
  * respect to time. 
  * @param name, the name of the graph
  * @param centerX, the x coordinate 
  * @param centerY, the y coordinate
  * @param lineNames[] all the names
  * of the values the graph is going
  * to keep track of. By adding more
  * names to the matrix, you add more 
  * lines.
  * @param maxTime, the amount of time
  * the graph keeps track of
  */
  Graph(String name, int centerX, int centerY, String[] lineNames, int maxTime){
    primeColor = 0;
    secondColor = #ffffff;
    time = millis();
    this.name = name;
    this.lineNames = lineNames;
    this.center = new int[] {centerX, centerY};
    
    //how often we are going to record data within the given time span
    this.maxTime = maxTime/timeSpacing;
    
    graphHieght = 200;
    graphWidth = 300;

    lineValues = new float[lineNames.length][maxTime];
    lineColors = new int[lineNames.length];
    values = new float[lineNames.length];
    for(int i = 0; i < lineNames.length; i++){
      lineColors[i] = secondColor;
      values[i] = 0;
      for(int j = 0; j < maxTime; j++){
        lineValues[i][j] = 0;
      }
    }
    
  }
  
  /**
  * draw the graph
  */
  void drawUI(){
    colorMode(RGB);
    
    //Set the new values every 50 milliseconds
    if(millis() > time + timeSpacing){
      time = millis();
      for(int i = 0; i < lineNames.length; i++){
        for(int j = 0; j < maxTime - 1; j++){
          lineValues[i][j] = lineValues[i][j+1];
        }
      }
      for(int i = 0; i < lineNames.length; i++){
        lineValues[i][maxTime-1] = values[i];
      }
    }
    textAlign(CENTER);
    textSize(18);
    fill(secondColor);
    text(name, center[0], center[1] - graphHieght/2 - 15);
    
    textAlign(LEFT);
    for(int i = 0; i < lineNames.length; i++){
      text(lineNames[i] + ": " + String.format("%.2f", values[i]), center[0] + graphWidth/2 + 5, center[1] - graphHieght/2 + 20*(i+1));
    }
    
    strokeWeight(4);
    stroke(primeColor);
    
    rectMode(CENTER);
    noFill();
    rect(center[0], center[1], graphWidth, graphHieght);
    
    //find max and min values to latter 
    //map them inside of the graph
    float maxHeight = lineValues[0][0];
    float minHeight = lineValues[0][0];
    for(int i = 0; i < lineNames.length; i++){
      for(int j = 0; j < maxTime; j++){
        if(maxHeight < lineValues[i][j]){
          maxHeight = lineValues[i][j];
        }
        if(minHeight > lineValues[i][j]){
          minHeight = lineValues[i][j];
        }
      }
    }
    
    //adds spacing prevents
    //return of NaN when mapped
    minHeight -= 3;
    maxHeight += 3;
    
    
    float xStart = center[0] - graphWidth/2;
    float xSpacing = (float)graphWidth/ (float) maxTime;
    float graphBottom = center[1] + graphHieght/2;
    float graphTop = center[1] - graphHieght/2;
    
    strokeWeight(1);
    
    for(int i = 0; i < lineNames.length; i++){
      for(int j = 0; j < maxTime - 1; j++){
        float yStart = map(lineValues[i][j], minHeight, maxHeight, graphBottom, graphTop);
        float yStop = map(lineValues[i][j+1], minHeight, maxHeight, graphBottom, graphTop);
        
        stroke(lineColors[i]);
        line(xStart+j*xSpacing, yStart, xStart+(j+1)*xSpacing, yStop);
        
      }
    }
    
    
  }
  
  
  public void setCenter(int centerX,int centerY){
    center = new int[] {centerX, centerY};
  }
  
  public void setValues(float values[]){
    try{
      for(int i = 0; i < values.length; i++){
        this.values[i] = values[i];
      }
    }
    catch(Exception e){
      println("graphClass setValues");
    }
  }
  
  public void setValues(int values[]){
    try{
      for(int i = 0; i < values.length; i++){
        this.values[i] = values[i];
      }
    }
    catch(Exception e){
      println("graphClass setValues");
    }
  }
  
  public void setValues(int values){
    this.values[0] = values;
  }
  
  public void setValues(float values){
    this.values[0] = values;
  }
  
  /**
  * return the stored values
  */
  public float[] getValues(){
    return values;
  }
  
  public int[] getCenter(){
    return center;
  }
  
  public String getN(){
    return name;
  }
  
  /**
  * Sets the colors of all the individual
  * lines in the Graph
  */
  public void setColors(int[] colors){
    if(colors.length == lineColors.length){
      for(int i = 0; i < lineColors.length; i++){
        lineColors[i] = colors[i];
      }
    }
  }
  
  /**
  * sets the graph's Hieght
  */
  public void setH(int graphHieght){
    this.graphHieght = graphHieght;
  }
  
  /**
  * sets the graphs width
  */
  public void setW(int graphWidth){
    this.graphWidth = graphWidth;
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
