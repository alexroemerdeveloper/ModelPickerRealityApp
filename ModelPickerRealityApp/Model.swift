//
//  Model.swift
//  ModelPickerRealityApp
//
//  Created by Alexander Römer on 08.06.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        let fileName  = modelName + "usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName).sink(receiveCompletion: { (loadCompletion) in
            //Handle error
            print("Unable to load modelEntitix  \(self.modelName)")
        }, receiveValue: { (modelEntity) in
            self.modelEntity = modelEntity
        })
        
    }
    
    
    
}
