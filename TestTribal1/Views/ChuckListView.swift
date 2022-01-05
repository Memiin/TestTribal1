//
//  ChuckListView.swift
//  TestTribal1
//
//  Created by Guillermo Jimenez on 5/1/22.
//

import SwiftUI

struct ChuckListView: View {
    let gridColumnTemplate: [GridItem] = [GridItem(.flexible(), spacing: 5)]
    @ObservedObject var chuckViewModel = ChuckViewModel()
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridColumnTemplate){
                ForEach(chuckViewModel.chuckList.indices, id:\.self){ index in
                    ChuckListItem(chuckModel: chuckViewModel.chuckList[index]).id(UUID())
                }
            }
        }.onAppear{
            self.chuckViewModel.populateList()
        }
    }
}
