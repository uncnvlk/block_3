//
//  FriendsAPI.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 24.10.2021.
//

import UIKit
import Alamofire

protocol FriendsAPIProtocol {
    func getFriends(completion: @escaping ([FriendModels])->())
}

final class FriendsAPI: FriendsAPIProtocol {
    
    let baseURL = "https://api.vk.com/method/"
    let token = Session.shared.token
    let userId = Session.shared.userID
    let version = "5.81"
    
    func getFriends(completion: @escaping ([FriendModels])->()) {
        let method = "friends.get"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "order": "name",
            "access_token": token,
            "v": version,
            "fields": "photo_50, photo_100",
            "count": 2
        ]
        
        let url = baseURL + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            
            do {
                
                let friendsJSON = try JSONDecoder().decode(FriendsJSON.self, from: data)
                let friends = friendsJSON.response.items
                completion(friends)
                
            } catch {
                print(error)
            }
        }
    }
}
