String text;
Button clearTextButton, numberButton;
Alphabet alphabetKeyboard;
NumberSymbol numberSymbolKeyboard;
Keyboard activeKeyboard;
boolean zoom;
int numZoom, zoomScale;
float zoomX, zoomY;
float xoff, yoff;

void setup() {
  // Dimensions of test Android phone
  size(480, 800);
  background(209, 214, 218);
  zoom = false;
  text = "";
  numZoom = 1;
  zoomScale = 2;
  alphabetKeyboard = new Alphabet(0, 300, 480, 700);
  numberSymbolKeyboard = new NumberSymbol(0, 300, 480, 700);
  numberButton = new Button(50, 725, 150, 775, "0-9");
  clearTextButton = new Button(350, 725, 450, 775, "Clear");
  activeKeyboard = alphabetKeyboard;
}

void draw() {
  if (zoom) {
    translate(zoomX, zoomY);
    scale(zoomScale);
  }
  
  background(209, 214, 218);
  textSize(32);
  fill(0);
  // TODO Text scrolling & wrapping
  text(text, 10, 40);
  clearTextButton.display();
  numberButton.display();
  activeKeyboard.display(); //<>//
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
        text += activeKeyboard.handleInput(zoomX, zoomY, zoomScale);
        activeKeyboard = alphabetKeyboard;
        zoom = false;
      } else {
        zoom = true;
        zoomX = (width/2) - mouseX*2;
        zoomY = (height/2) - mouseY*2;
      }
    } else {
      // If alphabetKeyboard simply handleInput
      text += activeKeyboard.handleInput(0, 0, 1);
    }
  }
}
