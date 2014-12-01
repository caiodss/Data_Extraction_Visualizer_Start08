
//Background Setup
class dataBg {

  float bgSz;

  //constructor
  void prime(float _bgSz) {
    bgSz = _bgSz;
  }

  void update() {
    background(220);
    
    fill(255, 255, 255, 100);
    
    pushMatrix();

    rotateX(radians(90));
    translate(0, 0, 0);
    ellipse(width/2, 0, bgSz, bgSz);

    translate(0, 0, 0.1);
    fill(0, 0, 0, 30);
    ellipse(usrPos.x, usrPos.z, 40, 40);

    translate(0, 0, 0.1);
    fill(0, 0, 0, 150);
    ellipse(usrPos.x, usrPos.z, 20, 20);
    //filter(BLUR, 3);

    popMatrix();
  }
}

