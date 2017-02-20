void control() {

  cp5 = new ControlP5(this); // init ControlP5 and set it up


  cp5.addNumberbox("Paper_width").setPosition(10, 10).setSize(50, 12).setScrollSensitivity(1.1)
    .setValue(600).setColorBackground(color(0, 158, 224));
  cp5.addNumberbox("Paper_height").setPosition(10, 40).setSize(50, 12).setScrollSensitivity(1.1)
    .setValue(800).setColorBackground(color(0, 158, 224));
  cp5.addNumberbox("largeur_grille").setPosition(10, 90).setSize(50, 12).setScrollSensitivity(1.1)
    .setValue(500).setColorBackground(color(0, 132, 31));
  cp5.addNumberbox("hauteur_grille").setPosition(10, 120).setSize(50, 12).setScrollSensitivity(1.1)
    .setValue(700).setColorBackground(color(0, 132, 31));
  cp5.addNumberbox("NB_colones").setPosition(10, 160).setSize(50, 12).setScrollSensitivity(1.1)
    .setValue(23).setColorBackground(color(133, 0, 0));
  cp5.addNumberbox("NB_lignes").setPosition(10, 190).setSize(50, 12).setScrollSensitivity(1.1)
    .setValue(70).setColorBackground(color(133, 0, 0)); 

  cp5.addToggle("horizontales").setPosition(10, 230).setSize(10, 10)
    .setColorBackground(color(200, 200, 200)).setColorActive(color(255, 0, 0))
    .setState(true);
  cp5.addToggle("verticales").setPosition(10, 260).setSize(10, 10)
    .setColorBackground(color(200, 200, 200)).setColorActive(color(255, 0, 0))
    .setState(true);
  cp5.addToggle("cadre").setPosition(10, 290).setSize(10, 10)
    .setColorBackground(color(200, 200, 200)).setColorActive(color(255, 0, 0))
    .setState(true);
  lignes = cp5.addTextlabel("label1", "On", 30, 230);
  verticals = cp5.addTextlabel("label2", "On", 30, 260);
  bordures = cp5.addTextlabel("label3", "Off", 30, 290);
  
  printmargeL = cp5.addTextlabel("label4", "Marge L = ", 8,350);
  printmargeH = cp5.addTextlabel("label5", "Marge H = ", 8,360);
  printlargeurcolone = cp5.addTextlabel("label6", "Colones = ", 8,390);
  printhauteurlignes = cp5.addTextlabel("label7", "Lignes = ", 8,400);
  
  
    cp5.addRadioButton("step")
     .setPosition(10,450)
     .setSize(10,10)
     .setItemsPerRow(3)
     .setSpacingColumn(20)
     .setColorForeground(color(255,0,0))
     .setColorBackground(color(255))
     .setColorActive(color(255,0,0))
     .addItem("1", 0)
     .addItem("2", 1)
     .addItem("4", 2)
     .addItem("8", 3)
     .addItem("16", 4)
     .addItem("32",5)
     .setColorLabel(color(255))
     .toUpperCase(false)
     .activate(2);
    steplabel= cp5.addTextlabel("label8", "Micro Step = " + step, 8, 480);
    
  cp5.addButton("Export_Gcode").setValue(1).setPosition(10, 520).setSize(80, 20)
    .setColorBackground(color(0, 158, 224)).setColorForeground(color(0, 144, 54))
    .setColorActive(color(255, 0, 0));
}

void Paper_width(int LPaper) {
  L=LPaper;
}
void Paper_height(int HPaper) {
  H=HPaper;
}
void largeur_grille(int l) {
  LGrid=l;
}
void hauteur_grille(int h) {
  HGrid=h;
}
void NB_colones(int NBh) {
  Nbcolone=NBh;
}
void NB_lignes(int NBl) {
  Nbligne=NBl;
}

void horizontales(boolean Hbutton) {
  if (Hbutton==true) {
    HScreen=true;
    lignes.setValue("On");
  } else {
   HScreen=false;
    lignes.setValue("Off ");
  }
}
void verticales(boolean Vbutton) {
  if (Vbutton==true) {
    verticals.setValue("On");
    VScreen=true;
  } else { 
    VScreen=false;
    verticals.setValue("Off ");
  }
}
void cadre(boolean Cbutton) {
  if (Cbutton==true) {
    bordures.setValue("On");
    CScreen=true;
  } else if (Cbutton==false) {
    bordures.setValue("Off ");
    CScreen=false;
  }
}

void step(int Value) {
  switch(Value) {
    case(0):step=1;break;
    case(1):step=2;break;
    case(2):step=4;break;
    case(3):step=8;break;
    case(4):step=16;break;
    case(5):step=32;break;
  }
  steplabel.setValue("Micro Step = " +str(step));
  println("stepsize"+ step);
}

void Export_Gcode(int Value) {
  if (frameCount>1){
 selectOutput("Select a file to write to:", "fileOutputSelected");
  //noLoop();
}
}