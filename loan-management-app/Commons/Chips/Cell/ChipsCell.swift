//
//  ChipsCell.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit

class ChipsCell: UICollectionViewCell, ChipsCellProtocol {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var container: CustomUIView!
    static let cellIdentifier = "ChipsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func update(with item: ChipItem, isSelected: Bool) {
        label.text = item.name
        label.textColor = isSelected ? UIColor.white : Color.getColor(name: .primary30)
        container.backgroundColor = isSelected ? Color.getColor(name: .primary30) : HexCodeColor.hexStringToUIColor(hex: "#EFF3F6")
    }

}
