class Goal{
  PVector goal;
  
  Goal(){
    goal = new PVector(480, 10);
    fill(255,255,0);
    ellipse(goal.x, goal.y, 10,10);
  }
  
  float goalXPos(){
    return goal.x;
  
  }
  
  float goalYpos(){
    return goal.y;
  }

}
