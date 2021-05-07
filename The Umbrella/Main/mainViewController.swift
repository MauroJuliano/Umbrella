//
//  mainViewController.swift
//  The Umbrella
//
//  Created by Lestad on 2021-01-03.
//  Copyright © 2021 Lestad. All rights reserved.
//

import Foundation
import UIKit

class mainViewController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    var currentWeather = CurrentWeather()
    var mainView = ViewController()
    var request = dataRequest()
    
    init(mainView: ViewController, request: dataRequest) {
        self.mainView = mainView
        self.request = request
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return request.weatherLocations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! LocationCollectionViewCell
        
        let weatherInfo = request.weatherLocations[indexPath.row]

        cell.setup(location: weatherInfo)
        return cell
    }

}
