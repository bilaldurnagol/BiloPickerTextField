//
//  BiloPickerView.swift
//  BiloPickerTextField
//
//  Created by Bilal Durnagöl on 20.04.2022.
//

import UIKit

protocol BiloPickerViewDelegate: AnyObject {
    func didChangeIndex(with index: Int)
}

open class BiloPickerView: UIPickerView {
    
    // MARK: - Properties
    open var selectedIndex: Int = 0
    weak var pickerDelegate: BiloPickerViewDelegate?
    open var data: [String] = [] {
        didSet {
            reloadAllComponents()
        }
    }
    
    open var pickerBackgroundColor: UIColor = .white {
        didSet {
            self.backgroundColor = pickerBackgroundColor
        }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Helper function
    private func commonInit() {
        setupPickerView()
        
    }
    
    private func setupPickerView() {
        delegate = self
        dataSource = self
        backgroundColor = pickerBackgroundColor
    }
}

// MARK: - UIPickerViewDataSource
extension BiloPickerView: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }}

// MARK: - UIPickerViewDelegate
extension BiloPickerView: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerDelegate?.didChangeIndex(with: row)
    }
}
