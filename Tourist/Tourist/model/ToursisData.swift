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
        PlaceInformation(PlaceImage0: "a1", PlaceImage1: "a2", PlaceImage2: "a3", PlaceImage3: "a3", PlaceName: "KAYA Cafe ⠀⠀", placeDetail: "إطلاله بين الأشجار"
                                                    )]),
    abhPlace(image: "8", name: "Candy Tree Cafe", placeA: [
        PlaceInformation(PlaceImage0: "z1", PlaceImage1: "z2", PlaceImage2: "a3", PlaceImage3: "a3", PlaceName: "Candy Tree Cafe", placeDetail: "مقهى رائع وجلسات داخلية راقية "
                                    )]),
    abhPlace(image: "10", name: "Piano Cafe  ☕️", placeA: [
         PlaceInformation(PlaceImage0: "p1",PlaceImage1: "p2", PlaceImage2: "p3", PlaceImage3: "10", PlaceName: "Piano Cafe  ☕️", placeDetail: "مقهى رائع وجلسات داخلية راقية ")
                                    ]),
    abhPlace(image: "3", name: "  على بالي  ☕️", placeA: [
    PlaceInformation(PlaceImage0: "c1",PlaceImage1: "c2", PlaceImage2: "c3", PlaceImage3: "3", PlaceName: "  على بالي  ☕️", placeDetail: "على بالي ، مطعم وكافيه لبناني")
         ]),
    ]
                          

var resturantList = [
    abhPlace(image: "3", name:  "  على بالي  ☕️", placeA:[
        PlaceInformation(PlaceImage0: "c1", PlaceImage1: "c2", PlaceImage2: "c3", PlaceImage3: "c1", PlaceName: "  على بالي  ☕️", placeDetail: "مطعم وكافيه لبناني")
                               ]),
                      ]
var hotelsList = [
abhPlace(image: "4", name: "سروات", placeA: [ PlaceInformation(PlaceImage0: "1", PlaceImage1: "2", PlaceImage2: "3", PlaceImage3: "4", PlaceName: "سروات", placeDetail: "سروات")
        ]),
]

var naturalList = [
    abhPlace(image: "t1", name: "AZIZAH ⠀⠀ ", placeA: [
    PlaceInformation(PlaceImage0: "2",PlaceImage1: "t2", PlaceImage2: "t3", PlaceImage3: "t4", PlaceName: "AZIZAH ⛰", placeDetail: "منتزه سياحي")
         ]),
    abhPlace(image: "7", name: "Abha Dam lake ⠀", placeA: [
      PlaceInformation(PlaceImage0: "q3",PlaceImage1: "q2", PlaceImage2: "q1", PlaceImage3: "7", PlaceName: "Abha Dam Lake", placeDetail: "بحيرة سد أبها ")
    ]),
    abhPlace(image: "1", name: "Jabal sawda ⛰", placeA: [
      PlaceInformation(PlaceImage0: "w1",PlaceImage1: "w2", PlaceImage2: "w3", PlaceImage3: "1", PlaceName: "Jabal sawda ⛰", placeDetail: "منتزه سياحي ")
    ]),
    abhPlace(image: "9", name: "Abu Kheyal Park", placeA: [
        PlaceInformation(PlaceImage0: "f1",PlaceImage1: "f2", PlaceImage2: "f3", PlaceImage3: "9", PlaceName: "Abu Kheyal Park", placeDetail: "حديقة بإطلاله ساحره")
  ]),
       abhPlace(image: "t1", name: "AZIZAH ⠀⠀ ", placeA: [
     PlaceInformation(PlaceImage0: "2",PlaceImage1: "t2", PlaceImage2: "t3", PlaceImage3: "t4", PlaceName: "AZIZAH ⛰", placeDetail: "منتزه سياحي")
                   ]),
]
// add struct favorit

struct FavVisitor {
    var image: String
    var name: String

}



//var coffeelist = [
//   //Details
//    abhPlace(image: "4", name: "KAYA Cafe ⠀⠀", placeA: [
//        PlaceInformation(PlaceImage0: "a1",PlaceImage1: "a2", PlaceImage2: "a3", PlaceImage3: "4" ,PlaceName: "KAYA cafe ☕️", placeDetail: "إطلاله بين الأشجار")
//      ]),
//      abhPlace(image: "5", name: "High City ⠀⠀", placeA: [
//        PlaceInformation(PlaceImage0: "s1",PlaceImage1: "s2", PlaceImage2: "s3", PlaceImage3: "s4", PlaceName: "high city 🏞", placeDetail: " مطاعم ومقاهي وفندق "),
//      ]),
//
     

//        abhPlace(image: "8", name: "Candy Tree Cafe", placeA: [
//            PlaceInformation(PlaceImage0: "z1",PlaceImage1: "z2", PlaceImage2: "z3", PlaceImage3: "8", PlaceName: "Candy Tree Cafe", placeDetail: "مقهى رائع وجلسات داخلية راقية ")
//      ]),

//        abhPlace(image: "10", name: "Piano Cafe  ☕️", placeA: [
//            PlaceInformation(PlaceImage0: "p1",PlaceImage1: "p2", PlaceImage2: "p3", PlaceImage3: "10", PlaceName: "Piano Cafe  ☕️", placeDetail: "مقهى رائع وجلسات داخلية راقية ")
//            ]),
//             abhPlace(image: "4", name: "KAYA Cafe ⠀⠀", placeA: [
//                 PlaceInformation(PlaceImage0: "a1",PlaceImage1: "a2", PlaceImage2: "a3", PlaceImage3: "4" ,PlaceName: "KAYA cafe ☕️", placeDetail: "مقهى كايا وبإطلالة مُبهرة.. تروقك القهوة و المكان والأشجار.")
//               ]),
//               abhPlace(image: "5", name: "High City ⠀⠀", placeA: [
//                 PlaceInformation(PlaceImage0: "s1",PlaceImage1: "s2", PlaceImage2: "s3", PlaceImage3: "s4", PlaceName: "high city 🏞", placeDetail: " تضم العديد من المطاعم والمقاهي والمنتجعات والفنادق والفلل السكنية لتلبية احتياجات السياح والزوار. "),
//               ]),

//               abhPlace(image: "7", name: "Abha Dam lake ⠀", placeA: [
//                 PlaceInformation(PlaceImage0: "q3",PlaceImage1: "q2", PlaceImage2: "q1", PlaceImage3: "7", PlaceName: "Abha Dam Lake", placeDetail: "بحيرة سد أبها ")
//               ]),
//               abhPlace(image: "1", name: "Jabal sawda ⛰", placeA: [
//                 PlaceInformation(PlaceImage0: "w1",PlaceImage1: "w2", PlaceImage2: "w3", PlaceImage3: "1", PlaceName: "Jabal sawda ⛰", placeDetail: "منتزه سياحي ")
//      ]),
//      
//  
//      abhPlace(image: "3", name: "  على بالي  ☕️", placeA: [
//        PlaceInformation(PlaceImage0: "c1",PlaceImage1: "c2", PlaceImage2: "c3", PlaceImage3: "3", PlaceName: "  على بالي  ☕️", placeDetail: "على بالي ، مطعم وكافيه لبناني")
//      ]),
//
//           ]

var searchPlace1 = [String]()









//struct coffee {
//    var image: String
//    let name: String
//    let placeA: Array<PlaceInformation>
//}
//struct PlaceInformationC {
//  var PlaceImageC1: String
//    var PlaceImageC2: String
//    var PlaceNameC: String
//    var placeDetailC: String
//}