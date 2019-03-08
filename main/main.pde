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
  
  // TODO Get out of numberKeyboard after a selection
  if (numberButton.overButton()) {
    activeKeyboard = numberKeyboard;
  }
  
  for (Key kkey : activeKeyboard.getKeys()) {
    if (kkey.overKey()) {
      if (kkey.value == "Enter") {
        text += "\n";
      } else if (kkey.value == "Space") {
        text += " ";
      } else if (kkey.value == "Shift") {
        if (alphabetKeyboard.isCapital) {
          alphabetKeyboard.isCapital = false;
        } else {
          alphabetKeyboard.isCapital = true;
        }
      } else {
        // TODO should just change the value on the key so we don't have to do this check
        if (alphabetKeyboard.isCapital) {
          text += kkey.value.toUpperCase();
          alphabetKeyboard.isCapital = false;
        } else {
          text += kkey.value;
        }
      }
    }
  }
}
