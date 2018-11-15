/*********************************************************
This set of functions is meant to be used in debugging and
they were also used in testing the code. Feel free to use them, 
however they may not be of much use. 
**********************************************************/

/**
* does a printout of all
* the serial data
*/
void printSerialData(){
  println("In Coming Data String");
  println(dataIn);
  if(serialData != null){
    String dataStr = "" + serialData[0];
    for(int i = 1; i < serialData.length; i++){
      dataStr = dataStr + "," + serialData[i];
    }
    println("In Coming Data Parsed: ");
    println(dataStr);
  }
  if(sentData != null){
    String dataStr = "" + sentData[0];
    String wrSerial = "aa" + ((int) sentData[0]);
    for(int i = 1; i < sentData.length; i++){
      dataStr = dataStr + ", " + sentData[i];
      wrSerial = wrSerial + "," + ((int)sentData[i]);
    }
    println("Out Going Data Floats: ");
    println(dataStr);
    println("What the Arduino sees: ");
    println(wrSerial);
    println();
    println();
    println();
  }
}

/**
* send new test data every 
* 2 seconds. The numbers
* generated should increment
* by 1 and start from a number
* less than 100
*/
void testSerialData(){
  if(millis() > timer + 2000){
    int sniper = millis();
    for(int i = 0; i < sentData.length; i++){
      sentData[i] = (sniper%100) + i;
    }
  }
}
