//
//  Group.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 28.10.2021.
//

import UIKit
struct Groups1 {
    
}

class GroupTableViewController: UITableViewController {

        let friendsService = FriendsAPI()
        let photosService = PhotosAPI()
        let groupsService = GroupsAPI()

        var groups: [GroupModels] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            
            groupsService.getGroups { groups in
                self.groups = groups
                self.tableView.reloadData()
            }
            
            /*photosService.getPhotos { photos in
                print("Получили фото в контроллере")
            }
            
            groupsService.getGroup { groups in
                print("Получили список групп в контроллере")
            }
            
            
            groupsService.getSearchGroup { searchGroups in
                print("Получили поиск группы в контроллере")
            }*/
            
        }


        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return groups.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            let group = groups[indexPath.row]

            cell.textLabel?.text = group.name

            return cell
        }


    }
