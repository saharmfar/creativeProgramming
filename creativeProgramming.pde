Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
float time = 0;

void setup()
{
  size(640, 960);
  maxim = new Maxim(this);
  player1 = maxim.loadFile("song1.wav");
  player1.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player1.volume(0.10);
  background(0);
  rectMode(CENTER);
  frameRate(30);
}

void draw()
{
  translate(width*0.5,height*0.5); //puts all the drawing in middle of the screen
  time += 0.01; //it adds 1 to time for every frame
  for(int i=0; i<20; i++) 
  { 
    rotate(time);
    rect(i,i,i*7,i*7);
  }
}

void mouseDragged()
{
  player1.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);

  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  brush3(mouseX, mouseY,speed, speed,lineWidth);
  brush6(mouseX, mouseY,speed, speed,lineWidth);
  
  player1.setFilter((float) mouseY/height*5000,mouseX / width);
  player2.setFilter((float) mouseY/height*5000,mouseX / width);
  
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{
  player1.ramp(0.,1000);
       
}


