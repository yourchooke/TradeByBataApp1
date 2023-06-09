//
//  ProfileView.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import SwiftUI
import RealmSwift

struct ProfileView: View {
    var viewModel: ProfileViewModel
    var body: some View {
        NavigationStack {
            VStack{
                    Text("Profile")
                        .fontWeight(.semibold)
                ProfilePhoto(imageURL: viewModel.photoURL, imageSize: CGSize(width: 50, height: 50))
                    Button(action: {}) {
                        Text("Change photo")
                            .font(AppFont().footnote)
                    }
                    Text(viewModel.fullName)
                        .font(AppFont().body)
                        .bold()
                        .padding()
                    Button(action: {}) {
                        HStack{
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                            Text("Upload item")
                            Spacer()
                        } .bold()
                    }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.306, green: 0.333, blue: 0.843))
                        .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                    List{
                        NavigationLink(destination: MockupDestinationView()) {
                            RowView(
                                viewModel: viewModel,
                                imageName: "menubar.rectangle",
                                text: "Trade store",
                                value: nil
                            )
                        }
                        NavigationLink(destination: MockupDestinationView()) {
                            RowView(
                                viewModel: viewModel,
                                imageName: "menubar.rectangle",
                                text: "Payment method",
                                value: nil
                            )
                        }.listRowSeparatorTint(.white)
                            RowView(
                                viewModel: viewModel,
                                imageName: "menubar.rectangle",
                                text: "Balance",
                                value: viewModel.balance
                            )
                        
                        NavigationLink(destination: MockupDestinationView()) {
                            RowView(
                                viewModel: viewModel,
                                imageName: "menubar.rectangle",
                                text: "Trade history",
                                value: nil
                            )
                        }.listRowSeparatorTint(.white)
                        NavigationLink(destination: MockupDestinationView()) {
                            RowView(
                                viewModel: viewModel,
                                imageName: "arrow.triangle.2.circlepath",
                                text: "Restore purchase",
                                value: nil
                            )
                        }.listRowSeparatorTint(.white)
                        NavigationLink(destination: MockupDestinationView()) {
                            RowView(
                                viewModel: viewModel,
                                imageName: "questionmark.circle",
                                text: "Help",
                                value: nil
                            )
                        }.listRowSeparatorTint(.white)
                        NavigationLink(destination: LoginView()) {
                            RowView(
                                viewModel: viewModel,
                                imageName: "rectangle.portrait.and.arrow.forward",
                                text: "Log out",
                                value: nil
                            )
                        }.listRowSeparatorTint(.white)
                    }.listStyle(.plain)
                        
                }
                
            .font(AppFont().body)
        }
            
    }
}


