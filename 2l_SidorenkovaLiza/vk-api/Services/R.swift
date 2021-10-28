//
//  R.swift
//  2l_SidorenkovaLiza
//
//  Created by Elizaveta Sidorenkova on 13.09.2021.
//

import UIKit

enum R {
    enum Storyboard {
        static let debugMenu: UIStoryboard = .init(name: "DebugMenu", bundle: nil)
    }
    
    enum Nib {
        static let basic: UINib = .init(nibName: "BasicTableViewCell", bundle: nil)
        static let newsBasic: UINib = .init(nibName: "NewsTableViewCell", bundle: nil)
    }
    
    enum Cell {
        static let basic: String = "BasicCell"
        static let news: String = "NewsCell"
    }

}
