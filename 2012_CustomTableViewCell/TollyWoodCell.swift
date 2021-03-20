//
//  TollyWoodCell.swift
//  2012_CustomTableViewCell
//
//  Created by mamidisetty Vikash on 19/03/21.
//

import UIKit

class TollyWoodCell: UITableViewCell {

    @IBOutlet weak var TollyWoodView: UIView!
    @IBOutlet weak var TTitleLB: UILabel!
    @IBOutlet weak var TdirectorLB: UILabel!
    @IBOutlet weak var tImageView: UIImageView!
    
    @IBOutlet weak var TollyWoodLB1: UILabel!
    @IBOutlet weak var TollyWoodLB: UILabel!
    @IBOutlet weak var TollyWoodImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        TTitleLB.layer.masksToBounds = true
        TTitleLB.layer.cornerRadius = 10
        TdirectorLB.layer.masksToBounds = true
        TdirectorLB.layer.cornerRadius = 10
        TollyWoodView.layer.cornerRadius = 15
        TollyWoodView.backgroundColor = UIColor(patternImage: UIImage(named: "041019031925bahubali")!)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
