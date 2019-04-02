class OutputManager {
  float startX, startY, endX, endY;
  ArrayList<Output> outputs;
  float xPos, yPos, xSpacing, ySpacing;
  
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
  
  void addTextOutput(String text) {
    if (!text.equals("")) {
      // Handle shift click
      if (outputs.size() != 0 && outputs.size() % 18 == 0) {
        yPos += ySpacing;
        xPos = startX;
      }
      outputs.add(new TextOutput(xPos, yPos, text));
      xPos += xSpacing;
    }      
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
  
  void newLine() {
    yPos += ySpacing;
    xPos = startX;
  }
  
  void clearText() {
    outputs.clear();
    xPos = startX;
    yPos = startY;
  }
}
