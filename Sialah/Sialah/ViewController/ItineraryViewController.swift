//
//  ItineraryViewController.swift
//  Sialah
//
//  Created by Edmund Mok on 10/14/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class ItineraryViewController: UIViewController {

    @IBOutlet weak var itineraryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itineraryTableView.dataSource = self
        itineraryTableView.delegate = self
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

// - MARK: UITableViewDelegate
extension ItineraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 280
        }
        return 140
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
            return cell
        }

        return tableView.dequeueReusableCell(withIdentifier: "OtherItineraryTableViewCell", for: indexPath) as! OtherItineraryTableViewCell
    }
}
