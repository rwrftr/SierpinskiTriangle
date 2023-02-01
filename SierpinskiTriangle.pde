int x1 = 260;
int y1 = 1204;
int l = 1000;
int s = 100;
int speed = 2;
int mouseX1;
int size1 = 100;
boolean left, right, up, down = false;
boolean mousePoll = true;
public void setup()
{
  size(1500, 1500);
  background(255);
  textSize(60);
}
public void draw()
{
  if (mousePoll) {
    mouseX1 = mouseX;
  }
  keyProcessing();
  sierpinski(x1, y1, 1000, size1);
  infoSquare();
}

public void sierpinski(int x, int y, int len, int size) 
{
  if (len <= size) {
    triangle(x, y, x+len, y, x+(len/2), y-len);
  } else {
    sierpinski(x, y, len/2, size);
    sierpinski((x + len/2), y, len/2, size);
    sierpinski(x+len/4, y-len/2, len/2, size);
  }
}

public void infoSquare()
{
  stroke(0);
  strokeWeight(6);
  fill(193);
  rect(20, 20, 350, 500, 50);
  fill(0);
  text("X: " + x1, 45, 100);
  text("Y: " + y1, 45, 200);
  text("Speed: " + speed, 45, 300);
  text("Size: " + size1, 45, 400);
  fill(255);
  strokeWeight(1);
}

public void mousePressed() {
  mousePoll = false;
}

public void mouseReleased() {
  mousePoll = true;
}

public void mouseDragged() {
  if (mouseX > mouseX1) {
    if (size1 > 10) {
      size1-= 10;
    }
  } else {
    if (size1 < 1000) {
      size1+= 10;
    }
  }
}

public void keyPressed() {
  if (key == 'a') {
    left = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == 'w') {
    up = true;
  }
  if (key == 's') {
    down = true;
  }
  if (keyCode == SHIFT) {
    speed++;
  }
  if (keyCode == CONTROL) {
    speed--;
  }
  if (key == ' ') {
    background(255);
  }
}

public void keyReleased() {
  if (key == 'a') {
    left = false;
  }
  if (key == 'd') {
    right = false;
  }
  if (key == 'w') {
    up = false;
  }
  if (key == 's') {
    down = false;
  }
}



public void keyProcessing() {
  if (left) {
    x1 -= speed;
  }
  if (right) {
    x1 += speed;
  }
  if (up) {
    y1 -= speed;
  }
  if (down) {
    y1 += speed;
  }
}
