class appsDisc {

  PVector discAPos = new PVector(0, 0, 0);
  PVector appPos_disc = new PVector(0, 0, 0);
  float discArad = 100;
  float totalApps;
  int maxApps = 10;
  float rotSpeed;
  float discAcircle;

  //constructor
  void prime() {
  }

  void update() {

    rotSpeed -= 0.12;

    for (int i = aps.size () -1; i >= 0; i--) {
      if (i < maxApps) {        

        apps applications = (apps) aps.get(i);
        totalApps = aps.size();

        //set disc radius
        if (totalApps <= 1) discArad = 0;
        else discArad = map(totalApps, 1, maxApps, 30, 100);

        //set disc height
        discAtop = map(totalApps, 1, maxApps, 100, 150);

        //define apps positions within disc A 
        discAcircle = ((rotSpeed/100) + radians(360/totalApps)*i);

        appPos_disc.x = center + cos(discAcircle) * discArad;
        appPos_disc.y = - (discAtop + 1);
        appPos_disc.z = sin(discAcircle) * discArad;

        //store apps' positions in PVector array "getAppsPos"

        getAppsPos[i].x = appPos_disc.x;
        getAppsPos[i].y = appPos_disc.y;
        getAppsPos[i].z = appPos_disc.z;

        //connect with lines
        stroke(0, 0, 0, 100);
        line (primaryStemTop.x, primaryStemTop.y, primaryStemTop.z, 
        appPos_disc.x, appPos_disc.y, appPos_disc.z);

        //render apps
        noStroke();
        applications.prime(20, appPos_disc.x, appPos_disc.y, appPos_disc.z);
        applications.update();
      }
    }

    if (keyPressed && aps.size() +1 <= maxApps) {
      if (key == 'u') {
        aps.add(new apps());
      }
    }
  }
}

