// Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyA6Cw1zvXTXy7v79SLj681ZNFfkSOhHy_g",
    authDomain: "voter-4132c.firebaseapp.com",
    databaseURL: "https://voter-4132c.firebaseio.com",
    projectId: "voter-4132c",
    storageBucket: "voter-4132c.appspot.com",
    messagingSenderId: "436270543492",
    appId: "1:436270543492:web:f950b7921c76885accc8d1",
    measurementId: "G-LNZGT6V25Q"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();


var addresses = ["Adams County, IN, USA", "200 E Berry St #470, Fort Wayne, IN 46802, USA", "234 Washington St, Columbus, IN 47201, USA", "307 E 5th St, Fowler, IN 47944, USA", "700 N Walnut St, Hartford City, IN 47348, USA", "112 Courthouse Sq, Lebanon, IN 46052, USA", "200 Commercial St, Nashville, IN 47448, USA", "201 S Union St, Delphi, IN 46923, USA", "14 Golfview Dr, Logansport, IN 46947, USA", "2209 Dutch Ln, Jeffersonville, IN 47130, USA", "105 E National Ave, Brazil, IN 47834, USA", "N Co Rd O, Frankfort, IN 46041, USA", "102 3rd St, English, IN 47118, USA", "200 E Walnut St, Washington, IN 47501, USA", "349 Walnut St, Lawrenceburg, IN 47025, USA", "312 S Wilder St, Greensburg, IN 47240, USA", "DeKalb County, IN, USA", "300 N High St, Muncie, IN 47305, USA", "Jasper, IN, USA", "Elkhart County 4-H Fairgrounds, 17746 County Rd 34, Goshen, IN 46528, USA", "30th St & Park Ave, James Robert'S Bldg, Connersville, IN 47331, United States", "904 E Main St, New Albany, IN 47150, USA", "1327 2nd St, Covington, IN 47932, USA", "459 Main St, Brookville, IN 47012, USA", "815 Main St, Rochester, IN 46975, USA", "709 N Embree St, Princeton, IN 47670, USA", "101 E 4th St, Marion, IN 46952, USA", "616 E Furnace Rd, Bloomfield, IN 47424, USA", "12880 E 146th St, Noblesville, IN 46060, USA", "1555 E Main St, Greenfield, IN 46140, USA", "219 N Capitol Ave, Corydon, IN 47112, USA", "865 E Main St, Danville, IN 46122, USA", "3637 IN-3, New Castle, IN 47362, USA", "3437 W Sycamore St, Kokomo, IN 46901, USA", "201 N Jefferson St, Huntington, IN 46750, USA", "111 S Main St #108, Brownstown, IN 47220, USA", "115 W Washington St, Rensselaer, IN 47978, USA", "806 E Votaw St, Portland, IN 47371, USA", "Hall, Gregg Township, IN 46157, USA", "24 N Pike St, Vernon, IN 47282, USA", "5 E Jefferson St, Franklin, IN 46131, USA", "1377 Hart St, Vincennes, IN 47591, USA", "121 N Lake St, Warsaw, IN 46580, USA", "1201 N 00Ew, LaGrange, IN 46761, USA", "220 S Main St, Crown Point, IN 46307, USA", "801 Michigan Ave, La Porte, IN 46350, USA", "1102 16th St, Bedford, IN 47421, USA", "1034 Main St, Anderson, IN 46016, USA", "200 E Washington St, Indianapolis, IN 46204, USA", "124 N Michigan St, Plymouth, IN 46563, USA", "221 Low St, Shoals, IN 47581, USA", "35 S Broadway, Peru, IN 46970, USA", "401 N Morton St, Bloomington, IN 47401, USA", "100 E Main St, Crawfordsville, IN 47933, USA", "10 E Washington St, Martinsville, IN 46151, USA", "304 E Seymour St, Kentland, IN 47951, USA", "211 E Park Dr, Albion, IN 46701, USA", "Rising Sun, IN 47040, USA", "110 N Gospel St, Paoli, IN 47454, USA", "364 S East St, Spencer, IN 47460, USA", "401 E Ohio St, Rockville, IN 47872, USA", "1140 31st St, Tell City, IN 47586, USA", "801 Main St, Petersburg, IN 47567, USA", "711 Calumet Ave, Valparaiso, IN 46383, USA", "300 Main St #115, Mt Vernon, IN 47620, USA", "112 E Main St #310, Winamac, IN 46996, USA", "715 S Co Rd 100 E, Greencastle, IN 46135, USA", "113 E Washington St # 1, Winchester, IN 47394, USA", "128 N Main St, Versailles, IN 47042, USA", "101 E 2nd St #209, Rushville, IN 46173, USA", "1045 W Sample St, South Bend, IN 46619, USA", "4029 S U.S. Hwy 31, Scottsburg, IN 47170, USA", "38 E Washington St, Shelbyville, IN 46176, USA", "200 Main St #8, Rockport, IN 47635, USA", "55 E Lake St, Knox, IN 46534, USA", "210 N Public Square, Angola, IN 46703, USA", "Sullivan County, IN, USA", "210 Ferry St, Vevay, IN 47043, USA", "2nd, 301 Main St, Lafayette, IN 47901, USA", "124 S Main St, Sharpsville, IN 46068, USA", "26 W Union St # 105, Liberty, IN 47353, USA", "825 Sycamore St # 216, Evansville, IN 47708, USA", "Hillsdale, IN 47854, USA", "17 Harding Ave #102, Terre Haute, IN 47807, USA", "202 S Wabash St, Wabash, IN 46992, USA", "Park Ave, Williamsport, IN 47993, USA", "135 S 2nd St, Boonville, IN 47601, USA", "99 Public Square # 102, Salem, IN 47167, USA", "Wayne County, IN, USA", "211 Water St ste b, Bluffton, IN 46714, USA", "405 E Washington St, Monticello, IN 47960, USA", "101 E Van Buren St # 10, Columbia City, IN 46725, USA"]; //county addresses (Many of these don't run appropriately with the API)

for (add in addresses) { //goes through every address to update representatives / candidates indiidually
    fetch('https://www.googleapis.com/civicinfo/v2/voterinfo?address=' + addresses[add] + '&key=AIzaSyB4ocz-4NHCGXM8cTfXsYRSVU6Wlz_3g4o')
                .then(function(response)
                { return response.json(); })
                .then(function(json) {
                    var pollingLocation = json.pollingLocations[0]; //stores closes polling lcoation, which will be inserted for the user.
                    firebase.database().ref("Polling Information").set({
                        address: pollingLocation.address,
                        hours: pollingLocation.pollingHours
                    });
                    var localCandidates = [];
                    for (var contest in json.contests) {
                        var role = json.contests[contest].office;
                        var candidates = {}
                        candidates[role] = json.contests[contest].candidates;
                        localCandidates.push(candidates);
                    }
                    writeLocalRepresentativeData(localCandidates);
              });


      fetch('https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyB4ocz-4NHCGXM8cTfXsYRSVU6Wlz_3g4o&address=' + addresses[add])
              .then(function(response)
              { return response.json(); })
              .then(function(json) {
              var inOffice = [];
              for (var i in json.offices) {
                var indices = json.offices[i].officialIndices;
                for (var k = 0; k < indices.length; k++) {
                    var position =  json.offices[i].name;
                    var newObj = {};
                    newObj[position] = json.officials[indices[k]];
                    inOffice.push(newObj);
                }
              }
              writeNationalStateData(inOffice);

            });
}
function writeNationalStateData(representatives) {

    for (var rep in representatives) {
        var title = representatives[rep];
        for (var k in title) {
            var replaced = k.replace(/\./g, '');
            var str;
            if (k.includes('U.S.') || k.includes('United States') && !k.includes("Vice")) {
                str = "Political Database/National/" + replaced;
            }
            else if (k.includes('IN') || k.includes('Indiana')) {
                str = "Political Database/State/" + replaced;
            }
            else break;
            try {
                firebase.database().ref(str).set({
                    name: title[k].name,
                    party: title[k].party,
                    channels: title[k].channels,
                    url: title[k].urls[0],
                    photo: title[k].photoUrl
                });
            } catch (err) { //if not all information requested above is available, only essential information will be displayed: party and name
                firebase.database().ref(str).set({
                    name: title[k].name,
                    party: title[k].party
                });
            }
        }
    }
}

function writeLocalRepresentativeData(candidates) {
    for (var i in candidates) {
        var position = candidates[i];
        for (var j in position) {
            var str = "Political Database/Local/" + j;
            firebase.database().ref(str).set(position[j]);
        }
    }
}
