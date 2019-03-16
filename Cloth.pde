  class Cloth{
    
  int cloth_length, cloth_width;
  Particle [][] particles_array;
  ArrayList<Spring> springs_list;
  int particles_num_len, particles_num_wid;
  float ks=0.85;
    
  Cloth(int cloth_length, int cloth_width, int particles_num_len, int particles_num_wid){
     this.cloth_length=cloth_length;
     this.cloth_width=cloth_width;
     this.particles_num_len=particles_num_len;
     this.particles_num_wid=particles_num_wid;
    particles_array=new Particle[this.particles_num_len][this.particles_num_wid];
    springs_list=new ArrayList<Spring>();
  
  }
  
  void createCloth(){
  
    float len_step=cloth_length/(particles_num_len-1);
    float wid_step=cloth_width/(particles_num_wid-1);
    
    
    for(int i=0;i<particles_num_len;i++)
    {
      for(int j=0;j<particles_num_wid;j++)
      {
     if(i==0 &&(j==0 || j==particles_num_wid-1))
      //if(i==0)
      particles_array[i][j]=new Particle(new PVector(j*wid_step,i*len_step,0.0), true);
      else
        particles_array[i][j]=new Particle(new PVector(j*wid_step,i*len_step,0.0), false);
        
        
      }
    
    }
    
    

    
     // Create Springs
     for(int i=0;i<particles_num_len-1;i++)
    {
      for(int j=0;j<particles_num_wid-1;j++)
      {
         Spring spring1 =new Spring(particles_array[i][j], particles_array[i][j+1], 7, ks);
         Spring spring2 =new Spring(particles_array[i][j], particles_array[i+1][j], 7, ks);
         springs_list.add(spring1);
         springs_list.add(spring2);
         //# to do last row and last colums are not fully connected 
      }
    
    }
    // create the spings on the right most  side 
    for(int i=0;i<particles_num_len-1;i++){
      Spring spring1 =new Spring(particles_array[i][particles_num_wid-1], particles_array[i+1][particles_num_wid-1], 7, ks);
      springs_list.add(spring1);
    }
    // create the springs on the most down side 
    for(int i=0;i<particles_num_wid-1;i++){
      Spring spring1 =new Spring(particles_array[particles_num_len-1][i], particles_array[particles_num_len-1][i+1],7, ks);
      springs_list.add(spring1);
    
    }
   
    
    
    
  }
//  PVector calcTriangleNormal(Particle p1,Particle p2,Particle p3)
//  {
//    PVector pos1 = p1.position;
//    PVector pos2 = p2.position;
//    PVector pos3 = p3.position;

//    PVector v1 = Vec3.subVector(pos2,pos1);
//    PVector v2 = Vec3.subVector(pos3,pos1);

//    return Vec3.crossVector(v1,v2);
//  }
//void addWindForcesForTriangle(Particle p1,Particle p2,Particle p3,PVector direction)
//  {
//    PVector normal = calcTriangleNormal(p1,p2,p3);
//    PVector d = normal.normalize();
//    PVector wind = Vec3.mulVector(normal,Vec3.mulVector(d,direction));
//    p1.addForce(wind);
//    p2.addForce(wind);
//    p3.addForce(wind);
//  }
//void windForce(PVector direction)
//  {
//    for(int x = 0; x<particles_num_len-1; x++)
//    {
//      for(int y=0; y<particles_num_wid-1; y++)
//      {
//        addWindForcesForTriangle(particles_array[x+1][y],particles_array[x][y],particles_array[x][y+1],direction);
//        addWindForcesForTriangle(particles_array[x+1][y+1],particles_array[x+1][y],particles_array[x][y+1],direction);
//      }
//    }
//  }
  void update(){
  
  
  }
  
  void draw(){
    
  
  }
  
  
}
