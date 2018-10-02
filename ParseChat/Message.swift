//
//  Message.swift
//  ParseChat
//
//  Created by Raeleen Watson on 9/29/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    
    @NSManaged var message: String
    
    class func parseClassName() -> String {
        return "Message"
    }
    
}
