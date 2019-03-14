boolean zoom;
int zoomScale;
float zoomX, zoomY;
String text;

Button clearTextButton, numberButton, emojiButton;
Emoji emojiKeyboard;
Alphabet alphabetKeyboard;
NumberSymbol numberSymbolKeyboard;
Keyboard activeKeyboard;

void setup() {
  // Dimensions of test Android phone (Samsung J1)
  size(480, 800);
  background(209, 214, 218);
  zoom = false;
  text = "";
  zoomScale = 2;
  
  // Initialize keyboards
  alphabetKeyboard = new Alphabet(0, 300, 480, 700);
  numberSymbolKeyboard = new NumberSymbol(0, 300, 480, 700);
  emojiKeyboard = new Emoji(0, 300, 480, 700);
  activeKeyboard = alphabetKeyboard;
  
  // Initialize buttons
  numberButton = new Button(50, 725, 150, 775, "0-9");
  emojiButton = new EmojiButton(150, 725, 250, 775, "smirking-face_1f60f.png");
  clearTextButton = new Button(350, 725, 450, 775, "Clear");
}

void draw() {
  if (zoom) {
    translate(zoomX, zoomY);
    scale(zoomScale);
  }
  
  background(209, 214, 218);
  // TODO Text scrolling & wrapping
  textSize(32);
  fill(0);
  text(text, 10, 40);
  displayItems();
}

void mousePressed() {
  if (clearTextButton.overButton()) {
    text = ""; 
  } else if (numberButton.overButton()) {
    if (activeKeyboard instanceof NumberSymbol) {
      activeKeyboard = alphabetKeyboard;
    } else {
      activeKeyboard = numberSymbolKeyboard;
    }
  } else if (emojiButton.overButton()) {
    if (activeKeyboard instanceof Emoji) {
      activeKeyboard = alphabetKeyboard;
    } else {
      activeKeyboard = emojiKeyboard;
    }
  } else {
    handleTextInput();
  }
}

// Update displayed items in draw
void displayItems() {
  clearTextButton.display();
  emojiButton.display();
  numberButton.display();
  activeKeyboard.display();
}

// Handle keyboard input
void handleTextInput() {
  if (activeKeyboard instanceof Alphabet) {
    // If alphabet keyboard simply handleInput
    text += activeKeyboard.handleInput(0, 0, 1);
  } else if (activeKeyboard instanceof NumberSymbol) {
    // If NumberSymbol keyboard handle zoom, then selection
    if (zoom) {
      // If already zoomed type selected key then switch keyboards
      text += activeKeyboard.handleInput(zoomX, zoomY, zoomScale);
      activeKeyboard = alphabetKeyboard;
      zoom = false;
    } else {
      zoom = true;
      zoomX = (width/2) - mouseX*2;
      zoomY = (height/2) - mouseY*2;
    }
  } else if (activeKeyboard instanceof Emoji) {
    String result = activeKeyboard.handleInput(0, 0, 0);
    int hexVal = Integer.parseInt(result.substring(2), 16);
    text += (char)hexVal;
    activeKeyboard = alphabetKeyboard;
  }
}
