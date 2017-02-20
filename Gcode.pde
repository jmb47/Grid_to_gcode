void fileOutputSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
     LMachine=L*step;// resize steep motor
     HMachine=H*step;// resize steep motor
     LGridMachine=LGrid*step;
     HGridMachine=HGrid*step;
     MargeLMachine= (float)(LMachine-LGridMachine)/2;//  marge Largeur
     MargeHMachine= (float)(HMachine-HGridMachine)/2;//  marge Hauteur
     LargeurColoneMachine=(float)LGridMachine/Nbcolone; //largeur colones
     HauteurLigneMachine=(float)HGridMachine/Nbligne;
     
     outputGcode = createWriter(selection.getAbsolutePath()+ ".ngc"); 
     outputGcode.println("G21");
     outputGcode.println("G90"); // en mm

    if(VScreen==true){ 
      currentX=MargeLMachine;  
    for (int i=0; i <(Nbcolone-1) ; i=i+1) {
      currentX= currentX+LargeurColoneMachine;
      outputGcode.println("G00 Z0"); 
      outputGcode.println("G00 X" + currentX + " Y" +MargeHMachine);
      outputGcode.println("G00 Z-40"); 
      outputGcode.println("G00 X" + currentX + " Y" +(HGridMachine+MargeHMachine));
  }
}

    if(HScreen==true){
    currentY=MargeHMachine;
    for (int j=0; j<(Nbligne-1) ; j=j+1){ // lignes horizontales
      currentY=currentY+HauteurLigneMachine; 
      outputGcode.println("G00 Z0"); 
      outputGcode.println("G00 X" + MargeLMachine + " Y" +currentY);
      outputGcode.println("G00 Z-40"); 
      outputGcode.println("G00 X" + (LGridMachine+MargeLMachine) + " Y" +currentY);
    
    }
    }
    if (CScreen==true){
     outputGcode.println("G00 Z0");
     outputGcode.println("G00 X" + MargeLMachine + " Y" +MargeHMachine);
     outputGcode.println("G00 Z-40"); 
     outputGcode.println("G00 X" + MargeLMachine + " Y" +(HGridMachine+MargeHMachine));
     outputGcode.println("G00 X" + (LGridMachine+MargeLMachine) + " Y" +(HGridMachine+MargeHMachine));
     outputGcode.println("G00 X" + (LGridMachine+MargeLMachine) + " Y" +MargeHMachine);
     outputGcode.println("G00 X" + MargeLMachine + " Y" +MargeHMachine);
     outputGcode.println("G00 Z0");
    
    }
    outputGcode.println("G00 Z0"); // end Gcode
    outputGcode.println("G00 X0 Y0");
    outputGcode.flush(); 
    outputGcode.close();
  }
}