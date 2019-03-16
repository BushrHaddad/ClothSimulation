class Particle{
public PVector position, last_position, acceleration, velocity;
float mass=1;
boolean lock;

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
  
  
}
void draw(){
// Pin this particle 
if(this.lock)
{
  Vec3.setVector(position,pinned_x,pinned_y,pinned_z);

}
// Draw the particle 
point(position.x, position.y, position.z);

}

// we are going to apply this force on this particle and move the particle according to this force 
void computeForce(float timestep, PVector force){

    this.addForce(force);


    velocity=Vec3.subVector(position, last_position);
    velocity = Vec3.mulVectorbyScalar(0.99,velocity);

    float timeStepSq = timestep * timestep;

    // calculate the next position using Verlet Integration
    float nextX = position.x + velocity.x + 0.5 * acceleration.x * timeStepSq;
    float nextY = position.y + velocity.y + 0.5 * acceleration.y * timeStepSq;
    float nextZ = position.z + velocity.z + 0.5 * acceleration.z * timeStepSq;
    
    
    Vec3.setVector(last_position,position.x,position.y,position.z);
    Vec3.setVector(position,nextX,nextY,nextZ);
    
    
    // reset the acceleration vector 
    Vec3.setVector(acceleration,0,0,0);    




}

void addForce(PVector force)
{
  acceleration = Vec3.addVector(acceleration,Vec3.mulVectorbyScalar(mass,force));
}


}
