
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
int nameLine = 0;
String animalType;

for (int i = 0 ; i < liveTags.length; i++) {
  
  
  if (nameFound) {
    
    int listEndIndex = liveTags[i].indexOf(listEnd);
    if (listEndIndex != -1) {
      
       // 
       for (int j=nameLine+3; j<i; j++) {
         int len = liveTags[j].length();
         println(trim(liveTags[j].substring(len-39, len-29)) + "," + trim(liveTags[j].substring(len-20, len-10)));
       }
      
       nameFound = false;
       
    }
    
  } else {
  
    int nameIndex = liveTags[i].indexOf(namePatternStart);
    nameLine = i;
    
    if (nameIndex != -1) {
      nameFound = true;
      int startIndex = nameIndex + namePatternStart.length();
      int endIndex = liveTags[i].indexOf(namePatternEnd);
      println(liveTags[i].substring(startIndex, endIndex));
      
      // skip the next two lines (table header, empty line);
      i+=2;
      
    }
  }
  
}




// http://las.pfeg.noaa.gov/TOPP/TOPP_tracks010.html?species=0&zone=1


