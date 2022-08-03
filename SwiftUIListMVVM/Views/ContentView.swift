//
//  ContentView.swift
//  SwiftUIListMVVM
//
//  Created by Dhaval Sanjay Adhav on 8/2/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: StockListVM

    init(viewModel: StockListVM) {
        self.viewModel = viewModel
    }

    var body: some View {
        //        List {
        //            ForEach(viewModel.stocks, id: \.self) { stock in
        //                HStack(alignment: .top) {
        //                    VStack(alignment: .leading, spacing: 12) {
        //                        Text(stock.ticker)
        //                            .font(.headline)
        //                        Text(stock.name)
        //                            .font(.body)
        //                    }
        //
        //                    Spacer()
        //
        //                    VStack(alignment: .trailing, spacing: 12) {
        //                        Text("\(stock.currentPriceInCents)")
        //                            .font(.headline)
        //                        if let quantity = stock.quantity {
        //                            Text("Quantity owned: \(quantity)")
        //                                 } else {
        //                                Text("No holdings")
        //                            }
        //
        //                    }
        //                }
        //
        //            }
        //        }
        //        .onAppear {
        //            viewModel.getStocks()
        //        }

        if #available(iOS 15.0, *) {
            List(viewModel.stocks) { stock in
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(stock.ticker)
                            .font(.headline)
                        Text(stock.name)
                            .font(.body)
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 12) {
                        Text("\(stock.currentPriceInCents)")
                            .font(.headline)
                        if let quantity = stock.quantity {
                            Text("Quantity owned: \(quantity)")
                        } else {
                            Text("No holdings")
                        }

                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.getStocks()
                }
            }
            .refreshable {
                await viewModel.getStocks()
            }
        } else {
            // Fallback on earlier versions
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = StockListVM()
        vm.stocks = stocks
        return ContentView(viewModel: vm)
    }
}

let stock = Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: 10, currentPriceTimestamp: 10)
let stocks: [Stock] = [
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: 20, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: 30, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10),
    Stock(ticker: "AAPL", name: "Apple", currency: .usd, currentPriceInCents: 20000, quantity: nil, currentPriceTimestamp: 10)
]
