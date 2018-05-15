//
//  RGGeoInfoViewController.swift
//  RGContainmentViewController
//
//  Created by dengjiangzhou on 2018/5/11.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class RGGeoInfoViewController: ViewController {
    
    private let geoCodeService = BMKGeoCodeSearch()
       
    
    
    var location: CLLocation!{
        didSet{
        //    if let old_value = oldValue, location.distance(from: old_value) > 100{
                geoCodeService.delegate = self
                let reverseGeocodeSearchOption = BMKReverseGeoCodeOption()
                reverseGeocodeSearchOption.reverseGeoPoint = location.coordinate
                geoCodeService.reverseGeoCode(reverseGeocodeSearchOption)
        //    }

        }// didSet{
    }
    
    private var infoLabel = {() -> UILabel in
        let tmpLabel = UILabel()
        tmpLabel.textAlignment = .center
        tmpLabel.textColor = UIColor.black
        tmpLabel.backgroundColor = UIColor.yellow
        tmpLabel.numberOfLines = 0
        tmpLabel.font = UIFont.systemFont(ofSize: 17)
        
        //boldSystemFont(ofSize: 17)
        tmpLabel.shadowColor = UIColor.blue
        tmpLabel.shadowOffset = CGSize(width: 1.0, height: 1.0)
        return tmpLabel
    }()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //  https://stackoverflow.com/questions/16361139/transitionfromviewcontroller-view-not-appearing
        // 有 bug
        print("123")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            print("456")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   let aView = UIView()
     //   aView.autoresizingMask = [UIViewAutoresizing.flexibleWidth , .flexibleHeight ]
        view.backgroundColor = UIColor.gray
      //  infoLabel.autoresizingMask = [UIViewAutoresizing.flexibleWidth , .flexibleHeight ]
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
     //   infoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       infoLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.42).isActive = true  // 难怪 官方例子，TM 这么写           //  infoLabel.autoresizingMask = [UIViewAutoresizing.flexibleWidth , .flexibleHeight ]
        
        
        
        
        
       // view = aView

      //  infoLabel.text = "woqu"
        print(infoLabel.frame)
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



extension RGGeoInfoViewController: BMKGeoCodeSearchDelegate{
    
 
    
    func onGetReverseGeoCodeResult(_ searcher: BMKGeoCodeSearch!, result: BMKReverseGeoCodeResult!, errorCode error: BMKSearchErrorCode) {
        if let businessCircle = result.businessCircle , businessCircle != "" {
            infoLabel.text = "\(businessCircle), \(result.address!)"
        }
        else{
            infoLabel.text = result.address!
        }
        
        
    }
    
    
}
