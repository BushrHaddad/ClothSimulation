

boolean is_wind;
float gravity=9.8;
double wind_speed;
int t=0;
 PVector force=new PVector(0,0,0); 
Cloth cloth;
// the number of particle on the height and the width 
int particles_len=40, particles_wid=40;
// the position of the middle particle 
float mid_particle_x, mid_particle_y;

//AdaptiveTimeStep parameters 
long previousTime;
long currentTime;
int fixedDeltaTime = 100;
float fixedDelatTimeSeconds = (float)fixedDeltaTime / 1000.0;
int leftOverDeltaTime = 0;
//Wind Direction
PVector wind_direction = new PVector(0,-0.2,0);

void setup(){
// set the size of the screen 
size(1000,700, P3D);

// create a curtain of cloth of length 300, width 300
cloth=new Cloth(500, 500,particles_len,particles_wid);
// craet the cloth,, create the particles inside the cloth and springs between them 

cloth.createCloth();
// get the position of the middle particle 
  mid_particle_x=cloth.particles_array[floor(particles_len/2)][floor(particles_wid/2)].position.x;
  mid_particle_y=cloth.particles_array[floor(particles_len/2)][floor(particles_wid/2)].position.y;
 
  
 
}
boolean g=false;
void draw(){
  // centerize the cloth 
  
   
   doTheMath();
   background(255);
    updating();
    t+=100;
    t/=100;
    g=!g;
  
}
void changeClothType(){


}
void updating(){
  currentTime = millis();
  long deltaTimeMS = currentTime - previousTime;
  int timeStepAmt = (int)((float)(deltaTimeMS + leftOverDeltaTime) / (float)fixedDeltaTime);
  // limit the timeStepAmt to prevent potential freezing
    timeStepAmt = min(timeStepAmt, 5);
    
    // store however much time is leftover for the next frame
    leftOverDeltaTime = (int)deltaTimeMS - (timeStepAmt * fixedDeltaTime);
for (int iteration = 1; iteration <= timeStepAmt; iteration++){
  // Drawing the particles each frame 
  
  for(int i=0;i<cloth.particles_num_len;i++)
    {
      for(int j=0;j<cloth.particles_num_wid;j++)
      {
        // this is the force of gravity, we will apply it on each particle 
       // PVector xx=Vec3.crossVector(new PVector(0,sin(t)*100,),new PVector(1,1,1));
       PVector xx=new PVector();
       if(g)
         if(i>=(cloth.particles_num_len-1)/5&& j>20)
         xx=new PVector(sin(t)*20,cloth.particles_array[i][j].mass*gravity,0);
        else 
           
           xx=new PVector(0,cloth.particles_array[i][j].mass*gravity,0);
        
       // print(xx.x+" "+xx.y+" "+xx.z+"\n");
        cloth.particles_array[i][j].computeForce(0.1, xx);   
        cloth.particles_array[i][j].draw();
      
          
        
      }
    
    }
    
    // Drawing the springs each frame 
   for(Spring spring: cloth.springs_list){
      spring.draw();
   }
    }

}
void keyPressed() {
 if ((key == 'g') || (key == 'G'))
 {
   gravity=3;
 }
}



// Centerize the cloth
void doTheMath(){
  
  translate( (width/2 - (particles_wid * 9)/2) , 0);
  translate( 0,(height/2 - (particles_len * 9)/2));
}
