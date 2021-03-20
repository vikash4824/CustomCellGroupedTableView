//
//  HollyWoodCustomCell.swift
//  2012_CustomTableViewCell
//
//  Created by mamidisetty Vikash on 19/03/21.
//

import UIKit

class HollyWoodCustomCell: UITableViewCell {
    @IBOutlet weak var HollyWoodLB1: UILabel!
    @IBOutlet weak var HollyWoodLB: UILabel!
    @IBOutlet weak var HollyWoodLB2: UILabel!
    @IBOutlet weak var HollyWoodImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        HollyWoodLB.layer.masksToBounds = true
        HollyWoodLB.layer.cornerRadius = 15
        HollyWoodLB1.layer.masksToBounds = true
        HollyWoodLB1.layer.cornerRadius = 15
        HollyWoodLB2.layer.masksToBounds = true
        HollyWoodLB2.layer.cornerRadius = 15
        HollyWoodImgView.layer.cornerRadius = HollyWoodImgView.frame.height/2
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
