//
//  GroupAPI.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 25.10.2021.
//

import UIKit
import Alamofire


struct Groups {
    
}


final class GroupsAPI {
    
    let baseURL = "https://api.vk.com/method/"
    let token = Session.shared.token
    let userId = Session.shared.userID
    let version = "5.81"
    
    func getGroup(completion: @escaping ([Groups])->()) {
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
    
    func getSearchGroup(completion: @escaping ([Groups])->()) {
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
