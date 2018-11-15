#include <FastLED.h>

//Change this to send more data
//to the computer
#define OUT_DATA_SIZE 10

//Change this to recieve
//more data from the computer
#define IN_DATA_SIZE 5

//Number of LED's being used 
#define NUM_LEDS 240

//Pin being used for data
#define DATA_PIN 6

//Variables used to send data
float outGoingData[OUT_DATA_SIZE];

//The data coming from the computer
volatile int inComingData[IN_DATA_SIZE];

// Define the array of leds
CRGB leds[NUM_LEDS];

//The hue, saturation and brightness of the LED's
volatile int h;
volatile int s;
volatile int b;

//mode the sign is set to
volatile int mode;

//timer for different events
unsigned long timer;

//timer for reading Serial data;
unsigned long dataTimer;

//keeps track of where the mode is in it's sequence
int modeCounter;
  
void setup() {
  //get rid of null values
  FastLED.addLeds<WS2812B, DATA_PIN, GRB>(leds, NUM_LEDS);
  for(int i = 0; i < OUT_DATA_SIZE; i++){
    outGoingData[i] = 0;
  }
  for(int i = 0; i < IN_DATA_SIZE; i++){
    inComingData[i] = 0;
  }
  Serial.begin(115200);
  delay(10);

  //start the timer and counter
  timer = millis();
  modeCounter = 0;
  
}

void loop() {

  /********************* read data and set variables ***********************/

  
    //readData();
    h = inComingData[0];
    s = inComingData[1];
    b = inComingData[2];
    mode = inComingData[3];

 
  
  /******************** select mode and write the LED's **********************/

  if(mode == 0){
    solidColor(); //One solid color
  }
  else if(mode == 1){
    breathing();  //One solid color breathing on and off
  }
  else if(mode == 2){
    wrap(); //   LED's walk in a circle
  }
  
  
  FastLED.show();
  
}

/**
 * Writes all the LEDS on solid color
 */
void solidColor(){
  for(int i = 0; i < NUM_LEDS; i++){
      leds[i].setHSV(h, s, b);
    }
}

/**
 * Fades LED's on and off slowly
 */
void breathing(){
  if((millis() - timer) > 10){
      
      timer = millis(); //reset the timer

      if(modeCounter > (b*2)){
          modeCounter = 0; //reset the mode counter
        }
        
      //bound the max brightness for the pulsing
      if(modeCounter <= b){
        for(int i = 0; i < NUM_LEDS; i++){
          leds[i].setHSV(h, s, modeCounter);
        }
        modeCounter += 1; //Increase the modeCounter
      }
      else{
        for(int i = 0; i < NUM_LEDS; i++){
          leds[i].setHSV(h, s, (b*2) - modeCounter);
        }
        modeCounter += 1; //increase the modeCounter
        
        
      }
    }
}

/**
 * sends data to the computer
 */
void sendData(){
  //start the string with the first value
  String outGoingString = "";
  for(int i = 0; i < OUT_DATA_SIZE; i++){
    outGoingString = outGoingString + outGoingData[i];
    outGoingString = outGoingString + ",";
  }
  Serial.println(outGoingString);
}

/**
 * read the incoming data
 * from the computer
 */

void serialEvent(){
  readData();
}

/**
 * 10 LED's travel in a circle
 */

void wrap(){
  if((millis() - timer) > 10){ //wait for the timer
      timer = millis(); //reset the timer

      if(modeCounter >= NUM_LEDS){
        modeCounter = 0; //reset modeCounter
      }
      
      for(int i = 0; i < NUM_LEDS; i++){
        leds[i] = 0; //clear the LED's
      }

      for(int i = 0; i < 10; i++){//set 10 LED's to walk
        leds[(modeCounter + i)%NUM_LEDS].setHSV(h, s, b); 
      }

      modeCounter += 1; //increade the modeCounter
    }
}
void readData(){  
     //find the starting point 
     //of the incoming string
     if (Serial.find("aa")) {
      for(int i = 0; i < IN_DATA_SIZE; i++){
        inComingData[i] = Serial.parseInt();
      }
     }
}
