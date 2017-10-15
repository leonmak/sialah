//
//  Constants.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

struct Constants {
    static let iconImageNames = ["coffee", "corn", "corndog", "cucumber", "cupcake", "doughnut-1", "doughnut",
                                 "eggplant", "fish-and-chips", "fish", "juice-6", "juice-7", "pia-colada", "pineapple",
                                 "popsicle-1", "popsicle"]
    
    static let zooStopover =
        Stopover(name: "Singapore Zoo", description: """
                Nine-time winner of the coveted Best Leisure Attraction Experience award by the Singapore Tourism Board, our 26-hectare wildlife park is nestled within the lush Mandai rainforest that stretches into the magnificent Upper Seletar Reservoir. More than 2,800 animals representing over 300 species of mammals, birds and reptiles call Singapore Zoo home.
                """,
                 panoImageName: "zoo-pano",
                 wallImageName: "zoo",
                 ticketImageName: "zoo-ticket")

    static let defaultInfoStopover =
        Stopover(name: "Merlion Park", description: "Explore the island's amamzing view newar the iconic Merlion.",
                 panoImageName: "merlion-pano",
                 wallImageName: "merlion")

    static let stopoverList = [
        Stopover(name: "Changi Airport", description: """
                Singapore Changi Airport or simply Changi Airport, is the primary civilian airport for Singapore, and one of the largest transportation hubs in Southeast Asia. It is currently rated the World's Best Airport by Skytrax, for the fifth consecutive year (Skytrax's World's Best Airport 2013–2017)[5] and is one of the world's busiest airports by international passenger and cargo traffic. This international airport is located in Changi, at the eastern end of Singapore, approximately 17.2 kilometres (10.7 mi) northeast[6] from Marina Bay (Singapore's Downtown Core), on a 13-square-kilometre (5.0 sq mi) site. It is operated by Changi Airport Group and it is the home base of Singapore Airlines, Singapore Airlines Cargo, SilkAir, Scoot, Jetstar Asia Airways and BOC Aviation.
                """,
                 openingHours: "24Hrs",
                 wallImageName: "airport",
                 wirelessInfo: "Connect to WiFi@Changi and follow prompts",
                 categories: [Category.airport], url: URL(string: "http://www.changiairport.com")),
        Stopover(name: "Hyatt Hoten", description:"""
                A 5-minute walk from Orchard MRT Station, Grand Hyatt Singapore offers luxurious accommodation, an elegant outdoor pool and 6 dining options including the award-winning restaurant mezza9. There is also a spa.
                """),
        Stopover(name: "Gardens By the Bay", description:"""
                Gardens by the Bay is a nature park spanning 101 hectares (250 acres) of reclaimed land in central Singapore, adjacent to the Marina Reservoir. The park consists of three waterfront gardens: Bay South Garden, Bay East Garden and Bay Central Garden. The largest of the gardens is Bay South Garden at 54 hectares (130 acres).
                """,
                 openingHours: "5am – 2am daily",
                 panoImageName: "bay-gardens-pano", wallImageName: "bay-gardens",
                 wirelessInfo: "Free WiFi (wireless@SG): Available at The Canopy, Supertree Grove and The Meadow.",
                 categories: [Category.adventure, Category.arts], url: URL(string: "http://www.gardensbythebay.com.sg/")),
        Stopover(name: "Botanical Gardens", description: """
                The Singapore Botanic Gardens is a 158-year-old tropical garden located at the fringe of Singapore's Orchard Roadshopping district. It is one of three gardens, and the only tropical garden, to be honoured as a UNESCO World Heritage Site. The Botanic Gardens has been ranked Asia's top park attraction since 2013, by TripAdvisor Travellers' Choice Awards. It was declared the inaugural Garden of the Year, International Garden Tourism Awards in 2012, and received Michelin's three-star rating in 2008.
                """,
                 openingHours: "5am-12am daily",
                 panoImageName: "botanic-gardens-pano", wallImageName: "botanic-gardens",
                 wirelessInfo: "None", categories: [Category.adventure], url: URL(string: "https://www.sbg.org.sg/")),
        Stopover(name: "Chinatown", description: """
                Singapore’s historic Chinatown is a bustling mix of old and new, filled with traditional shops and markets as well as cool stores and cafes.
                """,
                 wallImageName: "chinatown", wirelessInfo: "None",
                 categories: [Category.foodie],
                 events: ["25% Discounts on 'char kway teow' (stir-fried noodles) and 'satay' (barbecued meat skewers) at Chinatown Food Street"],
                 url: URL(string: "http://www.visitsingapore.com/see-do-singapore/places-to-see/chinatown.html"))
    ]
}
