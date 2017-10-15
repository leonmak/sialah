//
//  InfoVC.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit
import CTPanoramaView

class InfoVC: UIViewController, CardDelegate {
    
    var insets: CGFloat = 6
    var titleCard: Card!
    
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
        initScrollViewCards()
    }

    func initScrollViewCards() {
        let name = initStopoverName()
        let couponCard = initCoupon(name)
        self.titleCard = initTitle(miniCouponCard: couponCard)
        let panoCard = initPanoView(titleCard: titleCard)
        let eventsCard = initEvents(panoView: panoCard)
        let lastCard = eventsCard != nil ? eventsCard : titleCard
        scrollView.contentSize = CGSize(width: X(100), height: Y(12, from: lastCard!))
    }
    
    func initStopoverName() -> UILabel {
        let stopoverLabel = UILabel(frame: CGRect(x: X(insets), y: Y(insets), width: X(100-insets*2), height: 40))
        stopoverLabel.text = stopover.name.uppercased()
        stopoverLabel.textColor = UIColor.flatBlack
        stopoverLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        stopoverLabel.adjustsFontSizeToFitWidth = true
        stopoverLabel.setLineHeight(0.9)
        stopoverLabel.minimumScaleFactor = 0.1
        stopoverLabel.numberOfLines = 3
        stopoverLabel.lineBreakMode = .byWordWrapping
        scrollView.addSubview(stopoverLabel)
        return stopoverLabel
    }
    
    // May not appear
    func initCoupon(_ name: UILabel) -> Card? {
        guard let qrcodeName = stopover.qrcodeName else {
            return nil
        }
        let miniCouponCard = CardHighlight(frame: CGRect(x: X(insets), y: Y(10, from: name), width: X(100 - insets*2) , height: 120))
        miniCouponCard.title = ""
        miniCouponCard.itemTitle = "Ticket"
        miniCouponCard.itemSubtitle = "Scan to redeem"
        miniCouponCard.itemTitleSize = 10.0
        miniCouponCard.textColor = UIColor.black
        miniCouponCard.buttonText = "Enlarge"
        miniCouponCard.icon = UIImage(named: qrcodeName)
        miniCouponCard.delegate = self
        scrollView.addSubview(miniCouponCard)
        return miniCouponCard
    }
    
    // Confirm appear
    func initTitle(miniCouponCard: Card?) -> Card {
        let titlePosition = miniCouponCard != nil
            ? CGRect(x: X(insets), y: Y(10, from: miniCouponCard!), width: X(100 - insets*2) , height: 300)
            : CGRect(x: X(insets), y: Y(0), width: X(90) , height: 300)

        let card = CardHighlight(frame: titlePosition)
        card.title = "\(stopover.name) tours"
        card.itemSubtitle = stopover.description
        card.itemTitle = "Description"
        card.buttonText = "More info"
        card.textColor = UIColor.white
        
        if let wallImageName = stopover.wallImageName {
            card.backgroundImage = UIImage(named: wallImageName)
        }
        scrollView.addSubview(card)
        return card
    }
    
    // If appear, below title
    func initPanoView(titleCard: Card) -> UIView? {
        guard let pano = stopover.panoImageName else {
            return nil
        }
        panoView.image = UIImage(named: pano)
        let panoPosition = CGRect(x: X(insets), y: Y(10, from: titleCard), width: X(85) , height: 30)
        let label = UILabel(frame: panoPosition)
        label.text = "Preview"
        label.textColor = UIColor.flatGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.setLineHeight(0.65)
        scrollView.addSubview(label)
        
        panoView.frame = CGRect(x: X(0), y: Y(1, from: label), width: X(100), height: Y(30))
        panoView.layer.cornerRadius = 30.0
        panoView.controlMethod = .motion
        scrollView.addSubview(panoView)
        
        let subLabel = UILabel(frame: CGRect(x: X(insets), y: Y(1, from: panoView), width: X(100), height: Y(3)))
        subLabel.text = "Tap for full screen"
        subLabel.textColor = UIColor.flatGrayDark
        subLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        subLabel.setLineHeight(0.65)
        scrollView.addSubview(subLabel)

        let tapPreview = UITapGestureRecognizer(target: self, action:  #selector(self.previewTapped(_:)))
        self.panoView.addGestureRecognizer(tapPreview)
        return panoView
    }
    
    // May not appear
    func initEvents(panoView: UIView?) -> Card? {
        guard stopover.events.count > 0 else {
            return nil
        }
        let titlePosition = panoView != nil
            ? CGRect(x: X(insets), y: Y(10, from: panoView!), width: X(85) , height: 300)
            : CGRect(x: X(insets), y: Y(10, from: titleCard), width: X(85) , height: 300)
        let card = CardGroupSliding(frame: titlePosition)
        card.textColor = UIColor.black
        card.icons = Constants.iconImageNames.map { UIImage(named: $0)! }
        card.iconsSize = 60
        card.iconsRadius = 30
        card.title = "Special Offers"
        card.subtitle = stopover.events.first!
        scrollView.addSubview(card)
        return card
    }
    
    // MARK: Button pressed
    func cardHighlightDidTapButton(card: CardHighlight, button: UIButton) {
        if button.titleLabel?.text! == "ENLARGE" {
            performSegue(withIdentifier: "CouponVC", sender: stopover)
        }
    }
    
    @objc func previewTapped(_ sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "FullViewVC", sender: stopover)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let stopover = sender as? Stopover {
            if let couponVC = segue.destination as? CouponVC {
                couponVC.stopover = stopover
            }
            if let fullViewVC = segue.destination as? FullViewVC {
                fullViewVC.stopover = stopover
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

