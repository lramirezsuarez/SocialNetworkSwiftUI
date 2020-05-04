# SocialNetworkSwiftUI

- Made with SwiftUI
- IDE Xcode 11.3.1
- Language Swift and SwiftUI

### App Requirements
Create a mobile app for iOS with the objective to list users and their posts.
The users and posts are obtained from REST web services already created, you only need to consume them.

1. When the app opens, verify if the users are saved locally, if so, just show them, otherwise consume the web service and save the results and show them to the user.
2. When selecting an User, show, Name, phone number and email, and sho their posts.
3. It must allow to filter the users by name, each time a letter is written it must show the users according to the filter.

Base url: https://jsonplaceholder.typicode.com/
Services:
1. List users:
○ GET “/users”
2. List posts:
○ GET “/posts”
3. List posts of specific user id:
○ GET “/posts?userId=1”
    QUERY PARAMETER “userId”

## Frameworks:
- RealmSwift.

## API Consumed:
https://jsonplaceholder.typicode.com
