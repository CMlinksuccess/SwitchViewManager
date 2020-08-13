//
//  ListModelVC.swift
//  SwitchViewManager
//
//  Created by iMAC on 2020/8/11.
//  Copyright © 2020 xwj. All rights reserved.
//

import UIKit

class ListModelVC: UIViewController {

    let loginView = ScaleView()
    let registerView = ScaleView()
    let forgetPasswordView = ScaleView()
    let scale = SwitchViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //创建方式1
        createView1()
        //创建方式2
        //createView2()
        //添加新增视图
        forgetPassword()
    }
    //方式一
    func createView1() {
        loginView.title = "登录"

        registerView.title = "注册"
       
        scale.showType = .list
        let views = [registerView,loginView]
        scale.addViews(views: views, superView: view, frame: CGRect(x: 40, y: (view.frame.height - 300)/2.0, width: view.frame.width - 80, height: 300))
    }
    
    //方式二
    func createView2() {
        loginView.title = "登录"
        view.addSubview(loginView)
        loginView.frame = CGRect(x: 40, y: (view.frame.height - 300)/2.0, width: view.frame.width - 80, height: 300)

        registerView.title = "注册"
        view.addSubview(registerView)
        registerView.frame = CGRect(x: 40, y: (view.frame.height - 300)/2.0, width: view.frame.width - 80, height: 300)
                
        scale.showType = .list
        let views = [registerView,loginView]
        scale.addViews(views: views)
    }

    
    func forgetPassword() {
        let forgetBtn = UIButton()
        loginView.addSubview(forgetBtn)
        forgetBtn.setTitle("忘记密码", for: .normal)
        forgetBtn.setTitleColor(.blue, for: .normal)
        forgetBtn.addTarget(self, action: #selector(forgetClick), for: .touchUpInside)
        forgetBtn.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }
    @objc func forgetClick() {
        forgetPasswordView.title = "忘记密码"
        scale.showNewView(view: forgetPasswordView)
    }
}
