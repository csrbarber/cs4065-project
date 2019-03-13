class Button {
  float startX, startY,  endX, endY;
  String text;

  Button(float startX, float startY, float endX, float endY, String text) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.text = text;
  }

  void display() {
    rectMode(CORNERS);
    stroke(150);
    fill(100);
    rect(startX, startY, endX, endY);
    textSize(32);
    fill(0);
    float midY = startY + (endY - startY)/2;
    text(text, startX, midY); 
  }
  
  boolean overButton() {
   if (mouseX >= startX && mouseX <= endX && mouseY >= startY && mouseY <= endY) {
     return true;
   } else {
     return false;
   }
  } 
}
