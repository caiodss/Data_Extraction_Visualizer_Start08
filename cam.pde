
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
          camEye.y += 6;
        }

        if (key == 's') {
          camEye.y -= 6;
        }

        if (key == 'a') {
          camCircle += 3;
        }

        if (key == 'd') {
          camCircle -= 3;
        }
      }
    }

    //camPos 2 >> Y-far view
    if (camPos == 2) {

      float cam2_dist = 399;

      camera(camTar.x-0.01, camEye.y - cam2_dist, camEye.z - camTar.x, camTar.x, camTar.y, camTar.z, 0, 1, 0);

      if (keyPressed) {
        if ( key == 'w') {
          camEye.y += 6;
        }

        if (key == 's') {
          camEye.y -= 6;
        }
      }
    }
  }
}

