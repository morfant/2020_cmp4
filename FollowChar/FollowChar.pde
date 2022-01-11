Mover m;
PImage canvas;
ArrayList<PVector> brightDots = new ArrayList<PVector>();

void setup() {

    size(500, 500);

    textSize(200);
    textAlign(CENTER);
    background(0);
    stroke(255);
    text("ABC", width/2, height/2);
    canvas = get();

    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {

            if (red(canvas.get(x, y)) > 0 ) {
                PVector p = new PVector(x, y);
                brightDots.add(p);
            }

        }
    }

    println(brightDots.size());

    m = new Mover();

    // background(0);
}

void draw() {

    // background(0);
    stroke(255);
    // text("ABC", width/2, height/2);

    m.update();
    // m.checkEdge();
    m.display();
}