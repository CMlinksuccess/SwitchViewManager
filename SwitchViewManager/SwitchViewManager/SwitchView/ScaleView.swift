//
//  ScaleView.swift
//  FireControl
//
//  Created by iMAC on 2020/5/29.
//  Copyright © 2020 fireControl. All rights reserved.
//

import UIKit
import SnapKit

///视图显示类型
enum ShowType {
    case list     //列表模式
    case overlay  //重叠模式
}

typealias ButtonBlock = (ScaleView) -> Void
class ScaleView: UIView {
    ///标题，底部按钮文字
    var title: String = ""{
        didSet{
            button.setTitle(title, for: .normal)
            titleLab.text = title
        }
    }
    //是否设置圆角和阴影
    var isSetTheme = true
    
    //以下属性仅供SwitchViewManager类设置
    var showType:ShowType = .list
    var index:Int = 1
    var buttonBlock:ButtonBlock?
    var isNewView = false
    var select:Bool = true{
        didSet{
            if select { //放大
                self.button.isHidden = true
                UIView.animate(withDuration: 0.2, animations: {
                    self.transform = .identity
                })
            }else{ //缩小
                if isNewView {
                    return
                }
                UIView.animate(withDuration: 0.2, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
                    self.offsetY = (self.showType == ShowType.list ? self.index : 2)
                    self.transform = self.transform.translatedBy(x: 0, y: CGFloat(45*self.offsetY))
                })
                self.button.isHidden = false
            }
        }
    }
    let titleLab = UILabel()
    
    private let button = UIButton()
    private var offsetY:Int
    override init(frame: CGRect) {
        offsetY = index
        super.init(frame: frame)
        
        titleLab.font = .systemFont(ofSize: 24)
        titleLab.textAlignment = .left
        addSubview(titleLab)
        
        button.setTitleColor(.gray, for: .normal)
        addSubview(button)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        backgroundColor = .white
        if isSetTheme {
            
            //圆角
            layer.cornerRadius = 10
            //阴影设置
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 10
            layer.shadowOpacity = 0.3
        }
    }
    @objc func buttonClick() {
        if let block = self.buttonBlock {
            block(self)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        titleLab.snp_makeConstraints { (make) in
            make.top.equalTo(30)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
        }
        button.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
