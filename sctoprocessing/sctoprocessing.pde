import oscP5.*;
import netP5.*;

int counter=0; 
float stretch; 

//OSC stuff
OscP5 oscP5;
NetAddress myRemoteLocation;


void setup() {
  size(400,400, JAVA2D);

 frameRate(15);

/* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
   
   //57120 is SC lang default port
  myRemoteLocation = new NetAddress("127.0.0.1",57120);
 
stretch=random(0.5,2.5);

}



void draw() {

  counter = (counter+1)%6;
  
  if (counter ==0) {
 
   //in the following different ways of creating osc messages are shown by example 
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(stretch); // add a float to the osc message 

  // send the message 
  oscP5.send(myMessage, myRemoteLocation); 
  }
  
 background(255);
  
  strokeWeight(random(1,5));

 stroke(40*stretch, 30, 20); 
  line(20,20, stretch*40, stretch*10);
 

}





/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(" arguments: 0 "+theOscMessage.get(0).intValue()+" 1 "+theOscMessage.get(1).stringValue()+" 2 "+theOscMessage.get(2).floatValue());
  
  stretch= theOscMessage.get(2).floatValue();
}


