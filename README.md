1) Enviroment :
- This app has been built in Dart language using the Flutter SDK
- I have used Android Studio as an SDK 

2) Structure and Pattern : 
I have used MVVM structure to build the app:
- Models : I have created models similar to the server reponse in order to encapsulate data inside them.
- ViewModels : Each of the Main Widgets (pages) has it's own ViewModel that is responsible for the Business Logic
of the view. in order to keep the code reusable, testible and minimal!
- Views : are the widgets and are solely responsible for what the user sees on the screen
- Repository : It is a class layered between the Data Sources (Server and LocalDB) and the ViewModels, The data Repository
manages data calls back and forth, it also is responsible for making the decision whether to fetch data from Server or fetch
th Local data from the app DB.

3) 3rd party packages and State Management:
 - get: This is a new Framework and state management lib for flutter, it is light and minimal. I used it
to route from widget to widget instead of writing the native flutter way, it took me few words to navigate!
Also, I was able to observe a list where the user deletes an element and act upon it, making it possible to use
Stateless widget when I wanted an interactive UI (better than using setState(){} for the whole UI elements!)

 - floor: This library is used for creating Local Database like SQLITe, I could have used the SQLIte library as well
but this package's code is simple and minimal. it is very similar to Room for android! I created the Database, tables
DAOs for each entity and CRUD operations inside them!
  http: Used it for making an http call to the server , get the response , and display it to the user
  url_launcher: This simple package helped me to lauch a link (create hyperlink) when user presses the link icon!

4) Future scope  : As I did here, I use MVVM with a statemanagement package.
However here are things that I usually follow but didn't implement here :
1) TDD or Unit testing
2) Use a package that help in automatically defining the Platform-specific (Android - IOS) UI elements and show them!
3) Pay attention more to the UI elements and features (such as internet connection timeout, etc..)
4) Use abstraction layer between some classes by implementing their interfaces

Thank you for this opportunity, Hope you like my code:)
