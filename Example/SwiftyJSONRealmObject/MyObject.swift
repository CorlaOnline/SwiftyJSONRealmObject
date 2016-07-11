//
//  MyObject.swift
//  SwiftyJSONRealmObject
//
//  Created by Alex Corlatti on 11/07/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONRealmObject

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
