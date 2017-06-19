//
//  Superhero.swift
//  Tableviews
//
//  Created by Andrew Yang on 6/19/17.
//  Copyright © 2017 Andrew Yang. All rights reserved.
//

import UIKit

class Superhero: NSObject
{
    var name = ""
    var alias = ""
    var power = 0
    var image = UIImage(named: "default")

    init(Name: String, Alias: String, Power: Int, Image: UIImage)
    {
        name = Name
        alias = Alias
        power = Power
        image = Image
    }
    
    init(Name: String, Alias: String)
    {
        name = Name
        alias = Alias
    }

    
}
