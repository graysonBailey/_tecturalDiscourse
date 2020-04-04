void mouseClicked() {
  if (mouseButton == LEFT && geistPlane == true) {
    Geist = true; 
    zX = mouseX+(translation.x*-1); 
    zY = mouseY+(translation.y*-1);
  }

  if (mouseButton == LEFT && relationPlane == true) {
    for (int i = 0; i < unitList.size(); i++) {
      if (unitList.get(i).checkInternal()) {
        println(unitList.get(i).ID);
        if (rtemp1.equals(new PVector(0, 0, 0))) {
          
          rtemp1 = new PVector(cursor.x,cursor.y,unitList.get(i).ID);
         // println(rtemp1);
          
        } else if (rtemp2.equals(new PVector(0,0,0))){
          rtemp2 = new PVector(cursor.x,cursor.y, unitList.get(i).ID);
         // println("temp2"+rtemp2);
          relations.add(new Relation(int(rtemp1.z),int(rtemp2.z)));
          rtemp1=new PVector(0,0,0);
          rtemp2=new PVector(0,0,0);
          
        }
      }
    }
  }
}

//Necessarily contains all input typing
void keyTyped() {
  if (key == BACKSPACE) {
    tempWords = tempWords.substring(0, max(0, tempWords.length()-1));
  } else if (key == ENTER) {
  } else {
    tempWords =tempWords + key;
  }
}


void keyPressed() {
  if (keyCode == 27) {
    key = 0;
    println("alright, alright, alright...");
    Geist = false;
    tempWords ="";
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  translation.y+=(e*(-40));
  smin = new PVector(translation.x*-1, translation.y*-1);
  smax = new PVector(smin.x+width, smin.y+height);
}
