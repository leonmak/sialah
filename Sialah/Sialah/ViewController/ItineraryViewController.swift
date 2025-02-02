//
//  ItineraryViewController.swift
//  Sialah
//
//  Created by Edmund Mok on 10/14/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class ItineraryViewController: UIViewController, CardDelegate {

    struct MenuButton {
        let image: UIImage
        let backgroundColor: UIColor
    }

    let menuButtonData = [
//        MenuButton(image: <#T##UIImage#>, backgroundColor: <#T##UIColor#>), // Map
        MenuButton(image: UIImage(named: "icons_food")!, backgroundColor: .orange), // Food Stop
        MenuButton(image: UIImage(named: "icons_bus")!, backgroundColor: .yellow) // Hop-on-Hop-off Bus Button
    ]

    @IBOutlet weak var itineraryTableView: UITableView!

    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itineraryTableView.dataSource = self
        itineraryTableView.delegate = self

        setupNotificationHandlers()
        setupAirlineCards()
        setupMenuButton()
    }
    
    
    func setupAirlineCards() {
        let departCardFrame = CGRect(x: X(0), y: Y(85), width: X(100), height: Y(20))
        let departCardGroup = CardArticle(frame:  departCardFrame)
        departCardGroup.title = "Departure"
        departCardGroup.subtitleSize = 30.0
        departCardGroup.textColor = UIColor.white
        departCardGroup.category = "Flight SQ342 - SIN-DPS"
        departCardGroup.backgroundImage = UIImage(named: "airport")
        departCardGroup.delegate = self
        view.addSubview(departCardGroup)
    }

    func cardDidTapInside(card: Card) {
        if let article = card as? CardArticle, article.title == "Departure" {
            performSegue(withIdentifier: "CouponVC", sender: nil)
        }
    }

    private func setupNotificationHandlers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleDoneButtonPressed(_:)), name: Notification.Name(rawValue: "doneButtonPressed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleInfoCardPressed(_:)), name: Notification.Name(rawValue: "infoCardPressed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTicketButtonPressed(_:)), name: Notification.Name(rawValue: "ticketButtonPressed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleChecklistButtonPressed(_:)), name: Notification.Name(rawValue: "checklistButtonPressed"), object: nil)
    }

    @objc private func handleDoneButtonPressed(_ notification: Notification) {
        let rowIndex = notification.userInfo!["rowIndex"] as! Int

        currentIndex += 1
        itineraryTableView.reloadRows(at: [IndexPath(row: rowIndex, section: 0), IndexPath(row: rowIndex+1, section: 0)], with: .fade)
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(0.2)) {
            self.itineraryTableView.scrollToRow(at: IndexPath(row: self.currentIndex, section: 0), at: .top, animated: true)
            if self.currentIndex == 3 {
                self.alert(message: "Early closure due to weekly cleaning of enclosures.", title: "Singapore Zoo early closure")
            }
            if self.currentIndex == 4 {
                self.alert(message: "Checkout is at 8am tomrrow. Please be punctual", title: "Flight reminders")
            }
        }
    }

    @objc private func handleChecklistButtonPressed(_ notification: Notification) {
        self.performSegue(withIdentifier: "segueToChecklist", sender: notification.userInfo)
    }
    
    func alert(message: String, title: String) -> Void {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {_ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @objc private func handleInfoCardPressed(_ notification: Notification) {
        self.performSegue(withIdentifier: "infoCardSegue", sender: notification.userInfo)
    }

    @objc private func handleTicketButtonPressed(_ notification: Notification) {
        let modelIndex = notification.userInfo!["modelIndex"] as! Int
        self.performSegue(withIdentifier: "ticketButtonSegue", sender: modelIndex)
    }

    private func setupMenuButton() {
        let circleExpandingMenu = CircleExpandingMenu(
            frame: CGRect(x: self.view.bounds.width - 100, y: self.view.bounds.height - 100, width: 50, height: 50),
            normalIcon: "icons_menu",
            selectedIcon: "icons_close",
            buttonsCount: 2,
            duration: 0.8,
            distance: 10
        )
        circleExpandingMenu.delegate = self
        circleExpandingMenu.backgroundColor = UIColor(red:0.19, green:0.57, blue:1, alpha:1)
        circleExpandingMenu.layer.cornerRadius = circleExpandingMenu.frame.size.width / 2
        
        self.view.addSubview(circleExpandingMenu)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "infoCardSegue":
            let destVC = segue.destination as! InfoVC
            let userInfo = sender as! [AnyHashable : Any]
            let modelIndex = userInfo["modelIndex"] as! Int
            let rowIndex = userInfo["rowIndex"] as! Int
            guard rowIndex > 0 else {
                destVC.stopover = Constants.arrivalStopover
                return
            }
            destVC.stopover = Constants.stopoverList[modelIndex]
        case "ticketButtonSegue":
            let destVC = segue.destination as! CouponVC
            destVC.stopover = Constants.stopoverList[sender as! Int]
        case "segueToChecklist":
            return
        case "CouponVC":
            if let destVC = segue.destination as? CouponVC {
                destVC.stopover = Constants.departureStopover
            }
        case "FoodVC":
            return
        default:
            return
        }
    }

}

// - MARK: CircleExpandingMenuDelegate
extension ItineraryViewController: CircleExpandingMenuDelegate {
    func circleExpandingMenu(_ circleExpandingMenu: CircleExpandingMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = menuButtonData[atIndex].backgroundColor
        button.setImage(menuButtonData[atIndex].image, for: .normal)
    }

    func circleExpandingMenu(_ circleExpandingMenu: CircleExpandingMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        if atIndex == 0 {
            performSegue(withIdentifier: "FoodVC", sender: nil)
        }
        return
    }

    func circleExpandingMenu(_ circleExpandingMenu: CircleExpandingMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        return
    }
}

// - MARK: UITableViewDelegate
extension ItineraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == currentIndex {
            return 280
        }
        return 180
    }
}

// - MARK: UITableViewDataSource
extension ItineraryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.stopoverList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == currentIndex {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentItineraryTableViewCell", for: indexPath) as! CurrentItineraryTableViewCell
            cell.contentHeight = 222
            cell.rowIndex = indexPath.row
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentItineraryTableViewCell", for: indexPath) as! CurrentItineraryTableViewCell
        cell.contentHeight = 140
        cell.rowIndex = indexPath.row
        return cell
    }
}
