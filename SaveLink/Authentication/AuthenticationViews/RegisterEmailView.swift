//
//  RegisterEmailView.swift
//  SaveLink
//
//  Created by Martin Piccato on 22/10/2022.
//

import SwiftUI

struct RegisterEmailView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            DismissView()
                .padding(.top,10)
            Group {
                Text("Bienvenido a")
                Text("Finanzas Flia. Piccato")
                    .bold()
                
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.title)
            .tint(.primary)
            Group {
                Text("Registrate en la app:")
                    .underline()
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                    .padding(.bottom,5)
                TextField("Añade tu correo electrónico", text: $textFieldEmail)
                TextField("Añade tu password", text:$textFieldPassword)
                Button("Ingresar") {
                    authenticationViewModel.createNewUser(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 10)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top,20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal,64)
            Spacer()
        }
    }
}

struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
