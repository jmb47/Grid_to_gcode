void variables(){
  
   MargeL= (float)(L-LGrid)/2;//  marge Largeur
   MargeH= (float)(H-HGrid)/2;//  marge Hauteur
   LargeurColone=(float)LGrid/Nbcolone; //largeur colones
   HauteurLigne=(float)HGrid/Nbligne; // hauteur rangées
  // MargeL=MargeL+100; // adaptation à l'écran
  // MargeH=MargeH+10; // adaptation à l'ecran
   printmargeL.setValue("Marge L = " +MargeL +" mm");
   printmargeH.setValue("Marge H = " +MargeH +" mm");
   printlargeurcolone.setValue("Colones = " + nfc(LargeurColone,2) +" mm");
   printhauteurlignes.setValue("Lignes =  "+ nfc(HauteurLigne ,2)+" mm");
}

void Visualize(){
  pushMatrix();
  //translate(110,10);
 if (H>height) {
  scale=(height/H); // resize svg to screen
  
  } 
 if (L>(width-110)) {
   scale = (width/L)*0.95;
  }
  translate(110,10);
   
  scale (scale,scale);
  scale (0.95,0.95);// just to have margin.
  rect (0,0,L,H);
  
 if (VScreen==true){
   currentX=MargeL;   
  for (int i=0; i <(Nbcolone-1) ; i=i+1) {
    currentX= currentX+LargeurColone;
    stroke(200);
  line (currentX,MargeH,currentX,(HGrid+MargeH));// lignes verticales
  }
 }
    if(HScreen==true){
    currentY=MargeH;
  for (int j=0; j<(Nbligne-1) ; j=j+1){ // lignes horizontales
   currentY=currentY+HauteurLigne; 
   stroke (200);
  line(MargeL,currentY,(LGrid+MargeL),currentY);
  }
  }
  if (CScreen==true){
    stroke(200);
    line(MargeL,MargeH,MargeL,(HGrid+MargeH));// verticale gauche
    line(MargeL,(HGrid+MargeH),(LGrid+MargeL),(HGrid+MargeH));//horizontal bas
    line ((LGrid+MargeL),MargeH,(LGrid+MargeL),(HGrid+MargeH));// verticale droite
    line (MargeL,MargeH,(LGrid+MargeL),MargeH); // horizontale haute
  }
  popMatrix();
}