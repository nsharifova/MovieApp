//
//  APIManager.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 10.11.24.
//

import Foundation
import Alamofire

protocol NetworkSevice {
    func fetchData<T:Codable> (urlPath:String,parameters:[String:Any]?,method:HTTPMethod ,type:T.Type,headers: HTTPHeaders?,completion: @escaping (Result<T,Error>)->Void )
    func postData<T:Codable> (urlPath:String,parameters:[String:Any]? ,method:HTTPMethod,type:T.Type,completion: @escaping (Result<T,Error>)->Void )
}
class Service : NetworkSevice {
    
    func fetchData<T:Codable> (urlPath:String,parameters:[String:Any]? = nil,method:HTTPMethod = .get,type:T.Type,headers: HTTPHeaders? = nil,completion: @escaping (Result<T,Error>)->Void )
    {
        AF.request(urlPath,method: method,parameters: parameters,encoding: URLEncoding.default,headers: headers).responseDecodable(of: T.self){
            response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))

            }
        }
    }
    func postData<T:Codable> (urlPath:String,parameters:[String:Any]? = nil,method:HTTPMethod = .get,type:T.Type,completion: @escaping (Result<T,Error>)->Void )
    {
        AF.request(urlPath, method: method, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
         
            switch response.result {
             
            case .success(let value):
                print("Success:", value)
                
            case .failure(let error):
                print("Error:", error)
            }
        }
    }
    
}
