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
}
