//
//  PlacementButtonsView.swift
//  ModelPickerRealityApp
//
//  Created by Alexander Römer on 08.06.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct PlacementButtonsView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?

    var body: some View {
        HStack {
            //Canceled
            Button(action: {
                self.resetPlacementParameter()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            //Confirm
            Button(action: {
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameter()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    
    
    private func resetPlacementParameter() {
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
    
}

#if DEBUG
//struct PlacementButtonsView_Previews: PreviewProvider {
//    static let selectedModel = "toy_car"
//
//    static var previews: some View {
//        PlacementButtonsView(isPlacementEnabled: .constant(true), selectedModel: .constant(selectedModel), modelConfirmedForPlacement: .constant(selectedModel))
//    }
//}
#endif
