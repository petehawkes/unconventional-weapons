
/*
UNCONVENTIONAL WEAPONS
Author: Pete Hawkes, http://petehawkes.com
Start: January 2013
Processing v2.0b7

*/


// ANIMAL TRACKING DATA TESTS

//
// local file saved for offline testing
//String liveTags[] = loadStrings("http://las.pfeg.noaa.gov/TOPP/TOPP_tracks010.html?species=0&zone=1");
String liveTags[] = loadStrings("data/offline.html");


String namePatternStart="<table cellpadding=\"1\"><tr><td colspan=\"2\" align=\"center\"><h2>";
String namePatternEnd = "</h2>";

String listEnd = "</table>";

println("ANIMAL TYPES TRACKED");


boolean nameFound = false;
int nameIndex;

for (int i = 0 ; i < liveTags.length; i++) {
  
   nameIndex = liveTags[i].indexOf(namePatternStart);

  
    if (nameIndex != -1) {
      //nameFound = true;
      int startIndex = nameIndex + namePatternStart.length();
      int endIndex = liveTags[i].indexOf(namePatternEnd);
      println(liveTags[i].substring(startIndex, endIndex));
      
    }
  
  
}




// http://las.pfeg.noaa.gov/TOPP/TOPP_tracks010.html?species=0&zone=1


