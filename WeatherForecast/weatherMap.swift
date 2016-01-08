//
//  weatherMap.swift
//  WeatherForecast
//
//  Created by Karthik Basavaraj on 07/12/15.
//  Copyright © 2015 Karthik Basavaraj. All rights reserved.
//

import UIKit

class weatherMap: UIViewController {

    @IBOutlet weak var mapView: UIView!
    var weatherMap: AWFWeatherMap = AWFWeatherMap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.weatherMap = AWFWeatherMap(mapType: AWFWeatherMapType.Google)

        let location = CLLocationCoordinate2DMake(latitude, longitude)
        self.weatherMap.setMapCenterCoordinate(location, zoomLevel: 9, animated: true)
        self.weatherMap.addLayerType(AWFLayerType.RadarSatellite)
        //self.weatherMap.addLayerType(AWFLayerType.Satellite)
        
        weatherMap.weatherMapView.frame = self.mapView.bounds
        self.mapView.addSubview(self.weatherMap.weatherMapView)
        

      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
