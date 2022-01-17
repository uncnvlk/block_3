//
//  VKAdapter.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 17.01.2022.
//

import Foundation
import Alamofire

class VKAdapter: GroupsAPIProtocol {
    
    private let groups: GroupsDB
    let baseURL = "https://api.vk.com/method/"
    let token = Session.shared.token
    let userId = Session.shared.userID
    let version = "5.81"
    
    
    init(adaptee: GroupsDB) {
        self.groups = adaptee
    }
    
    func getGroups(completion: @escaping ([GroupModels])->()) {
      
        let method = "groups.get"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "access_token": token,
            "v": version,
            "extended": 1
        ]
        
        let url = baseURL + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            
            do {
                
                let groupsJSON = try JSONDecoder().decode(GroupsJSON.self, from: data)
                let groups = groupsJSON.response.items
                completion(groups)
                
            } catch {
                print(error)
            }
        }

        groups.load()
    }
    func getSearchGroup(completion: @escaping ([GroupModels]) -> ()) {
        // аналогично
    }
        
}
    


