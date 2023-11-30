# cbk-task
1 User MVVM  for Project architecture well design  as per rule created
 .  Controller folder holds all model with Model, View Model, View, and Controller  
 . View folder holds all launch screen and other stuff if need custom view as per the design required
 . Resource folder contains the Asset and Property list which we can separate all  plist and images and colors 
 . The utilities folder contain all custom class and extension which  useful classes and extension so we can use those classes in any file 
 . SPM contains all SPM SDK so we don't need to install it every time 

2  Used Firestore and Firebase store for storing user data and Photos
3  For Authentication I have used Google authentication once authentication is done store that user model in Usermanage data in keychain synch so we can secure as wll 
4 For Secure keys of Firebase I have used  the Obfuscator secure class for  encrypt key and we can decrypt for secure all keys in our local file 
5 For secure Al user data we have used Keychain kishikawakatsumi/KeychainAccess SDK to handle keychain stuff 

6 Tasks are done till now 
1. **User Authentication:** Done
- Implement basic user authentication using Firebase Authentication.
  
2. **Photo Upload and Display:** Done
- Allow users to upload photos from their devices. Done
- Display a feed of uploaded photos with basic information. working on that part 

 3. **Networking and API Integration:** Done
- Integrate Firebase Storage for photo storage.
- Implement basic API calls to retrieve and display photos.

5. **User Profiles:** Done
- Create simple user profiles displaying uploaded photos.

6. **Code Quality and Documentation:** Done
- Write clean, well-documented code. - Follow Swift coding conventions.
