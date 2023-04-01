class Horde{
 Minion[] minions;
 float vigorSum; 
 
 int gen = 1;
 int bestMinion;
 int minStep = 500;
 
 Horde(int size){
   minions = new Minion[size];
   
   for(int i = 0; i < minions.length; i++){
     minions[i] = new Minion();
   }
 }

 void show(){
   for(int i =1; i < minions.length; i++){
     minions[i].show();
   
   }
   minions[0].show();
 }

 void update(){ //<>//
   for(int i =0; i < minions.length;i++){
     if(minions[i].brain.step > minStep){
       minions[i].dead = true;
     }else{
       minions[i].update();
     }
   }
 
 }
 
 void calculateVigor(){
   for (int i = 0; i < minions.length; i++){
     minions[i].calculateVigor();
   }
 
  //<>//
 }
 
 boolean allMinionsDead(){ //<>//
   for (int i = 0; i < minions.length; i ++){ //<>//
     if (!minions[i].dead && !minions[i].goalReached){ //<>//
       return false;
     }
   }
   return true;
 }
 
 void naturalSelection(){
   Minion[] newMinion = new Minion[minions.length];
   setBestMinion();
   calculateVigorSum();
   
   newMinion[0] = minions[bestMinion].newSpecies(); //<>//
   newMinion[0].isBest = true;
   
   for(int i = 1; i <newMinion.length; i ++){
   
     Minion parent = selectParent();
     
     newMinion[i] = parent.newSpecies();
   } //<>//
   gen++;
   minions = newMinion.clone();
 }
 
 void calculateVigorSum(){
   vigorSum = 0;
   for (int i = 0; i < minions.length; i ++){
     vigorSum = minions[i].vigor;
   }  
 }
 
 Minion selectParent(){
   
   float randomSelection = random(vigorSum);
   
   float baseSum = 0;
   for (int i = 0; i <minions.length; i++){
     baseSum += minions[i].vigor;
     if (baseSum > randomSelection){
     return minions[i];
     }
   }
   
   return null;
 }
 
 void MutateMinionsBabies(){
  
   for (int i = 1; i < minions.length; i++){
       minions[i].brain.mutate();
   
   }
 }
 
 void setBestMinion(){
   
   float max = 0;
   int maxIndex = 0;
   for(int i = 0; i < minions.length; i++){
     
     if(minions[i].vigor > max){
       max = minions[i].vigor;
       maxIndex = i;
     }     
   }
   bestMinion = maxIndex;
   if(minions[bestMinion].goalReached){
     minStep = minions[bestMinion].brain.step;
   }
 }
}
