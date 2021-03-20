//
//  KollyWoodTableViewCell.swift
//  2012_CustomTableViewCell
//
//  Created by mamidisetty Vikash on 20/03/21.
//

import UIKit

class KollyWoodTableViewCell: UITableViewCell {
    @IBOutlet weak var KollywoodImgView: UIImageView!
    
    @IBOutlet weak var kView: UIView!
    @IBOutlet weak var KtitileLB: UILabel!
    @IBOutlet weak var KdirLB: UILabel!
    @IBOutlet weak var kDirectorLB: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        KollywoodImgView.layer.cornerRadius = KollywoodImgView.frame.height/2
        kView.layer.cornerRadius = 15
        kView.backgroundColor = UIColor(patternImage: UIImage(named: "photo-1468581264429-2548ef9eb732")!)
        KtitileLB.layer.masksToBounds = true
        KtitileLB.layer.cornerRadius = 10
        KdirLB.layer.masksToBounds = true
        KdirLB.layer.cornerRadius = 10
        kDirectorLB.layer.masksToBounds = true
        kDirectorLB.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
