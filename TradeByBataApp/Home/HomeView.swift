//
//  HomeView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            if let latestArray = viewModel.latest {
                ScrollView {
                    HStack{      
                        ForEach(latestArray, id: \.name) {good in
                            LatestCard(
                                category: good.category,
                                name: good.name,
                                price: good.price,
                                imageURL: good.imageUrl
                            )
                        }
                    }
                }
                
            } else {
                Text("Loading...")
            }
            
            if let flashSaleArray = viewModel.flashSale {
                ScrollView {
                    HStack{
                        ForEach(flashSaleArray, id: \.name) {good in
                            FlashSaleCard(
                                category: good.category,
                                name: good.name,
                                price: good.price,
                                discount: good.discount ?? 0,
                                imageURL: good.imageUrl
                            )
                        }
                    }
                }
                
            } else {
                Text("Loading...")
            }
        }.task {
            await viewModel.fetchData()
            print("await fetch data")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel.init())
    }
}
