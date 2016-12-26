//
//  ViewController.swift
//  WeatherAppWithAlamofire
//
//  Created by macOSX on 12/23/16.
//  Copyright © 2016 macOSX. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    //Header @Outlet
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    @IBOutlet weak var weatherIconHeader: UIImageView!
    @IBOutlet weak var MaxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    //Footer @Oulet
    @IBOutlet weak var dataLable: UILabel!
    //@TableView
    @IBOutlet weak var tableView: UITableView!
    //FetchData Weather
    var weather = DataModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //loadData 
        weather.downloadData {
            self.updateUI()
        }
        //Table Delegate
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func updateUI(){
        cityName.text = weather.location
        weatherIconHeader.image = UIImage(named:weather._weather)
        cityDescription.text = weather.weather
        MaxTemp.text = "\(weather.temp)"
        dataLable.text = weather.date
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

