# Mhacks12
Aiming to reduce political bias and raise political awareness, we have built Voter - an iOS application.

![gallery](https://user-images.githubusercontent.com/22580992/69933049-5cf0e900-149b-11ea-8df5-5c004676621d.jpg)
![gallery-2](https://user-images.githubusercontent.com/22580992/69933068-6aa66e80-149b-11ea-987e-b91cbfce3648.jpg)

It is hard to find unbiased, reliable information in the Internet, specially when regarding politics. To reduce this issue,
we decided to provide a simple, easy-to use iOS app that provides you with data such as your current representatives and their
competitors in future election. Candidates' information are provided at local, state and federal levels, including background descriptions,
social media links and current office held. 

To acquire the data for this application, we made extensive use of the Civic Information API (https://developers.google.com/civic-information/),
which included most of the essential information we needed.

#What's your Inspiration
One of the main issues with voting today is the underwhelming amount of students and young adults ages between 18 and 29, having their voices neglected in society. As young college students ourselves eligible to vote, we are confused as to whom which candidate we should elect to represent us. With the election coming up around the corner, we decided to develop an app that voters could use to view candidates either in their local area, state, and country.

#What does it do?
In this app, users will have an unbiased opportunity to preview which candidates will be running for the upcoming election and see their profiles, including their social media, news articles, and photos. Instead of sorting by political party, we instead hide this information by default and offer the user the chance to reveal this information to further remove political bias. In addition to collecting the most recent news articles based on that candidate, we also wanted to remove any possible bias from that article. By utilizing {}, we were able to provide concise summaries that were unbiased and would be able to deliver pertinent information to our users. Afterward, users could also then check if they were registered to vote. If so, users could then be redirected to the nearest polling location.

#How we built it
We used a geolocation and direction API to convert a list of counties in a given state into street addresses that could be then used with the Google Civic-API to retrieve each election candidate data. Utilizing the Civic API we gathered, we created a profile for those campaigning in the 2020 election. We then categorized candidates into 3 categories: local county, state, and country. Each should show candidates campaigning at that level. To show this with a nice UI, we used swift for the front end interface for IOS and javascript for the back end data. In order to incorporate this, we had to use a FireDataBase in order to store our data on a server to then be accessed by our app.

#Challenges we ran into
Importing the data we had from our javascript file to the FireDataBase server was difficult for us since formatting was complicating enough to prevent our front end from accessing the file. In addition, it was difficult when using data from the Google Civic database since the data provided was outdated, not used much often, and had lots of null data on candidates.

#Accomplishments that we're proud of
We are proud of incorporating a few different Google APIs along with developing a great program for users to become more involved in politics and voting to be able to voice their opinions.

#What we learned
In the end, we learned how to manipulate a backend onto a database server to be used for app development. In addition, we were grateful for the opportunity to meet many recruiters and learn their perspectives on how software development could help social good and benefit their company.

#What's next for Voter
With voters, we hope the app could be developed throughout the United States such that its unbiased formality could be used at polling booths to well inform electors to wisely choose the candidate that they could best support and be represented by.
