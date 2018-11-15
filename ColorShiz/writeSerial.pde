/**
* Writes the serial data 
* to the Arduino
*/ 

void writeSerial(){
    String wrSerial = "aa";
    for(int i = 0; i < sentDataSize; i++){
      //The arduino is only ready to handle int variables
      //This can be changed in the the Arduino code, 
      //but for now stick to int variables
      wrSerial = wrSerial + "," + ((int) sentData[i]);
    }
    wrSerial = wrSerial + ",";
    myPort.write(wrSerial);
}
