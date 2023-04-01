class Minion {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float vigor = 0;
  
  boolean dead = false;
  boolean goalReached = false;
  boolean isBest = false;
  Brain brain;
  Goal goal;
  
  
  
  Minion(){
  
  brain = new Brain(500);
  
  position = new PVector(width/2, height-9);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  
  
}

void show(){
  
  if(isBest){
    fill(0,255,100);
    ellipse(position.x, position.y, 4,4);
  }else{
    fill(0);
    ellipse(position.x, position.y, 4,4);
  }
}

void move(){
  
  
  if (brain.directions.length > brain.step){
    acceleration = brain.directions[brain.step];
    brain.step++;
  }else{
    dead = true;
  
  }
  velocity.add(acceleration);
  velocity.limit(20);
  position.add(velocity);

}

void update(){
  
   if (!dead && !goalReached){    
     move();
     goal = new Goal();
       if(position.x < 1 || position.y < 1 || position.x > width - 1 || position.y > height -1){
        dead = true;
      }else if(dist(position.x, position.y, goal.goalXPos(), goal.goalYpos()) < 5){
        goalReached = true; //<>//
      }else if (position.x< 500 && position.y < 215 && position.x > 0 && position.y > 200) {//if hit obstacle
        dead = true;
      }else if (position.x< 800 && position.y < 415 && position.x > 300 && position.y > 400) {//if hit obstacle
        dead = true;
      }
  }
}
  
  void calculateVigor(){
    
    if(goalReached){
      vigor = 1.0/16.0 + 10000.0 /(float)(brain.step * brain.step);
    }else{
    goal = new Goal();
    float distanceToGoal = dist(position.x, position.y, goal.goalXPos(), goal.goalYpos());
    vigor = 1/(distanceToGoal * distanceToGoal);
    }
  }
  
  Minion newSpecies(){
    Minion baby = new Minion();
    baby.brain = brain.clone();
    return baby;
  
  }
}
