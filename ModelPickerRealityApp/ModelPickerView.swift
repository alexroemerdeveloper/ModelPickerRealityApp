//
//  ModelPickerView.swift
//  ModelPickerRealityApp
//
//  Created by Alexander Römer on 08.06.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ModelPickerView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    var models: [Model]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0..<self.models.count) { (index) in
                    Button(action: {
                        self.selectedModel = self.models[index]
                        self.isPlacementEnabled = true
                    }) {
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }//hStack
        }//scrollView
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}

#if DEBUG
//struct ModelPickerView_Previews: PreviewProvider {
//    static let model = ["toy_car"]
//    static let selectedModel = "toy_car"
//    static var previews: some View {
//        ModelPickerView(isPlacementEnabled: .constant(true), selectedModel: .constant(selectedModel), models: model)
//    }
//}
#endif
