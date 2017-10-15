//
//  CurrentItineraryTableViewCell.swift
//  Sialah
//
//  Created by Edmund Mok on 10/14/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit
import DynamicButton

class CurrentItineraryTableViewCell: UITableViewCell {

    @IBOutlet weak var innerItineraryCollectionView: UICollectionView!

    private var startingScrollingOffset = CGPoint.zero

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDelegates()
    }

    private func setupDelegates() {
        innerItineraryCollectionView.delegate = self
        innerItineraryCollectionView.dataSource = self
    }

}

// - MARK: UICollectionViewDelegate
extension CurrentItineraryTableViewCell: UICollectionViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingScrollingOffset = scrollView.contentOffset
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidth = UIScreen.main.bounds.width + 22

        let page: CGFloat
        let offset = scrollView.contentOffset.x + scrollView.contentInset.left
        let proposedPage = offset / max(1, cellWidth)
        let snapPoint: CGFloat = 0.1
        let snapDelta: CGFloat = offset > startingScrollingOffset.x ? (1 - snapPoint) : snapPoint

        if floor(proposedPage + snapDelta) == floor(proposedPage) {
            page = floor(proposedPage)
        }
        else {
            page = floor(proposedPage + 1)
        }

        targetContentOffset.pointee = CGPoint(
            x: cellWidth * page,
            y: targetContentOffset.pointee.y
        )
    }
}

// - MARK: UICollectionViewDataSource
extension CurrentItineraryTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerCurrentItineraryCollectionViewCell", for: indexPath) as? InnerCurrentItineraryCollectionViewCell else {
            return UICollectionViewCell()

        }
        prepareButtons(for: cell)
        return cell
    }

    private func prepareButtons(for cell: InnerCurrentItineraryCollectionViewCell) {
        prepare(button: cell.directionsButton)
        prepare(button: cell.ticketsButton)
    }

    private func prepare(button: DynamicButton) {
        button.layer.cornerRadius = button.frame.height / 2.0
        button.contentMode = .center
        button.imageView?.contentMode = .center
        button.imageView?.contentScaleFactor = 1.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 1
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false
    }

}

// - MARK: UICollectionViewDelegateFlowLayout
extension CurrentItineraryTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width + 10, height: collectionView.frame.height)
    }

}
