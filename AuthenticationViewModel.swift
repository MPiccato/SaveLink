//
//  AuthenticationViewModel.swift
//  SaveLink
//
//  Created by Martin Piccato on 22/10/2022.
//

import Foundation

final class AuthenticationViewModel {
    
    @Published var user: User?
    @Published var messageError: String?
    
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }
    
    func createNewUser(email: String, password: String) {
        authenticationRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
            
        }
        
    }
}
