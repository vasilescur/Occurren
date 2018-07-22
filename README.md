<img src="https://user-images.githubusercontent.com/10100323/43046867-497f1bca-8d9d-11e8-9401-68ee77b75c24.png" height="150px">

# Occurren

## The Problem

1 in every 59 kids are diagnosed with Autism in the United States. Out of these, 40% are considered *socially isolated*-- they never see friends and half do not receive any phone calls or invitations to activities, according to research published recently in the Journal of Autism and Developmental Disorders. Strikingly, researchers said that 28% had no social contact at all.

Often, these children have very specific interests and passions, but there is a lack of a strong, centralized community for them to find friends with similar interests and backgrounds. 

## The Solution

Introducing *Occurren*, a cross-platform mobile application geared towards empowering parents of kids with autism to create meaningful relationships between their kids and other like-minded children nearby.


## How it Works

Parents create a profile for their kids, including:

  - Name
  - Age
  - Picture
  - Interests
  
Then, a list of matches is carefully generated, helping the parents to see other profiles in their area with matching or similar interests in the same age group.

When parents find a suitable potential connection, they can tap on that match from the list and start a text chat with the other parent, directly in the app. Parents can use the chat to talk to other parents, and set up events and meetups with those around them, strengthening the community and improving the social lives of their children.

## Technology Stack

Occurren is a cross-platform (iOS, Android, Web) application built on the [Flutter](http://flutter.io) platform using Google's [Dart](http://dartlang.org) language.

We crafted a server to handle data storage and retrieval. The server was built with [Node.js](https://nodejs.org/en/) and uses a Google [Firebase](https://firebase.google.com/) realtime database backend. In addition, we leveraged Firebase's [Machine Learning Kit](https://firebase.google.com/docs/ml-kit/) in our application.

We developed the server using [repl.it](http://repl.it) as a development environment, and then hosted it on a Google Cloud Compute Engine instance.

Finally, we used HTML/CSS/JavaScript to create a prototype web interface for the application.
