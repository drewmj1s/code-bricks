LinkedList allLines = new LinkedList();
Color[] colorList = new Color[]{new Color(152,118,170), new Color(138,101,59), new Color(255,198,109), new Color(204, 120, 50),  new Color(204, 102, 51), new Color(106,135,89), new Color(104,151,187), new Color(169,183,198)};
int count = 1;
int startingx, startingy, endx, endy;
void setup() {
  background(0x2B2B2B);
  size(400, 400);
  int rand = ceil(random(30));
  startingx =35;
  startingy =35;
  endx= 65+ rand;
  endy= 35;
  allLines.addNode(new Line(startingx, startingy, endx, endy));
}
void draw() {
  strokeCap(PROJECT);
  strokeJoin(ROUND);
  noFill();
  stroke(255);
  square(20, 20, 360);
  strokeWeight(8);
  //if(key== BACKSPACE){
    //allLines.removeLastNode();
  //}
  if (keyPressed) {
    count++;
    delay(50);
  }
  
  if (count%(3)==0) {
    int rand = ceil(random(34));
    if(count%(ceil(random(5))+1)==1){
      startingx = endx+12;
      endx+= 32+rand;
      //line(startingx,startingy,endx,endy);
      allLines.addNode(new Line(startingx, startingy, endx, endy));
      count++;
    }
    else if(count%16==0){
      startingx=35;
      endx = 65 + rand;
      startingy += 12;
      endy += 12;
      //line(startingx,startingy,endx,endy);
      allLines.addNode(new Line(startingx, startingy, endx, endy));
      count=1;
    }
  }
  allLines.update();
}

class Line {
  Color strokeColor = colorList[ceil(random(colorList.length-1))];
  Line next;
  float x1, y1, x2, y2;
  Line(float initX, float initY, float finX, float finY) {
    x1 = initX;
    y1 = initY;
    x2 = finX;
    y2 = finY;
  }
  Line getNext() {
    return next;
  }
  void setNext(Line newNode) {
    next = newNode;
  }
}
class Color {
  int red, green, blue;
  Color(int r, int g, int b) {
    red = r;
    blue = b;
    green = g;
  }
  int getRed() {
    return red;
  }
  int getBlue() {
    return blue;
  }
  int getGreen() {
    return green;
  }
}

class LinkedList {
  Line head;
  int size = 0;
  LinkedList() {
    head = null;
  }
  void addNode(Line newLine) {
    if (head==null) {
      head = newLine;
    } else {
      size = 1;
      traverseToEnd(head).setNext(newLine);
    }
  }
  Line traverseToEnd(Line node) {
    if (node.getNext()==null) {
      return node;
    } else {
      size+=1;
      return traverseToEnd(node.getNext());
    }
  }
  void update() {
    updateHelper(head);
  }
  Line updateHelper(Line node) {
    if (node.getNext()==null) {
      return node;
    } else {
      Color sC = node.strokeColor;
      stroke(sC.getRed(), sC.getGreen(), sC.getBlue());
      line(node.x1, node.y1, node.x2, node.y2);
      return updateHelper(node.getNext());
    }
  }
  void removeLastNode(){
   Line temp = traverseToEnd(head);
   temp = null;
  }
}
