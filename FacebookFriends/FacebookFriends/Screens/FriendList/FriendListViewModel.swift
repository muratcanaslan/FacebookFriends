//
//  FriendListViewModel.swift
//  FacebookFriends
//
//  Created by Murat Can ASLAN on 9.08.2023.
//

import Foundation

protocol FriendListViewModelProtocol {
    //MARK: - Typealis
    typealias OnSuccess = () -> Void
    typealias OnError = (String) -> Void
    
    var cellVMs: [FriendViewModel] { get set }
    var onSuccess: OnSuccess? { get set }
    var onError: OnError? { get set }
    
    func fetchList()
}

final class FriendListViewModel: FriendListViewModelProtocol{
    //MARK: - Properties
    var cellVMs: [FriendViewModel] = []
    var onSuccess: OnSuccess?
    var onError: OnError?
    
    //MARK: - Network
    func fetchList() {
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let data = data, error == nil else {
                self?.onError?("Lütfen tekrar deneyiniz!")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(UsersResponse.self, from: data)
                if let users = response.results {
                    self?.cellVMs = users.map({ .init(model: $0 )})
                    self?.onSuccess?()
                } else {
                    self?.onError?("Lütfen tekrar deneyiniz!")
                }
            } catch {
                self?.onError?(error.localizedDescription)
            }
        }.resume()
    }
}
