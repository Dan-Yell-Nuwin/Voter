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


var counties = []
var address = ["1101 3rd Street, West Lafayette, IN 47906"]

fetch('https://www.googleapis.com/civicinfo/v2/voterinfo?address=' + address + '&key=AIzaSyB4ocz-4NHCGXM8cTfXsYRSVU6Wlz_3g4o')
            .then(function(response)
            { return response.json(); })
            .then(function(json) {
                var pollingLocation = json.pollingLocations[0];
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


  fetch('https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyB4ocz-4NHCGXM8cTfXsYRSVU6Wlz_3g4o&address=' + address)
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
            } catch (err) {
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
