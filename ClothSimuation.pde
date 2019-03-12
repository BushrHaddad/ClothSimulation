

boolean is_wind;

double wind_speed;

PVector wind_direction;
Cloth cloth;
// the number of particle on the height and the width 
int particles_len=30, particles_wid=30;
// the position of the middle particle 
float mid_particle_x, mid_particle_y;

void setup(){
// set the size of the screen 
size(775,400, P3D);

// create a curtain of cloth of length 300, width 300
cloth=new Cloth(300, 300,particles_len,particles_wid);
// craet the cloth,, create the particles inside the cloth and springs between them 

cloth.createCloth();
// get the position of the middle particle 
  mid_particle_x=cloth.particles_array[floor(particles_len/2)][floor(particles_wid/2)].position.x;
  mid_particle_y=cloth.particles_array[floor(particles_len/2)][floor(particles_wid/2)].position.y;
 
  
 
}

void draw(){
  // centerize the cloth 
   doTheMath();
   
   background(255);
    updating();
}
void changeClothType(){


}
void updating(){
    
  // Drawing the particles each frame 
  for(int i=0;i<cloth.particles_num_len;i++)
    {
      for(int j=0;j<cloth.particles_num_wid;j++)
      {
        
        cloth.particles_array[i][j].draw();
      }
    
    }
    
    // Drawing the springs each frame 
   for(Spring spring: cloth.springs_list){
      spring.draw();
   }

}


// Centerize the cloth
void doTheMath(){
  translate(width/2- mid_particle_x , height/2 - mid_particle_y, 0);
}
