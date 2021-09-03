//
//  ItemDetail.swift
//  iDine
//
//  Created by Student on 8/31/21.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    @State private var showToast = false
    var body: some View {
           VStack {
            ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                        .resizable()
                        .scaledToFit()
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                }
               Text(item.description)
                .padding()
                Button(action: {
                        order.add(item: item)
                        showToast.toggle()
                })
                {
                    if(item.name == "All Out Donuts" || item.name == "Macarons Galore")
                       {
                        Text("Order \(item.name)")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .font(Font.custom("ComicSansMS", size: 25))
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(100)
                       }
                    else
                    {
                        Text("Order a \(item.name)")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .font(Font.custom("ComicSansMS", size: 25))
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(100)
                    }
                    
                }
                .font(.headline)
               Spacer()
           }
           .toast(isPresenting: $showToast){ //credit for this goes to https://github.com/elai950/AlertToast
            AlertToast(type: .complete(Color.green), title: "Order added to checkout!")
           }
           .navigationTitle(item.name)
           .navigationBarTitleDisplayMode(.inline)
       }
    
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
