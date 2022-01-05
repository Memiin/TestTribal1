//
//  ChuckListItem.swift
//  TestTribal1
//
//  Created by Guillermo Jimenez on 5/1/22.
//

import SwiftUI
import URLImage

struct ChuckListItem: View {
    var chuckModel: ChuckModel
    
    var body: some View {
        HStack {
            
            URLImage(URL(string: chuckModel.icon_url)!) { image in
                image
                  
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    
            }
            
            Spacer()
            Text(chuckModel.value)
            
        }.cornerRadius(5).frame(height: 200).background(.gray).padding(10)
    }
}

