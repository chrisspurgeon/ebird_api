float mapWidth = 4506;
float mapHeight = 2736;
float aspectRatio = mapWidth / mapHeight;
float screenWidth;
float screenHeight;
PImage map;

void setup() {
  map = loadImage("us-map.png");
  fullScreen(2);
  screenWidth = width;
  screenHeight = height;
  println(aspectRatio);
//  image(map, 0, 0);
  println((screenWidth / screenHeight) * 1000.0);
  if (screenWidth / screenHeight >= aspectRatio) {
    map.resize(0,height);
    image(map,-50,-10);
  } else {
    map.resize(width,0);
  }
}
