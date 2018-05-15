//
//  RGMapViewController.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/11.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

// import MapKit

class RGMapViewController: ViewController {

    var mapView_baidu: BMKMapView!
    var map_view_height: CGFloat!
    var annotationImageName: String!
    
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    let topHeight = UIApplication.shared.statusBarFrame.height
      //  let map_view_height = view.frame.height*0.42 - topHeight
        map_view_height = view.frame.height*0.42
      //  mapView_baidu = BMKMapView(frame: CGRect(x: 0, y: topHeight, width: view.frame.width, height: map_view_height))
         mapView_baidu = BMKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: map_view_height))
        view.addSubview(mapView_baidu)
        
        
        
        mapView_baidu.mapType = UInt(BMKMapTypeSatellite)
        // 百度 地图真没用, API 太low
        //  MKMapTypeHybrid 混合地图(在卫星图上显示街道等名称)
        // 使用 标准行政地图， 上面的小人， 几乎看不见
        
        mapView_baidu.delegate = self
        let annotation = RGAnnotation()
        mapView_baidu.addAnnotation(annotation)
        
    }
//   BS  baidu 的 ObjC , ， 我用下约束，都不行
    
    
/*
     
 
    func updatePositionY(){
        mapView_baidu.frame.origin.y = view.frame.height - map_view_height
    }
  */
    
    
    func updateAnnotationLocation(locate location: CLLocation ){
        let annotation = mapView_baidu.annotations.last as! RGAnnotation
        annotation.updateCoordinate(newCoordinate: location.coordinate)
        snapToLocation(loc: location)
        currentLocation = location
    }
    
    
    
    
    func snapToLocation(loc location: CLLocation ){
        let region = BMKCoordinateRegionMakeWithDistance(location.coordinate, 100_000.0, 100_000.0)
        mapView_baidu.setRegion(region, animated: true)
        
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




extension RGMapViewController: BMKMapViewDelegate{
    
    func mapView(_ mapView: BMKMapView!, viewFor annotation: BMKAnnotation!) -> BMKAnnotationView! {
        let annotationIdentifier = annotationImageName
      //  if annotation.isKind(of: BMKAnnotation.self) {
            //      if annotation.isKind(of: BMKAnnotationView.self) {  笑死了 ，我写的
            
            //       if annotation.isKind(of: RGAnnotation.self) {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
            if let annotationView = annotationView {
                annotationView.annotation = annotation
            }       //       if let annotationView = annotationView
            else{
             //   annotationView = RGAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
                annotationView = BMKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
                annotationView?.image = UIImage(named: annotationIdentifier!)
                annotationView?.isDraggable = true
            }
            
            return annotationView
       // }//if annotation.isKind(of: RGAnnotationView.self)
        
      //  return nil
    }
    
}
