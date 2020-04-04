String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    return null;
  }
}


String[] fillErUp(String[] log) {
  StringList discs = new StringList();
  for (int i = 0; i <log.length; i++) {
    if (log[i].contains(".json") == true && log[i].contains("relations") != true) {
      discs.append(log[i]);
    }
  }
  return discs.array();
}

void loadDiscourses(int choice) {
  if (choice == disCsets.length) {
    discourses = new JSONArray();
  } else {
    discourses = loadJSONArray(disCsets[choice]);
    saveName = disCsets[choice];
    println(saveName);
    File relFile = new File( sketchPath("relations_"+saveName));
    if (relFile.exists()) {
      relationsD = loadJSONArray("relations_"+saveName);
      println("RELATIONS UPLOADED");
    }

    for (int i = 0; i < discourses.size(); i++) {
      JSONObject temp = discourses.getJSONObject(i);
      unitList.add(new discourseUnit(new PVector(temp.getInt("PosX"), temp.getInt("PosY")), temp.getString("Base"), temp.getString("Type"), unitList.size(), temp.getString("User")));
      println(temp.getString("Type"));
    }

    for (int i = 0; i <relationsD.size(); i++) {
      JSONObject temp = relationsD.getJSONObject(i);

      relations.add(new Relation(temp.getInt("ID_A"), temp.getInt("ID_B")));
    }
  }
}

void updateDiscourses() {
  int agents = unitList.size();
  //int discs = discourses.size();
  //if (agents > discs) {
  for (int i = 0; i < agents; i++) {
    JSONObject discourse = new JSONObject();
    JSONObject source = new JSONObject();
    discourse.setInt("ID", i);
    discourse.setInt("PosX", int(unitList.get(i).location.x));
    discourse.setInt("PosY", int(unitList.get(i).location.y));
    discourse.setString("Type", unitList.get(i).type);
    discourse.setString("Content", unitList.get(i).discourseContent);
    discourse.setString("Base", unitList.get(i).base);
    discourse.setString("User", unitList.get(i).user);
    if (unitList.get(i).source == true) { 
      source.setInt("source", 1);
      source.setString("author", unitList.get(i).author);
      source.setString("title", unitList.get(i).title);
      source.setString("publication type", unitList.get(i).publication);
      source.setString("year", unitList.get(i).year);
      source.setString("page", unitList.get(i).page);
    }
    source.setInt("source", 0);
    discourse.setJSONObject("bib", source);
    discourses.setJSONObject(i, discourse);
    //}
    //}
  }
  saveJSONArray(discourses, saveName);
}

void saveRelations() {
  for (int i = 0; i < relations.size(); i++) {
    JSONObject relation = new JSONObject();


    relation.setInt("ID_A", relations.get(i).ID1);
    relation.setInt("ID_B", relations.get(i).ID2);


    relationsD.setJSONObject(i, relation);
  }
  saveJSONArray(relationsD, "relations_"+saveName);
  //println(saveName);
}

//void resetThatSubstrate() {
//  unitList = new ArrayList<discourseUnit>();
//  discourses = new JSONArray();
//}
