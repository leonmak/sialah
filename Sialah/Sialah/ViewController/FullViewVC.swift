//
//  FullViewVC.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit
import CTPanoramaView

class FullViewVC: UIViewController {
    
    @IBOutlet weak var panoView: CTPanoramaView!
    var panoImageName: String? {
        didSet {
            panoView.image = UIImage(named: panoImageName!)!
        }
    }
    
    var dragBtn: ColoredBtn!
    var motionBtn: ColoredBtn!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPanoView()
        initButtons()
    }
    
    func initPanoView() {
        panoView.controlMethod = .motion
        panoView.panoramaType = .cylindrical
        panoImageName = panoImageName == nil ? "merlion" : panoImageName
    }
    
    func initButtons() {
        let w = view.frame.width
        let h = view.frame.height
        let dragFrameBtn = CGRect(x: w * 0.1, y: h * 0.8, width: w * 0.3, height: h * 0.075)
        let motionBtnFrame = CGRect(x: w * 0.6, y: h * 0.8, width: w * 0.3, height: h * 0.075)
        self.dragBtn = ColoredBtn(frame: dragFrameBtn, title: "Drag", color: UIColor.darkGray.withAlphaComponent(0.75))
        self.motionBtn = ColoredBtn(frame: motionBtnFrame, title: "Motion", color: UIColor.darkGray.withAlphaComponent(0.75))
        self.dragBtn.addTarget(self, action: #selector(self.dragBtnPressed(_:)), for: .touchUpInside)
        self.motionBtn.addTarget(self, action: #selector(self.motionBtnPressed(_:)), for: .touchUpInside)
        self.view.addSubview(dragBtn)
        self.view.addSubview(motionBtn)
    }

    @objc func dragBtnPressed(_ sender: Any) {
        panoView.controlMethod = .touch
    }
    
    @objc func motionBtnPressed(_ sender: Any) {
        panoView.controlMethod = .motion
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

