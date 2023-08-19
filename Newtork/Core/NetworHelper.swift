//
//  NetworHelper.swift
//  FodFod
//
//  Created by Dogukaim on 14.08.2023.
//

import Foundation


enum NetworkEndPoint: String {
    case BASE_URL = "https://yummie.glitch.me"
    
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    func requestUrl(url:String) -> String {
        return "\(NetworkEndPoint.BASE_URL.rawValue)\(url)"
    }
}


