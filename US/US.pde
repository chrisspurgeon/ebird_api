float mapWidth = 4506;
float mapHeight = 2736;
float aspectRatio = mapWidth / mapHeight;
float screenWidth;
float screenHeight;
PImage map;
PFont loadingFont;
String loadingMessage = "Loading....";
String listURL = "https://ebird.org/ws2.0/product/lists/US?maxResults=100&key=phnhfrhb4c4t";
float loadingMessageWidth;
float loadingMessageX;
float loadingMessageY;
float elapsedSeconds;
boolean printLoadingMessage = true;
JSONArray lists;
boolean JSONLoaded = false;

void setup() {
  map = loadImage("us-map.png");
  fullScreen(2);
  screenWidth = width;
  screenHeight = height;
  loadingFont = loadFont("AmericanTypewriter-60.vlw");
  textFont(loadingFont);
  loadingMessageWidth = textWidth(loadingMessage);
  loadingMessage = "Loading";
  loadingMessageX = (screenWidth / 2.0) - (loadingMessageWidth / 2.0);
  loadingMessageY = screenHeight / 2.0 - 30;
  thread("retrieveLists");
}

void draw() {
  if (screenWidth / screenHeight >= aspectRatio) {
    map.resize(0, height);
  } else {
    map.resize(width, 0);
  }
  fill(20);
  image(map, 0, 0);
  if (printLoadingMessage == true) {
    printLoadingMessage();
  }
  if (JSONLoaded == true) {
    printLoadingMessage = false;
  }
}

void printLoadingMessage() {
  fill(100, 100, 100, 200);
  rect(0, 0, screenWidth, screenHeight);
  fill(0);
  float timer = int(millis() / 200);
  if (timer % 5 == 0) {
    text(loadingMessage, loadingMessageX, loadingMessageY);
  } else if (timer % 5 == 1) {
    text(loadingMessage + ".", loadingMessageX, loadingMessageY);
  } else if (timer % 5 == 2) {
    text(loadingMessage + "..", loadingMessageX, loadingMessageY);
  } else if (timer % 5 == 3) {
    text(loadingMessage + "...", loadingMessageX, loadingMessageY);
  } else if (timer % 5 == 4) {
    text(loadingMessage + "...", loadingMessageX, loadingMessageY);
  }
}

void retrieveLists() {
//  delay(5000);
  lists = loadJSONArray(listURL);
  println("lists retrieved!");
  println(lists);
  JSONLoaded = true;
}
void printDot(float lat, float lng) {
}
