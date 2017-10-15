//
//  InfoVC.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCards()
    }
    
    func initCards() {
        let icons: [UIImage] = [
            UIImage(named: "barbecue-1")!,
            UIImage(named: "beer-2")!,
            UIImage(named: "coconut")!,
            UIImage(named: "pia-colada")!,
            UIImage(named: "pineapple")!,
            UIImage(named: "popsicle-1")!
        ]
        
        let card = CardGroupSliding(frame: CGRect(x: 40, y: 50, width: 300 , height: 360))
        card.textColor = UIColor.black
        
        card.icons = icons
        card.iconsSize = 60
        card.iconsRadius = 30
        
        card.title = "from the editors"
        card.subtitle = "Welcome to XI Cards !"
        
        view.addSubview(card)

    }
    
}
