//
//  RGContainerViewController.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/11.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class RGContainerViewController: ViewController {

    
    @IBOutlet weak var topContainer: UIView!
    
    @IBOutlet weak var bottomContainer: UIView!
    
    let startMapViewController = RGMapViewController()
    
    let targetMapViewController = RGMapViewController()
    
    let startGeoViewController = RGGeoInfoViewController()
    
    let targetGeoViewController = RGGeoInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.addChildViewController(startMapViewController)
        topContainer.addSubview(startMapViewController.view)
        startGeoViewController.didMove(toParentViewController: self)
        
        self.addChildViewController(targetMapViewController)
        topContainer.addSubview(targetMapViewController.view)
        targetMapViewController.didMove(toParentViewController: self)
        targetMapViewController.updatePositionY()
        // 要注意的 真多， 直接这样， 一个 controller 多地图， 地图无法滚动。
        // 直接的 多开， 不行是吧
        
        topContainer.decorateLayer(2)
        bottomContainer.decorateLayer(-2)
        
        
        
    }

    
    @IBAction func infoButtonHandler(_ sender: UIButton) {
        
        
        
        
        
        
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
