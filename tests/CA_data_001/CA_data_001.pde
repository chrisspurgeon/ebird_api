// Upper left corner x is 33, y is 42 --> -124.1546008,41.9689362,
// south point x is 452, y is 774 --> -117.1349992,32.5117042

PImage bg;
JSONArray json;

void setup() {
  size(650, 800);
  bg = loadImage("CA.jpg");
  //  json = loadJSONArray("https://ebird.org/ws2.0/data/obs/CA/recent/cangoo?maxResults=30&key=phnhfrhb4c4t");
  json = loadJSONArray("sightings.json");
}

void draw() {
  background(bg);

  println("JSON file has " + json.size() + " reports.");
  JSONObject thisObservation;
  int howMany;
  float lat;
  float lng;
  float mapLat;
  float mapLng;

  fill(200, 0, 100,100);

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
    ellipse(mapLng, mapLat, 10 + howMany, 10 + howMany);
  }
  println("Goodbye");


  noLoop();
}
