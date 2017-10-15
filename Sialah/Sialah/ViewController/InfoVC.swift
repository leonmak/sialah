//
//  InfoVC.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit
import CTPanoramaView

class InfoVC: UIViewController {
    
    var insets: CGFloat = 6
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var panoView: CTPanoramaView!
    
    var stopover = Constants.defaultInfoStopover
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initScrollView()
        
    }

    func initScrollView() {
        scrollView.frame = CGRect(x: insets, y: insets,
                                  width: view.frame.width - insets * 2,
                                  height: view.frame.height - insets * 2)
        initPanoView()
        initCards()
    }

    func initPanoView() {
        panoView.controlMethod = .motion
        if let pano = stopover.panoImageName {
            panoView.image = UIImage(named: pano)
        }
        panoView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.3)
        scrollView.addSubview(panoView)
    }

    func initCards() {
        let card = CardGroupSliding(frame: CGRect(x: X(5), y: Y(10, from: panoView), width: X(90) , height: 300))
        card.textColor = UIColor.black
        card.icons = Constants.iconImageNames.map { UIImage(named: $0)! }
        card.iconsSize = 60
        card.iconsRadius = 30
        card.title = "from the editors"
        card.subtitle = "Welcome to XI Cards !"
        scrollView.addSubview(card)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

