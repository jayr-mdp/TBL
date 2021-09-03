//
//  APIService.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit

class APIService: NSObject {
    static let shared = APIService()
        
    var baseURL: NSURL?
    
    //Initializer
    private override init(){
    }
        
    func getFriendsList(completion: @escaping (_ result :  Result?,_ error : Error?) -> Void) {
        let requestURL = URL(string: "https://randomuser.me/api/?results=10")
        let task = URLSession.shared.dataTask(with: requestURL!) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Result.self, from: data)
                completion(result, error)
            } catch {
                print("Error : \(error)")
            }
        }

        task.resume()
    }
}
