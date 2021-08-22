//
//  CourseViewCell.swift
//  Base
//
//  Created by Roberto on 22/8/21.
//

import UIKit

class CourseViewCell: UITableViewCell {

    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var titleCourseLabel: UILabel!
    
    @IBOutlet weak var subtitleCourseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
