//
//  AuthenticationResponse.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 10/2/24.
//

import Foundation

final class AuthenticationResponse: Decodable {
    var Body: String
    
    init(Body: String) {
        self.Body = Body
    }
}
