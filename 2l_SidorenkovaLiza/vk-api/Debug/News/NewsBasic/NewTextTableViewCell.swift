//
//  NewTextTableViewCell.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 27.11.2021.
//

import UIKit

class NewTextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var postAuthor: UILabel!
    
    func configure(postTextFromVK: String){
        self.postText.text = postTextFromVK
    }
    
}
