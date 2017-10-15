//
//  CurrentItineraryTableViewCell.swift
//  Sialah
//
//  Created by Edmund Mok on 10/14/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class CurrentItineraryTableViewCell: UITableViewCell {

    @IBOutlet weak var innerItineraryTableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        innerItineraryTableView.delegate = self
        innerItineraryTableView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// - MARK: UITableViewDataSource
extension CurrentItineraryTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InnerCurrentIntineraryTableViewCell", for: indexPath)
        cell.textLabel?.text = "ASDS"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

// - MARK: UITableViewDelegate
extension CurrentItineraryTableViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
