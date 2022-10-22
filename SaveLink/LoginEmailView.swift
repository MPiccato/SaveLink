//
//  LoginEmailView.swift
//  SaveLink
//
//  Created by Martin Piccato on 22/10/2022.
//

import SwiftUI

struct LoginEmailView: View {
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            Group {
                Text("Bienvenido de nuevo a")
                Text("Finanzas Flia. Piccato")
                    .bold()
                  
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.title)
            .tint(.primary)
            Group {
                Text("Ingresar a la aplicación")
                    .underline()
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                    .padding(.bottom,5)
                TextField("Añade tu correo electrónico", text: $textFieldEmail)
                TextField("Añade tu password", text:$textFieldPassword)
                Button("Ingresar") {
                    print("Login")
                }
                .padding(.top, 10)
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal,64)
            Spacer()
        }
        
       
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
    }
}
