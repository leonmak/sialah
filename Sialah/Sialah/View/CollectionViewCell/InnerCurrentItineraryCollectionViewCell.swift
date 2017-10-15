//
//  InnerCurrentItineraryCollectionViewCell.swift
//  Sialah
//
//  Created by Edmund Mok on 10/14/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit
import DynamicButton

class InnerCurrentItineraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var card: Card!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var itineraryTitle: UILabel!
    @IBOutlet weak var directionsButton: DynamicButton!
    @IBOutlet weak var ticketsButton: DynamicButton!
    @IBOutlet weak var doneButton: DynamicButton!
    @IBOutlet weak var checklistButton: DynamicButton!

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var busLabel: UILabel!
    @IBOutlet weak var openingHoursLabel: UILabel!
    var rowIndex: Int?
    var modelIndex: Int?

    @IBAction func handleDirectionsButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.google.com/maps/dir/?api=1&destination=hyatt+hotel+singapore")!, options: [:], completionHandler: nil)
    }

    @IBAction func handleTicketButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(Notification(name: Notification.Name("ticketButtonPressed"), object: self, userInfo: ["modelIndex": self.modelIndex!]))
    }

    @IBAction func handleDoneButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(Notification(name: Notification.Name("doneButtonPressed"), object: self, userInfo: ["rowIndex": self.rowIndex!]))
    }
    @IBAction func handleChecklistButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(Notification(name: Notification.Name("checklistButtonPressed"), object: self, userInfo: nil))
    }
}

extension InnerCurrentItineraryCollectionViewCell: CardDelegate {
    func cardDidTapInside(card: Card) {
        NotificationCenter.default.post(name: Notification.Name("infoCardPressed"), object: self, userInfo: ["modelIndex": self.modelIndex!, "rowIndex": self.rowIndex!])
    }
}
