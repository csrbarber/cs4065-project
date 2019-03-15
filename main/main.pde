boolean zoom;
int zoomScale;
float zoomX, zoomY;
String text;

Button clearTextButton, numberButton, emojiButton;
Emoji emojiKeyboard;
Alphabet alphabetKeyboard;
NumberSymbol numberSymbolKeyboard;
Keyboard activeKeyboard;
OutputManager outputManager;

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
  outputManager = new OutputManager(10, 40, 460, 400, 25, 10, 40);
}

void draw() {
  if (zoom) {
    translate(zoomX, zoomY);
    scale(zoomScale);
  }
  
  background(209, 214, 218);
  // TODO Text scrolling & wrapping
  displayItems();
}

void mousePressed() {
  if (clearTextButton.overButton()) {
    // TODO outputManager.clearText();
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
  outputManager.display();
  clearTextButton.display();
  emojiButton.display();
  numberButton.display();
  activeKeyboard.display();
}

// Handle keyboard input
void handleTextInput() {
  if (activeKeyboard instanceof Alphabet) {
    // If alphabet keyboard simply handleInput
    outputManager.addTextOutput(activeKeyboard.handleInput(0, 0, 1));
  } else if (activeKeyboard instanceof NumberSymbol) {
    // If NumberSymbol keyboard handle zoom, then selection
    if (zoom) {
      // If already zoomed type selected key then switch keyboards
      outputManager.addTextOutput(activeKeyboard.handleInput(zoomX, zoomY, zoomScale));
      activeKeyboard = alphabetKeyboard;
      zoom = false;
    } else {
      zoom = true;
      zoomX = (width/2) - mouseX*2;
      zoomY = (height/2) - mouseY*2;
    }
  } else if (activeKeyboard instanceof Emoji) {
    // Need to modify handleInput - ret type doesn't work for emojis
    if (zoom) {
      // If already zoomed type selected key then switch keyboards
      outputManager.addEmojiOutput(activeKeyboard.handleClick(zoomX, zoomY, zoomScale));
      activeKeyboard = alphabetKeyboard;
      zoom = false;
    } else {
      zoom = true;
      zoomX = (width/2) - mouseX*2;
      zoomY = (height/2) - mouseY*2;
    }
  }
}
