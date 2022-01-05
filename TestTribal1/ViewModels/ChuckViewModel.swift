//
//  ChuckViewModel.swift
//  TestTribal1
//
//  Created by Guillermo Jimenez on 5/1/22.
//

import Foundation
import SwiftUI

final class ChuckViewModel: ObservableObject
{
    @Published var chuckList: [ChuckModel] = []
    
    init(){}
    
    func fetchChuck()  {
        ChuckModel.getChuck() { result in
            DispatchQueue.main.async {
                
                
                switch result {
                    
                case let .success(chuckModel):
                    if let index = self.chuckList.firstIndex(where: {$0.id == chuckModel.id }){
                    } else {
                        if(self.chuckList.count < 15) {
                            self.chuckList.append(chuckModel)
                        }
                    }          
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    func populateList() {
        for index in 0...50  {
            if(self.chuckList.count < 15) {
                self.fetchChuck()
            }
        }
    }
}
