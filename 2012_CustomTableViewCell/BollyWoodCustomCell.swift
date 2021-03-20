//
//  BollyWoodCustomCell.swift
//  2012_CustomTableViewCell
//
//  Created by mamidisetty Vikash on 19/03/21.
//

import UIKit

class BollyWoodCustomCell: UITableViewCell {

    @IBOutlet weak var BollyWoodView: UIView!
    @IBOutlet weak var BollyWoodLB1: UILabel!
    @IBOutlet weak var BollyWoodLB: UILabel!
    @IBOutlet weak var BollyWoodImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        BollyWoodImgView.layer.cornerRadius = BollyWoodImgView.frame.height/2
        BollyWoodView.layer.cornerRadius = 15
        
        BollyWoodLB.layer.masksToBounds = true
        BollyWoodLB1.layer.masksToBounds = true
        BollyWoodLB.layer.cornerRadius = 10
        BollyWoodLB1.layer.cornerRadius = 10

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
