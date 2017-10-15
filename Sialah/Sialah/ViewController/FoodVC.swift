//
//  FoodVC.swift
//  Sialah
//
//  Created by Leon Mak on 15/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class FoodVC: UIViewController {
    var insets: CGFloat = 6
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: insets, y: insets,
                                  width: view.frame.width - insets * 2,
                                  height: view.frame.height - insets * 2)
        
        
        let card = initEvents()
        let _ = initMoreEvents(card)
    }

    func initEvents() -> Card? {
        let titlePosition = CGRect(x: X(insets), y: Y(1, from: label), width: X(85) , height: 300)
        let card = CardGroupSliding(frame: titlePosition)
        card.textColor = UIColor.black
        card.icons = Constants.iconImageNames.map { UIImage(named: $0)! }
        card.iconsSize = 60
        card.iconsRadius = 30
        card.title = "Local Food Discounts"
        card.subtitle = "Near Gardens By the bay"
        scrollView.addSubview(card)
        return card
    }
    
    func initMoreEvents(_ card: Card?) -> Card? {
        let titlePosition = CGRect(x: X(insets), y: Y(1, from: card!), width: X(85) , height: 300)
        let card = CardGroupSliding(frame: titlePosition)
        card.textColor = UIColor.black
        card.icons = Constants.fruitNames.map { UIImage(named: $0)! }
        card.iconsSize = 60
        card.iconsRadius = 30
        card.title = "Fruit Season Offers"
        card.subtitle = "Near Orchard Road"
        scrollView.addSubview(card)
        return card
    }
}


