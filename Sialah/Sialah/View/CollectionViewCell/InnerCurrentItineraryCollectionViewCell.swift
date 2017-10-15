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
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var itineraryTitle: UILabel!
    @IBOutlet weak var directionsButton: DynamicButton!
    @IBOutlet weak var ticketsButton: DynamicButton!

    var modelIndex: Int?

    @IBAction func handleDirectionsButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.google.com/maps/search/?api=1&query=centurylink+field")!, options: [:], completionHandler: nil)
    }

    @IBAction func handleTicketButtonPressed(_ sender: Any) {
    }
}
