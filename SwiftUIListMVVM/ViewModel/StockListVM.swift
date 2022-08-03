//
//  StockListVM.swift
//  SwiftMVVMLIst
//
//  Created by Dhaval Sanjay Adhav on 8/2/22.
//

import Combine
import Foundation

class StockListVM: ObservableObject {


    // MARK: - properties

    @Published var stocks: [Stock] = []
    @Published var error: Error?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - methods

    @available(iOS 15.0.0, *)
    func getStocks() async {
        let successUrl = URL(string: "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json")!
        let urlRequest = URLRequest(url: successUrl)
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.error = error
                }
            }, receiveValue: { [weak self] data, urlResponse in
                guard let httpResponse = urlResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    self?.error = NetworkingError.invalidResponse
                    return
                }

                do {

                    let stockResponse = try JSONDecoder().decode(StocksResponse.self, from: data)
                    self?.stocks = stockResponse.stocks
                } catch {
                    self?.error = NetworkingError.decodingError
                }
            })
            .store(in: &cancellables)
    }
}

enum NetworkingError: Error {
    case invalidResponse
    case decodingError
}
