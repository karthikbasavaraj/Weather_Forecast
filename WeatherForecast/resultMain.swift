//
//  resultMain.swift
//  WeatherForecast
//
//  Created by Karthik Basavaraj on 16/11/15.
//  Copyright © 2015 Karthik Basavaraj. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit

class resultMain: UIViewController, FBSDKSharingDelegate{
  
    
    @IBOutlet weak var mainTemp: UILabel!
    
    @IBOutlet weak var lowHighTemp: UILabel!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var precipProb: UILabel!
    
    @IBOutlet weak var dew: UILabel!
    
    @IBOutlet weak var precip: UILabel!
  
    @IBOutlet weak var humidity: UILabel!
    
    @IBOutlet weak var visibility: UILabel!
    
    @IBOutlet weak var sunRise: UILabel!
  
    @IBOutlet weak var sunSet: UILabel!
    
    @IBOutlet weak var degSymbol: UILabel!
    
    @IBOutlet weak var mainTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.contentSize.height = 763
       sleep(1)
        
        
        let url = NSURL(string: currentDetails.iconurl)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        
        mainImage.image = UIImage(data: data!)
        
        
      /*  print(currentDetails)*/
        
        mainTemp.text =  currentDetails.temp
        
        mainTitle.text = currentDetails.summary
        
        degSymbol.text = currentDetails.tempIndicator
        
        lowHighTemp.text = currentDetails.lowHighTemp
        
        precip.text = currentDetails.precipIntensity
        
        precipProb.text = currentDetails.precipProb
        
        dew.text = currentDetails.dew
        
        humidity.text = currentDetails.humidity
        
        visibility.text = currentDetails.visibility
        
        windSpeed.text = currentDetails.windSpeed
        
        sunRise.text = currentDetails.sunRiseTime
        
        sunSet.text = currentDetails.sunSetTime
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func sharer(sharer: FBSDKSharing!, didCompleteWithResults results: [NSObject: AnyObject]) {
    if(results.count != 0){
        print("Success")
        let alert = UIAlertController(title: "", message: "Posted Successfully!!", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    else{
        print("Not Posted")
        let alert = UIAlertController(title: "", message: "Post Cancelled!!", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    }
    
    func sharer(sharer: FBSDKSharing!, didFailWithError error: NSError!) {
        print("sharer NSError")
        print(error.description)
    }
    
    func sharerDidCancel(sharer: FBSDKSharing!) {
        print("sharerDidCancel")
    }
    
    @IBAction func fbshare(sender: AnyObject) {
        let url = NSURL(string: currentDetails.iconurl)
        let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "https://forecast.io")
        content.imageURL = url
        content.contentTitle = fbContentTitle
        content.contentDescription = fbContentDesc
        
        let shareFB: FBSDKShareDialog = FBSDKShareDialog()
        shareFB.shareContent = content
        shareFB.delegate = self
        shareFB.mode = FBSDKShareDialogMode.FeedWeb
        shareFB.show()
        
    }

}
