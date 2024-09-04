//
//  HoroscopeViewCell.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 30/7/24.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    
    @IBOutlet weak var favoriteIcon: UIImageView!
    
    func render(horoscope: Horoscope) {
        nameLabel.text = horoscope.name
        logoImageView.image = horoscope.logo
        datesLabel.text = horoscope.dates
        
        let isFavorite = UserDefaults.standard.string(forKey: "FAVORITE_HOROSCOPE") == horoscope.id
        if isFavorite {
            favoriteIcon.isHidden = false
        } else {
            favoriteIcon.isHidden = true
        }
    }
    
    /*override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } */
    

}
