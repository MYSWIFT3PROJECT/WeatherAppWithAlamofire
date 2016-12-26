//
//  DataModel.swift
//  WeatherAppWithAlamofire
//
//  Created by macOSX on 12/23/16.
//  Copyright © 2016 macOSX. All rights reserved.
//

import Foundation
import Alamofire

class DataModel{
    var _date:Double?
    var _temp:String?
    var _location:String?
    var _weather:String?
    typealias JONSStandard = Dictionary<String, AnyObject>
    let url = URL(string:"http://api.openweathermap.org/data/2.5/weather?q=Portland&appid=a7bbbd5e82c675f805e7ae084f742024")!
    var date:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? "Today,\(dateFormatter.string(from: date))":"Date Invalid"
    }
    var temp:String{
        return _temp ?? "0 °C"
    }
    var location:String{
        return _location ?? "Location Invalid"
    }
    var weather:String{
        return _weather ?? "Weather Invalid"
    }
    func downloadData(completed: @escaping ()->()){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            if let dict = result.value as? JONSStandard,let main = dict["main"] as? JONSStandard,let temp = main["temp"] as? Double , let weatherArray = dict["weather"] as? [JONSStandard], let weather = weatherArray[0]["main"] as? String, let name = dict["name"] as? String, let sys = dict["sys"] as? JONSStandard, let country = sys["country"] as? String, let dt = dict["dt"] as? Double {
                self._temp = String(format: "%.0f °C", temp - 273.15)
                self._weather = weather
                self._location = "\(name), \(country)"
                self._date = dt
                
            }
            completed()
            print("Completed Data\(completed)")
        })
    }
    
}
