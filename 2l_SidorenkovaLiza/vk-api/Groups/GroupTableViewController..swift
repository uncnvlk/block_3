//
//  Group.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 28.10.2021.
//

import UIKit
import PromiseKit
import RealmSwift

class GroupTableViewController: UITableViewController {

        let friendsService = FriendsAPI()
        let photosService = PhotosAPI()
        let groupsService = GroupsAPI()
        let groupDB = GroupsDB()
    
        var groups: Results <GroupModels>?

    
        override func viewDidLoad() {
            super.viewDidLoad()
            let VKAdapter = VKAdapter(adaptee: groupDB)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            groupsService.getGroups()
        }


        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            guard groups != nil else { return 0 }
                return self.groups!.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let group = groups?[indexPath.row]
            cell.textLabel?.text = group?.name

            
            return cell
        }
    

}
