//
//  ViewModel.swift
//  VDImageText
//
//  Created by Vinay Devdikar on 19/02/22.
//

import UIKit
struct ViewModel {
    let title: String
    let description: String
    let image: UIImage?
    let imageURL: String?
    let footerNote: String?
    
    init(title: String,
         description: String,
         image: UIImage? =  nil,
         imageURL: String? = nil,
         footerNote: String? = nil) {
        self.title =  title
        self.description =  description
        self.image = image
        self.imageURL = imageURL
        self.footerNote = footerNote
    }
}
