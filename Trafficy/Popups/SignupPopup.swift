//
//  SignupPopup.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 10/18/24.
//

import SwiftUI

struct SignupPopup: View {
    @Binding var isVisible: Bool
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 10)
            Text("Reminder")
                .font(.title)
            Spacer()
                .frame(height: 20)
            Text("If you do not live in Arizona \nthis app will not work")
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
    
            Spacer()
                .frame(height: 30)
            Divider()
            Button("Ok") { // Button title
                isVisible = false
            }.foregroundColor(Color(UIColor(red: 0.53, green: 0.54, blue: 0.51, alpha: 1.00))) // Change the title of button
                .frame(width: UIScreen.main.bounds.width/2-30, height: 40) // Change the frames of button
                
        }
            .frame(width: UIScreen.main.bounds.width-50, height: 200)
            .background(Color(UIColor(red: 0.95, green: 0.96, blue: 0.89, alpha: 1.00)))
            .cornerRadius(12)
            .clipped()
    }
}

#Preview {
    //SignupPopup()
}
