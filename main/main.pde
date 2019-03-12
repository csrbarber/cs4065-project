String text;
Button clearTextButton, numberButton, zoomTestButton;
Alphabet alphabetKeyboard;
Number numberKeyboard;
Keyboard activeKeyboard;
boolean zoom;

void setup() {
  size(800, 800);
  background(240);
  zoom = false;
  text = "";
  clearTextButton = new Button(700, 0, 800, 100, "Clear");
  zoomTestButton = new Button(600, 0, 700, 100, "Zoom");
  alphabetKeyboard = new Alphabet(0, 300, 800, 700);
  numberKeyboard = new Number(0, 300, 800, 700);
  numberButton = new Button(50, 725, 150, 775, "0-9");
  activeKeyboard = alphabetKeyboard;
}

void draw() {
  if (zoom) {
    translate(width/2, height/2);
    scale(2);
    translate(-mouseX, -mouseY);
  }
  background(240);
  textSize(32);
  fill(0, 102, 153);
  text(text, 50, 50);
  clearTextButton.display();
  zoomTestButton.display();
  numberButton.display();  
  activeKeyboard.display();
}

void mousePressed() {
  if (clearTextButton.overButton()) {
    text = ""; 
  }
  
  //Handle button presses
  if (numberButton.overButton()) {
    activeKeyboard = numberKeyboard;
  } else {
    // Handle input
    text += activeKeyboard.handleInput();
    activeKeyboard = alphabetKeyboard;
  }
  
  zoom = true;
}

void mouseReleased() {
  zoom = false;
}
