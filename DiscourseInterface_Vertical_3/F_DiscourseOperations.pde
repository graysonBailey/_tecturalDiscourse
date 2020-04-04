void Discourses() {
  PVector smin = new PVector(translation.x*-1, translation.y*-1);
  PVector smax = new PVector(smin.x+width, smin.y+height);
  for (int i = 0; i < unitList.size(); i++) {
    PVector pLoc = unitList.get(i).location;
    if (pLoc.x > smin.x && pLoc.x < smax.x && pLoc.y > smin.y-30 && pLoc.y < smax.y) {
      unitList.get(i).visText();
    }
  }
}

void Geist() {
  if (Geist == true) {
    noStroke();
    fill(190);
    rect(zX,zY-50,400,45);
    fill(0);
    text("q/ = quote",zX,zY-48);text("r/ = response",zX,zY-33); text("source @ end = %*author, title, publication type, year, page", zX, zY-18);
    fill(255);
    rect(zX, zY, 400, 500);
    fill(0);
    String blinkChar;
    if (frameCount % 20 < 10) {
      blinkChar = "_";
    } else {
      blinkChar = "";
    }
    text(tempWords+blinkChar, zX+10, zY+10, 380, 480);
  }
  if (keyPressed == true && key == ENTER && tempWords != "" && Geist == true) {
    unitList.add(new discourseUnit(new PVector(zX+10, zY+10), tempWords, caseCheck(tempWords),unitList.size(),macString(user)));
    updateDiscourses();
    Geist = false;
    tempWords = "";
  } else if (keyPressed == true && keyCode == 27) {
    key =0;
    Geist = false;
    tempWords ="";
  }
}

void Relate(){
  fill(255,120);
  rect(smin.x+translation.x,smin.y,(width/5)*3,height);
  for(int i = 0; i < unitList.size(); i++){
   unitList.get(i).checkInternal();
  }
}

void RelateScreen(float a, color b){
 for(int i = 0; i < relations.size(); i++){
   relations.get(i).visRelation(a,b);
  } 
}

String caseCheck(String text) {
  String type="";
  if (text.length() > 0) {
    char subChar = text.charAt(0);
    if (subChar == 'q') { 
      type = "quote";
    } else if (subChar == 'r') { 
      type = "response";
    } else { 
      type = "other";
    }
  }
  return type;
}
