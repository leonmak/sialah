//
//  Stopover.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import Foundation

class Stopover {
    var name: String
    var description: String
    var openingHours: String?
    var wallImageName: String?
    var panoImageName: String?
    var ticketImageName: String?
    var qrcodeName: String?
    var wirelessInfo: String?
    var categories: [Category] = []
    var events: [String] = []
    var isClosingSoon: Bool=false
    var url: URL?
    var cardImageName: String?
    
    init(name: String,
         description: String,
         openingHours: String?=nil,
         panoImageName: String?=nil,
         wallImageName: String?=nil,
         ticketImageName: String?=nil,
         qrcodeName: String?=nil,
         wirelessInfo: String?=nil,
         categories: [Category] = [],
         events: [String] = [],
         url: URL?=nil) {
        self.name = name
        self.description = description
        self.openingHours = openingHours
        self.panoImageName = panoImageName
        self.wallImageName = wallImageName
        self.ticketImageName = ticketImageName
        self.qrcodeName = qrcodeName
        self.wirelessInfo = wirelessInfo
        self.categories = categories
        self.events = events
        self.url = url
    }
    
    
}
