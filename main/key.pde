class Key {
  float startX, startY,  endX, endY;
  String value;
  boolean isCapital;

  Key(float startX, float startY, float endX, float endY, String value) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.value = value;
    this.isCapital = false;
  }

  void display() {
    rectMode(CORNERS);
    stroke(0);
    fill(225);
    rect(startX, startY, endX, endY);
    textSize(20);
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
       print("mouseX: " + mouseX + "mouseY: " + mouseY + "\n");
     return true;
   } else {
     return false;
   }
  } 
}
