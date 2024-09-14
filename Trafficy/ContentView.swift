//
//  ContentView.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 9/14/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var Username = ""
    @State private var Email = ""
    @State private var Password = ""
    @State private var wrongUsername = 0;
    @State private var wrongPassword = 0;
    @State private var screenHeight = UIScreen.main.bounds.height
    @State private var screenWidth = UIScreen.main.bounds.width
    @State private var showSheet = false
    @State private var showSignUp = false
    @State private var showLogin = false
    @State private var sheetHeight = UIScreen.main.bounds.height / 1.6
    @State private var popupWasShown = false
    @State private var showSIgnUpPopup = false
    @State private var showWarning = false // this is for the warning popup.
    /*
     * The underlineState keeps track of the underline, underline false means underline the login button and true means underline the signup
     * button in the sheet. this is to get the animation to work
     */
    @State private var underlineState = false
    @Namespace private var underlineNamespace
    
    var body: some View {
        NavigationView {
            
            //This contains the white overlapping circle
            ZStack {
                Color(UIColor(red: 0.95, green: 0.96, blue: 0.89, alpha: 1.00)).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                        .frame(height: screenHeight - (screenHeight / 4))
                    Circle()
                        .scale((screenHeight/screenWidth) * 3.5)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                
                
                //Contains all the buttons, images, and text
                VStack {
                   
                    Image("InAppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth / 1.3, height: screenHeight / 3)
                    
                    
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .padding(5)
                        .foregroundColor(.black)
                    
                    Text("Monitoring Traffic routes made easy")
                        .font(.system(size: 24))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .frame(width: screenWidth / 1.3)
                        .foregroundColor(.black)
                    
                    Button(action: {
                        DispatchQueue.main.async {
                            showSignUp = false
                            showLogin = true
                            underlineState = false
                            Username = ""
                            Password = ""
                            Email = ""
                        }
                        showSheet = true
                    }, label: {
                        Text("Login")
                            .frame(width: screenWidth/1.6, height: screenHeight / 15)
                            .background(Color(red: 0.95, green: 0.96, blue: 0.89))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    })
                    .padding(.top, screenHeight / 14)
                    
                    Button(action: {
                            DispatchQueue.main.async {
                                showLogin = false
                                showSignUp = true
                                underlineState = true
                                Username = ""
                                Password = ""
                                Email = ""
                            }
                        if popupWasShown {
                            showSheet = true
                        }
                        //WIP
                        else {
                            showWarning = true
                            popupWasShown.toggle()
                        }
                    }, label: {
                        Text("Sign Up")
                            .frame(width: screenWidth/1.6, height: screenHeight / 15)
                            .background(Color(red: 0.95, green: 0.96, blue: 0.89))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    })
                    .padding(screenHeight / 45)
                    
                    //This is the popup view for the sign up button
                    .sheet(isPresented: $showSheet, content: {
                        VStack (spacing: 1.25) {
                            //This contains the buttons that swap between the sheets
                            ButtonsOnTop(
                                Username: $Username,
                                Password: $Password,
                                Email: $Email,
                                showLogin: $showLogin,
                                showSignUp: $showSignUp,
                                underlineState: $underlineState,
                                screenWidth: $screenWidth,
                                underlineNamespace: underlineNamespace)
                            
                            if showSignUp {
                                SignUpSheetView(
                                    screenHeight: $screenHeight,
                                    screenWidth: $screenWidth,
                                    Email: $Email,
                                    Password: $Password,
                                    Username: $Username)
                            }
                            
                            else if showLogin {
                                LoginSheetView(
                                    screenHeight: $screenHeight,
                                    screenWidth: $screenWidth,
                                    Email: $Email,
                                    Password: $Password)
                            }
                        }
                        .presentationDetents([.height(sheetHeight)])
                        .presentationCornerRadius(45)
                        .presentationBackground(Color(red: 0.98, green: 0.98, blue: 0.96))
                    })
                }
                .zIndex(0)
                
                
                if showWarning {
                    Color.black.opacity(0.7) // Semi-transparent dark background
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showWarning)
                }
                
                if showWarning {
                    SignupPopup(isVisible: $showWarning)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showWarning)
                }
                
            }
            .navigationBarHidden(true)
            
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
