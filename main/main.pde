boolean zoom;
int zoomScale, startTime, zoomStartTime;
float zoomX, zoomY;
String text;

Button timeTextButton, numberButton, emojiButton;
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
  timeTextButton = new Button(350, 725, 450, 775, "Start");
  outputManager = new OutputManager(10, 40, 460, 400, 25, 35);
}

void draw() {
  if (zoom) {
    translate(zoomX, zoomY);
    scale(zoomScale);
  }
  
  background(209, 214, 218);
  displayItems();
}

void mousePressed() {
  if (timeTextButton.overButton()) {
    if (timeTextButton.text.equals("Start")) {
      startTime = millis();
      timeTextButton.text = "Finish";
    } else {
      timeTextButton.text = "Start";
      int sentenceTime = millis() - startTime;
      println("SENTENCE TIME: " + sentenceTime);
      println("SENTENCE: " + outputManager.getOutput());
    }
    outputManager.clearText();
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
  timeTextButton.display();
  emojiButton.display();
  numberButton.display();
  activeKeyboard.display();
}

// Handle keyboard input
void handleTextInput() {
  if (activeKeyboard instanceof Alphabet) {
    // If alphabet keyboard simply handleInput
    String input = activeKeyboard.handleInput(0, 0, 1);
    if (input.equals(Alphabet.ENTER)) {
      outputManager.newLine();
    } else {
      outputManager.addTextOutput(input);
    }
  } else {
    // Handle zoom-able keyboards (NumberSymbol & Emoji)
    if (zoom) {
      int zoomTime = millis() - zoomStartTime;
      // If already zoomed type selected key then switch keyboards
      if (activeKeyboard instanceof NumberSymbol) {
        String input = activeKeyboard.handleInput(zoomX, zoomY, zoomScale);
        if (!input.equals("")) {
          outputManager.addTextOutput(input);
          println("ZOOM TIME: " + zoomTime + " FOR CHARACTER: " + input);
        }
      } else {
        EmojiKey kkey = activeKeyboard.handleClick(zoomX, zoomY, zoomScale);
        if (kkey != null) {
          outputManager.addEmojiOutput(kkey.img, kkey.value);
          println("ZOOM TIME: " + zoomTime + " FOR EMOJI: " + kkey.value);
        }
      }
      activeKeyboard = alphabetKeyboard;
      zoom = false;
    } else {
      zoomStartTime = millis();
      // Set zoom in params
      zoom = true;
      zoomX = (width/2) - mouseX*2;
      zoomY = (height/2) - mouseY*2;
    }
  }
}
