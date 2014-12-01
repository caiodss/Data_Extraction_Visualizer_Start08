
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
    fill(255);
    translate(usrSz/2 +3, -usrSz/2 - 6, 0);
    sphere(1);
    popMatrix();
  }
}

