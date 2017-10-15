//
//  CouponCard.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class CouponCard: Card {
    
    var title: String = "Singapore Zoo"
    var itemTitle: String = "Mr. John Appleseed"
    var itemTitleSize: CGFloat = 14
    var itemSubtitle: String = "Free entry for all attractions"
    var itemSubtitleSize: CGFloat = 12
    var icon: UIImage?
    var iconRadius: CGFloat = 16
    var buttonText: String = "Redeem"
    
    var delegate: CardDelegate?

    internal var iconIV = UIImageView()
    internal var overlay = UIView()
    internal var actionBtn = UIButton()
    internal var titleLbl = UILabel ()
    internal var itemTitleLbl = UILabel()
    internal var itemSubtitleLbl = UILabel()
    internal var lightColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
    internal var bgIconIV = UIImageView()
    
    // View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func initialize() {
        super.initialize()
        
        backgroundIV.addSubview(overlay)
        backgroundIV.addSubview(iconIV)
        backgroundIV.addSubview(titleLbl)
        backgroundIV.addSubview(itemTitleLbl)
        backgroundIV.addSubview(itemSubtitleLbl)
        self.addSubview(actionBtn)
        
        if backgroundImage == nil {  backgroundIV.addSubview(bgIconIV); }
        else { bgIconIV.alpha = 0 }
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Helpers func
        func X(_ percentage: CGFloat ) -> CGFloat { return percentage*rect.width/100 }
        func Y(_ percentage: CGFloat ) -> CGFloat { return percentage*rect.height/100 }
        func X(_ percentage: CGFloat, from: UIView ) -> CGFloat { return percentage*rect.width/100 + from.frame.maxX }
        func Y(_ percentage: CGFloat, from: UIView ) -> CGFloat { return percentage*rect.height/100 + from.frame.maxY }
        func RevX(_ percentage: CGFloat, width: CGFloat ) -> CGFloat { return (rect.width - percentage*rect.width/100) - width }
        func RevY(_ percentage: CGFloat, height: CGFloat) -> CGFloat { return (rect.height - percentage*rect.height/100) - height }
        let btnWidth = CGFloat((buttonText.characters.count + 2) * 10)
        
        //Draw
        bgIconIV.frame = CGRect(x: RevX(-20, width: X(60)), y: Y(0), width: X(60), height: X(60))
        bgIconIV.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/6))
        bgIconIV.image = icon
        bgIconIV.alpha = backgroundImage != nil ? 0 : 0.6
        bgIconIV.layer.cornerRadius = iconRadius * 2
        bgIconIV.clipsToBounds = true
        
        titleLbl.frame = CGRect(x: X(insets), y: X(insets), width: X(90), height: Y(25))
        titleLbl.text = title.uppercased()
        titleLbl.textColor = textColor
        titleLbl.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.setLineHeight(0.65)
        titleLbl.minimumScaleFactor = 0.1
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.numberOfLines = 3
        
        iconIV.frame = CGRect(x: X(insets), y: Y(insets, from: titleLbl), width: X(75), height: X(75))
        iconIV.image = icon
        iconIV.layer.cornerRadius = iconRadius
        
        iconIV.clipsToBounds = true
        
        itemTitleLbl.frame = CGRect(x: X(insets), y: RevY(17, height: Y(8)) + X(insets), width: X(80) - btnWidth, height: Y(8))
        itemTitleLbl.textColor = textColor
        itemTitleLbl.text = itemTitle
        itemTitleLbl.font = UIFont.boldSystemFont(ofSize: itemTitleSize)
        itemTitleLbl.adjustsFontSizeToFitWidth = true
        itemTitleLbl.minimumScaleFactor = 0.1
        itemTitleLbl.lineBreakMode = .byTruncatingTail
        itemTitleLbl.numberOfLines = 0
        
        itemSubtitleLbl.frame = CGRect(x: X(insets), y: Y(0, from: itemTitleLbl), width: X(80) - btnWidth, height: Y(13))
        itemSubtitleLbl.textColor = textColor
        itemSubtitleLbl.text = itemSubtitle
        itemSubtitleLbl.font = UIFont.systemFont(ofSize: itemSubtitleSize)
        itemSubtitleLbl.adjustsFontSizeToFitWidth = true
        itemSubtitleLbl.minimumScaleFactor = 0.1
        itemSubtitleLbl.lineBreakMode = .byTruncatingTail
        itemSubtitleLbl.numberOfLines = 2
        itemSubtitleLbl.sizeToFit()
        
        actionBtn.frame = CGRect(x: RevX(insets, width: btnWidth), y: RevY(insets, height: 32), width: btnWidth, height: 36)
        actionBtn.backgroundColor = UIColor.clear
        actionBtn.layer.backgroundColor = lightColor.cgColor
        actionBtn.layer.cornerRadius = actionBtn.layer.bounds.height/2
        let btnTitle = NSAttributedString(string: buttonText.uppercased(), attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: .black), NSAttributedStringKey.foregroundColor : self.tintColor])
        actionBtn.setAttributedTitle(btnTitle, for: .normal)
        actionBtn.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        
        overlay.frame = CGRect(x: X(0), y: Y(0), width: X(100), height: Y(100))
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        overlay.layer.cornerRadius = cardRadius
        
        backgroundIV.bringSubview(toFront: titleLbl)
    }
    
    override func cardTapped() {
        super.cardTapped()
        delegate?.cardDidTapInside?(card: self)
    }
    
    //Actions
    @objc func buttonTapped(){
        
        UIView.animate(withDuration: 0.2, animations: {
            self.actionBtn.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        }) { (true) in
            UIView.animate(withDuration: 0.1, animations: {
                self.actionBtn.transform = CGAffineTransform.identity
            })
        }
        delegate?.cardCouponDidTapButton?(card: self, button: actionBtn)
    }
    
    
}



