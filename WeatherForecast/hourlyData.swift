//
//  hourlyData.swift
//  WeatherForecast
//
//  Created by Karthik Basavaraj on 18/11/15.
//  Copyright © 2015 Karthik Basavaraj. All rights reserved.
//

import Foundation

class hourlyData{
   
    var time:String
    
    var iconurl:String
    
    var temp:String
    
    init(time:String,iconurl:String,temp:String){
        self.time = time
        self.iconurl = iconurl
        self.temp = temp
    }
    
 
}