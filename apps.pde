
class apps {

  PFont appTitle;

  float appsSz;
  PVector appPos = new PVector(0, 0, 0);

  //constructor
  void prime(float _appsSz, float _appPosX, float _appPosY, float _appPosZ) {
    appsSz = _appsSz;
    appPos.x = _appPosX;
    appPos.y = _appPosY;
    appPos.z = _appPosZ;

    appTitle = loadFont("Htitle24.vlw");
  }

  void update() {

    fill(0);

    //black sphere
    pushMatrix();
    translate(appPos.x, appPos.y, appPos.z);
    sphere(appsSz);
    popMatrix();

    //App title
    pushMatrix();
    rotateY(HALF_PI);
    //    if(mouseX <= screenX(
    textMode(SHAPE);
    //    text("App Title", 25, 15, 15);
    popMatrix();



    //cast shadow
    pushMatrix();
    translate(appPos.x, appPos.y, appPos.z);
    translate(0, discAtop, 0);
    rotateX(radians(90));
    fill(map(discAtop, 90, 150, 210, 228));
    ellipse(0, 0, map(discAtop, 100, 150, 50, 70), map(discAtop, 100, 150, 50, 70));
    popMatrix();
  }
}

