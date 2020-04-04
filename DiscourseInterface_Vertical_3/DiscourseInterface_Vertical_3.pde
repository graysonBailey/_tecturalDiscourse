import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

String tempWords = "";
ArrayList<discourseUnit> unitList = new ArrayList<discourseUnit>();
ArrayList<Relation> relations = new ArrayList<Relation>();
PVector rtemp1=new PVector(0, 0, 0);
PVector rtemp2=new PVector(0, 0, 0);
JSONArray discourses;
JSONArray relationsD= new JSONArray();
String[] disCsets;
String saveName;
int lineLength = 63;
float zX;
float zY;
PVector translation;
Boolean Geist = false;
Boolean startup = true;
Boolean load = false;
Boolean newOne = false;
Boolean relationPlane=false;
Boolean geistPlane = false;
PVector smin;
PVector smax; 
PVector cursor= new PVector(0, 0);
byte[] user;

void settings() {
  size(1800, 960);
  translation = new PVector(width/5, 0);
  smin = new PVector(-translation.x, 0);
  smax = new PVector(width-translation.x, height);
}

void setup() {
  textFont(createFont("Flama.otf", 36));
  textSize(16);
  whatAreMyOptions();
  user = getMac();
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  Gen();
}
