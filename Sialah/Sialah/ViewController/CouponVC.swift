//
//  CouponVC.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class CouponVC: UIViewController, CardDelegate {

    var couponCard: CouponCard!
    var stopover: Stopover = Constants.zooStopover
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCoupon()
        couponCard.delegate = self
    }
    
    func initCoupon() {
        let padding = CGFloat(30)
        let couponCardFrame = CGRect(x: padding, y: padding,
                                     width: view.frame.width - padding * 2,
                                     height: view.frame.height - padding * 2)
        couponCard = CouponCard(frame: couponCardFrame)
        
        couponCard.textColor = UIColor.white
        couponCard.title = stopover.name
        
        if let bgImageName = stopover.wallImageName {
            couponCard.backgroundImage = UIImage(named: bgImageName)
        }
        if let ticketImageName = stopover.ticketImageName {
            couponCard.bgIconIV.image = UIImage(named: ticketImageName)
        }
        couponCard.icon = UIImage(named: stopover.qrcodeName!)
        
        self.view.addSubview(couponCard)
    }
    
    func cardCouponDidTapButton(card: CouponCard, button: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

