//
//  Data.swift
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//

import UIKit

var newPlace: Array<abhPlace> = []

// add struct abhPlace

struct abhPlace {
    var image: String
    let name: String
    let placeA: Array<PlaceInformation>
    var id: String
}

// add struct PlaceInformation

struct PlaceInformation {
    let PlaceImage0: String
    let PlaceImage1: String
    let PlaceImage2: String
    let PlaceImage3: String
    let PlaceName: String
    let placeDetail: String
}


var  coffeelist = [
    abhPlace(image: "4", name: "KAYA Cafe ⠀⠀", placeA: [
        PlaceInformation(PlaceImage0: "a1", PlaceImage1: "a2", PlaceImage2: "a3", PlaceImage3: "a3", PlaceName: "KAYA Cafe ⠀⠀", placeDetail: "⭐️⭐️⭐️⭐️"
                        )], id: UUID().uuidString),
    abhPlace(image: "8", name: "Candy Tree Cafe", placeA: [
        PlaceInformation(PlaceImage0: "z1", PlaceImage1: "z2", PlaceImage2: "a3", PlaceImage3: "a3", PlaceName: "Candy Tree Cafe", placeDetail: "⭐️⭐️⭐️⭐️"
                        )], id: UUID().uuidString),
    abhPlace(image: "10", name: "Piano Cafe  ☕️", placeA: [
         PlaceInformation(PlaceImage0: "p1",PlaceImage1: "p2", PlaceImage2: "p3", PlaceImage3: "10", PlaceName: "Piano Cafe  ☕️", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),

    abhPlace(image: "5", name: "High City ⠀⠀", placeA: [
        PlaceInformation(PlaceImage0: "s1",PlaceImage1: "s2", PlaceImage2: "s3", PlaceImage3: "s4", PlaceName: "high city 🏞", placeDetail: "⭐️⭐️⭐️⭐️⭐️"),
    ], id: UUID().uuidString),

    ]
                          

var resturantList = [
    abhPlace(image: "j1", name: "مطعم النارنج", placeA: [
         PlaceInformation(PlaceImage0: "j5",PlaceImage1: "j2", PlaceImage2: "j3", PlaceImage3: "j4", PlaceName: "مطعم النارنج", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),
abhPlace(image: "t11", name: "مطعم تونير", placeA: [
PlaceInformation(PlaceImage0: "j5",PlaceImage1: "t22", PlaceImage2: "t33", PlaceImage3: "t44", PlaceName: "مطعم تونير", placeDetail: "⭐️⭐️⭐️⭐️")
], id: UUID().uuidString),
    abhPlace(image: "c2", name: "  على بالي  ☕️", placeA: [
    PlaceInformation(PlaceImage0: "c1",PlaceImage1: "3", PlaceImage2: "c3", PlaceImage3: "c4", PlaceName: "  على بالي  ☕️", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),
    abhPlace(image: "h5", name: " مطعم إكليل", placeA: [
    PlaceInformation(PlaceImage0: "h1",PlaceImage1: "h3", PlaceImage2: "h2", PlaceImage3: "h4", PlaceName:  " مطعم إكليل", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),
                      ]
var hotelsList = [
abhPlace(image: "i5", name: "فندق بيات", placeA: [ PlaceInformation(PlaceImage0: "i2", PlaceImage1: "i1", PlaceImage2: "i3", PlaceImage3: "i4", PlaceName: "فندق بيات", placeDetail: "⭐️⭐️⭐️⭐️")
                                                 ], id: UUID().uuidString),
abhPlace(image: "o2", name: "فندق عابر", placeA: [ PlaceInformation(PlaceImage0: "o2", PlaceImage1: "o1", PlaceImage2: "o3", PlaceImage3: "o4", PlaceName: "فندق عابر", placeDetail: "⭐️⭐️⭐️⭐️")
                                                 ], id: UUID().uuidString),
abhPlace(image: "l2", name: "فندق بلو ان", placeA: [ PlaceInformation(PlaceImage0: "l1", PlaceImage1: "l3", PlaceImage2: "l4", PlaceImage3: "l5", PlaceName: "فندق بلو ان", placeDetail: "⭐️⭐️⭐️⭐️")
                                                   ], id: UUID().uuidString),

abhPlace(image: "m4", name: "فندق أزد", placeA: [ PlaceInformation(PlaceImage0: "m1", PlaceImage1: "m3", PlaceImage2: "m2", PlaceImage3: "m5", PlaceName: "فندق أزد", placeDetail: "⭐️⭐️⭐️⭐️")
                                                ], id: UUID().uuidString),

abhPlace(image: "n1", name: "فندق المهيدب ", placeA: [ PlaceInformation(PlaceImage0: "n2", PlaceImage1: "n3", PlaceImage2: "n4", PlaceImage3: "n5", PlaceName: "فندق المهيدب ", placeDetail: "⭐️⭐️⭐️⭐️⭐️")
                                                     ], id: UUID().uuidString),

abhPlace(image: "u1", name: "فندق السروات بارك", placeA: [ PlaceInformation(PlaceImage0: "u5", PlaceImage1: "u3", PlaceImage2: "u4", PlaceImage3: "u2", PlaceName: "فندق السروات بارك", placeDetail: " : التقييم ⭐️⭐️⭐️⭐️")
                                                         ], id: UUID().uuidString),

]

var naturalList = [
    abhPlace(image: "t1", name: "العزيزه ⠀⠀ ", placeA: [
    PlaceInformation(PlaceImage0: "2",PlaceImage1: "t2", PlaceImage2: "t3", PlaceImage3: "t4", PlaceName: "العزيزه ⛰", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),
    abhPlace(image: "7", name: "بحيره السد⠀", placeA: [
      PlaceInformation(PlaceImage0: "q3",PlaceImage1: "q2", PlaceImage2: "q1", PlaceImage3: "7", PlaceName: "بحيرة السد ", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),
    abhPlace(image: "1", name: "جبال السوده ⛰", placeA: [
      PlaceInformation(PlaceImage0: "w1",PlaceImage1: "w2", PlaceImage2: "w3", PlaceImage3: "1", PlaceName: "جبال السوده ⛰", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),
    abhPlace(image: "9", name: "حديقة ابو خيال", placeA: [
        PlaceInformation(PlaceImage0: "f1",PlaceImage1: "f2", PlaceImage2: "f3", PlaceImage3: "9", PlaceName: "حديقة ابو خيال", placeDetail: "⭐️⭐️⭐️⭐️")
    ], id: UUID().uuidString),

    
]
// add struct favorit

struct FavVisitor {
    var image: String
    var name: String
    var id : String
    
}



var searchPlace1 = [String]()


