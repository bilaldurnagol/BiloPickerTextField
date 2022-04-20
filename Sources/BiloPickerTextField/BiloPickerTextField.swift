//
//  BiloPickerTextField.swift
//  BiloPickerTextField
//
//  Created by Bilal Durnagöl on 20.04.2022.
//

import UIKit

open class BiloPickerTextField: UITextField {
    
    // MARK: - Properties
    
    open var pickerView = BiloPickerView()
    open var toolbar = BiloPickerToolbar()
    private var selectedIndex: Int = 0
    
    open var didChangeIndex: DataBlock<Int>?
    open var onTapRight: DataBlock<Int>?
    
    
    open var textFieldBackgroundColor: UIColor = .white {
        didSet {
            self.backgroundColor = textFieldBackgroundColor
        }
    }
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Helper function
    private func commonInit() {
        setupUI()
        subcriptions()
    }
    
    private func setupUI() {
        self.inputView = pickerView
        self.inputAccessoryView = toolbar
        self.backgroundColor = textFieldBackgroundColor
        self.tintColor = textFieldBackgroundColor // so that the indicator does not appear
    }
    
    private func subcriptions() {
        toolbar.toolbarDelegate = self
        pickerView.pickerDelegate = self
        self.delegate = self
    }
}

// MARK: - BiloPickerToolbarDelegate
extension BiloPickerTextField: BiloPickerToolbarDelegate {
    func didTapLeft() {
        resignFirstResponder()
    }
    
    func didTapRight() {
        onTapRight?(selectedIndex)
        resignFirstResponder()
    }
}

// MARK: - BiloPickerViewDelegate
extension BiloPickerTextField: BiloPickerViewDelegate {
    func didChangeIndex(with index: Int) {
        selectedIndex = index
        didChangeIndex?(index)
    }
}

// MARK: - UITextFieldDelegate
extension BiloPickerTextField: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
