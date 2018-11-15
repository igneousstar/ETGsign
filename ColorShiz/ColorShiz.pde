import processing.serial.*;

/**
* The com port the arduino is on
*/

Serial myPort;

/**
* the incoming String from 
* the Arduino
*/
String dataIn;

/**
* The size of the incoming serial data
* this is what you need to change
* if you modify the amount of data
* being read from the Arduino. 
*/
static final int dataSize = 10;

/**
* The incomeing serial data
*/
float[] serialData;

/**
* The amount of data being sent
* modify to send more to the Arduino
*/
static final int sentDataSize = 5;

/**
*
*/
float[] sentData;

/**
* A timer for different actions
*/

long timer;

/**
* This is the data that
* is going to be sent to 
* the Arduino :)
*/
String str;

/**
* Stuff for the GUI
*/
vertColorSel vert;
vertBrightSel vert1;
vertSatSel vert2;

Slider slider;
modeSelect mode;

int dataChange;
void setup(){
  size(1400, 700);
  //start the incoming data array
  serialData = new float[dataSize];
  
  //start the outgoing data array
  sentData = new float[sentDataSize];
  //get rid of all the null pointers
  //in the arrays
  for(int i = 0; i < dataSize; i++){
    serialData[i] = 0;
  }
  
  for(int i = 0; i < sentDataSize; i++){
    sentData[i] = 0;
  }
  int maxL = 400;
  int maxWidth = 30;
  int centerY = height/2;
  vert = new vertColorSel("hey", 1000, centerY, maxL, maxWidth);
  vert1 = new vertBrightSel("hey", 1200, centerY, maxL, maxWidth);
  vert2 = new vertSatSel("hey", 1100, centerY, maxL, maxWidth);
  //slider = new Slider("LED COUNT", width/2, height*4/5, 150, 0, 100);
  //slider.setDragBarHeight(20);
  
  //set all of the values
  String string[] = {"Solid Color", "Breath", "Rotate", "Mode 4"};
  mode = new modeSelect("Modes",string, 200, 250);
  
  
  sentData[0] = vert.getValues()[0];
  sentData[1] = vert2.getValues()[0];
  sentData[2] = vert1.getValues()[0];
  sentData[3] = mode.getValues()[0];
  
  dataChange = 0;
  
  timer = -3000;
  
}
void draw(){
  
  
/****************** select the serial port ****************/
  if(myPort == null){
    selectCom();
  }
  
  
  
  else{

/******************* redo the background ******************/

    colorMode(RGB);
    background(#aaaaaa);
    
/******************* update the colors on the sliders ********************/

    vert1.setPrimeColor((int) vert.getValues()[0]);
    vert1.setSecondColor((int) vert2.getValues()[0]);
    
    vert2.setPrimeColor((int) vert.getValues()[0]);
    
/********************* draw the user interface *******************/

    vert.drawUI();
    vert1.drawUI();
    vert2.drawUI();
    mode.drawUI();


/******************* update serial data values **************/

   sentData[0] = vert.getValues()[0];
   sentData[1] = vert2.getValues()[0];
   sentData[2] = vert1.getValues()[0];
   sentData[3] = mode.getValues()[0];
   sentData[4] = 0;
   
/**************** write the data *****************/ 
  if(mousePressed){
     writeSerial();
     printSerialData();
   }
   

  }
  

}
