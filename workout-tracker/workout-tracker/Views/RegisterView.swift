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
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    RegisterView()
}
