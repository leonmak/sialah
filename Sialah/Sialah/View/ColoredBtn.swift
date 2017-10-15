//
//  ColoredBtn.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit
import ChameleonFramework

class ColoredBtn: UIButton {
    
    convenience init(frame: CGRect, title: String="Button", color: UIColor) {
        self.init(frame: frame)
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 9
        self.layer.masksToBounds = false
        self.layer.borderWidth = 1.0
        self.titleLabel?.font = UIFont(name: "Lato", size: 30)
        
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.flatBlack.cgColor
        self.layer.shadowOpacity = 0.9
        self.layer.shadowRadius = 9
        self.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
