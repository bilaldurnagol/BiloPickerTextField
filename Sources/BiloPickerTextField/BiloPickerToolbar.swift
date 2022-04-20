//
//  BiloPickerToolbar.swift
//  BiloPickerTextField
//
//  Created by Bilal Durnagöl on 20.04.2022.
//

import UIKit

protocol BiloPickerToolbarDelegate: AnyObject {
    func didTapLeft()
    func didTapRight()
}

open class BiloPickerToolbar: UIToolbar {
    
    // MARK: - Properties
    let rightBarButton = UIBarButtonItem(
        title: "Done",
        style: .done,
        target: nil,
        action: #selector(didTapRightButton)
    )
    let spaceButton = UIBarButtonItem(
        barButtonSystemItem: .flexibleSpace,
        target: nil,
        action: nil
    )
    let leftBarButton = UIBarButtonItem(
        title: "Cancel",
        style: .done,
        target: nil,
        action: #selector(didTapLeftButton)
    )
    
    open var doneButtonTitle: String? {
        didSet {
            rightBarButton.title = doneButtonTitle
        }
    }
    
    open var doneButtonTintColor: UIColor? {
        didSet {
            rightBarButton.tintColor = doneButtonTintColor
        }
    }
    
    open var cancelButtonTitle: String? {
        didSet {
            leftBarButton.title = cancelButtonTitle
        }
    }
    
    open var cancelButtonTintColor: UIColor? {
        didSet {
            leftBarButton.tintColor = cancelButtonTintColor
        }
    }
    
    open var isHiddenLeftButton: Bool = false {
        didSet {
            if isHiddenLeftButton {
                items?.remove(at: 0)
            }
        }
    }
    
    open var isHiddenRightButton: Bool = false {
        didSet {
            if isHiddenRightButton {
                items?.remove(at: 2)
            }
        }
    }
    
    weak var toolbarDelegate: BiloPickerToolbarDelegate?
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // Helper Function
    private func commonInit() {
        self.barStyle = .default
        self.isTranslucent = false
        self.sizeToFit()
        self.items = [
            leftBarButton,
            spaceButton,
            rightBarButton
        ]
    }
    
    // MARK: - Objc
    @objc
    private func didTapRightButton() {
        toolbarDelegate?.didTapRight()
    }
    
    @objc
    private func didTapLeftButton() {
        toolbarDelegate?.didTapLeft()
    }
}
