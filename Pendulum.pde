float r1= 200;
float r2 = 200;
float m1 = 40;  //size
float m2 = 40;  //size
float a1 = PI/2;  //manipulate
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
//float a1_a = 0.01;
//float a2_a = -0.001;
float g =1;

float px2 =-1;
float py2 = -1;
float cx, cy;


PGraphics canvas;

void setup() {
   size(900, 600); 
   cx = width/2;
   cy = 50;
   canvas = createGraphics (width, height);
   canvas.beginDraw();
   canvas.background(30); //color
   canvas.endDraw();
 
  
}

void draw (){
  float numb1 = -g * (2*m1+m2)*sin(a1);
  float numb2 = -m2*g*sin(a1-2*a2);
  float numb3 = -2*sin(a1-a2)*m2;
  float numb4= a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r1*(2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (numb1+numb2+numb3*numb4)/den;
  
  
  numb1 = 2*sin(a1-a2);
  numb2 = (a1_v*a1_v*r1*(m1+m2));
  numb3 = g*(m1+m2)*cos(a1);
  numb4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r2*(2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (numb1*(numb2+numb3+numb4))/den;
  
  
   //background (255);
   
   image(canvas, 0,0);
   stroke (0);
   strokeWeight (2);
   
   
   translate (cx, cy);
   
   float x1 = r1 * sin(a1);
   float y1 = r1 * cos(a1);
   
   float x2 = x1 + r2 * sin(a2);
   float y2 = y1 + r2 * cos(a2);
   
   
   
   
   line (0, 0, x1, y1);
   fill(0);
   ellipse(x1,y1,m1,m1);
  
  
   line(x1, y1, x2, y2);
   fill(0);
   ellipse(x2,y2,m2,m2);
   
   a1_v +=a1_a;
   a2_v -=a2_a;
   a1 +=a1_v;
   a2 -=a2_v;
  
   a1_v *= 0.999;  //slow down
   a2_v *=0.999;
   
   canvas.beginDraw();
   canvas.translate(cx, cy);
   canvas.strokeWeight(2);
   canvas.stroke(#00CED1);
   if (frameCount>1){
   canvas.line(px2, py2,x2, y2); 
   }
   canvas.endDraw();
 
   px2 =x2;
   py2 = y2;
}
