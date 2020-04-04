class discourseUnit {
  String discourseContent;
  String base;
  PVector location;
  String type;
  String author;
  String title;
  String publication;
  String year;
  String page;
  Boolean source;
  int ID;
  String user;
  byte[] mac;
  PVector locationMax;
  PVector centroid;
  PVector[] corners;
  ArrayList<Relation> relations = new ArrayList<Relation>();

  discourseUnit(PVector loc, String disc, String Typ, int _id,String us) {
    location = loc;
    base = disc;
    divideContent();
    type = Typ;
    ID = _id;
    user = us;
    

    int len = ceil(discourseContent.length()/52);
    if (len <1) {
      len =1;
    }
    float vert = 10+(len*18);
    locationMax = new PVector(400, vert);
    corners = new PVector[] {location, new PVector(location.x, location.y+locationMax.y), new PVector(location.x+locationMax.x, location.y+locationMax.y), new PVector(location.x+locationMax.x, location.y)};
    centroid = new PVector(location.x+(locationMax.x/2), location.y+(locationMax.y/2));
  }

  void divideContent() {

    String[] temp = split(base, "%*");
    discourseContent = temp[0];
    if (temp.length>1) {
      source = true;
      String[] bib = split(temp[1], ",");
      author = bib[0];
      title = bib[1];
      publication = bib[2];
      year = bib[3];
      page = bib[4];
    } else {
      source = false;
    }
  }


  void update() {
    visText();
    visRelations();
  }

  void visText() {
    fill(colorType(type));
    textSize(14);
    text(discourseContent, location.x+10, location.y+10, 380, 480);
    text(str(ID), location.x-10, location.y-10);
    text(type+"_____"+user, location.x-10, location.y-20);
    noFill();
    stroke(colorType(type));
    strokeWeight(3);
    if (!type.equals("response")) {
      rect(location.x, location.y, locationMax.x, locationMax.y);
    } else if (type == "response"){
      
    }
    fill(255);
    textSize(12);
    if (author != null) {
      text(author+", "+title+", "+publication+", "+year+", "+page, location.x, location.y+locationMax.y+10, 400, 400);
    }
  }

  void visRelations() {
  }

  Boolean checkInternal() {

    Boolean b = false;

    if (cursor.x > location.x && cursor.x < location.x+locationMax.x && cursor.y > location.y && cursor.y < location.y+locationMax.y) {
      noFill(); 
      strokeWeight(5);
      stroke(45, 230, 240);
      rect(location.x, location.y, locationMax.x, locationMax.y);
      b=true;
    }
    return b;
  }



  color colorType(String t) {
    color col = color(0);

    if (t.equals("response")) {
      
      col = color(255,0,0);
    } else if (t.equals("quote")) {
      col = color(180);
    } else {
      col = color(255);
    }
    return col;
  }
}
