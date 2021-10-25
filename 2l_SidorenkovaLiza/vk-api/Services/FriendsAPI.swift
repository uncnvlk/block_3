//
//  FriendsAPI.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 24.10.2021.
//

import UIKit
import Alamofire


struct Friend {
    
}


final class FriendsAPI {
    
    let baseURL = "https://api.vk.com/method/"
    let token = Session.shared.token
    let userId = Session.shared.userID
    let version = "5.81"
    
    
    func getFriends(completion: @escaping ([Friend])->()) {
        let method = "friends.get"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "order": "name",
            "access_token": token,
            "v": version,
            "fields": "photo_50, photo_100",
            "count": 10
        ]
        
        let url = baseURL + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
    func getPhotos(completion: @escaping ([Friend])->()) {
        let method = "photos.getAll"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "access_token": token,
            "v": version,
            "count": 3,
            "extended": 1,
            "photo_sizes": 0
        ]
        
        let url = baseURL + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
    func getGroup(completion: @escaping ([Friend])->()) {
        let method = "groups.get"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "access_token": token,
            "v": version,
            "extended": 1
        ]
        
        let url = baseURL + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }
    
    func getSearchGroup(completion: @escaping ([Friend])->()) {
        let method = "group.search"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "access_token": token,
            "v": version,
            "q": "MeMeBlog"
        ]
        
        let url = baseURL + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
        }
    }

    
    

}
