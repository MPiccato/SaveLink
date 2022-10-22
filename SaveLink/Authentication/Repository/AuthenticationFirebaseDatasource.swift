//
//  AuthenticationFirebaseDatasource.swift
//  SaveLink
//
//  Created by Martin Piccato on 22/10/2022.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthenticationFirebaseDatasource {
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email:email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creando un nuevo usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("Nuevo usuario creado with info \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email:String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Usuario incorrecto o no encontrado \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("Usuario ingresado \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
}
