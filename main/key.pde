class Key {
  float startX, startY,  endX, endY;
  String value;
  boolean isCapital, isLandmark;

  Key(float startX, float startY, float endX, float endY, String value, boolean landmark) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.value = value;
    this.isLandmark = landmark;
    this.isCapital = false;
  }

  void display() {
    rectMode(CORNERS);
    stroke(0);
    if(isLandmark)
      fill(250);
    else
      fill(225);
    rect(startX, startY, endX, endY);
    textSize(25);
    fill(0);
    String val = value;
    if (isCapital) {
      val = val.toUpperCase();
    }
    float midY = startY + (endY - startY)/2;
    text(val, startX, midY); 
  }
  
  String printKey() {
    if (isCapital) {
      return value.toUpperCase();
    }
    return value;
  }
  
  boolean overKey(float xOffset, float yOffset, int zoomScale) {
   if (mouseX >= (startX*zoomScale) + xOffset && mouseX <= (endX*zoomScale) + xOffset
     && mouseY >= (startY*zoomScale) + yOffset && mouseY <= (endY*zoomScale) + yOffset) {
     return true;
   } else {
     return false;
   }
  } 
}
