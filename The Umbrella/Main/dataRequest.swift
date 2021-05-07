//
//  dataRequest.swift
//  The Umbrella
//
//  Created by Lestad on 2021-01-03.
//  Copyright © 2021 Lestad. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class dataRequest{
    let ref: DatabaseReference = Database.database().reference()
    var currentWeather = CurrentWeather()
    var weatherLocations = [locationModel]()
    var weatherFull = [String: Any]()
    
    func downloadData(completionHandler: @escaping(_ result: Bool, _ error: Error?) -> Void) {
        
        if let uid = Auth.auth().currentUser?.uid {
            let reference = ref.child("locations").child(uid)
            reference.observe(.value, with: { (snapshot) in
         
                if let locations = snapshot.value as? [String: AnyObject] {
                  
                    for(_, value) in locations {
                        
                        let userToshow = locationModel()
                        let cityName = value["name"] as? String
                        let latitude = value["latitude"] as? Double
                        let longitude =  value["longitude"] as? Double
                        let userID = value["userID"] as? String
                        
                        userToshow.name = cityName
                        userToshow.latitude = latitude
                        userToshow.longitude = longitude
                        userToshow.userID = userID
                
                        if userToshow.userID == uid {
                            self.weatherLocations.append(userToshow)
                            completionHandler(true,nil)
                        }
                    }
                }
            })
        }
    }
}
