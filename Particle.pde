class Particle{
public PVector position, last_position, acceleration, force, velocity;
float mass=1, gravity=9.8;
boolean lock;
float damping=0.99;

float pinned_x, pinned_y, pinned_z;
Particle(PVector position, boolean lock){

  this.position=new PVector(position.x, position.y, position.z);
  this.pinned_x=position.x;
  this.pinned_y=position.y;
  this.pinned_z=position.z;
  this.lock=lock;
  
  
  this.last_position=new PVector(this.position.x,this.position.y,this.position.z);
  this.acceleration=new PVector(0, 0, 0);
  this.velocity=new PVector(0, 0, 0);
  this.force=new PVector(0, 0, 0);
  
  
}

//Particle(Particle p1){

//  this.position=new PVector(p1.position.x, p1.position.y, p1.position.z);
//  this.last_position=new PVector(this.position.x,this.position.y,this.position.z);
//  this.acceleration=new PVector(0, 0, 0);
//  this.velocity=new PVector(0, 0, 0);
//  this.force=new PVector(0, 0, 0);
  
//}

void draw(){

computeForce();

if(this.lock)
{
  this.position.x=pinned_x;
  this.position.y=pinned_y;
  this.position.z=pinned_z;

}
point(position.x, position.y, position.z);

}

void computeForce(){

force.y=mass*gravity;
force.x=0;
force.z=0;
acceleration.x = force.x/mass;
acceleration.y = force.y/mass;
acceleration.z = force.z/mass;

velocity=subVector(position, last_position);
velocity.x*=damping;
velocity.y*=damping;
velocity.z*=damping;

float timeStep=0.15; // it was 0.05 ... then I Bisher :) changed this to 0.1 and it was good som

    float timeStepSq = timeStep * timeStep;

    // calculate the next position using Verlet Integration
    float nextX = position.x + velocity.x + 0.5 * acceleration.x * timeStepSq;
    float nextY = position.y + velocity.y + 0.5 * acceleration.y * timeStepSq;
    float nextZ = position.z + velocity.z + 0.5 * acceleration.z * timeStepSq;
    
    
    last_position.x=position.x;
    last_position.y=position.y;
    last_position.z=position.z;
    
   
    position.x=nextX;
    position.y=nextY;
    position.z=nextZ;
    
    acceleration.x = 0;
    acceleration.y = 0;
    acceleration.z = 0;
    
    




}


void applyForce(){

  
}


PVector subVector(PVector p1, PVector p2){
  PVector result=new PVector(p1.x-p2.x, p1.y-p2.y, p1.z-p2.z);
return result;

}


}
