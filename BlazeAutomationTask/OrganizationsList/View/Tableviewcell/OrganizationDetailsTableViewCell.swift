//
//  OrganizationDetailsTableViewCell.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 03/09/22.
//

import UIKit

class OrganizationDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var switchHasSubSecd: UISwitch!
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblSub: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
