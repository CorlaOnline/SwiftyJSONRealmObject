//
//  SwiftyJSONRealmObject.swift
//  SwiftyJSONRealmObject
//
//  Created by Alex Corlatti on 07/11/2016.
//  Copyright (c) 2016 Alex Corlatti. All rights reserved.
//

import RealmSwift
import SwiftyJSON

/**
 SwiftyJSONRealmObject
 - Description : Object derived from Realm object and is the base for all the objects that want be mapped from JSON
 */
open class SwiftyJSONRealmObject: Object {

    required convenience public init(json: JSON) {

        self.init()

    }

    open class func createList< T where T: SwiftyJSONRealmObject >(ofType type: T.Type, fromJson json: JSON) -> List<T> {

        let list = List<T>()

        for (_, singleJson):(String, JSON) in json {

            list.append(T(json: singleJson))

        }

        return list

    }

}
