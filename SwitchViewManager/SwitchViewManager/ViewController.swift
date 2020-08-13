//
//  ViewController.swift
//  SwitchViewManager
//
//  Created by iMAC on 2020/8/11.
//  Copyright © 2020 xwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private static let tag:Int = 10000
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let listBtn = setBtn(title: "列表模式")
        listBtn.tag = ViewController.tag
        listBtn.frame = CGRect(x: 50, y: 200, width: 200, height: 40)
       
        let overlayBtn = setBtn(title: "重叠模式")
        overlayBtn.tag = ViewController.tag + 1
        overlayBtn.frame = CGRect(x: 50, y: 400, width: 200, height: 40)
    }

    func setBtn(title:String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        view.addSubview(button)
        
        return button
    }
    
    @objc func buttonClick(button:UIButton) {
        if button.tag == ViewController.tag {

            navigationController?.pushViewController(ListModelVC(), animated: true)
        }else if button.tag == ViewController.tag + 1 {

            navigationController?.pushViewController(OverlayModelVC(), animated: true)
        }
        
    }
}

