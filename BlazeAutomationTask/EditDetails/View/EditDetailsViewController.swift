//
//  EditDetailsViewController.swift
//  BlazeAutomationTask
//
//  Created by ram krishna on 04/09/22.
//

import UIKit

class EditDetailsViewController: UIViewController {
 
    var organization : Organizations?
    @IBOutlet weak var tfName : UITextField!
    @IBOutlet weak var tfSub_Name : UITextField!
    @IBOutlet weak var switchHas_Subseccd : UISwitch!
    var VMEditOrganization : EditOrganizationViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrgData()
    }
    
    func setOrgData(){
        if let org = self.organization {
            self.tfName.text = org.name ?? ""
            self.tfSub_Name.text = org.sub_name ?? ""
            self.switchHas_Subseccd.isOn = org.has_subseccd
        }
    }
    
    @IBAction func updateDetails(){
        let updateDetailsOrg = UpdatedOrgainsation.init(name: self.tfName.text, sub_Name: self.tfSub_Name.text, has_Subseccd: self.switchHas_Subseccd.isOn, id: self.organization?.id)
        self.VMEditOrganization = EditOrganizationViewModel()
        if (self.VMEditOrganization?.updateOrganizationChanges(updateOrgDetails: updateDetailsOrg) ?? false) {
            let animatedVCXib = AnimatedChildViewController.init(nibName: "AnimatedChildViewController", bundle: nil)
            self.add(animatedVCXib,frame: self.view.bounds)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
}

