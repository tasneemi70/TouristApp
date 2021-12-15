# TouristApp
### Project Name: Tourist

#Project Description :
Tourist it's App enable users to search about touristic places in Abha city

#Features List:

- Feature 1 App can brows places of city 
- Feature 2 User can share Photo and description for the place 
- Feature 3 User can search for places and find location 
- Feature 4 User can know the weather of the city 
- Feature 5 User can add place to list and can delete
- Feature 6 User can Change the App Language (Arabic & English).
- Feature 7 User can share the App with friends.
- Feature 7 user can watch video for places


# Structure:
screens:
add screens/models/views/cells
- HomeVC.
- visitorVC.
- ShareVC.
- FavoriteVC.
- profileVC.
- videoVC
- MapVC
- WEatherVc

##models
- user
- Data weather
- Tourist Data


##cells 
- visitorCell
- Favourite Cell
- Home Cell
- video Cell
- Place Detail Cell

# Structure:
// Add your project screens/models/views/cells
screens:
- HomeVC.
- ArabicBookVC.
- EnglishBookVC.
- FavoriteVC.
- profileVC.
- pdfBookVC
Models:
- User
- BookData
Cells:
- ArabicCell
- EnglishCell
- Favourite Cell
- BookInformationCell
- ReadBook Cells



### User Stories:
As a user I want to login/Register, so that I can make account to use app
As a user I want to Sign out, so that I can login wth another account
As a user I want to editing my profile , so that i can ubdate my profile
As a user I want to search for places , so that I can find it easly
As a user I want to know the weather of the city , so that I know if suitable for visit this time or no 
As a user I want to add places to my list , so that I can check and save it to visit any time
As a user I want to share place i like to another users , so that users can visit any time
As a user I want to the location of the placescon the map , so that I can visit easly
As a user I want to watch video for places , so that I can see details for places


# Backlog:
 
User :
- see your profile
- see photo and video , location for places and weather for city & share place for visitor 
- see favourite place list
- can share place for friend to another App
- can signOut
- can change language [Arabic , Envglish]
- can change appearance for the app [Dark , Light mode]


# React Router Routes (React App)

|      Component      |   Permission   |                Behavior                  |
|       :---          |     :---:      |                  ---:                    |
|     lunchScreen     |     public     |                Show Logo                 |
|       :---          |     :---:      |                  ---:                    |
|    RigesterPage     |     public     |  Rigester page, link to login,           | 
|                     |                |  navigate to homepage after Rigester.    |  
|       :---          |     :---:      |                  ---:                    |
|                     |                |      Login page, link to Rigester,       |
|     LoginPage       |     public     |      navigate to home page after login.  |
|                     |                |                                          |
|       :---          |     :---:      |                  ---:                    |
|                     |                | Home page, link to visitor List,         |
|    firstHomePage    |   user only    | navigate to photo place List after       |                                                                               | pressed on visitor button                |
|                     |                |                                          |
                                                                                  | 
|       :---          |     :---:      |                  ---:                    |
|                     |                | share Place page, link to add            |
                                         place image                              |
|    firstHomePage    |   user only    | navigate to iphone library               |
|                     |                | after tap on place image and add         |
                                               description .                      |      
                                                                                  |
|       :---          |     :---:      |                  ---:                    |
|                     |                | list visitorpage,link to place details,  |
|    listVisitorPage  |   user only    |     navigate to place Details            |   
|                     |                |    after pressed on specific place.      |
|        :---         |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                |                                          |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                | information place page, link to share    |
|PlaceDetails Page    |   user only    | place,navigate to Alert sheet after      |
|                     |                |   pressed on Share Place Button.         |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                |    list place Page, link to add place to |
|    listPlacePage    |   user only    |    favourite page, after pressed         |
|                     |                |         on Like Button.                  |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                |                                          |
|   mapPage           |     :---:      |   map Page, link to mapPage View         |
|                     |                |   navigate to location Place after       |
                      |                |     pressed on mapPage                   |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                |   weather page, link to weather View     | 
|    weatherPage      |   user only    |   navigate to change country  after      |
|                     |                |     pressed on left view  "Gesture"      |
|       :---          |     :---:      |                  ---:                    |
|                     |                | video page, link to video List           |
|     videoPage       |   user only    | navigate to video List after             |
|                     |                |     pressed on video button              |
                                                                    .             |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to edit profile image,| 
|    profilePage      |   user only    | navigate to iphone library               |
|                     |                |  after tap on profile image.             |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to edit User name,    | 
|    profilePage      |   user only    | navigate to edite user name after        |
|                     |                |  tap on name field.                      |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to change language,   | 
|    profilePage      |   user only    | navigate to iphone setting               |
|                     |                |  after tap on change Language button.    |
|                     |                |                                          |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to share Application, | 
|    profilePage      |   user only    | navigate to share Alert sheet after      |
|                     |                |  pressed on Share App button.            |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to signOut,           | 
|    profilePage      |   user only    | navigate to login page after             |
|                     |                |  pressed on SignOut button.              |
|       :---          |     :---:      |                  ---:                    |



# Components:

 - Rigester $ LogIn Page 
 - Home Page (contains collection of pages)
 - share place Page 
 - visitor page
 - Favourite Page
 - Profile Page
 - video page
 - location page
 - weather page
 
 # Services
_ Auth Service: 
  - auth.rigester(user)
  - auth.login(user)
  - auth.logout(user)
_ Favourite Services.

# Links: 

_ repository Link:
https://github.com/tasneemi70/TouristApp

-
