//
//  ContentView.swift
//  ModelPickerRealityApp
//
//  Created by Alexander Römer on 08.06.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?

    private var models: [Model] = {
        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else { return [] }
        var availableModels = [Model]()
        for filename in files where filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }
        return availableModels
    }()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            
            if self.isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            } else {
                ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, models: self.models)
            }
            
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        let arView = CustomARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelConfirmedForPlacement {
            
            if let modelEntity = model.modelEntity {
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity)
                uiView.scene.addAnchor(anchorEntity.clone(recursive: true))
            } else {
                print("Unable to load modelEntity")
            }
            
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
            
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
