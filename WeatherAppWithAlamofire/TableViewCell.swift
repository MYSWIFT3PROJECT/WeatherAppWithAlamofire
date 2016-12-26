//
//  TableViewCell.swift
//  WeatherAppWithAlamofire
//
//  Created by macOSX on 12/23/16.
//  Copyright © 2016 macOSX. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    //Header @OutletCell
    @IBOutlet weak var currentTemp: UIImageView!
    @IBOutlet weak var CurrentDayTemp: UILabel!
    @IBOutlet weak var currentWeatherTemp: UILabel!
    @IBOutlet weak var currentMaxTemp: UILabel!
    @IBOutlet weak var minCurrentTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
