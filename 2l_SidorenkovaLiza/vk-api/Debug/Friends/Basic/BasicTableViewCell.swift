//
//  BasicTableViewCell.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 16.09.2021.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    @IBOutlet weak var friendLabel: UILabel!
    
    
    func configure(with item: FriendsDisplayItem) {
        self.friendLabel.text = item.friend
    }
    
}

struct FriendsDisplayItem {
    
    let friend: String
    
}
