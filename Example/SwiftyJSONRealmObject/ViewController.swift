//
//  ViewController.swift
//  SwiftyJSONRealmObject
//
//  Created by Alex Corlatti on 07/11/2016.
//  Copyright (c) 2016 Alex Corlatti. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyJSON
import SwiftyJSONRealmObject

class ViewController: UIViewController {

    @IBOutlet weak var singleObjectLabel: UILabel!
    @IBOutlet weak var table: UITableView!

    var myObjList = List<MyObject>()

    override func viewDidLoad() {

        super.viewDidLoad()

        let json = [

            "id": "1",
            "type": "type1",
            "name": "Single Object"

        ]

        let jsonList = [

            [ "id": "1", "type": "type1", "name": "Object 1" ],
            [ "id": "2", "type": "type2", "name": "Object 2" ],
            [ "id": "3", "type": "type3", "name": "Object 3" ],

        ]

        let myObj = MyObject(json: JSON(json))

        singleObjectLabel.text = "\(myObj.name)"

        myObjList = SwiftyJSONRealmObject.createList(ofType: MyObject.self, fromJson: JSON(jsonList))

        table.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myObjList.count

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell? else { return UITableViewCell() }

        guard indexPath.row < myObjList.count else { return UITableViewCell() }

        let obj = myObjList[indexPath.row]

        cell.textLabel?.text = "\(obj.id) - \(obj.name)"

        return cell

    }


}
