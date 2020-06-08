//
//  CustomARView.swift
//  ModelPickerRealityApp
//
//  Created by Alexander Römer on 08.06.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import UIKit
import RealityKit
import FocusEntity
import ARKit

class CustomARView: ARView {
    let focusSquare = FESquare()
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        focusSquare.viewDelegate = self
        focusSquare.delegate = self
        focusSquare.setAutoUpdate(to: true)
        self.setupARView()
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupARView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing  = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        self.session.run(config)
    }

    
}


extension CustomARView: FEDelegate {
    func toTrackingState() {
        print("Tracking")
    }
    
    func toInitializingState() {
        print("Initializing")
    }
}
