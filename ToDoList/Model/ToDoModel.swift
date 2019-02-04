//
//  ToDoModel.swift
//  ToDoList
//
//  Created by Daniel Leah on 04/02/2019.
//  Copyright © 2019 tae. All rights reserved.
//

import Foundation

class ToDoModel: Encodable, Decodable{
    var title :String = ""
    var isChecked :Bool = false
}
