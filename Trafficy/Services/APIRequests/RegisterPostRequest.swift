//
//  PostRequest.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 10/2/24.
//

import Foundation

struct RegisterPostRequest {
    //Connection to the api
    let apiConnectionURL: URL
    init() {
        let apiConnectionURL = "https://{link to authentication API}"
        guard let apiConnectionURL = URL(string: apiConnectionURL) else {
            fatalError("Invalid URL: \(apiConnectionURL)")
        }
        self.apiConnectionURL = apiConnectionURL
    }
    
    func sendPostRequest(_ request: RegisterRequest, completion: @escaping (Bool, AuthenticationResponse?) -> Void) {
        do {
            var urlRequest = URLRequest(url: apiConnectionURL)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = try JSONEncoder().encode(request)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(false, nil)
                    return
                }
                completion(httpResponse.statusCode == 200, nil)
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    do {
                        if let data = data {
                            do {
                                let authenticationResponse = try JSONDecoder().decode(AuthenticationResponse.self, from: data)
                                completion(true, authenticationResponse)
                            } catch {
                                print("Failed to decode response: \(error.localizedDescription)")
                                completion(false, nil)
                            }
                        } else {
                            completion(false, nil)
                        }
                    }
                }
            }
            task.resume()
        } catch {
            completion(false, nil)
        }
    }
}
