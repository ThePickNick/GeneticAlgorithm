Horde test;
Goal goal;


void setup(){
  size(800,800);
  test = new Horde(25);
  

}

void draw(){
  background(255);
  goal = new Goal();
  fill (200, 200, 200);
  rect(0, 200, 500, 15);
  
  fill (200, 200, 200);
  rect(300, 400, 800, 15);
  
  print();
  if(test.allMinionsDead()){
    test.calculateVigor();
    test.naturalSelection();
    test.MutateMinionsBabies();
  
  } else { //<>//
   test.update();
   test.show();
  }
  
  fill(0); 
  text("Generation " + test.gen, 10, height - 20);
}
