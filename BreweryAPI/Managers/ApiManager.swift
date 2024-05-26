//
//  ApiManager.swift
//  BreweryAPI
//
//  Created by Collins, Matthew - MC on 24/05/2024.
//

import Foundation

class ApiManager: ObservableObject {
    
    static let shared = ApiManager()
    
    private init() {}
    
    private let baseURL: String = "https://api.openbrewerydb.org/v1/breweries"
    
    
    func searchFor(query: String, completion: @escaping ([ApiResult]) -> Void) {
        let query = "/autocomplete?query=\(query)"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let results = try? decoder.decode([ApiResult].self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(results)
            
        }
        task.resume()
    }
    
}
