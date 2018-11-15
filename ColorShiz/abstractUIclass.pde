/**
* UI objects for use
* primarily with 
* Arduinos
*/

abstract class UIobject{
  /**
  * sets the center of 
  * the UIobject
  */
  abstract void setCenter(int centerX,int centerY);
  
  /**
  * sets the values of the object
  */
  abstract void setValues(float values[]);
  
  abstract void setValues(int values[]);
  
  abstract void setValues(int values);
  
  abstract void setValues(float values);
  
  /**
  * Draws the interactive part 
  * of the UI
  */
  abstract void drawUI();
  
  /**
  * Returns the values stored
  * in the object
  */
  abstract float[] getValues();
  
  /**
  * Returns the center of the
  * UI graphic
  */ 
  abstract int[] getCenter();  
  
  /**
  * Returns the name of the
  * UI graphic
  */
  abstract String getN();
  
  /**
  * Sets the primary color of the UI
  * graphic with the #ffffff format
  * where each ff, in the sequence is
  * a hexadecimal representing r, g, 
  * and b values repsectively. 
  */
  abstract void setPrimeColor(int primeColor);
  
  /**
  * Sets the primary color with R, B, and B values
  */
  abstract void setPrimeColor(int r, int g, int b);
  abstract void setPrimeColor(float r, float g, float b);
  
 
  
  /**
  * Sets the secondary color of the UI
  * graphic with the #ffffff format
  * where each ff, in the sequence is
  * a hexadecimal representing r, g, 
  * and b values repsectively. 
  */
  abstract void setSecondColor(int secondColor);
  
  /**
  * Sets the secondary color with R, B, and B values
  */
  abstract void setSecondColor(int r, int g, int b);
  abstract void setSecondColor(float r, float g, float b);
}
