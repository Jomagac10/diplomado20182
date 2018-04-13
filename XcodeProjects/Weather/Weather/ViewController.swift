//
//  ViewController.swift
//  Weather
//
//  Created by Jose Manuel García Chávez on 4/13/18.
//  Copyright © 2018 Jose Manuel García Chávez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LocationText: UILabel!
    @IBOutlet weak var TemperatureText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London,uk&units=metric&APPID=c15ad56f2d962c97ad623d9506e4308d"){
            WeatherService(url: url)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func WeatherService(url: URL){
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let _data = data else{
                print ("Error, data is nil")
                return
            }
                do {
                    if let json = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any]{
                        DispatchQueue.main.async {
                            if let main = json["main"] as! [String: Any]? {
                                if let temperatureValue = main["temp"] as? NSNumber {
                                    self.TemperatureText.text = "\(temperatureValue) ºC"
                                }
                            }
                            self.LocationText.text = json["name"] as? String
                        }
                    }
                } catch let e {
                    print("Error retrieving weather data: \(e)")
                }
        })
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

