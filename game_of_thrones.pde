int numrows = 47;
String gotdata[][];
String gotnames[];
Character characters[];
float canvasw = 1000;
float canvash = 700;
float startx = 100;
float starty = 100;
float cellw = 12;
float cellh = 12;
color e5 = color(255,20,20);
color e4 = color(255,20,20,120);
color e3 = color(255,20,20,100);
color e2 = color(255,20,20,80);
color e1 = color(255,20,20,60);
color self = color(255);
color neut = color(238);
color f5 = color(20,20,255);
color f4 = color(20,20,255,120);
color f3 = color(20,20,255,100);
color f2 = color(20,20,255,80);
color f1 = color(20,20,255,60);
color highlighted = color(10,100,40,30);
color arryn = color(62,101,205);
color stark = color(105,107,109,150);
color baratheon = color(170,103,89);
color nw = color(0,100,200,100);
color greyjoy = color(157,117,158);
color lannister = color(237,202,83);
color tyrell = color(234,159,59);
color targaryen = color(240,91,100);
int charnum = 0;
String currentdata[][];

void setup() {
  size(1000, 700);
  background(255);
  textFont("Helvetica-Bold", 20);
  fill(0);
  textAlign(CENTER);
  text("Friends and Enemies in:", 830, 100);
  textFont("Helvetica-Bold", 36);
  text("A Game of Thrones", 830, 150);
  textFont("Helvetica", 12);
  text("This graphic represents a snapshot of relationships between" +
  "\n" + " characters on HBO's 'A Game of Thrones', at the end of the" +
  "\n"+ " second season. Relationships range from:", 830, 200);
  
  textFont("Helvetica", 14);
  text("Click on a character's name to re-sort the graphic", 830, 290);
  float colx = 760;
  float coly = 250;
  textFont("Helvetica", 12);
  text("Bitter Enemies", colx-42, coly+cellh/1.4);
  text("Faithful Allies", colx+172, coly+cellh/1.4);
  noStroke();
  fill(e5);
  rect(colx, coly, cellw, cellh);
  fill(e4);
  rect(colx+cellw, coly, cellw, cellh);
  fill(e3);
  rect(colx+cellw*2, coly, cellw, cellh);
  fill(e2);
  rect(colx+cellw*3, coly, cellw, cellh);
  fill(e1);
  rect(colx+cellw*4, coly, cellw, cellh);
  fill(neut);
  rect(colx+cellw*5, coly, cellw, cellh);
  fill(f1);
  rect(colx+cellw*6, coly, cellw, cellh);
  fill(f2);
  rect(colx+cellw*7, coly, cellw, cellh);
  fill(f3);
  rect(colx+cellw*8, coly, cellw, cellh);
  fill(f4);
  rect(colx+cellw*9, coly, cellw, cellh);
  fill(f5);
  rect(colx+cellw*10, coly, cellw, cellh);
  
  stroke(0);
  strokeWeight(.2);
  fill(255);
  float boxx = startx+(numrows+2)*cellw;
  float boxy = 330;
  rect(boxx, boxy, canvasw-startx-((numrows+5)*cellw), 190);
  fill(0);
  textFont("Helvetica", 16);
  text("The Houses", boxx+130, boxy+20);
  line(boxx, boxy+30, boxx+275, boxy+30);

  
  fill(arryn);
  rect(boxx+10, boxy+40, 15, 15);
  fill(baratheon);
  rect(boxx+10, boxy+70, 15,15);
  fill(greyjoy);
  rect(boxx+10, boxy+100, 15, 15);
  fill(tyrell);
  rect(boxx+10, boxy+130, 15,15);
  fill(0);
  rect(boxx+10, boxy+160, 15,15);
  
  fill(stark);
  rect(boxx+140, boxy+40, 15,15);
  fill(nw);
  rect(boxx+140, boxy+70, 15,15);
  fill(lannister);
  rect(boxx+140, boxy+100, 15,15);
  fill(targaryen);
  rect(boxx+140, boxy+130, 15,15);
  textAlign(LEFT);
  textFont("Helvetica", 12);
  fill(0);
  text("House Arryn", boxx+30, boxy+52);
  text("House Stark", boxx+160, boxy+52);
  text("House Baratheon", boxx+30, boxy+82);
  text("The Night's Watch", boxx+160, boxy+82);
  text("House Greyjoy", boxx+30, boxy+112);
  text("House Lannister", boxx+160, boxy+112);
  text("House Tyrell", boxx+30, boxy+142);
  text("House Targaryen", boxx+160, boxy+142);
  text("No House", boxx+30, boxy+172);
  
  textFont("Helvetica", 8);
  text("Concept and data creation by Loranne Nasir. Programming and Design by Ben Chartoff.", canvasw - 300, canvash-10);
  
  gotdata = readData();
  adjustData();
  readCharacters();
  gotnames = new String[numrows-1];
  for (int i = 3; i < numrows+2; i++) {
    gotnames[i-3] = gotdata[0][i];
    //print(names[i-3] + " " + (i-3) + "\n");
  }
  
  currentdata = createCharacterData(charnum);
  printCData(currentdata);
  //saveStrings("newfile.csv", checkOutput(createCharacterData(0)));
}

void draw() {
  if(mouseX < startx && mouseY > starty && mouseY < cellh*(numrows-1)+starty){
    int index = floor((mouseY-starty)/cellh);
    printtext(currentdata);
    fill(highlighted);
    rect(0,starty+index*cellh, startx, cellh); 
    } 
   else if(mouseX > startx && mouseY < starty && mouseX < cellw*(numrows-1)+startx){
     int index2 = floor((mouseX-startx)/cellw);
     printtext(currentdata);
     fill(highlighted);
     rect(startx+index2*cellw, 0, cellw, starty);
   }
   
   else if(mouseX > startx && mouseX < cellw*(numrows-1)+startx && mouseY > starty && mouseY < cellh*(numrows-1)+starty){
     int index3 = floor((mouseY-starty)/cellh);
     int index4 = floor((mouseX-startx)/cellw);
     printtext(currentdata);
     fill(highlighted);
     rect(0,starty+index3*cellh, startx, cellh);
     rect(startx+index4*cellw, 0, cellw, starty);
   }
   else{
     printtext(currentdata);
   }
}

class Character {
  RCharacter rcs[];
  String gotname;

  Character(String n, RCharacter rc[]) {
    gotname = n;
    rcs = rc;
  }

  RCharacter[] getRcs() {
    return rcs;
  }
}

void mouseClicked(){
  int index = 0;
  if(mouseX < startx && mouseY > starty && mouseY < cellh*(numrows-1)+starty|| mouseX > startx && mouseY < starty && mouseX < cellw*(numrows-1)+startx){
    fill(255);
    rect(0,0,startx+(numrows-1)*cellw, starty+(numrows-1)*cellh);
    if(mouseX < startx){
      index = floor((mouseY-starty)/cellh);
    }
    else if(mouseX > startx){
      index = floor((mouseX-startx)/cellw);
    }
    String clickedname = createCharacterData(charnum)[index+1][2];
    for(int i = 0; i < numrows-1; i++){
      if(clickedname == gotnames[i]){
      currentdata = createCharacterData(i);
      printCData(currentdata);
      charnum = i;
      }
    }
  
  }
}
class RCharacter {
  String gotname;
  int relationship;
  String house;

  RCharacter(String n, int r, String h) {
    gotname = n;
    relationship = r;
    house = h;
  }

  int getRelationship() {
    return relationship;
  }

  String getName() {
    return gotname;
  }
  
  String getHouse(){
    return house;
  }
}

class CharacterData{
  String charname;
  String chardata[][];
}

class Cell{
  color col;
  float xpos;
  float ypos;

  
  Cell(color c, float x, float y){
    col = c; xpos = x; ypos = y;
  }
  
  void printcell(){
    noStroke();
    fill(col);
    rect(xpos, ypos, cellw, cellh);
  }
}

void CharacterSort(RCharacter[] sortcharacters) {
  int i;
  int j;
  int size = sortcharacters.length;
  for (i = 0; i<numrows-1; i++) {
    for (j = 0; j <numrows-2; j++) {
      if (sortcharacters[j+1].getRelationship() > sortcharacters[j].getRelationship()) {
        RCharacter temp = new RCharacter(sortcharacters[j+1].getName(), sortcharacters[j+1].getRelationship(), sortcharacters[j+1].getHouse());
        sortcharacters[j+1] = sortcharacters[j];
        sortcharacters[j]=temp;
      }
    }
  }
}


String[][] readData() {

  String datalines[] = split(strdata, "\n");
  String readgotdata[][] = new String[numrows][numrows+2];
  for (int i = 0; i < numrows; i++) {
    String dataline[] = new String[numrows+2];
    dataline = split(datalines[i], ",");
    for (int j = 0; j < numrows+2; j++) {
      readgotdata[i][j] = dataline[j];
    }
  }
  return readgotdata;
}

void adjustData() {
  for (int i = 0; i < numrows; i++) {
    for (int j = 0; j < numrows+2; j++) {
      if(gotdata[i][j].length() == 1 && parseInt(gotdata[i][j]) == 0){
        gotdata[i][j] = "-10";
      }
      if (gotdata[i][j].length() == 0) {
        gotdata[i][j] = "10";
      }
    }
  }
}

void readCharacters() {
  characters = new Character[numrows-1];
  for (int i = 1; i < numrows; i++) {
    String gotname = gotdata[i][2];
    RCharacter rcs[] = new RCharacter[numrows-1];
    for (int j = 3; j < numrows + 2; j++) {
      RCharacter rc = new RCharacter(gotdata[0][j], int(gotdata[i][j]), gotdata[j-2][0]);
      rcs[j-3] = rc;
    }
    Character character = new Character(gotname, rcs);
    characters[i-1] = character;
  }
 /* CharacterSort(characters[0].getRcs());
  fill(0);
  for (int k = 0; k < numrows-1; k++) {
    text(characters[0].getRcs()[k].getName()+ " " + characters[0].getRcs()[k].getRelationship() + "\n", 10, 10*k+10);
  }*/
  
  
}

String[][] createCharacterData(int index){
  String[][] cdat = new String[numrows][numrows+2];
 /* for(int i = 0; i < numrows; i++){
    cdat[i][0] = gotdata[i][0];
    cdat[i][1] = gotdata[i][1];
  }*/

  
  CharacterSort(characters[index].getRcs());
  RCharacter[] rcs = characters[index].getRcs();

  for(int j = 0; j < numrows-1; j++){
    cdat[j+1][0] = rcs[j].getHouse();
    cdat[j+1][2] = rcs[j].getName();
    cdat[0][j+3] = rcs[j].getName();    
  }
  for(int k = 0; k < numrows-1; k++){
    for(int m = 0; m < numrows-1; m++){
      String rowname = cdat[k+1][2];
      String colname = cdat[0][m+3];
      int r = 0;
      int c = 0;
      for(int n = 0; n < numrows -1; n++){
        if(rowname == gotnames[n]){
          r = n+1;
        }
        if(colname == gotnames[n]){
          c = n+3;
        }
        cdat[k+1][m+3] = gotdata[r][c];
      }
      
    }
  }
  return cdat;
}

void printCData(String[][] cdata){
  printtext(cdata);
  float x = startx;
  float y = starty;
  for(int i = 1; i < numrows; i++){
    for(int j = 3; j < numrows+2; j++){
      color col = 0;
      if(parseInt(cdata[i][j]) == -10){
        col = neut;
      }
      else if(parseInt(cdata[i][j]) == -5){
        col = e5;
      }
      else if(parseInt(cdata[i][j]) == -4){
        col = e4;
      }
      else if(parseInt(cdata[i][j]) == -3){
        col = e3;
      }
      else if(parseInt(cdata[i][j]) == -2){
        col = e2;
      }
      else if(parseInt(cdata[i][j]) == -1){
        col = e1;
      }
      else if(parseInt(cdata[i][j]) == 5){
        col = f5;
      }
      else if(parseInt(cdata[i][j]) == 4){
        col = f4;
      }
      else if(parseInt(cdata[i][j]) == 3){
        col = f3;
      }
      else if(parseInt(cdata[i][j]) == 2){
        col = f2;
      }
      else if(parseInt(cdata[i][j]) == 1){
        col = f1;
      }
      else if(parseInt(cdata[i][j]) == 10){
        col = self;
      }
      Cell c = new Cell(col, x, y);
      c.printcell();
      x = x + cellw;
    }
    x = startx;
    y = y + cellh;
  }
}


void printtext(String[][] cdata){
  fill(255);
  noStroke();
  rect(0,0,startx,starty+(numrows-1)*cellh);
  rect(0,0,startx+(numrows-1)*cellw,starty);
  float x = startx;
  float y = starty;
  float x2 = startx-43;
  for(int i = 1; i < numrows; i++){
    if(cdata[i][0].equals("Arryn")){
      fill(arryn);
    }
    else if(cdata[i][0].equals("Stark")){
      fill(stark);
    }
    else if(cdata[i][0].equals("Baratheon")){
      fill(baratheon);
    }
    else if(cdata[i][0].equals("Night's Watch")){
      fill(nw);
    }
    else if(cdata[i][0].equals("Greyjoy")){
      fill(greyjoy);
    }
    else if(cdata[i][0].equals("Lannister")){
      fill(lannister);
    }
    else if(cdata[i][0].equals("Tyrell")){
      fill(tyrell);
    }
    else if(cdata[i][0].equals("Targaryen")){
      fill(targaryen);
    }
    else{
      fill(0);
    }
    
   textFont("Helvetica", 9);
    textAlign(RIGHT);
    text(cdata[i][2], startx-3, y+cellh/1.1);
    textAlign(LEFT, BOTTOM);
    pushMatrix();
    //90 for 100,100 fadjusts x start of vertical names
    translate(x2,90);
    rotate(-HALF_PI);
    //-8 for 100,100, adjusts ystart of vertical names
    text(cdata[i][2],-8,x2);
    popMatrix();
    x = startx;
    y = y + cellh;
    x2 = x2+cellw/2;
  }

}
  
/*
String[] checkOutput(String[][] testdata){
  String testoutput[] = new String[numrows];
  for(int i = 0; i < numrows; i++){
    String testline = "";
    for(int j = 0; j < numrows + 2; j++){
      testline = testline + testdata[i][j] + ",";
    }
    testoutput[i] = testline;
  }
  return testoutput;
}
*/

String strdata = "Current house affiliation,Former house,,Lysa Arryn,Petyr Baelish,Joffrey Baratheon,Margaery Tyrell,Renly Baratheon,Robert Baratheon,Stannis Baratheon,Brienne of Tarth,Bronn,Gregor Clegane,Sandor Clegane,Xaro Xhoan Daxos,Gendry,Balon Greyjoy,Theon Greyjoy,Jaqen H'ghar,Hodor,Khal Drogo,Cersei Lannister,Jaime Lannister,Lancel Lannister,Tyrion Lannister,Tywin Lannister,Maester Luwin,Melisandre,Jeor Mormont,Jorah Mormont,Osha,Podrick Payne,Pyat Pree,Grand Maester Pycelle,Ros,Davos Seaworth,Shae,Jon Snow,Arya Stark,Bran Stark,Catelyn Stark,Robb Stark,Sansa Stark,Daenerys Targaryen,Viserys Targaryen,Samwell Tarly,Loras Tyrell,Varys,Eddard Stark" + "\n" +
"Arryn,Tully,Lysa Arryn,,3,0,0,0,1,0,1,0,0,0,0,0,-1,-1,0,2,0,-1,-1,-1,-1,-1,1,0,0,0,0,0,0,0,0,0,0,1,2,2,3,2,2,0,0,0,0,0,3" + "\n" +
"Baelish,,Petyr Baelish,3,,-1,1,-2,1,-1,0,-1,-1,-1,0,0,0,0,0,0,0,-2,-2,0,-1,-2,0,0,0,0,0,-1,0,-1,-2,0,-1,0,1,1,5,0,3,-1,0,0,1,-1,-3" + "\n" +
"Lannister,Baratheon,Joffrey Baratheon,0,-1,,4,-3,2,-5,-3,-1,3,4,0,-5,-2,-3,0,-1,-3,5,4,1,-2,3,-1,-4,0,-3,-2,-1,0,-1,-5,-2,-1,-1,-2,-2,-3,-5,0,-5,-3,0,2,-1,-5" + "\n" +
"Tyrell,Baratheon,Margaery Tyrell,0,1,3,,5,0,-5,-4,0,0,1,0,-5,-1,-2,0,0,0,2,1,0,-1,3,0,-4,0,-2,0,0,0,0,0,-2,-1,0,-1,-1,-2,-5,0,-5,-3,0,5,0,0" + "\n" +
"Baratheon,,Renly Baratheon,0,-2,-5,5,,3,-5,2,-1,-2,-2,0,-4,0,-3,0,0,0,-4,-3,-1,-2,-5,1,-5,0,-2,0,-1,0,-1,0,-3,-1,0,2,2,3,2,2,-5,-3,0,5,-1,1" + "\n" +
"Baratheon,,Robert Baratheon,2,1,4,0,3,,2,0,0,-1,0,0,4,-1,4,0,1,-4,-2,-1,0,1,-1,2,0,0,-3,-2,0,0,1,2,0,0,2,4,4,5,4,4,-5,-4,0,0,-2,5" + "\n" +
"Baratheon,,Stannis Baratheon,0,-1,-5,-4,-5,1,,-2,-2,-3,-4,0,-5,-2,0,0,-1,0,-5,-4,-2,-3,-5,0,5,0,-4,-2,-2,0,-3,0,5,0,-2,-2,-2,-4,-5,-2,-5,-3,0,-5,-2,0" + "\n" +
"Stark,,Brienne of Tarth,1,-1,-3,-3,5,0,-4,,-2,-2,-3,0,0,-4,-5,0,3,0,-5,-5,-2,-5,-5,3,-5,0,-3,2,-1,0,-1,0,-4,-3,1,4,4,5,3,4,-5,0,0,3,-1,0" + "\n" +
"Lannister,,Bronn,0,-1,-2,-1,-1,0,-2,-1,,-3,-5,0,0,0,-1,0,0,-1,-3,-3,-1,5,-4,0,-2,0,-1,0,4,0,-3,0,-2,5,0,0,0,-2,-2,1,-2,-2,0,-1,-2,0" + "\n" +
"Lannister,,Gregor Clegane,0,-1,3,-1,-2,-2,-3,-2,-2,,-5,0,-3,0,0,-5,0,-4,2,2,0,-2,5,0,-2,0,-2,0,-1,0,0,0,-1,-1,-1,-3,-3,-4,-4,0,-4,0,0,-3,0,-1" + "\n" +
"Lannister,,Sandor Clegane,0,-2,3,0,-2,0,-4,-3,-5,-5,,0,-2,0,0,0,0,-3,2,1,0,0,3,0,-2,0,-1,0,-2,0,0,0,-1,-1,0,0,0,-3,-3,5,-5,0,0,0,-1,0" + "\n" +
",,Xaro Xhoan Daxos,0,0,0,0,0,0,0,0,0,0,0,,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,-3,0,0,0,0,0" + "\n" +
",Baratheon,Gendry,0,0,-5,-5,-4,5,-5,0,-1,-3,-2,0,,0,0,3,2,0,-5,-4,-2,0,-5,0,0,0,0,2,0,0,-3,0,0,0,0,5,2,0,0,0,-2,0,0,-1,0,3" + "\n" +
"Greyjoy,,Balon Greyjoy,-1,0,-2,-1,-1,-1,-2,-5,0,0,-1,0,0,,3,0,0,0,-3,-2,-1,-2,-3,0,-2,0,-1,0,-1,0,-1,0,0,-1,-2,-1,-1,-4,-5,-2,-3,0,0,-1,0,-5" + "\n" +
"Greyjoy,,Theon Greyjoy,-1,0,-3,-2,-3,4,-5,-5,-1,0,-2,0,0,3,,0,-5,0,-4,-3,-1,-3,-4,-5,-2,0,-1,-5,-2,0,-1,3,0,-1,-2,-4,-5,-4,-4,-2,-3,-1,0,-1,-1,3" + "\n" +
",,Jaqen H'ghar,0,0,0,0,0,0,0,0,0,-5,0,0,3,0,0,,3,0,-1,-1,-1,0,-3,1,0,0,0,1,0,0,0,0,0,0,1,5,1,1,1,1,0,0,0,0,0,0" + "\n" +
"Stark,,Hodor,2,0,-3,0,0,3,0,3,0,0,0,0,2,0,-5,3,,0,-3,-2,0,-1,-3,5,0,0,0,5,0,0,0,0,0,0,4,5,5,5,5,4,0,0,0,0,0,4" + "\n" +
",,Khal Drogo,0,0,-1,0,-5,-5,0,0,-1,-4,-3,0,0,0,0,0,0,,-3,-2,0,-1,-3,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,5,-4,0,0,0,0" + "\n" +
"Lannister,Baratheon,Cersei Lannister,-1,-2,5,-5,-5,3,-5,-5,-3,2,2,0,-5,-3,-4,-1,-3,-3,,5,5,-4,4,0,-3,0,-3,-2,0,0,2,1,-2,-3,-2,-1,-1,-4,-5,1,-5,-3,0,-2,2,-4" + "\n" +
"Lannister,,Jaime Lannister,-1,-2,3,-3,-4,-1,-5,-5,-3,2,1,0,-4,-2,-3,-1,-2,-2,5,,2,2,4,0,-1,0,-1,0,0,0,2,0,-1,0,0,-1,-2,-5,-5,0,-4,-2,0,-1,0,-5" + "\n" +
"Lannister,,Lancel Lannister,-1,0,1,-1,-1,0,-2,-2,-1,0,0,0,-2,-1,-1,-1,0,0,5,2,,-1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2,-2,0,-1,0,0,0,0,0" + "\n" +
"Lannister,,Tyrion Lannister,-5,-1,-3,0,-2,1,-5,-4,5,-3,-2,0,0,-2,-3,0,-1,-1,-4,-3,-1,,-5,0,-3,0,-1,0,5,0,1,5,0,5,0,0,0,-1,-1,3,-1,-1,0,-1,-1,0" + "\n" +
"Lannister,,Tywin Lannister,-1,-2,3,-5,-5,1,-5,-5,-4,5,3,0,-5,-3,-4,-3,-3,-3,4,4,2,-5,,0,-4,0,-3,0,0,0,2,0,-2,-2,-1,-1,-1,-5,-5,0,-5,0,0,-3,1,0" + "\n" +
"Stark,,Maester Luwin,1,0,-1,0,0,2,0,3,0,0,0,0,0,0,-5,1,5,0,0,0,0,0,0,,0,0,0,3,0,0,0,0,0,0,5,5,5,5,5,5,0,0,0,0,0,5" + "\n" +
"Baratheon,,Melisandre,0,0,-5,-5,-5,0,5,-4,-1,-2,-2,0,0,-2,-2,0,0,0,-3,-1,0,0,-4,0,,0,-3,0,0,0,-1,0,-2,0,0,-1,-1,-5,-5,-2,-4,0,0,-3,-3,-5" + "\n" +
"Night's Watch,,Jeor Mormont,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,,3,0,0,0,0,0,0,0,5,0,0,2,0,0,0,0,3,0,0,1" + "\n" +
"Targaryen,,Jorah Mormont,0,0,-3,-2,-2,-3,-5,-3,-1,-2,-1,0,0,-1,-1,0,0,4,-3,-1,0,-1,-3,0,-3,3,,0,0,-5,0,0,-2,0,0,-1,-1,-3,-3,-1,5,-1,0,-1,0,-2" + "\n" +
"Stark,,Osha,0,0,-2,0,0,-2,-2,0,0,0,0,2,0,-5,1,5,0,-2,0,0,0,0,0,3,0,0,0,,0,0,-1,0,-1,0,2,2,5,3,2,1,-2,-1,0,-3,-2,2" + "\n" +
"Lannister,,Podrick Payne,0,0,-1,-1,-1,0,-2,-1,5,-1,0,0,0,-1,-2,0,0,0,0,0,0,5,0,0,0,0,0,0,,0,-2,1,-3,4,0,0,0,-2,-2,3,-3,0,0,-1,-2,0" + "\n" +
",,Pyat Pree,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-5,0,0,,0,0,0,0,0,0,0,0,0,0,-5,0,0,0,0,0" + "\n" +
",,Grand Maester Pycelle,0,-1,-1,-1,-1,1,-3,-1,-3,0,0,0,-3,-1,-1,0,0,0,2,2,0,2,2,0,-1,0,0,-1,-2,0,,1,-1,-1,0,0,0,-2,-3,0,-3,-1,0,-1,-3,-1" + "\n" +
",,Ros,0,-2,-5,0,0,1,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,5,0,0,0,0,0,0,1,0,1,,0,3,0,0,0,0,0,0,0,0,0,0,0,0" + "\n" +
"Baratheon,,Davos Seaworth,0,0,-2,-2,-3,-1,5,-3,-2,-1,-1,0,0,0,0,0,0,0,-2,-1,0,0,-2,0,-2,0,-2,-1,-3,0,-1,0,,-1,-1,-2,-2,-3,-3,-1,-3,0,0,-1,-2,0" + "\n" +
"Lannister,,Shae,0,-1,-1,-1,-1,0,0,-3,5,-1,0,0,0,-1,-1,0,0,0,-3,0,0,5,-2,0,0,0,0,0,4,0,-1,3,-1,,0,0,0,0,0,0,0,0,0,0,0,0" + "\n" +
"Night's Watch,Stark,Jon Snow,1,0,-1,-1,0,2,-2,1,0,-1,0,0,0,-2,-2,1,4,0,-2,0,0,0,-1,5,0,5,0,2,0,0,0,0,-1,0,,5,5,-1,5,5,0,0,5,0,0,5" + "\n" +
"Stark,,Arya Stark,2,1,-1,-1,0,4,-2,4,0,-3,0,0,5,-1,-4,5,5,0,-1,-1,0,0,-1,5,-1,0,-1,2,0,0,0,0,-2,0,5,,5,5,5,4,-1,-1,1,-1,-5,5" + "\n" +
"Stark,,Bran Stark,2,1,-1,-1,0,4,-2,4,0,-3,0,0,2,-1,-5,1,5,0,-1,-2,0,0,-1,5,-1,0,-1,5,0,0,0,0,-2,0,5,5,,5,5,5,-1,-1,1,-1,-5,5" + "\n" +
"Stark,Tully,Catelyn Stark,3,2,-5,-2,3,5,-5,5,-3,-4,-2,0,0,-4,-4,1,4,0,-4,-5,-1,-5,-5,5,-5,1,-3,3,-2,0,-2,0,-3,0,-1,5,5,,4,5,-5,-1,0,-1,-5,5" + "\n" +
"Stark,,Robb Stark,2,0,-5,-1,-4,5,-5,3,-2,-4,-3,0,0,-5,-4,1,5,0,-5,-5,-2,-1,-5,5,-5,0,-3,2,-2,0,-3,0,-3,0,5,5,5,3,,5,-5,-3,1,-4,-5,5" + "\n" +
"Stark,,Sansa Stark,1,2,-1,0,-3,4,-2,4,1,0,1,0,0,-2,-3,1,4,0,1,0,0,3,0,5,-2,0,-1,1,1,0,0,0,-1,0,5,5,5,5,5,,-3,-1,1,-1,-1,5" + "\n" +
"Targaryen,,Daenerys Targaryen,0,-2,-5,-5,-5,-5,-5,-5,-2,-4,-5,-3,-2,-3,-3,0,0,5,-5,-4,-1,-1,-5,0,-4,0,5,-2,-3,-5,-3,0,-3,0,0,-1,-1,-4,-5,-3,,2,0,0,-3,-2" + "\n" +
"Targaryen,,Viserys Targaryen,0,0,-3,-3,-4,-3,-3,0,-2,0,0,0,0,0,-1,0,0,-4,-3,-2,0,-1,0,0,0,0,-1,-1,0,0,-1,0,0,0,0,-1,-1,-1,-3,-1,-2,,0,0,-1,0" + "\n" +
"Night's Watch,,Samwell Tarly,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,5,1,1,0,1,1,0,0,,0,0,1" + "\n" +
"Tyrell,,Loras Tyrell,0,1,-2,5,5,0,-5,-3,-1,-3,0,0,-1,-1,-1,0,0,0,-2,-1,0,-1,-3,0,-3,0,-1,-3,-1,0,-1,0,-1,0,0,-1,-1,-1,-4,-1,0,0,0,,-1,0" + "\n" +
",,Varys,0,-1,-1,0,-1,-2,-2,-1,-2,0,-1,0,0,0,-1,0,0,0,2,0,0,2,1,0,-3,0,0,-2,-2,0,-3,0,-2,0,0,-5,-5,-5,-5,-1,-3,-1,0,-1,,-5" + "\n" +
"Stark,,Eddard Stark,3,-1,-5,0,1,5,0,0,-1,-1,0,0,3,-5,3,0,4,0,-4,-5,0,-1,0,5,-5,1,-2,2,0,0,-1,0,0,0,5,5,5,5,5,5,-2,0,1,0,-5,";






