abstract class Output {
  float startX, startY;
  
  Output(float startX, float startY) {
    this.startX = startX;
    this.startY = startY;
  }
  
  abstract void display();
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
}

class EmojiOutput extends Output {
  PImage img;
  
  EmojiOutput(float startX, float startY, PImage img) {
    super(startX, startY);
    this.img = img;
  }
  
  void display() {
    // determine c & d params on image (so the image isn't full size)
    if(img != null)
      image(img, startX, startY, 20, 20);
  }
}
