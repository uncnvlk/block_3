//
//  FriendsViewController.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 16.09.2021.
//

import UIKit
import RealmSwift

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var searchController: UISearchController!
    
    //private var FriendItem: [FriendModels] = []
    
    private var SearchFriendItem: [FriendModels] = []
    
    let friendsService = FriendsAPI()
    let photosService = PhotosAPI()
    let groupsService = GroupsAPI()
    
    let friendsDB = FriendsDB()
    var friends: Results<FriendModels>?
    var token: NotificationToken?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.Nib.basic, forCellReuseIdentifier: R.Cell.basic)
        //self.getData()
        friendsService.getFriends{ [weak self] friends in
            
            guard let self = self else {return}
            let friendsOld = self.friendsDB.load()
            
            friendsOld.forEach {
                self.friendsDB.delete($0)
            }
            
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.load()
            self.tableView.reloadData()
//            self?.FriendItem = friends
//            self?.tableView.reloadData()
        }
        
        searchController = UISearchController(searchResultsController: nil)
                tableView.tableHeaderView = searchController.searchBar
                searchController.searchResultsUpdater = self
    }
    
//    private func getData() {
//        friendsService.getFriends{ [weak self] friends in
//            self?.friends = friends
//            self?.tableView.reloadData()
//        }
//    }
}

extension FriendsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
                    return SearchFriendItem.count
                } else {
                    guard friends != nil else {return 0}
                    return self.friends!.count
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return tableView.dequeueReusableCell(withIdentifier: R.Cell.basic, for: indexPath)
    }
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if searchController.isActive {
                    (cell as? BasicTableViewCell)?.configure(with: self.SearchFriendItem[indexPath.row])
                } else {
                    (cell as? BasicTableViewCell)?.configure(with: self.friends![indexPath.row])
                }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            if searchController.isActive {
                return false
            } else {
                return true
            }
}
}

extension FriendsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text {
                filterContent(searchText: searchText)
                tableView.reloadData()
            }
        }
        func filterContent(searchText: String){
            SearchFriendItem = friends!.filter({(FriendsSome: FriendModels) -> Bool in
                let nameMatch = FriendsSome.fullName.range(of: searchText)
                return nameMatch != nil
            })
        }
}
