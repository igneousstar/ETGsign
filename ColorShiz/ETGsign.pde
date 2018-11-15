
/**
* This class is used
* to draw the ETG sign
*/
class ETGsign{
  
  /**
  *The center location of the sign
  */
  private int center[];
  
  /**
  * The demenstion of the sign
  */
  private int signH;
  private int signW;
  
  /**
  * Mode the sign is in
  */
  private int mode;
  
  /**
  * Colors stored 
  * 0-255 is for hues
  * 0-255 for brightness
  * 0-255 saturation
  * set to white
  */
  private int[][] colorData;
  
  ETGsign(int centerX, int centerY, int signW, int signH){
    center = new int[] {centerX, centerY};
    this.signW = signW;
    this.signH = signH;
    colorData = new int[3][10];
    for(int i = 0; i < colorData.length; i++){
      for(int j = 0; j < colorData[0].length; j++){
        colorData[i][j] = 0;
      }
    }
  }
  
  void drawUI(){
    if(mode == 0){
      
    }
    else if(mode == 1){
      
    }
    else if(mode == 2){
      
    }
      
  }
  
  void setMode(int mode){
    this.mode = mode;
  }
  
  void setMode(float mode){
    this.mode = (int) mode;
  }
  
}
