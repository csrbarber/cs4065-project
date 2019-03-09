String text;
Button clearTextButton, numberButton;
Alphabet alphabetKeyboard;
Number numberKeyboard;
Keyboard activeKeyboard;

void setup() {
  size(800, 800);
  background(240);
  text = "";
  clearTextButton = new Button(700, 0, 800, 100, "Clear");
  alphabetKeyboard = new Alphabet(0, 300, 800, 700);
  numberKeyboard = new Number(0, 300, 800, 700);
  numberButton = new Button(50, 725, 150, 775, "0-9");
  activeKeyboard = alphabetKeyboard;
}

void draw() {
  background(240);
  textSize(32);
  fill(0, 102, 153);
  text(text, 50, 50);
  clearTextButton.display();
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
}
