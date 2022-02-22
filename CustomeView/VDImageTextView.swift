//
//  VDImageTextView.swift
//  VDImageText
//
//  Created by Vinay Devdikar on 19/02/22.
//

import UIKit

class VDImageTextView: UIView {

    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var footerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .right
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var viewModel: ViewModel {
        didSet {
            applyViewModel()
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUpSubViews()
        applyStyling()
        applyViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyViewModel() {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        footerLabel.text = viewModel.footerNote
    }
    
    private func applyStyling() {
        setImage()
        stackView.setCustomSpacing(SpacingConstant.imageTitle, after: imageView)
        stackView.setCustomSpacing(SpacingConstant.titleDescription, after: titleLabel)
        stackView.setCustomSpacing(SpacingConstant.descriptionFooter, after: descriptionLabel)
    }
    
    private func setUpSubViews() {
        addStackView()
        addSubViewsInStackView()
    }
    
}

extension VDImageTextView {
    
    private func addStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: -SpacingConstant.bottom),
        ])
    }
    
    private func addSubViewsInStackView() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(footerLabel)
    }
    
    private func setImage() {
        guard let image = viewModel.image else {
            return
        }
        imageView.image = image
    }

}

fileprivate enum SpacingConstant {
    static let imageTitle: CGFloat = 10.0
    static let titleDescription: CGFloat = 10.0
    static let descriptionFooter: CGFloat = 10.0
    static let bottom: CGFloat = 10.0
}

