# Be careful about this settings

### Dependecies
```
dependencies:
  flutter_spinkit: "^4.1.1" 
  firebase_auth:
  cloud_firestore:
  ```
  
### Android level `build.gradle`
```
dependencies {
        classpath 'com.google.gms:google-services:4.3.2'
       
    }
 ```
### App level `build.gradle`
```
dependencies {
    implementation 'androidx.multidex:multidex:2.0.1'
    implementation 'com.google.firebase:firebase-analytics:17.2.0'
}
apply plugin: 'com.google.gms.google-services'(At the end of this file)


defaultconfig{
multiDexEnabled true
}
```
#### whenever creating new user 
```
.storeNewUser(signedInUser.user, context);
```
here `.user` is important to note(mistake prone) whenver connecting to firestore.
