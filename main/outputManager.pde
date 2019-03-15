class OutputManager {
  float startX, startY, endX, endY;
  ArrayList<Output> outputs;
  float xPos, yPos, spacing;
  
  // TODO Should be able to scroll, therefore no endY
  // No need for both xPos/yPos and startX/startY
  OutputManager(float startX, float startY, float endX, float endY, float spacing, float xPos, float yPos) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.spacing = spacing;
    this.xPos = xPos;
    this.yPos = yPos;
    this.outputs = new ArrayList<Output>();
  }
  
  // Should make it so this (manager) assigns spacing (Half-done)
  // TODO Need var for ySpacing, and to deal with wrapping/overlap
  void addTextOutput(String text) {
    outputs.add(new TextOutput(xPos, yPos, text));
    xPos += spacing;
  }
  
  void addEmojiOutput(PImage img) {
    outputs.add(new EmojiOutput(xPos, yPos, img));
    xPos += spacing;
  }
  
  void display() {
    for (Output o : outputs) {
      o.display();
    }
  }
}
