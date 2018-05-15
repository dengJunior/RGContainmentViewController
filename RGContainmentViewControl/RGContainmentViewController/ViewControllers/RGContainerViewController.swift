//
//  RGContainerViewController.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/11.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

struct value_coordinates {
  /*  let lati = 121.53
    let longi = 31.22
 
     
     // 我日蚜， 经纬度 写反了
     
 */
    
    let lati = 31.22
    let longi = 121.53
    
}




class RGContainerViewController: ViewController {

    
    @IBOutlet weak var topContainer: UIView!
    
    @IBOutlet weak var bottomContainer: UIView!
    
    
    @IBOutlet weak var infoButton: UIButton!
    
    
    let startMapViewController = { () -> RGMapViewController in  
        let viewController = RGMapViewController()
        viewController.annotationImageName = "man"
        
        //  "man"
        
        //  "x"
        return viewController
    }()
    
    let targetMapViewController = { () -> RGMapViewController in
        let viewController = RGMapViewController()
        viewController.annotationImageName = "x"
        return viewController
    }()
    let delay = 0.2
    
    let startGeoViewController = RGGeoInfoViewController()
    
    let targetGeoViewController = RGGeoInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.addChildViewController(startMapViewController)
        topContainer.addSubview(startMapViewController.view)
        startGeoViewController.didMove(toParentViewController: self)
        
        self.addChildViewController(targetMapViewController)
        bottomContainer.addSubview(targetMapViewController.view)
        targetMapViewController.didMove(toParentViewController: self)
       // targetMapViewController.updatePositionY()         //  20180514 ， 这行代码， 大可不必
        // 要注意的 真多， 直接这样， 一个 controller 多地图， 地图无法滚动。   20180513
        // 直接的 多开， 不行是吧         20180513   ,            20180514   qu qu qu
        
        
        //  let initialLocation = CLLocation(latitude: 56.55, longitude: 8.316667)  不用 国外的
        
        let initialLocation = CLLocation(latitude: value_coordinates().lati , longitude: value_coordinates().longi) // 用上海的
        //      https://jingwei.supfree.net/mengzi.asp?id=824
        
        
        
        startMapViewController.updateAnnotationLocation(locate: initialLocation)
        targetMapViewController.updateAnnotationLocation(locate: initialLocation.antipode())
        
        
        
        topContainer.decorateLayer(2)
        bottomContainer.decorateLayer(-2)
        
        
        
    }

    
    @IBAction func infoButtonHandler(_ sender: UIButton) {
        
        sender.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + delay * 2) {
            self.infoButton.isEnabled = true
        }
        var animationDirection = UIViewAnimationOptions.transitionFlipFromTop
        if startMapViewController.parent == self{
            startGeoViewController.location = startMapViewController.currentLocation
            targetGeoViewController.location = targetMapViewController.currentLocation
            dng_flipFromViewController(startMapViewController, toViewController: startGeoViewController, direction: animationDirection, delayTime: .now() ,isBottomView: false)
           // topContainer.addSubview(startGeoViewController.view)
            dng_flipFromViewController(targetMapViewController, toViewController: targetGeoViewController, direction: animationDirection, delayTime: .now() + delay ,isBottomView: true)
           // bottomContainer.addSubview(targetGeoViewController.view)
        }
        else{
            animationDirection = .transitionFlipFromBottom
            dng_flipFromViewController(startGeoViewController, toViewController: startMapViewController, direction: animationDirection, delayTime: .now() ,isBottomView: false)
            dng_flipFromViewController(targetGeoViewController, toViewController: targetMapViewController, direction: animationDirection, delayTime: .now() + delay ,isBottomView: true)
            
        }
        
        
        
    }
    
    
    
    func dng_flipFromViewController(_ fromController: UIViewController, toViewController: UIViewController, direction: UIViewAnimationOptions , delayTime: DispatchTime , isBottomView: Bool){
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
          //  let centerPoint = fromController.view.center
            toViewController.view.frame = fromController.view.frame
            fromController.willMove(toParentViewController: nil)
            
            self.addChildViewController(toViewController)
            if isBottomView{
                if self.bottomContainer.subviews.contains(toViewController.view){
                    print("Amazing")
                }
                else{
                  //  self.bottomContainer.addSubview(toViewController.view)
                }
                
            }
            else{
                
                if self.topContainer.subviews.contains(toViewController.view){
                    print("Amazing topContainer")
                }
                else{
                //    self.topContainer.addSubview(toViewController.view)
                }
            }
            
       //     toViewController.view.frame = CGRect(origin: centerPoint, size: CGSize(width: 0, height: 0))
            
            self.transition(from: fromController, to: toViewController, duration: 0.2, options: [direction, .curveEaseIn] , animations: {
                
            //    toViewController.view.frame = fromController.view.bounds
                // 换成
                //  toViewController.view.frame = fromController.view.bounds
                // 可好玩了
                
                
                
              //  fromController.view.frame = CGRect(origin: centerPoint, size: CGSize(width: 0, height: 0))
                
            }, completion: { _ in
                
                toViewController.didMove(toParentViewController: self)
                fromController.removeFromParentViewController()
                
                /*
                 RGContainmentViewController[17224:644505] Unbalanced calls to begin/end appearance transitions for <RGContainmentViewController.RGGeoInfoViewController: 0x7ff2eb513890>.
                 */
                
                
                
                self.infoButton.isEnabled = true
            })
            
            
        }
        
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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




extension UIView{
    func decorateLayer(_ height: CGFloat){
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0.0, height: height)
        
    }
    
}



/*
 
 
 不能用 storyboard , 因为 上下 容器 视图，承载的 开始都是 map 控制器，
 
 
 反转一下，
 对跖点
 
 
 
 上下 容器 视图， 承载 的 就变成都是地理位置信息控制器，
 
 
 
 
 */




/*
 
 
 storyboard 的控制器， class, 没怎么见过 动态修改的
 
 
 */
