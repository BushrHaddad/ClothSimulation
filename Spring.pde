class Spring{

float ks, damping_factor, rest_length;
Particle p1,p2;
boolean hidden=false;

  
Spring(Particle p1, Particle p2, float rest_length, float ks ){
this.p1=p1;
this.p2=p2;
this.rest_length=rest_length;
this.ks=ks;
}

void draw(){
  solve();
if(!hidden)
    line(p1.position.x, p1.position.y, p2.position.x, p2.position.y);
}

void solve(){
 // calculate the distance between the two PointMasss
    float diffX = p1.position.x - p2.position.x;
    float diffY = p1.position.y - p2.position.y;
    float diffZ = p1.position.z - p2.position.z;
    float d = sqrt(diffX * diffX + diffY * diffY+ diffZ * diffZ);
    // find the difference, or the ratio of how far along the restingDistance the actual distance is.
    float difference = (rest_length - d) / d;
    

    
    // Inverse the mass quantities
    float im1 = 1 / p1.mass;
    float im2 = 1 / p2.mass;
    float scalarP1 = (im1 / (im1 + im2)) * ks;
    float scalarP2 = ks - scalarP1;
    
    // Push/pull based on mass
    // heavier objects will be pushed/pulled less than attached light objects
    p1.position.x += diffX * scalarP1 * difference;
    p1.position.y += diffY * scalarP1 * difference;
    p1.position.z += diffZ * scalarP1 * difference;
    
    p2.position.x -= diffX * scalarP2 * difference;
    p2.position.y -= diffY * scalarP2 * difference;
    p2.position.z -= diffZ * scalarP2 * difference;

}


}
