//
//  ContentView.swift
//  SaveLink
//
//  Created by Martin Piccato on 22/10/2022.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image("mpiccato-portada")
                .resizable()
                .frame(width:200, height: 200)
            VStack {
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Entra con Email", systemImage: "envelope.fill")
                    
                }
                .tint(.blue)
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top,60)
            Spacer()
            HStack {
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("Tienes cuenta?")
                    Text("Registrate")
                        .underline()
                }.tint(.black)
            }
       
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
                case .register:
                    RegisterEmailView(authenticationViewModel: authenticationViewModel)
                case .login:
                    LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
        }
       
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}
