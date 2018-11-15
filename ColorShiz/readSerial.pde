/**
* Checks for incoming data
* then parses incoming data
*/

void readSerial() {
  if (myPort.available() > (dataSize - 1)) {
    dataIn = myPort.readStringUntil('\n');
  } 
  
  try{
    String[] split;
    split = dataIn.split(",");
    for(int i = 0; i < dataSize; i++){
      serialData[i] = parseInt(split[i]);
    }
  }
  catch(Exception e){println("something went wrong trying to read the serial data");}
}
