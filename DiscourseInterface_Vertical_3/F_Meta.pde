void Slew() {
  navigate();
  Discourses();
  Buttons();
  if (geistPlane) {
    RelateScreen(.5, color(234, 162, 33));
    Geist();
  } else if (relationPlane) {
    Relate(); 
    RelateScreen(1.8, color(234, 162, 33));
  }
  interfaceVis();
}

void Gen() {
  if (startup == true) {
    chooseDiscourse();
  } else if (newOne == true) {
    newOne();
  } else {
    Slew();
  }
}

byte[] getMac() {

  InetAddress ip;
  byte[] mac= new byte[6];
  try {
    ip = InetAddress.getLocalHost();
    //println("Current IP address : " + ip.getHostAddress());
    NetworkInterface network = NetworkInterface.getByInetAddress(ip);
    mac = network.getHardwareAddress();
   
 
  } 
  catch (UnknownHostException e) {
    e.printStackTrace();
  } 
  catch (SocketException e) {
    e.printStackTrace();
  }
  return mac;
}

String macString(byte[] mac){
  String user;
   StringBuilder sb = new StringBuilder();
    for (int i = 0; i < mac.length; i++) {
      sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
    }
  user = sb.toString();
  return user;
}
