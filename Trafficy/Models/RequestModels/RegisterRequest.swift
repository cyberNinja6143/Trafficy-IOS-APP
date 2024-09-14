//
//  RegisterRequest.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 10/2/24.
//

import Foundation

final class RegisterRequest: Encodable {
    var Username: String
    var Password: String
    var Email: String
    
    init(Username: String, Password: String, Email: String) {
        self.Username = Username
        self.Password = Password
        self.Email = Email
    }
}
