class stem {

  float stemThickness;

  //constructor
  void prime() {
  }

  void update() {

    stroke(0);

    //define Main stem top
    primaryStemTop.x = usrPos.x;
    primaryStemTop.y = usrPos.y - (discAtop - 80);
    primaryStemTop.z = usrPos.z;

    line(usrPos.x, usrPos.y, usrPos.z, 
    primaryStemTop.x, primaryStemTop.y, primaryStemTop.z
      );
  }
}

