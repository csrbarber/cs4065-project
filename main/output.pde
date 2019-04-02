abstract class Output {
  float startX, startY;
  
  Output(float startX, float startY) {
    this.startX = startX;
    this.startY = startY;
  }
  
  abstract void display();
  abstract String getText();
}

class TextOutput extends Output {
  String text;
  
  TextOutput(float startX, float startY, String text) {
    super(startX, startY);
    this.text = text;
  }
  
  void display() {
    textSize(32);
    fill(0);
    text(text, startX, startY);
  }
  
  String getText() {
    return text;
  }
}

class EmojiOutput extends Output {
  PImage img;
  String fileName;
  
  EmojiOutput(float startX, float startY, PImage img, String fileName) {
    super(startX, startY);
    this.img = img;
    this.fileName = fileName;
  }
  
  void display() {
    image(img, startX, startY, 20, 20);
  }
  
  String getText() {
    return fileName;
  }
}
