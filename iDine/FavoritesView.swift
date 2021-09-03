//
//  FavoritesView.swift
//  iDine
//
//  Created by Student on 9/3/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorite: Favorites
    var body: some View {
        NavigationView{
            List{
                Section {
                    ForEach(favorite.items) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Favorites")
            .disabled(favorite.items.isEmpty)
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        }

    }
    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(Favorites())
    }
}


