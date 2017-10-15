//
//  ChecklistViewController.swift
//  Sialah
//
//  Created by Edmund Mok on 10/15/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

class ChecklistViewController: UIViewController {

    var insets: CGFloat = 6

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackBtn()
    }

    func initBackBtn() {
        let backBtnFrame = CGRect(x: X(75), y: Y(insets), width: X(21), height: 30.0)
        let backBtn = ColoredBtn(frame: backBtnFrame, title: "Back", color: UIColor.flatGrayDark)
        backBtn.layer.shadowOpacity = 0
        backBtn.addTarget(self, action: #selector(self.backPressed(_:)), for: .touchUpInside)
        self.view.addSubview(backBtn)
    }

    @objc func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
