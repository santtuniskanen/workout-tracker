//
//  RegisterView.swift
//  workout-tracker
//
//  Created by santtuniskanen on 14.2.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack{
                Text("Register")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                HStack {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: register){
                    Text("Register")
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
    func register() {
        isLoading = true
        AuthService().register(firstName: firstName, lastName: lastName, email: email, password: password) { result in
            switch result {
            case .success:
                // Registration successful, navigate to login screen or home screen
                // You can implement navigation logic here
                print("Registration successful")
            case .failure(let error):
                // Handle registration error
                print("Error: \(error)")
            }
            isLoading = false
        }
    }
}



#Preview {
    RegisterView()
}
