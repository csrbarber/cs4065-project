String text;
Button clearTextButton, numberButton;
Alphabet alphabetKeyboard;
NumberSymbol numberSymbolKeyboard;
Keyboard activeKeyboard;
boolean zoom;
int numZoom, zoomScale;
float zoomX, zoomY;

void setup() {
  size(800, 800);
  background(240);
  zoom = false;
  text = "";
  numZoom = 1;
  zoomScale = 2;
  clearTextButton = new Button(700, 0, 800, 100, "Clear");
  alphabetKeyboard = new Alphabet(0, 300, 800, 700);
  numberSymbolKeyboard = new NumberSymbol(0, 300, 800, 700);
  numberButton = new Button(50, 725, 150, 775, "0-9");
  activeKeyboard = alphabetKeyboard;
}

void draw() {
  if (zoom) {
    translate(width/2, height/2);
    scale(zoomScale);
    translate(zoomX, zoomY);
  }
  
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
    if (activeKeyboard instanceof NumberSymbol) {
      activeKeyboard = alphabetKeyboard;
    } else {
      activeKeyboard = numberSymbolKeyboard;
    }
  } else {
    // Handle input
    if (activeKeyboard instanceof NumberSymbol) {
      if (zoom) {
        // If already zoomed type selected key then switch keyboards
        text += activeKeyboard.handleInput();
        activeKeyboard = alphabetKeyboard;
        zoom = false;
      } else {
        zoom = true;
        zoomX = -mouseX;
        zoomY = -mouseY;
      }
    } else {
      // If alphabetKeyboard simply handleInput
      text += activeKeyboard.handleInput();
    }
  }
}

void mouseReleased() {
  //zoom = false;
}
