void navigate() {
  //The distance the workspace will move in each frame when prompted
  int transStep = 10;
  if ( keyPressed ==  true) {
    if (key == CODED) {
      if (keyCode == UP) {
        translation.y+=float(transStep) ;
      } else if (keyCode == DOWN) {
        translation.y-=float(transStep);
      }
      smin = new PVector(translation.x*-1, translation.y*-1);
      smax = new PVector(smin.x+width, smin.y+height);
    }
  }
  translate(translation.x, translation.y);
}

void interfaceVis() {
  int marg = (width/5)*3;
  stroke(255, 120);
  strokeWeight(1);
  line(1, smin.y, 1, smax.y);  
  line(-1, smin.y, -1, smax.y);
  line(marg+1, smin.y, marg+1, smax.y);
  line(marg-1, smin.y, marg-1, smax.y);
  Cursor();
}

void Cursor() {
  stroke(47, 240, 230);  
  cursor.x = smin.x+mouseX;
  cursor.y=smin.y+mouseY;
  pushMatrix();  
  translate(cursor.x, cursor.y);  
  strokeWeight(3);
  point(0, 5);
  point(5, 0);
  point(0, 0);  
  popMatrix();
}

void Buttons() {
  exitButton();
  planeButtons();
  printScreenButton();
}

void planeButtons() {
  boolean boof = false;
  textSize(14);

  int[]b1 = {20, 100, 220, 120};
  int[]b2 = {20, 140, 220, 160};
  fill(255);
  if (geistPlane == true) {
    fill(37, 230, 240);
  }
  noStroke();
  if (mouseX>b1[0] && mouseX<b1[2]  && mouseY > b1[1] && mouseY < b1[3] ) {
    boof = true;
    if (mousePressed == true) { 
      geistPlane=true;
      relationPlane=false;
    }
    fill(255, 0, 0);
  }
  textAlign(LEFT, TOP);
  rect(smin.x+20, smin.y+100, 200, 20);
  fill(0);
  text("g e i s t   p l a n e", smin.x+b1[0], smin.y+b1[1], 200, 20);
  boof = false;


  fill(255);
  if (relationPlane == true) {
    fill(37, 230, 240);
  }
  if (mouseX>b2[0] && mouseX<b2[2]  && mouseY > b2[1] && mouseY < b2[3] ) {
    boof = true;
    if (mousePressed == true) { 
      relationPlane=true;
      geistPlane=false;
    }
    fill(255, 0, 0);
  }
  rect(smin.x+20, smin.y+140, 200, 20);  
  fill(0);
  text("r e l a t i o n   p l a n e", smin.x+b2[0], smin.y+b2[1], 200, 20);

  boof = false;
}

void exitButton() {
  boolean boof = false;
  fill(255);
  noStroke();
  if (mouseX>20 && mouseX<70  && mouseY > 20 && mouseY < 40 ) {
    boof = true;
    if (mousePressed == true) { 
      saveRelations();
      updateDiscourses();
      exit();
    }
    fill(255, 0, 0);
  }
  rect(smin.x+20, smin.y+20, 50, 20);
  if (boof == true) {
    fill(255);
    textSize(16);
    text("quit", smin.x+20, smin.y+20, 50, 20);
  }
  boof = false;
}


void printScreenButton() {
  boolean boof = false;
  fill(255);
  noStroke();
  if (mouseX>20 && mouseX<110  && mouseY > height-40 && mouseY < height-20 ) {
    boof = true;
    if (mousePressed == true && frameCount%10 ==0) { 
      String[] temp = split(saveName, ".");
      println(temp[0]);
      saveFrame(temp[0]+"_"+year()+month()+day()+hour()+minute()+".png");
    }
    fill(255, 0, 0);
  }
  rect(smin.x+20, smin.y+(height-40), 90, 20);
  if (boof == true) {
    fill(255);
    textSize(16);
    text("saveScreen", smin.x+20, smin.y+(height-40), 90, 20);
  }
  boof = false;
}



void whatAreMyOptions() {
  disCsets = fillErUp(listFileNames(sketchPath()));
  //println(disCsets.length);
}

void chooseDiscourse() {
  int choice;
  fill(255, 0, 0); 
  text("c h o o s e   d i s c o u r s e   s e t", 50, 180);
  fill(255); 
  textSize(14);
  for ( int i= 0; i <= disCsets.length; i++) {
    String tex; 
    float Y = 200+(i*20);
    if (i == disCsets.length) {
      tex ="+ n e w   d i s c o u r s e ";
    } else {
      tex =disCsets[i];
    }
    if (mouseX < 50+textWidth(tex) && mouseX > 50 && mouseY < Y && mouseY > Y-10) {
      fill(47, 230, 340); 
      if (mousePressed == true) {
        choice = i; 
        loadDiscourses(choice);
        startup = false;
        if (choice == disCsets.length) {
          newOne = true;
        }
      }
    } else { 
      fill(255);
    }
    text(tex, 50, Y);
  }
}

void newOne() {
  textAlign(LEFT, BOTTOM);
  fill(255);
  text("e n t e r   d i s c o u r s e   n a m e : ", 100, 50);
  noStroke();
  fill(47, 230, 240);
  rect(95, 58, 200, 16);
  fill(0);
  text(tempWords, 100, 70);
  if (keyPressed == true && key == ENTER) {
    saveName = tempWords+".json";
    tempWords="";
    newOne = false;
    textAlign(LEFT, TOP);
  }
}
