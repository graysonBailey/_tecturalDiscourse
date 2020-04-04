class Relation {
  int ID1=-1;
  int ID2=-1;
  PVector lp1=new PVector(0, 0);
  PVector lp2=new PVector(0, 0);
  Boolean Open= true;

  Relation(int ida, int idb) {
    ID1=ida;
    ID2=idb;
    sortConnectionPoints();
  }

  void sortConnectionPoints() {
    PVector save = unitList.get(ID2).corners[0];
    PVector comp = unitList.get(ID1).centroid;
    for (int i = 1; i < unitList.get(ID2).corners.length; i++) {
      PVector temp = unitList.get(ID2).corners[i];
      float dist = PVector.dist(temp, comp);
      float savedist = PVector.dist(save, comp);
      if (dist > 0 && dist < savedist) {
        save = temp;
      }
    }
    lp2 = save;
    save = unitList.get(ID1).corners[0];
    comp = lp2; 
    for (int i = 1; i < unitList.get(ID1).corners.length; i++) {
      PVector temp = unitList.get(ID1).corners[i];
      float dist = PVector.dist(temp, comp);
      float savedist = PVector.dist(save, comp);
      if (dist > 0 && dist < savedist) {
        save = temp;
      }
    }
    lp1=save;
  }

  //void update() {
  //}

  void visRelation(float weight, color col) {
    stroke(col);
    strokeWeight(weight);
    line(lp1.x, lp1.y, lp2.x, lp2.y);
  }
}
