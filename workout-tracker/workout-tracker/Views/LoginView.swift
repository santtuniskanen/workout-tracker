//
//  LoginView.swift
//  workout-tracker
//
//  Created by santtuniskanen on 14.2.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    
    var body: some View {
        
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: login) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(isLoading)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
    func login() {
        isLoading = true
        AuthService().login(email: email, password: password) {
            result in
            switch result {
            case .success:
                // Login successful, navigate to home screen
                // You can implement navigation logic here
                print("Login successful")
            case .failure(let error):
                // Handle registration error
                print("Error: \(error)")
            }
            isLoading = false
        }
    }
}

#Preview {
    LoginView()
}
