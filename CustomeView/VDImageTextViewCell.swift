//
//  VDImageTextViewCell.swift
//  VDImageText
//
//  Created by Vinay Devdikar on 19/02/22.
//

import UIKit

class VDImageTextViewCell: UITableViewCell {
    private var imageTextView: VDImageTextView!
    
    func updateTextView(viewModel: ViewModel) {
        if imageTextView == nil {
            imageTextView = VDImageTextView(viewModel: viewModel)
            imageTextView.translatesAutoresizingMaskIntoConstraints =  false
            contentView.addSubview(imageTextView)
            NSLayoutConstraint.activate([
                imageTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                       constant: 20.0),
                imageTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
                imageTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                        constant: -20.0),
            ])
        } else {
            imageTextView.viewModel = viewModel
        }
        
        backgroundColor = .white
    }
}
