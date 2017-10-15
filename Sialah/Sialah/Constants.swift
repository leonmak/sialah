//
//  Constants.swift
//  Sialah
//
//  Created by Leon Mak on 14/10/17.
//  Copyright © 2017 Leon Mak. All rights reserved.
//

import UIKit

struct Constants {
    static let iconImageNames = ["food-1",
                                 "food-1a",
                                 "food-1b",
                                 "food-2",
                                 "food-2a",
                                 "food-2b",
                                 "food-2c",
                                 "food-3"]
    
    static let zooStopover =
        Stopover(name: "Singapore Zoo", description: """
                Nine-time winner of the coveted Best Leisure Attraction Experience award by the Singapore Tourism Board, our 26-hectare wildlife park is nestled within the lush Mandai rainforest that stretches into the magnificent Upper Seletar Reservoir. More than 2,800 animals representing over 300 species of mammals, birds and reptiles call Singapore Zoo home.
                """,
                 wallImageName: "zoo",
                 ticketImageName: "zoo-ticket",
                 qrcodeName: "qrcode", busColor: "blue", rating: 4.5)

    static let defaultInfoStopover =
        Stopover(name: "Merlion Park",
                 description: "Explore the island's amamzing view newar the iconic Merlion.",
                 panoImageName: "merlion-pano",
                 wallImageName: "merlion",
                 qrcodeName: "qrcode",
                 busColor: "brown",
                 events: ["50% Discounts on all hawker center food and drinks"],
                 rating: 4.5)

    static let stopoverList = _stopoverList + _stopoverList + _stopoverList + _stopoverList

    static let _stopoverList = [
        Stopover(name: "Hyatt Hotel", description:"""
                A 5-minute walk from Orchard MRT Station, Grand Hyatt Singapore offers luxurious accommodation, an elegant outdoor pool and 6 dining options including the award-winning restaurant mezza9. There is also a spa.
                """,
                 panoImageName: "hotel-pano", wallImageName: "hotel", busColor: "blue", rating: 4.5),
        Stopover(name: "Gardens By the Bay", description:"""
                Gardens by the Bay is a nature park spanning 101 hectares (250 acres) of reclaimed land in central Singapore, adjacent to the Marina Reservoir. The park consists of three waterfront gardens: Bay South Garden, Bay East Garden and Bay Central Garden. The largest of the gardens is Bay South Garden at 54 hectares (130 acres).
                """,
                 openingHours: "5am – 2am daily",
                 panoImageName: "bay-gardens-pano", wallImageName: "bay-gardens",
                 wirelessInfo: "Free WiFi (wireless@SG): Available at The Canopy, Supertree Grove and The Meadow.",
                 busColor: "yellow",
                 categories: [Category.adventure, Category.arts], url: URL(string: "http://www.gardensbythebay.com.sg/"), rating: 4.7),
        Stopover(name: "Botanical Gardens", description: """
                The Singapore Botanic Gardens is a 158-year-old tropical garden located at the fringe of Singapore's Orchard Roadshopping district. It is one of three gardens, and the only tropical garden, to be honoured as a UNESCO World Heritage Site. The Botanic Gardens has been ranked Asia's top park attraction since 2013, by TripAdvisor Travellers' Choice Awards. It was declared the inaugural Garden of the Year, International Garden Tourism Awards in 2012, and received Michelin's three-star rating in 2008.
                """,
                 openingHours: "5am - 12am daily",
                 panoImageName: "botanic-gardens-pano", wallImageName: "botanic-gardens",
                 busColor: "brown", categories: [Category.adventure], url: URL(string: "https://www.sbg.org.sg/"), rating: 4.6),
        Stopover(name: "Chinatown", description: """
                Singapore’s historic Chinatown is a bustling mix of old and new, filled with traditional shops and markets as well as cool stores and cafes.
                """,
                 wallImageName: "chinatown",
                 busColor: "blue",
                 categories: [Category.foodie],
                 events: ["25% Discounts on 'char kway teow' (stir-fried noodles) and 'satay' (barbecued meat skewers) at Chinatown Food Street"],
                 url: URL(string: "http://www.visitsingapore.com/see-do-singapore/places-to-see/chinatown.html"), rating: 4.3),
        Constants.defaultInfoStopover,
        Constants.zooStopover
    ]
    
    static let mockResponse: [String: Any] = [
        "flightIDs": [
            "2301D9F90000ABE4"
        ],
        "originAirport": [
            "airportCode": "SIN",
            "airportTerminal": "3"
        ],
        "destinationAirport": [
            "airportCode": "FCO",
            "airportTerminal": "3"
        ],
        "flightNumber": "366",
        "departureDateTime": "2017-11-01T01:55:00"
    ]
}
