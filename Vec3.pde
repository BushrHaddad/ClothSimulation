static class Vec3
{
  
  
  
  static PVector subVector(PVector p1, PVector p2){
    
  PVector result=new PVector(p1.x-p2.x, p1.y-p2.y, p1.z-p2.z);
   return result;

}
static PVector addVector(PVector p1, PVector p2){
  PVector result=new PVector(p1.x+p2.x, p1.y+p2.y, p1.z+p2.z);
   return result;

}
static PVector mulVector(PVector p1, PVector p2){
  PVector result=new PVector(p1.x*p2.x, p1.y*p2.y, p1.z*p2.z);
   return result;

}
static PVector mulVectorbyScalar(float x, PVector p){
  PVector result=new PVector(x*p.x, x*p.y,x*p.z);
   return result;

}
static PVector divVectoroverScalar(float x, PVector p){
  PVector result=new PVector(p.x/x, p.y/x,p.z/x);
   return result;
}
static PVector divVector(PVector p1, PVector p2){
  PVector result=new PVector(p1.x/p2.x, p1.y/p2.y, p1.z/p2.z);
   return result;

}
 static void  setVector(PVector p1,float x,float y,float z){
  p1.x = x;
  p1.y = y;
  p1.z = z;
}
static PVector crossVector(PVector p1,PVector p2)
  {
    float x = p1.y * p2.z - p1.z * p2.y;
    float y = p1.z * p2.x - p1.x * p2.z;
    float z = p1.x * p2.y - p1.y * p2.x;
    PVector result = new PVector (x,y,z);
    return result;
  }
static PVector normalize(PVector p)
  {
    float l = p.x*p.x+p.y*p.y+p.z*p.z;
    PVector result = new PVector(p.x*l,p.y/l,p.z/l);
    return result;
  }
  
  
  
  
  
}
