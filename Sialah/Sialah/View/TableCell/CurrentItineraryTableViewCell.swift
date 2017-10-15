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
    @IBOutlet weak var directionsButton: DynamicButton!
    @IBOutlet weak var ticketsButton: DynamicButton!
    @IBOutlet weak var moreButton: DynamicButton!

    private var startingScrollingOffset = CGPoint.zero

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDelegates()
        prepareButtons()
    }

    private func setupDelegates() {
        innerItineraryCollectionView.delegate = self
        innerItineraryCollectionView.dataSource = self
    }

    private func prepareButtons() {
        prepare(button: directionsButton)
        prepare(button: ticketsButton)
        prepare(button: moreButton)
    }

    private func prepare(button: DynamicButton) {
        button.layer.cornerRadius = button.frame.height / 2.0
        button.contentMode = .center
        button.imageView?.contentMode = .center
        button.imageView?.contentScaleFactor = 1.5
    }

}

// - MARK: UICollectionViewDelegate
extension CurrentItineraryTableViewCell: UICollectionViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingScrollingOffset = scrollView.contentOffset
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidth = collectionView(
            innerItineraryCollectionView,
            layout: innerItineraryCollectionView.collectionViewLayout,
            sizeForItemAt: IndexPath(item: 0, section: 0)
        ).width

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerCurrentItineraryCollectionViewCell", for: indexPath)
        return cell
    }

}

// - MARK: UICollectionViewDelegateFlowLayout
extension CurrentItineraryTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width + 10, height: collectionView.frame.height)
    }

}
