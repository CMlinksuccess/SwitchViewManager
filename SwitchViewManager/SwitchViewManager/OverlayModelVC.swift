//
//  OverlayModelVC.swift
//  SwitchViewManager
//
//  Created by iMAC on 2020/8/11.
//  Copyright © 2020 xwj. All rights reserved.
//

import UIKit

class OverlayModelVC: UIViewController {

    let loginView = ScaleView()
    let registerView = ScaleView()
    let forgetPasswordView = ScaleView()
    let scale = SwitchViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //创建方式1
        createView1()

    }
    //方式一
    func createView1() {
        loginView.title = "登录"

        registerView.title = "注册"
        
        forgetPasswordView.title = "忘记密码"
       
        scale.showType = .overlay
        let views = [forgetPasswordView,registerView,loginView]
        scale.addViews(views: views, superView: view, frame: CGRect(x: 40, y: (view.frame.height - 300)/2.0, width: view.frame.width - 80, height: 300))
    }
    
}
