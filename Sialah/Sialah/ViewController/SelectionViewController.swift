//
//  SelectionViewController.swift
//  Sialah
//
//  Created by Edmund Mok on 10/15/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initCards()
    }
    @IBOutlet weak var stopoverBorder: UIView!

    @IBOutlet weak var layoverBorder: UIView!
    func initCards() {
        layoverBorder.layer.borderWidth = 5
        layoverBorder.layer.borderColor = UIColor.flatBlueDark.cgColor
        layoverBorder.layer.cornerRadius = 20

        stopoverBorder.layer.borderWidth = 5
        stopoverBorder.layer.borderColor = UIColor.flatBlueDark.cgColor
        stopoverBorder.layer.cornerRadius = 20
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "ItineraryVC", sender: nil)
    }
}
