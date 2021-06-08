
 final int N_PARTITIONS = 10;
 final PVector[] grid = new PVector[int(sq(N_PARTITIONS+1))]; //sq(N_PARTITIONS+1) = the total number of grid points appear on screen, including one on the edges
 ArrayList<PVector> dots = new ArrayList<PVector>();
 int pressed_node_index;
 
 void setup(){
   size(600,360);
   background(255);
   // the loop below assigns the cordinates of the grid points to the grid array
   // order: column by column
   for(int i=0; i <= N_PARTITIONS; i++){
     for(int j=0; j <= N_PARTITIONS; j++){
      grid[i+j*(N_PARTITIONS+1)] = new PVector(i*width/N_PARTITIONS, j*height/N_PARTITIONS,0);
   } } 
   pressed_node_index = -1;
 }
 
void mouseClicked(){
  int i = index_of_min(mouseX, mouseY);
  dots.add(new PVector (grid[i].x,grid[i].y)); 
}

void mousePressed(){
  for(int i=0; i<dots.size(); i++){
  if(dist(mouseX,mouseY,dots.get(i).x,dots.get(i).y)<=5) pressed_node_index=i;
}}

void mouseReleased(){
  if(pressed_node_index != -1){
    dots.set(pressed_node_index, grid[index_of_min(mouseX,mouseY)]);
    pressed_node_index =-1;
    //The grid points need resetting due to mutable problem that changes the coordinates of grid[i] after the first time releasing a node
    for(int i=0; i <= N_PARTITIONS; i++){
     for(int j=0; j <= N_PARTITIONS; j++){
      grid[i+j*(N_PARTITIONS+1)] = new PVector(i*width/N_PARTITIONS, j*height/N_PARTITIONS,0);
   } } 
  }
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(1);
  //Drawing the grid
  for(int i =0; i <=width; i+=width/N_PARTITIONS) line(i,0,i,height);
  for(int i =0; i <=height; i+=height/N_PARTITIONS) line( 0,i,width,i);
  if(dots.size()>=1){
    strokeWeight(3);
    beginShape();
    for(int i=0; i<dots.size();i++){
      fill(0);
      circle(dots.get(i).x,dots.get(i).y,10);
      noFill();
      vertex(dots.get(i).x, dots.get(i).y);
    }
    vertex(dots.get(0).x, dots.get(0).y);
    endShape();
  }
  if(pressed_node_index != -1){
   dots.get(pressed_node_index).x=mouseX;
   dots.get(pressed_node_index).y=mouseY;
  }
  colorNodes();
}



//index_of_min returns the index of the point on the gid whose distance from the mouse clicked position is min
int index_of_min(int x, int y){ //(x,y) mouse clicked position

 float[] distance = new float[int(sq(N_PARTITIONS+1))]; //an array to store the distances from where the mouse is clicked to every point on the grid
   for(int i=0; i < int(sq(N_PARTITIONS+1)); i++)
      distance[i] = dist(x,y,grid[i].x, grid[i].y);
      
 float min_temp=distance[0];
 int index_min_temp=0;
    for(int i=0; i < int(sq(N_PARTITIONS+1)); i++){
      if(distance[i]<min_temp){
      min_temp = distance[i];
      index_min_temp = i;
      }
    }
  return index_min_temp;
}

// MOVE UP/DOWN/LEFT/RIGHT FUNCTION
void keyPressed(){
    if(keyCode==UP){
     for(int i=0; i<dots.size();i++){
      dots.get(i).y= dots.get(i).y-height/N_PARTITIONS;
     }}
    if(keyCode==DOWN){
     for(int i=0; i<dots.size();i++){
      dots.get(i).y= dots.get(i).y+height/N_PARTITIONS;
     }}
    if(keyCode==LEFT){
      for(int i=0; i<dots.size();i++){
        dots.get(i).x= dots.get(i).x-width/N_PARTITIONS;
     }}
    if(keyCode==RIGHT){
      for(int i=0; i<dots.size();i++){
        dots.get(i).x= dots.get(i).x+width/N_PARTITIONS;
    }}
}

//Function to draw color nodes at min/max cumulative distance
void colorNodes(){
  // a float array to store the cumulative distances for each node
  float[] cum_dist = new float[dots.size()];
  for(int i=0; i < cum_dist.length; i++){
    for(int j=0; j < dots.size(); j++){
      cum_dist[i]=cum_dist[i]+dist(dots.get(i).x,dots.get(i).y,dots.get(j).x,dots.get(j).y);
  }}
 
 if(dots.size() >=3){
  float max=0;
  int Index_of_max=0;
  for(int i=0; i < cum_dist.length; i++){
    if(cum_dist[i]>max){ max = cum_dist[i]; Index_of_max = i; }
  }
  
  float min=max;
  int Index_of_min=0;
   for(int i=0; i < cum_dist.length; i++){
    if(cum_dist[i]<min){ min = cum_dist[i]; Index_of_min = i; }
   }
   
  stroke(255,0,0); fill(255,0,0);
  circle(dots.get(Index_of_min).x,dots.get(Index_of_min).y,10);
  stroke(0,0,255); fill(0,0,255);
  circle(dots.get(Index_of_max).x,dots.get(Index_of_max).y,10);
}
}
