//
//  Post.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/3/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse
class Post: PFObject, PFSubclassing {
    @NSManaged var author: PFUser
    @NSManaged var message: String
    static func parseClassName() -> String {
        return "Post"
    }
    
    
}
