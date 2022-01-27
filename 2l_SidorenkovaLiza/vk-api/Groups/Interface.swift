//
//  Interface.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 27.01.2022.
//

import Foundation
 
protocol GroupsInterface {
    func getGroups(completion: @escaping ([GroupModels])-> ())
}
 
class GroupsProxy: GroupsInterface {
 
    let groupsService: VKAdapter
 
    init(groupsService: VKAdapter) {
        self.groupsService = groupsService
    }
 
    func getGroups(completion: @escaping ([GroupModels]) -> ()) {
        self.getGroups(completion: completion)
    }
}
