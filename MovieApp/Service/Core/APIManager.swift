//
//  APIManager.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation
import Alamofire

protocol NetworkSevice {
    func fetchData<T:Codable> (urlPath:String,parameters:[String:Any]?,method:HTTPMethod ,type:T.Type,completion: @escaping (Result<T,Error>)->Void )
}
class Service : NetworkSevice {
    func fetchData<T:Codable> (urlPath:String,parameters:[String:Any]? = nil,method:HTTPMethod = .get,type:T.Type,completion: @escaping (Result<T,Error>)->Void )
    {
        AF.request(urlPath,method: method,parameters: parameters,encoding: URLEncoding.default).responseDecodable(of: T.self){
            response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
                if let data = response.data {
                          print("Response Data: \(String(data: data, encoding: .utf8) ?? "No readable data")")
                      }
                      print("Error: \(error)")
                      completion(.failure(error))
            }
        }
    }
}
