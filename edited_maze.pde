/*
Izzy G.
January 28, 2014
Simple Maze A
Original Game: http://www.openprocessing.org/sketch/425 John Kuiphoff 
Changed: size of maze, where the "car" starts, color of maze
*/

Car car;
Tile[] tiles =  new Tile[0];
 
// Build Map Array
int[][] mymap = {
 
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },  //made the maze bigger, it used to be 10x10, but not it's 13x13 
  { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1 },
  { 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1 },
  { 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1 }, 
  { 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1 },
  { 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1 },
  { 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1 },
  { 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1 },
  { 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1 },
  { 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1 },
  { 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1 },
  { 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1 },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
 
};
 
// Tile size
int tileW = 40;  //used to be 30, changed it so that it was larger
int tileH = 40;
 
void setup()
{
  size(500, 500);  //changed how large the screen is
  smooth();
 
  // Create grid
  for (int i = 0; i <= 12; i++)  //made it so that the number of rows i had fit into the screen. it used to be 9, changed it to 12
  {
    for (int j = 0; j <= 12; j++) //same as above
    {
      Tile a = new Tile(j*tileW, i*tileH, tileW, tileH, mymap[i][j]);
      tiles = (Tile[]) append(tiles, a);
    }
  }
 
  // Create car object
  car = new Car(440, 440, 40, 40, color(255, 255, 255), 40);  //the 440, 440 is where i wanted the dot to start, it used to start in the top left corner
}
 
void draw()
{
  // Set background
  background(255);  
 
  // Create grid
  for(int i = 0; i < tiles.length; i++)
  {
    tiles[i].display();
  }
 
  // Display car
  car.display();
 
}
 
void keyPressed()
{
 
  if(keyCode == UP)    {
    car.move("up");
  }
  if(keyCode == DOWN)  {
    car.move("down");
  }
  if(keyCode == LEFT)  {
    car.move("left");
  }
  if(keyCode == RIGHT) {
    car.move("right");
  }
}
 
class Car
{
  float x, y, w, h;
  color c;
  float s;
 
  Car(float tempX, float tempY, float tempW, float tempH, color tempColor, float tempSpeed)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempColor;
    s = tempSpeed;
  }
 
  void display()
  {
    fill(c);
    noStroke();
    ellipseMode(CORNER);
    ellipse(x, y, w, h);
  }
 
  void move(String direction)
  {
    if(keyPressed)
    {
      // Directions
      if(direction == "up")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i-13].v == 0.0)  //changed from `10 to 13 to fit my rows
            {
              car.y = car.y - s;
              break;
            }
          }
        }
      }
      if(direction == "down")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i + 13].v == 0.0) //changed 10 to 13 to fit my rows
            {
              car.y = car.y + s;
              break;
            }
          }
        }
      }
      if(direction == "left")
      {
 
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i-1].v == 0.0)
            {
              car.x = car.x - s;
              break;
            }
          }
        }
      }
      if(direction == "right")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((car.x == tiles[i].x) && (car.y == tiles[i].y))
          {
            if(tiles[i+1].v == 0.0)
            {
              car.x = car.x + s;
              break;
            }
          }
        }
      }
    }
  }
}
 
 
class Tile
{
  float x, y, w, h, v;
 
  Tile(float tempX, float tempY, float tempW, float tempH, int tempValue)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    v = tempValue;
  }
 
  void display()
  {
    noStroke();
    if(v == 0)
    {
      fill(100);
    }
    if(v == 1)
    {
      fill(48, 51, 116);  //changed maze color
    }
    rectMode(CORNER);
    rect(x, y, w, h);
  }
}

