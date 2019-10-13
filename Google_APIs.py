import urllib.request, json
filename = 'countynames.txt'
with open(filename) as f:
    content = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
line = [x.strip() for x in content]
array = []
p = 0
for i in line:
    #print('"' + i.partition(' ')[0] + ' County",')
    destination = i
    endpoint = 'https://maps.googleapis.com/maps/api/directions/json?'
    api_key = 'AIzaSyAae9XuxUasMbqrUUDNOAr1rFN9wpPDu4M'
#Enter your location
    origin = 'Purdue+University'
#destination = 'Purdue+' + input('Where do you want to go?: ').replace(' ','+')
#Code in the destinations
    #print(destination)
    destination = destination.replace('\n','')
    destination = destination.replace('–','+')
    #print(destination)
    destination = destination.replace(' ', '+') + '+Town+Hall+Indiana'
    #print(destination)
    destination = destination.replace('+++','+')
    #print(destination)
    mode = 'walking'
#Building the URL for the request
    nav_request = 'origin={}&destination={}&mode={}&key={}'.format(origin,destination,mode,api_key)
    request = endpoint + nav_request
#Sends the request and reads the response.
    response = urllib.request.urlopen(request).read()
#Loads response as JSON
#print(response)
#print('hi')
    directions = json.loads(response)
#print(directions)
    routes = directions['routes']
#duration = directions['duration']
    legs = routes[0]['legs']
#print(directions)
    time = legs[0]['duration']['text']
    location = legs[0]['end_address']
#print("It will take " + time + ".")
#location works
    array.append(location)

    print('"' + location + '",')
    p = p+1
print(p)
#we have 92 city counties



