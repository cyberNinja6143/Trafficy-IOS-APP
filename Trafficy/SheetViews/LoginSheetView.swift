//
//  LoginSheetView.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 9/24/24.
//

import SwiftUI

struct LoginSheetView: View {
    @Binding var screenHeight: CGFloat
    @Binding var screenWidth: CGFloat
    @Binding var Email: String
    @Binding var Password: String
    @State private var isValidEmail = true
    
    var body: some View {
        Spacer()
            .frame(width: screenWidth/1.4, height: screenHeight / 15, alignment: .leading)
        Text("Email")
            .font(.headline)
            .fontWeight(.light)
            .frame(width: screenWidth/1.4, height: screenHeight / 15, alignment: .leading)
            .foregroundColor(Color(red: 0.44, green: 0.47, blue: 0.41))
        
        TextField("Email", text: $Email)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(15)
                        .frame(width: UIScreen.main.bounds.width / 1.4, height: UIScreen.main.bounds.height / 15)
                        .autocapitalization(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(isValidEmail ? Color(red: 0.44, green: 0.47, blue: 0.41) : Color.red, lineWidth: 1)
                        )
                        .onChange(of: Email) { oldVlaue, newValue in
                            isValidEmail = validateEmail(newValue)
                        }

                    // Display a message if the email is invalid
                    if !isValidEmail {
                        Text("Invalid email address")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
        
        Text("Password")
            .font(.headline)
            .fontWeight(.light)
            .frame(width: screenWidth/1.4, height: screenHeight / 15, alignment: .leading)
            .foregroundColor(Color(red: 0.44, green: 0.47, blue: 0.41))
        
        SecureField("Password", text: $Password)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(15)
            .frame(width: screenWidth/1.4, height: screenHeight / 15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 0.44, green: 0.47, blue: 0.41), lineWidth: 1)
            )
        
        Spacer()
        
        Button(action: {
            
        }, label: {
            Text("Login")
                .frame(width: screenWidth/1.6, height: screenHeight / 15)
                .background(Color(red: 0.95, green: 0.96, blue: 0.89))
                .cornerRadius(15)
                .foregroundColor(.black)
        })
    }
    func validateEmail(_ email: String) -> Bool {
        if email.isEmpty {
            return true
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
}
