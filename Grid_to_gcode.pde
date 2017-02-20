/* 
*  coding by Jean-Marie Blanchet _2017_january
*  The paper size is in mm, change the micro step from you machine 
*  you can choose drawing just vertical, horizontal or the frame of the grid or the both or the three of them
*/



import controlP5.*;
ControlP5 cp5;
ControlFont font;

float MargeL,MargeH,MargeLMachine,MargeHMachine;// coordonnée départ X, marge L
float LargeurColone,HauteurLigne,LargeurColoneMachine,HauteurLigneMachine; //largeur colones
float currentX,currentY;
float scale=1;
float Q;
int step=4;// steep machine default
float L,H,l,h,LMachine,HMachine;
int LGrid,HGrid,LGridMachine,HGridMachine;
int Nbcolone,Nbligne;

Textlabel lignes,bordures,verticals,printmargeL,printmargeH,printlargeurcolone,printhauteurlignes,steplabel;
Boolean screen=false,Hbutton,Vbutton,Cbutton,Value;
Boolean HScreen=true,VScreen=true,CScreen=true;

PrintWriter outputGcode;

void setup(){
    size(1300, 900);
    //surface.setResizable(true);
    control();
    
}

void draw(){
background(0);
  noFill();
  stroke(123);
  variables();
  Visualize();

}