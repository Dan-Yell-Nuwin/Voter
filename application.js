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

//func callAPI(address){

//for(var i = 0; i < address.length;i++){

    //var county;

fetch('https://www.googleapis.com/civicinfo/v2/voterinfo?address=' + address + '&key=AIzaSyB4ocz-4NHCGXM8cTfXsYRSVU6Wlz_3g4o')
            .then(function(response)
            { return response.json(); })
            .then(function(json) {
                var localCandidates = [];
                for (var contest in json.contests) {
                    var role = json.contests[contest].office;
                    var candidates = {}
                    candidates[role] = json.contests[contest].candidates;
                    localCandidates.push(candidates);
                }
                writeLocalRepresentativeData(localCandidates);
          });
          /*
          county
            JSONArray
              office, name, social media, number, address
          */

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
            var str = "Political Database/National/";
            var newObj = {};
            newObj[k] = title[k];
            firebase.database().ref(str).set(newObj);
        }
    }
}

function writeLocalRepresentativeData(candidates) {
    for (var i in candidates) {
        var position = candidates[i];
        console.log(position);
        for (var j in position) {
            var str = "Political Database/Local/" + j;
            var newObj = {};
            newObj[j] = position[j];
            firebase.database().ref(str).set(newObj);
        }
    }
}
