import urllib.request, json
#from lib.google_search_results import GoogleSearchResults

params = {
    "api_key": "fbcca12b9dc69bdd30c3bffa8d7e41a369bcdaa2b0e52b55fd7b70fc9b06d7b1",
    "engine": "google",
    "ijn": "0",
    "q": "apple",
    "google_domain": "google.com",
    "tbm": "isch",
}
request = 'https://serpapi.com/search.json?engine=google&q=apple&google_domain=google.com&ijn=0&tbm=isch&api_key=fbcca12b9dc69bdd30c3bffa8d7e41a369bcdaa2b0e52b55fd7b70fc9b06d7b1'
    response = urllib.request.urlopen(request).read()
    results = json.loads(response)
    #client = GoogleSearchResults(params)
    #results = client.get_dict()
    print(results)
    picture = results['images_results']
    print(picture)
    jpg = picture[0]['original']
    print(jpg)