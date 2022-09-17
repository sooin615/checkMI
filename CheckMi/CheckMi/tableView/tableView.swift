//
//  tableView.swift
//  CheckMi
//
//  Created by Agiss on 2022/09/16.
//

import Foundation
import UIKit

class User {
    var name:String!
    var dayCount:Int!
    var sit:Int!
    init(name:String,dayCount:Int,sit:Int) {
        self.name = name
        self.dayCount = dayCount
        self.sit = sit
    }
}


var users:Array<User> = [User(name: "son", dayCount: 2, sit: 1), User(name: "min", dayCount: 1, sit: 1)]

func apd(temp:User) {
    users.append(temp)
}

class tableView: UIViewController {
    
    @IBOutlet weak var userList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(users[0].name)
        debugPrint(users.count)
        
        userList.delegate = self
        userList.dataSource = self
        apd(temp: User(name: "sooin", dayCount: 10, sit: 1))
    }
}

extension tableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? tableViewCell
        
        cell?.nameLabel.text = users[indexPath.row].name
        cell?.countLabel.text = String(users[indexPath.row].dayCount)
        return cell!

    }
    
    

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
