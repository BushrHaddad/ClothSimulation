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
     if((i==0&&j==0) || (i==0&&j==particles_num_wid-1))
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
         Spring spring1 =new Spring(particles_array[i][j], particles_array[i][j+1], 9.5, ks);
         Spring spring2 =new Spring(particles_array[i][j], particles_array[i+1][j], 9.5, ks);
        // Spring spring3 =new Spring(particles_array[i][j], particles_array[i+1][j+1], 11, 0.5);
         springs_list.add(spring1);
         springs_list.add(spring2);
        // springs_list.add(spring3);
         
         //# to do last row and last colums are not fully connected 
      }
    
    }
    //  for(int i=particles_num_len-2;i>0;i--)
    //{
    //  for(int j=particles_num_wid-1;j>0;j--)
    //  {
    //     Spring spring1 =new Spring(particles_array[i][j], particles_array[i+1][j-1], 11, 0.5);
    //     springs_list.add(spring1);
         
    //     //# to do last row and last colums are not fully connected 
    //  }
    
    //}
    // create the spings on the right most  side 
    for(int i=0;i<particles_num_len-1;i++){
      Spring spring1 =new Spring(particles_array[i][particles_num_wid-1], particles_array[i+1][particles_num_wid-1], 9.5, ks);
      springs_list.add(spring1);
    }
    // create the springs on the most down side 
    for(int i=0;i<particles_num_wid-1;i++){
      Spring spring1 =new Spring(particles_array[particles_num_len-1][i], particles_array[particles_num_len-1][i+1],9.5, ks);
      springs_list.add(spring1);
    
    }
   
    
    
    
  }
  void update(){
  
  
  }
  
  void draw(){
    
  
  }
  
  
}
