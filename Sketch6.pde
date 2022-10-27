// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for this video: https://youtu.be/f0lkz2gSsIk

import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 28;
float b = 48.92;
float c = 4;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 650);
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));

  translate(10, 10, -50);
  //translate(width/2, height/2);
  scale(7);
  stroke(255);
  noFill();

  float hu = 2;
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y,v.z);
    //PVector offset = PVector.random3D();
    //offset.mult(0.1);
    //v.add(offset);

    hu += 0.2;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();


  //println(x,y,z);
}
