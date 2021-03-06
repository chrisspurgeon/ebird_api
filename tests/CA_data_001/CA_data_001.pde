// Upper left corner x is 33, y is 42 --> -124.1546008,41.9689362,
// south point x is 452, y is 774 --> -117.1349992,32.5117042

PImage bg;
JSONArray json;
JSONArray json2;
boolean dataLoaded = false;
int counter = 0;


void loadData() {
//  json = loadJSONArray("https://ebird.org/ws2.0/data/obs/US-CA/recent/cangoo?maxResults=30&key=phnhfrhb4c4t");
  json = loadJSONArray("sightings.json");
  dataLoaded = true;
}


void setup() {
  size(650, 800);
  bg = loadImage("CA.jpg");
  //  println("Time before is " + millis());
  //  json = loadJSONArray("https://ebird.org/ws2.0/data/obs/US-CA/recent/cangoo?maxResults=30&key=phnhfrhb4c4t");
  //    json = loadJSONArray("sightings.json");
  //  println("Time after is " + millis());
  println("About to call data");
  thread("loadData");
}

void draw() {
  if (dataLoaded == false) {
    print("no data yet! Try number ");
    println(counter);
    counter++;
    background(100, 255, 100);
  } else {
    println("Got Data!");
    background(bg);


    println("JSON file has " + json.size() + " reports.");
    JSONObject thisObservation;
    int howMany;
    float lat;
    float lng;
    float mapLat;
    float mapLng;

    fill(200, 0, 100, 100);

    for (int i = 0; i < json.size(); i++) {
      thisObservation = json.getJSONObject(i);
      howMany = 1;
      if (thisObservation.isNull("howMany") == false) {
        howMany = thisObservation.getInt("howMany");
      }
      lat = thisObservation.getFloat("lat");
      lng = thisObservation.getFloat("lng");
      mapLat = map(lat, 41.9689362, 32.5117042, 42, 774);
      mapLng = map(lng, -124.1546008, -117.1349992, 33, 452);
      println(mapLat + " & " + mapLng);
      ellipse(mapLng, mapLat, 10 + howMany, 10 + howMany);
    }
    println("Goodbye");
    noLoop();
  }
}
