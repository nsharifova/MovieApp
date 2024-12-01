//
//  APIManagerHelper.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 12.11.24.
//

import Foundation
class APIManagerHelper {
     static let shared = APIManagerHelper()
     let baseUrl = "https://api.themoviedb.org/3"
     let apiKey = "526f8b398f30698867f33f3dec845d09"
    
    func APIUrl (url:String,sessionId : String? = nil) -> String {
        var fullUrl = baseUrl + url + "?api_key=\(apiKey)"
        if let sessionId = sessionId {
              fullUrl += "&session_id=\(sessionId)"
        }
          
        return fullUrl
    }

}
