String text;
Button clearTextButton, numberButton, zoomTestButton, emojiButton;
Alphabet alphabetKeyboard;
Number numberKeyboard;
// vaishu
Emoji emojiKeyboard;
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
  emojiKeyboard = new Emoji(0, 300, 800, 700);
  numberButton = new Button(50, 725, 150, 775, "0-9");
  emojiButton = new EmojiButton(150, 725, 250, 775, "smirking-face_1f60f.png");
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
  emojiButton.display();
  activeKeyboard.display();
}

void mousePressed() {
  if (clearTextButton.overButton()) {
    text = ""; 
  }
  
  //Handle button presses
  if (numberButton.overButton()) {
    activeKeyboard = numberKeyboard;
  } 
  else if (emojiButton.overButton()) {
    activeKeyboard = emojiKeyboard;
  } else {
    // Handle input
    String result = activeKeyboard.handleInput();
    if(result.substring(0, 2).equals("\\u"))
    {
      int hexVal = Integer.parseInt(result.substring(2), 16);
      text += (char)hexVal;
    }
    else
      text += activeKeyboard.handleInput();
    activeKeyboard = alphabetKeyboard;
  }
  
  zoom = true;
}

void mouseReleased() {
  zoom = false;
}
