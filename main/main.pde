String text;
Button clearTextButton;
Alphabet alphabetKeyboard;

void setup() {
  size(800, 800);
  background(240);
  text = "";
  clearTextButton = new Button(700, 0, 800, 100, "Clear");
  alphabetKeyboard = new Alphabet(0, 400, 800, 800);

}

void draw() {
  background(240);
  textSize(32);
  fill(0, 102, 153);
  text(text, 50, 50);
  clearTextButton.display();
  alphabetKeyboard.display();
}

void keyPressed() {
  text = text + key;
}

void mousePressed() {
  if (clearTextButton.overButton()) {
    text = ""; 
  }
  
  for (Key kkey : alphabetKeyboard.keys) {
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
        } else {
          text += kkey.value;
        }
      }
    }
  }
}
