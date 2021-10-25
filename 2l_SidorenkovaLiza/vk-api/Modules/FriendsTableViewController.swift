//
//  FriendsTableViewController.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 24.10.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let friendsService = FriendsAPI()
    let photosService = PhotosAPI()
    let groupsService = GroupsAPI()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsService.getFriends{ friends in
            print("Получили друзей в контроллере")
        }
        
        photosService.getPhotos { photos in
            print("Получили фото в контроллере")
        }
        
        groupsService.getGroup { groups in
            print("Получили список групп в контроллере")
        }
        
        
        groupsService.getSearchGroup { searchGroups in
            print("Получили поиск группы в контроллере")
        }
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
