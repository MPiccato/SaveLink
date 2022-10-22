//
//  AuthenticationRepository.swift
//  SaveLink
//
//  Created by Martin Piccato on 22/10/2022.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource : AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
}
