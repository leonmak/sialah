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
    var stopover: Stopover = Constants.zooStopover
    
    var dragMotionBtn: ColoredBtn!
    
    var isMotion = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        initPanoView()
        initButtons()
    }
    
    func initPanoView() {
        panoView.controlMethod = .motion
        panoView.panoramaType = .cylindrical
        panoView.image = UIImage(named: stopover.panoImageName!)
    }
    
    func setDragBtnTitle() {
        if isMotion {
            dragMotionBtn.setTitle("Motion", for: .normal)
        } else {
            dragMotionBtn.setTitle("Drag", for: .normal)
        }
    }
    
    func initButtons() {
        let dragFrame = CGRect(x: rect.width * 0.6, y: rect.height * 0.85, width: rect.width * 0.3, height: rect.height * 0.1)
        self.dragMotionBtn = ColoredBtn(frame: dragFrame, title: "",
                                        color: UIColor.darkGray.withAlphaComponent(0.75))
        self.dragMotionBtn.addTarget(self, action: #selector(self.dragMotionBtnPressed(_:)), for: .touchUpInside)
        setDragBtnTitle()
        self.view.addSubview(dragMotionBtn)
        
        let backBtnFrame = CGRect(x: X(75), y: Y(6), width: X(21), height: 30.0)
        let backBtn = ColoredBtn(frame: backBtnFrame, title: "Back", color: UIColor.flatGrayDark)
        backBtn.layer.shadowOpacity = 0
        backBtn.addTarget(self, action: #selector(self.backPressed(_:)), for: .touchUpInside)
        
        self.view.addSubview(backBtn)
    }

    @objc func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @objc func dragMotionBtnPressed(_ sender: Any) {
        isMotion = !isMotion
        panoView.controlMethod = isMotion ? .motion : .touch
        setDragBtnTitle()
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

