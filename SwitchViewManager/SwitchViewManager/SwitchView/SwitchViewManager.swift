//
//  SwitchView.swift
//  FireControl
//
//  Created by iMAC on 2020/6/1.
//  Copyright © 2020 fireControl. All rights reserved.
//

import UIKit


class SwitchViewManager: NSObject {
    //当前选择的视图
    var selectView:ScaleView?
    var showType: ShowType = .list
    
    private var changeView:[ScaleView] = []

    ///原视图添加新的显示视图，新视图不进行轮换显示时使用
    @discardableResult
    func showNewView(view:ScaleView) -> Bool?{
        guard let firstView = selectView else { return false}
        view.frame = firstView.frame
        firstView.superview!.addSubview(view)
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        view.isNewView = true
        changeView.insert(view, at: 0)
        viewSwitch(scaleView: view)
        return true
    }
    ///添加轮换视图时使用
    func addView(view:ScaleView) {
        changeView.insert(view, at: 0)
        viewSwitch(scaleView: view)
        view.buttonBlock = {(scaleView) in
            if self.selectView != nil && self.selectView!.isNewView { //不参与轮播
                self.selectView!.removeFromSuperview()
                self.changeView.removeFirst()
            }
            if self.showType == .overlay {
                if let item = self.changeView.first {
                    self.changeView.append(item)
                    self.changeView.removeFirst()
                }
            }
            self.viewSwitch(scaleView: scaleView)
        }
    }
    ///直接添加视图数组
    @discardableResult
    func addViews(views:[ScaleView]) -> Bool?{
        if views.count == 0 {
            return false
        }
        changeView = views
        for item in changeView {
            addView(view: item)
        }
        return true
    }
    ///统一设置父视图和位置，添加完视图后调用
    @discardableResult
    func addViews(views:[ScaleView],superView:UIView, frame:CGRect) -> Bool? {

        for item in views {
            item.frame = frame
            superView.addSubview(item)
        }
        return addViews(views: views)
    }
    //视图交互逻辑
    func viewSwitch(scaleView: ScaleView) {
        scaleView.showType = showType
        
        if let item = changeView.firstIndex(of: scaleView) {
            changeView.remove(at: item)
        }
        changeView.insert(scaleView, at: 0)
            
        for (index, subView) in changeView.enumerated().reversed() {
            subView.superview?.bringSubviewToFront(subView)
            subView.index = index + 1
            subView.select = index == 0
        }
        self.selectView = scaleView
    }
    ///删除指定标题的视图
    func removeView(title:String) -> ScaleView? {
        if changeView.count < 2 {
            return nil
        }
        for (index, item) in changeView.enumerated() {
            if item.title == title {
                let deleView = changeView.remove(at: index)
                deleView.removeFromSuperview()
                viewSwitch(scaleView: changeView.first!)
                return deleView
            }
        }
        return nil
    }
}

