//
//  RGMapViewController.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/11.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class RGMapViewController: ViewController {

    var mapView_baidu: BMKMapView!
    var map_view_height: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
    //    let topHeight = UIApplication.shared.statusBarFrame.height
      //  let map_view_height = view.frame.height*0.42 - topHeight
        map_view_height = view.frame.height*0.42
      //  mapView_baidu = BMKMapView(frame: CGRect(x: 0, y: topHeight, width: view.frame.width, height: map_view_height))
         mapView_baidu = BMKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: map_view_height))
        view.addSubview(mapView_baidu)
    }
//   BS  baidu 的 ObjC , ， 我用下约束，都不行
    func updatePositionY(){
        mapView_baidu.frame.origin.y = view.frame.height - map_view_height
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
