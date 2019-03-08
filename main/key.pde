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
    stroke(150);
    fill(100);
    rect(startX, startY, endX, endY);
    textSize(16);
    fill(0);
    String val = value;
    if (isCapital) {
      val = val.toUpperCase();
    }
    text(val, startX, endY); 
  }
  
  boolean overKey() {
   if (mouseX >= startX && mouseX <= endX && mouseY >= startY && mouseY <= endY) {
     return true;
   } else {
     return false;
   }
  } 
}
