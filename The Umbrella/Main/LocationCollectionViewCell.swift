//
//  LocationCollectionViewCell.swift
//  The Umbrella
//
//  Created by Lestad on 2021-01-03.
//  Copyright © 2021 Lestad. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cityName: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var weatherType: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var imageBack: UIImageView!
    var currentWeather = CurrentWeather()

    func setup(location: locationModel){
        cityName.text = ""
        weatherLabel.text = ""
        weatherType.text = ""
        weatherImage.image = nil
        imageBack.image = nil
        
        self.contentView.roundCorners(.allCorners, radius: 10)
        
        cityName.text = location.name
        let color = UIColor(hexString: "#CB0162")
        
        //self.contentView.backgroundColor = color
        
//        if location.name == "Vancouver"{
//            imageBack.image = UIImage(named: "van5")
//        }else if location.name == "Toronto" {
//            imageBack.image = UIImage(named: "toronto")
//        }else{
//            imageBack.image = UIImage(named: "city")
//        }
        currentWeather.downloadPreWeather(latitude: location.latitude, longitude: location.longitude){
            
            self.weatherLabel.text = "\(self.currentWeather.currentTemp)°"
            self.weatherType.text = "\(self.currentWeather.weatherType)"
            
            //self.imageBack.isHidden = true
            if self.currentWeather.weatherType == "Clouds"{
                self.weatherImage.image = UIImage(named:"clouds")
            } else if self.currentWeather.weatherType == "Rain"{
                self.weatherImage.image = UIImage(named:"rain")
            }else if self.currentWeather.weatherType == "snow"{
                self.weatherImage.image = UIImage(named:"snowing")
            }else if self.currentWeather.weatherType == "Clear"{
                self.weatherImage.image = UIImage(named:"sun1")
            }
        }
    }
}
