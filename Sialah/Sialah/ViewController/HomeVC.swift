//
//  HomeVC.swift
//  Sialah
//
//  Created by Leon Mak on 15/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAirportCard()
        
    }
    
    func loadAirportCard() {
        let insets: CGFloat = 6.0
        let arrivalCardFrame = CGRect(x: X(insets), y: Y(-0.75*insets), width: X(100-insets*2), height: Y(3*insets))
        let arrivalCardGroup = CardArticle(frame: arrivalCardFrame)
        arrivalCardGroup.title = "Arrival"
        arrivalCardGroup.category = ""
        arrivalCardGroup.textColor = UIColor.white
        arrivalCardGroup.subtitle = "Flight SQ325 - FRA-SIN"
        arrivalCardGroup.backgroundImage = UIImage(named: "airport")
        view.addSubview(arrivalCardGroup)
        
        let departCardFrame = CGRect(x: X(insets), y: Y(100-2*insets), width: X(100-insets*2), height: Y(3*insets))
        let departCardGroup = CardArticle(frame:  departCardFrame)
        departCardGroup.title = "Departure"
        departCardGroup.subtitleSize = 30.0
        departCardGroup.textColor = UIColor.white
        departCardGroup.category = "Flight SQ342 - SIN-DPS"
        departCardGroup.backgroundImage = UIImage(named: "airport")
        view.addSubview(departCardGroup)
    }
    
}
