String text;
Button clearTextButton;

void setup() {
  size(800, 800);
  background(240);
  text = "";
  clearTextButton = new Button(700, 0, 800, 100, "Clear");
}

void draw() {
  background(240);
  textSize(32);
  fill(0, 102, 153);
  text(text, 50, 50);
  clearTextButton.display();
}

void keyPressed() {
  text = text + key;
}

void mousePressed() {
  if (clearTextButton.overButton()) {
    text = ""; 
  }
}
