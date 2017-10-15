//
//  ItineraryViewController.swift
//  Sialah
//
//  Created by Edmund Mok on 10/14/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class ItineraryViewController: UIViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itineraryTableView.dataSource = self
        itineraryTableView.delegate = self

        setupMenuButton()
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
        circleExpandingMenu.backgroundColor = .green
        circleExpandingMenu.layer.cornerRadius = circleExpandingMenu.frame.size.width / 2

        self.view.addSubview(circleExpandingMenu)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// - MARK: CircleExpandingMenuDelegate
extension ItineraryViewController: CircleExpandingMenuDelegate {
    func circleExpandingMenu(_ circleExpandingMenu: CircleExpandingMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = menuButtonData[atIndex].backgroundColor
        button.setImage(menuButtonData[atIndex].image, for: .normal)
    }

    func circleExpandingMenu(_ circleExpandingMenu: CircleExpandingMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        return
    }

    func circleExpandingMenu(_ circleExpandingMenu: CircleExpandingMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        return
    }
}

// - MARK: UITableViewDelegate
extension ItineraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
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
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentItineraryTableViewCell", for: indexPath) as! CurrentItineraryTableViewCell
            cell.contentHeight = 222
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentItineraryTableViewCell", for: indexPath) as! CurrentItineraryTableViewCell
        cell.contentHeight = 140
        return cell
    }
}
