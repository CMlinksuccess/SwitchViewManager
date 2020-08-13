# SwitchViewManager
少量视图卡切换动画

## 效果图：
<img src="https://github.com/CMlinksuccess/SwitchViewManager/blob/master/EffectDrawing/image1.PNG" width="300" height="630"><img src="https://github.com/CMlinksuccess/SwitchViewManager/blob/master/EffectDrawing/image2.PNG" width="300" height="630">


## 使用方式

1.ScaleView 类作为视图卡，使用时可创建子类定制视图

2.SwitchViewManager 类作为视图卡管理类，可进行添加和删除加入动画的视图卡

创建示例如下：
```swift
let loginView = ScaleView()
let registerView = ScaleView()
let forgetPasswordView = ScaleView()
let scale = SwitchViewManager() //管理类
    
loginView.title = "登录"

registerView.title = "注册"
        
forgetPasswordView.title = "忘记密码"

scale.showType = .overlay     
let views = [forgetPasswordView,registerView,loginView]
scale.addViews(views: views, superView: view, frame: CGRect(x: 40, y: (view.frame.height - 300)/2.0, width: view.frame.width - 80, height: 300))   
    
```

展示模式有2种：列表型、重叠型
```swift
///视图显示类型
enum ShowType {
    case list     //列表模式
    case overlay  //重叠模式
}
```

### 添加新视图卡
1.添加临时展示视图卡
```swift
let configView = ScaleView()
configView.title = "配置环境"
view.addSubview(configView)
configView.frame = CGRect(x: 40, y: (view.frame.height - 300)/2.0, width: view.frame.width - 80, height: 300)
scale.addView(view: configView)
```
2.添加轮动视图卡
```swift
let configView = ScaleView()
configView.title = "配置环境"
scale.showNewView(view: configView)
```
### 删除视图卡
```swift
scale.removeView(title: "配置环境")
```
