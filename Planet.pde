class Planet {
  float radius;
  float distance;
  Planet[] planets;
  float angle;
  float orbitspeed;
  PVector v;
  
  float[] distanceArray = new float[7];
  
  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    
    globe.setTexture(img);
  }

  void orbit() {
    angle = angle + orbitspeed; 
    
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
  }
}


  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/random(level, level*2);
      
      distanceArray[0] = random((radius + r), (radius + r) * 1.3);
      distanceArray[1] = random((radius + r), (radius + r) * 1.8);
      distanceArray[2] = random((radius + r), (radius + r) * 2.3);
      distanceArray[3] = random((radius + r), (radius + r) * 2.8);
      distanceArray[4] = random((radius + r), (radius + r) * 3.3);
      distanceArray[5] = random((radius + r), (radius + r) * 3.8);
      distanceArray[6] = random((radius + r), (radius + r) * 4.3);

      
      float d = distanceArray[i];
      float o = random(0.02, 0.08);
      
      planets[i] = new Planet(r, d, o, textures[i]);
      
      if (level < 1) {
        int num = int(random(0, 3));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    //line(0, 0, 0, v.x, v.y, v.z);
    //line(0, 0, 0, p.x, p.y, p.z);
    
    translate(v.x, v.y, v.z);
    noStroke();
    fill(255);
    shape(globe);
    
    //sphere(radius);
    //ellipse(0, 0, radius*2, radius*2);

    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
  
  void overlap() {
    
  };
  
}
