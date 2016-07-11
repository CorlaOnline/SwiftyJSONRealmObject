# SwiftyJSONRealmObject

[![CI Status](http://img.shields.io/travis/Alex Corlatti/SwiftyJSONRealmObject.svg?style=flat)](https://travis-ci.org/Alex Corlatti/SwiftyJSONRealmObject)
[![Version](https://img.shields.io/cocoapods/v/SwiftyJSONRealmObject.svg?style=flat)](http://cocoapods.org/pods/SwiftyJSONRealmObject)
[![License](https://img.shields.io/cocoapods/l/SwiftyJSONRealmObject.svg?style=flat)](http://cocoapods.org/pods/SwiftyJSONRealmObject)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyJSONRealmObject.svg?style=flat)](http://cocoapods.org/pods/SwiftyJSONRealmObject)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 7.3+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build SwiftyJSONRealmObject

To integrate SwiftyJSONRealmObject into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SwiftyJSONRealmObject'
```

Then, run the following command:

```bash
$ pod install
```

## Usage
Your ```Realm``` object can hinerit from ```SwiftyJSONRealmObject```, than means that you have to implement the required initializer ```convenience required init(json: JSON)``` that maps the JSON value with your object properties like in this way 

```swift

class MyObject: SwiftyJSONRealmObject {

    dynamic var id = ""
    dynamic var type = ""
    dynamic var name = ""

    override static func primaryKey() -> String? {

        return "id"

    }

    convenience required init(json: JSON) {

        self.init()

        self.id = json["id"].stringValue
        self.type = json["type"].stringValue
        self.name = json["name"].stringValue

    }

}
	
```

Now you can create your object directly from JSON

```swift
...
	
let json = [
   "id": "1",
   "type": "type1",
   	"name": "Single Object"
]
    
let myObj = MyObject(json: JSON(json))
    
// Do something with it and/or save it in Realm
	
...

```

You can also create list of object with ```SwiftyJSONRealmObject``` class method ```createList(ofType type: T.Type, fromJson json: JSON)```

```swift
...
	
let jsonList = [

	[ "id": "1", "type": "type1", "name": "Object 1" ],
	[ "id": "2", "type": "type2", "name": "Object 2" ],
	[ "id": "3", "type": "type3", "name": "Object 3" ]

]
    
let myObjList = SwiftyJSONRealmObject.createList(ofType: MyObject.self, fromJson: JSON(jsonList))
    
// Do something with it and/or save it in Realm
	
...

```

### Use it with [AlamofireRouter](https://cocoapods.org/pods/AlamofireRouter) and [AlamofireUIManager](https://cocoapods.org/pods/AlamofireUIManager)

```SwiftyJSONRealmObject``` is perfect to itegrate in your Web API manger suite composed by ```AlamofireRouter ``` and ```AlamofireUIManager ```. (See the specific documentation to understand how they works)

```swift
...
let netManager = AlamofireUIManager.sharedInstance

netManager.request(MyAPI.myRequest(myParameter: "aValue"), completionHandler: { json in
	
	let myObj = MyObject(json: json)
	
	// Do some stuff
	
})
...
```

## Author

Alex Corlatti, alex.corlatti@gmail.com

## License

SwiftyJSONRealmObject is available under the MIT license. See the LICENSE file for more info.
