
ArrayList aps;

float center;
float discAtop;

int totalApps;

float usrSz;
PVector usrPos = new PVector(0, 0, 0);
PVector primaryStemTop = new PVector (usrPos.x, usrPos.y - (discAtop - 50), usrPos.z);

cam camA = new cam();
dataBg bg = new dataBg();
usr yourself = new usr();

//Tree
appsDisc discA = new appsDisc();
stem primaryStem = new stem();

void setup() {

  smooth();

  size(800, 600, P3D);

  //define center variable
  center = width/2;
  
  //Invoke camera
  camA.prime(1);

  //Invoke Background class
  bg.prime(500);

  //Invoke user class
  yourself.prime(20);

  //Invoke Apps Disc
  aps = new ArrayList();

  discA.prime();
  primaryStem.prime();
}

void draw() {

  noStroke();

  //Camera
  camA.update();

  //Background
  bg.update();

  //User
  yourself.update();

  //Tree
  discA.update();
  primaryStem.update();
}

