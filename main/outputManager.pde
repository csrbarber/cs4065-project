class OutputManager {
  float startX, startY, endX, endY;
  ArrayList<Output> outputs;
  float xPos, yPos, xSpacing, ySpacing;
  
  // TODO Should be able to scroll, therefore no endY
  OutputManager(float startX, float startY, float endX, float endY, float xSpacing, float ySpacing) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.xSpacing = xSpacing;
    this.ySpacing = ySpacing;
    this.xPos = startX;
    this.yPos = startY;
    this.outputs = new ArrayList<Output>();
  }
  
  // Should make it so this (manager) assigns spacing (Half-done)
  // TODO Need var for ySpacing, and to deal with wrapping/overlap
  void addTextOutput(String text) {
    if (outputs.size() != 0 && outputs.size() % 18 == 0) {
      yPos += ySpacing;
      xPos = startX;
    }
    outputs.add(new TextOutput(xPos, yPos, text));
    xPos += xSpacing;
  }
  
  void addEmojiOutput(PImage img) {
    if (outputs.size() != 0 && outputs.size() % 18 == 0) {
      yPos += ySpacing;
      xPos = startX;
    }
    outputs.add(new EmojiOutput(xPos, yPos -25, img));
    xPos += xSpacing;
  }
  
  void display() {
    for (Output o : outputs) {
      o.display();
    }
  }
  
  void clearText() {
    outputs.clear();
    xPos = startX;
    yPos = startY;
  }
}
