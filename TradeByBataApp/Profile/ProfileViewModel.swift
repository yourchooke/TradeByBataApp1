//
//  ProfileViewModel.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import Foundation

protocol ProfileViewModelProtocol {
    var fullName: String { get }
    var photo: Data? { get }
    var balance: Double { get }
    
    init(user: User)
}

class ProfileViewModel: ProfileViewModelProtocol {
    var fullName: String {
        "\(user.firstName) \(user.lastName)"
    }
    
    var photo: Data? {
        NetworkManager.shared.fetchImageData(from: user.photoUrl)
    }
    
    var balance: Double {
        guard let balance = user.balance else { return 0 }
        return balance
    }
    
    private let user: User
    
    required init(user: User) {
        self.user = user
    }
}