//
//  CustomTableViewCell.swift
//  CarAssistant
//
//  Created by Maciek on 30.06.2014.
//  Copyright (c) 2014 Maciej Scisłowski. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    init(frame: CGRect, reuseIdentifier: String!){
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
    }
    
}


