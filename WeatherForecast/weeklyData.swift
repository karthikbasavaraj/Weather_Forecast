//
//  weeklyData.swift
//  WeatherForecast
//
//  Created by Karthik Basavaraj on 19/11/15.
//  Copyright © 2015 Karthik Basavaraj. All rights reserved.
//

import Foundation

class weeklyData {
    var date:String
    var iconurl:String
    var lowHighTemp:String
    
    init(date:String,iconurl:String,lowHighTemp:String){
        self.date=date
        self.iconurl=iconurl
        self.lowHighTemp=lowHighTemp
    }
}