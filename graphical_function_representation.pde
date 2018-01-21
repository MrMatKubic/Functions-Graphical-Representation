PVector gOrigin; // -20 to 20
PVector xscale;
PVector yscale;
PGraphics gLayer;

void setup()
{
  size(800, 800);
  this.gOrigin = new PVector(width / 2, height / 2);
  this.xscale = new PVector(-15, 15);
  this.yscale = new PVector(-15, 15);
  this.gLayer = createGraphics(width, height, JAVA2D);
  
  gLayer.beginDraw();
  gLayer.background(0);
  gLayer.stroke(255);
  gLayer.strokeWeight(1);
  gLayer.beginShape();
  gLayer.noFill();
  
  gLayer.line(width / 2, 0, width / 2, height);
  gLayer.line(0, height / 2, width, height / 2);  
  
  gLayer.stroke(255, 0, 0);
  gLayer.strokeWeight(2);
  for(float i = this.xscale.x; i <= this.xscale.y; i++)
  {
    float x = map(i, this.xscale.x, this.xscale.y, 0, width);
    for(float j = this.yscale.x; j < this.yscale.y; j++)
    {
      float y = map(i, this.yscale.x, this.yscale.y, height, 0);
      gLayer.line(gOrigin.x - 2, y, gOrigin.x + 2, y);
      //gLayer.text((int)i, gOrigin.x - 12, y + 3); // SHOW Y COORD
      gLayer.line(x, gOrigin.y - 2, x, gOrigin.y + 2);  
      //gLayer.text((int)i, x - 3, gOrigin.y - 12);  // SHOW X COORD      
    }
  }
  
  gLayer.stroke(0, 255, 0);
  for(float i = this.xscale.x; i < this.xscale.y; i+= 0.05)
  {
    float x = map(i, this.xscale.x, this.xscale.y, 0, width);
    for(float j = this.yscale.x; j < this.yscale.y; j+= 0.05)
    {
        float y = map(doubleFunction(i), this.yscale.x, this.yscale.y, height, 0);
        gLayer.vertex(x, y);        
    }
  }
  
  gLayer.endShape();  
  gLayer.endDraw();
  image(gLayer, 0, 0, width, height);
}

void draw()
{  
  float x = map(mouseX, 0, width, xscale.x, xscale.y);
  float y = map(mouseY, height, 0, yscale.x, yscale.y);
  fill(255);
  rect(0, 0, 135, 105);
  fill(0);
  noStroke();
  rect(0, 0, 130, 100);
  fill(255);
  String text = "(" + round(x) + "; " + round(y) + ")";
  text(text, 0, 25);
  text("x = " + map(mouseX, 0, width, this.xscale.x, this.xscale.y), 0, 50);
  float fx = doubleFunction(map(mouseX, 0, width, this.xscale.x, this.xscale.y));
  text("f(x) = " + fx, 0, 75);
}

float doubleFunction(float x)
{
  //return pow(2.71828, x);
  return sqrt(x);
}