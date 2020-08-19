Table table1, table2, table3;
void setup()
{
  
  size(1300, 900);
  background(119,136,153);
  println("Reading csv");
  table1 = loadTable("/Users/manasipalkar/Desktop/minard-data2.csv", "csv , header");
  println("Reading csv1");
  table2 = loadTable("/Users/manasipalkar/Desktop/minard-data3.csv", "csv , header");
  println("Reading cs2");
  table3 = loadTable("/Users/manasipalkar/Desktop/minard-data4.csv", "csv , header");
  println("Reading csv3");  
 
  pushMatrix();
translate(0, height); 
plottemperature(); 
keyReleased();
mapdraw();
plotcities();

popMatrix();
legend();
dislayheadline();


}

void draw()
{ 
}

void dislayheadline()
{
  fill(color(0,0,0));
  textSize(40);
  println("MM");
text("Napolean's March To Russia",0,100); 
//popMatrix();
}


void plotcities() {
 
 fill(color(1, 1, 1));
  int n=20;
  println("1");
  for (int i=0; i<n-1; i++)
  {
    float lon1=float(table1.getString(i, "LONC"));
    println("longitude :" +lon1);

    float lat1 = float(table1.getString(i, "LATC"));
    println("latitud e :" +lat1);
    stroke(1.0);
    strokeWeight(1.0);
    ellipse(Scaling_Longitude(lon1), Scaling_Latitude(lat1), 5, 5);
    String City = table1.getString(i, "CITY");
    text(City, Scaling_Longitude(lon1)+10, Scaling_Latitude(lat1)+10);
    println(City);
  }
}  

void mapdraw() { 
  int n= 47;
  for (int i=0; i<n-1; i++)
  {
    float latp = float(table2.getString(i, "LATP"));
    float latp1 =float(table2.getString(i+1, "LATP"));
    float longp =float(table2.getString(i, "LONP"));
    float longp1 = float(table2.getString(i+1, "LONP"));
    String dir = table2.getString(i , "DIR");
 
    strokeWeight(GetStrokeWeight(table2.getInt(i, "SURV")));
    println(dir);
    if (dir.equals("A"))
  {
    strokeWeight(GetStrokeWeight(table2.getInt(i, "SURV")));
    stroke(255,91,71); 
  
  }
   if (dir.equals("R"))
   {
     strokeWeight(GetStrokeWeight(table2.getInt(i, "SURV")));
      stroke(255,153,51); 
   
   }   
   strokeWeight(GetStrokeWeight(table2.getInt(i, "SURV")));
    line(Scaling_Longitude(longp), Scaling_Latitude(latp), Scaling_Longitude(longp1), Scaling_Latitude(latp1));
  }
} 


void legend(){ 
fill(224,224,224);
  rect(1050 , 65 , 150 ,150);
fill(color(0,0,255)); // blue box with black 
text("Survivors attack",1100,100);

fill(255,91,71);
rect(1075 , 86 , 20 ,15);
fill(color(0,0,255));
text("Survivors Retreat",1100,120);
fill(255,153,51);
rect(1075 , 105 , 20 ,15);
//fill(color(0,0,255));
//text("Division 3",1100,140);

stroke(255,91,71);
strokeWeight(3.0);
line(1060, 155, 1090, 155);
fill(color(0,0,255)); 
text("Attack",1100,160);

stroke(255,153,51);
strokeWeight(3.0);
fill(color(0,0,255));
line(1060,175,1090,175);
text("Retreat",1100,180);

stroke(1,1,1);
strokeWeight(2.0);
fill(color(0,0,255));
line(1060,195,1090,195);
text("Temperature",1100,200);
} 


void plottemperature(){  

 
  int n =9;
  
   for (int i=0; i<n-1; i++)
 {
   int temp = int(table3.getString(i , "TEMP"));
   int temp1 = int(table3.getString(i+1 , "TEMP"));
    float longc =float(table3.getString(i, "LONT"));
    float longc1 = float(table3.getString(i+1, "LONT"));
  

  stroke(0,0,0);
  strokeWeight(2.0);
  line(Scaling_Longitude(longc), Scaling_Temp(temp), Scaling_Longitude(longc1), Scaling_Temp(temp1));
  
  String Temp = table3.getString(i+1, "TEMP");
  text(Temp, Scaling_Longitude(longc1) , Scaling_Temp(temp1)+10);
  
  color(0,0,0);
  ellipse(Scaling_Longitude(longc1), Scaling_Temp(temp1), 5, 5);
  
  println(Temp +"Plotting Temperature");
 } 
}

float GetStrokeWeight(int survivor)
{
  
  if( survivor >= 30000) 
  {
    return 30.0;
  }
  if( survivor >= 20000 ) 
  {
    return 22.0;
  }
  if( survivor >= 10000) 
  {
    return 16.0;
  }
  else
  {
    return 9.0;
  }
}

float Scaling_Latitude(float latitude)
{
  latitude=(latitude-52.77)*195;
  return -latitude;
}
float Scaling_Longitude(float longitude)
{
  longitude=(longitude-23.01)*85;
  return longitude;
}
float Scaling_Temp(float temperature)
{
  temperature =(temperature-55)*2.15;
  return temperature;
}
void division(int a){
  int n = 48;
  for(int i=0 ; i<n-1 ;i++){ 
int division = int(table2.getString(i , "DIV"));
  if (a == division)
  {
    float latp = float(table2.getString(i, "LATP"));  
    float longp =float(table2.getString(i, "LONP"));
 
  stroke(0,0,0);
  strokeWeight(2.0);
  line(Scaling_Longitude(longp), Scaling_Latitude(latp), 5,5);
  }   
  }
}
//void keyReleased() {
//  clear();
//  if ( key == 1)  {
//    division(1);
//  }
//  if(key == 2){
//  division(2);
//  }
// else 
// println("No call");

//setup();
//}
