//
//  ButtonsOnTop.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 9/24/24.
//

import SwiftUI

struct ButtonsOnTop: View {
    @Binding var Username: String
    @Binding var Password: String
    @Binding var Email: String
    @Binding var showLogin: Bool
    @Binding var showSignUp: Bool
    @Binding var underlineState: Bool
    @Binding var screenWidth: CGFloat
    let underlineNamespace: Namespace.ID
    
    var body: some View {
        HStack(spacing: screenWidth / 3.5) {
            ZStack {
                Button(action: {
                    DispatchQueue.main.async {
                        Username = ""
                        Password = ""
                        Email = ""
                    }
                    showSignUp = false
                    showLogin = true
                    withAnimation(.easeInOut) {
                        underlineState = false
                    }
                }) {
                    Text("Login")
                        .foregroundColor(Color(red: 0.44, green: 0.47, blue: 0.41))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: screenWidth / 5.75)
                
                if !underlineState {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.44, green: 0.47, blue: 0.41))
                        .frame(width: screenWidth / 5.75, height: 2.5)
                        .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                        .offset(y: 20)
                }
            }
            
            ZStack {
                Button(action: {
                    DispatchQueue.main.async {
                        Username = ""
                        Password = ""
                        Email = ""
                    }
                    showLogin = false
                    showSignUp = true
                    withAnimation(.easeInOut) {
                        underlineState = true
                    }
                }) {
                    Text("Sign Up")
                        .foregroundColor(Color(red: 0.44, green: 0.47, blue: 0.41))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: screenWidth / 5.75)
                
                if underlineState {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.44, green: 0.47, blue: 0.41))
                        .frame(width: screenWidth / 5.75, height: 2.5)
                        .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                        .offset(y: 20)
                }
            }
        }
        .padding()
    }
}
