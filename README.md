
# react-native-sm-contact

## Getting started

`$ npm install react-native-sm-contact --save`

### Mostly automatic installation

`$ react-native link react-native-sm-contact`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-sm-contact` and add `SMOSmContact.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libSMOSmContact.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.sm_contact.SMOSmContactPackage;` to the imports at the top of the file
  - Add `new SMOSmContactPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-sm-contact'
  	project(':react-native-sm-contact').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-sm-contact/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-sm-contact')
  	```


## Usage
```javascript
import SMOSmContact from 'react-native-sm-contact';

// TODO: What to do with the module?
SMOSmContact;
```
  