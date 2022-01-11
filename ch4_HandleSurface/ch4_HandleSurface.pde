//https://stackoverflow.com/a/19540268
import java.awt.Point;
import java.awt.MouseInfo;

java.awt.Insets insets;
Point mouse, win;

int[] w = {220, 100};

Object o;
javax.swing.JFrame frame;

void setup() {
  //println(surface); // instance of processing.awt.PSurfaceAWT
  surface.setSize(400, 400);
  surface.setLocation(w[0], w[1]);
  
  // https://discourse.processing.org/t/getlocation-of-the-sketch/5763/4
  o = ((processing.awt.PSurfaceAWT.SmoothCanvas)surface.getNative()).getFrame();
  frame = (javax.swing.JFrame)(o); 
}

void draw() {
  setFrame();
  if (insideFrame()) {
    background(200);
  } else {
    background(0);
  }  

}

//set position of frame & mouse
void setFrame() 
{  
  mouse = MouseInfo.getPointerInfo().getLocation();
  win = frame.getLocation();

  if (!frame.isUndecorated()) {
    //add borders of window
    insets = frame.getInsets();
    win.x += insets.left;
    win.y += insets.top;
  }
}

boolean insideFrame() {
  boolean in = false;
  if (mouse.x-win.x >= 0 && width >= mouse.x-win.x)
    if (mouse.y-win.y >= 0 && height >= mouse.y-win.y)
      in = true;

  return in;
}
