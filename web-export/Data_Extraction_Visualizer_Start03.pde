

float center;
PShape stemOne;
int totalApps = 4;
PVector appPos = new PVector(0, 0, 0);

float usrSz;
PVector usrPos = new PVector(0, 0, 0);

cam camA = new cam();
dataBg bg = new dataBg();
usr yourself = new usr();

//Tree
appsDisc discA = new appsDisc();
stem primaryStem = new stem();

void setup() {
  
  //  smooth();
  size(800, 600, P3D);
  noStroke();

  center = width/2;

  //camera
  camA.prime(1);

  //background
  bg.prime(500);

  //user
  yourself.prime(20);

  //disc A
  discA.prime();
  stemOne = loadShape("stemOne.obj");
  primaryStem.prime(2);
}

void draw() {

  //camera
  camA.update();

  //Background
  bg.update();

  //User
  yourself.update();

  //Tree
  discA.update();
  primaryStem.update();

  //Light
  //  pointLight(255, 255, 255, width/2, height/2, 0);
}
class apps {
  
  float appsSz;
    
  //constructor
  void prime(float _appsSz) {
    appsSz = _appsSz;
  }

  void update() {

    pushMatrix();

    fill(20, 20, 20);
    translate(appPos.x, appPos.y, appPos.z);
    sphere(appsSz);

    popMatrix();
  }
}

class appsDisc {

  PVector discAPos = new PVector(0, 0, 0);
  float discArad = 100;

  apps[] usrApps = new apps[totalApps];

  //constructor
  void prime() {

    for (int i = 0; i < totalApps; i++) { 
      usrApps[i] = new apps();
      usrApps[i].prime(20);
    }
  }

  void update() {

    for (int i = 0; i < totalApps; i++) { 

      appPos.x = center + cos(radians(360/totalApps)*i) * discArad;
      appPos.z = sin(radians(360/totalApps)*i) * discArad;

      usrApps[i].update();
    }
  }
}


//Camera Setup
class cam {

  int camPos = 1;
  float camCircle = 0;
  PVector target = new PVector(400, usrPos.y, usrPos.z);
  PVector camEye = new PVector(0, -100, 0);
  PVector camTar = new PVector(target.x, target.y, target.z);

  //constructor
  void prime(int _camPos) { //cam selector
    camPos = _camPos;
  }

  void update() {

    if (keyPressed) {
      if (key == '1') camPos = 1;
      if (key == '2') camPos = 2;
    }

    //camPos 1 >> Z-far view

    float cam1_dist = 300;

    if (camPos == 1) {

      camera(camEye.x, camEye.y, camEye.z - cam1_dist, camTar.x, camTar.y, camTar.z, 0, 1, 0);

      camEye.x = target.x + (cos(radians(camCircle))* cam1_dist);
      camEye.z = cam1_dist + (sin(radians(camCircle))* cam1_dist);

      if (keyPressed) {
        if ( key == 'w') {
          camEye.y += 1;
        }

        if (key == 's') {
          camEye.y -= 1;
        }

        if (key == 'a') {
          camCircle += 1;
        }

        if (key == 'd') {
          camCircle -= 1;
        }
      }
    }

    //camPos 2 >> Y-far view
    if (camPos == 2) {

      float cam2_dist = 399;

      camera(camTar.x-0.01, camEye.y - cam2_dist, camEye.z - camTar.x, camTar.x, camTar.y, camTar.z, 0, 1, 0);

      if (keyPressed) {
        if ( key == 'w') {
          camEye.y += 10;
        }

        if (key == 's') {
          camEye.y -= 10;
        }
      }
    }
  }
}


//Background Setup
class dataBg {

  float bgSz;

  //constructor
  void prime(float _bgSz) {
    bgSz = _bgSz;
  }

  void update() {
    background(220);
    fill(255);
    
    pushMatrix();

    rotateX(radians(90));
    translate(0, 0, 0);
    ellipse(width/2, 0, bgSz, bgSz);

    translate(0, 0, 0.1);
    fill(0, 0, 0, 30);
    ellipse(usrPos.x, usrPos.z, 30, 30);

    translate(0, 0, 0.1);
    fill(0, 0, 0, 150);
    ellipse(usrPos.x, usrPos.z, 20, 20);
    //    filter(BLUR, 3);

    popMatrix();
  }
}

class stem {

  float stemThickness;

  //constructor
  void prime(float _stemThickness) {
    stemThickness = _stemThickness;
  }

  void update() {

    pushMatrix();

    translate(usrPos.x, usrPos.y - 50, usrPos.z);
    scale(0.05, 1, 0.05);

    shape(stemOne, 0, 0);
    popMatrix();
  }
}


//User Setup
class usr {

  //constructor
  void prime(float _usrSz) {
    usrSz = _usrSz;
  }

  void update() {
    usrPos.x = center;
    usrPos.y = - usrSz;
    usrPos.z = 0;
    
    pushMatrix();

    fill(250, 130, 40);
    translate(usrPos.x, usrPos.y, usrPos.z);
    sphere(usrSz);

    popMatrix();
  }
}


