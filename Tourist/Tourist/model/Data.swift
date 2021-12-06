//
//  Data.swift
//  eBook
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//

import UIKit

var newPlace: Array<abhPlace> = []

struct abhPlace {
    var image: UIImage!
    var name: String
    var placeA: Array<PlaceInformation>
}


struct PlaceInformation {
  let PlaceImage0: String
    let PlaceImage1: String
    let PlaceImage2: String
    let PlaceImage3: String
    
  let PlaceName: String
}
var PlaceList = [
   
    abhPlace(image: UIImage(named: "4"), name: "KAYA cafe ☕️", placeA: [
        PlaceInformation(PlaceImage0: "a1",PlaceImage1: "a2", PlaceImage2: "a3", PlaceImage3: "4" ,PlaceName: "KAYA cafe ☕️")
    ]),
    abhPlace(image: UIImage(named: "5"), name: "high city 🏞", placeA: [
        PlaceInformation(PlaceImage0: "s1",PlaceImage1: "s2", PlaceImage2: "s3", PlaceImage3: "s4", PlaceName: "high city 🏞"),
    ]),
    abhPlace(image: UIImage(named: "t1"), name: "AZIZAH ⛰", placeA: [
        PlaceInformation(PlaceImage0: "2",PlaceImage1: "t2", PlaceImage2: "t3", PlaceImage3: "t4", PlaceName: "AZIZAH ⛰")
    ]),
    abhPlace(image: UIImage(named: "7"), name: "Abha Dam Lake", placeA: [
        PlaceInformation(PlaceImage0: "q3",PlaceImage1: "q2", PlaceImage2: "q1", PlaceImage3: "7", PlaceName: "Abha Dam Lake")
    ]),
    abhPlace(image: UIImage(named: "1"), name: " Jabal sawda ⛰", placeA: [
        PlaceInformation(PlaceImage0: "w1",PlaceImage1: "w2", PlaceImage2: "w3", PlaceImage3: "1", PlaceName: "Jabal sawda ⛰")
    ]),
      abhPlace(image: UIImage(named: "8"), name: "Candy Tree Cafe", placeA: [
        PlaceInformation(PlaceImage0: "z1",PlaceImage1: "z2", PlaceImage2: "z3", PlaceImage3: "8", PlaceName: "Candy Tree Cafe")
    ]),
      abhPlace(image: UIImage(named: "9"), name: "Abu Kheyal Park", placeA: [
        PlaceInformation(PlaceImage0: "f1",PlaceImage1: "f2", PlaceImage2: "f3", PlaceImage3: "9", PlaceName: "Abu Kheyal Park")
    ]),
      abhPlace(image: UIImage(named: "10"), name: "Piano Cafe  ☕️", placeA: [
        PlaceInformation(PlaceImage0: "p1",PlaceImage1: "p2", PlaceImage2: "p3", PlaceImage3: "10", PlaceName: "Piano Cafe  ☕️")
    ]),
    
abhPlace(image: UIImage(named: "6"), name: "Fog cafe ☕️ ", placeA: [
    PlaceInformation(PlaceImage0: "d1",PlaceImage1: "d2", PlaceImage2: "d3", PlaceImage3: "6", PlaceName: "Fog cafe ☕️")

    ]),
    abhPlace(image: UIImage(named: "c4"), name: "  على بالي  ☕️", placeA: [
        PlaceInformation(PlaceImage0: "c1",PlaceImage1: "c2", PlaceImage2: "c3", PlaceImage3: "3", PlaceName: "  على بالي  ☕️")
    ]),


    
           ]

struct English {
    var image: String
    var name: String
}

let placeList2 = [
    English(image: "1", name: "wk"),
    English(image: "1", name: "wk"),
    English(image: "1", name: "wk"),
     
] as [Any]


var searchPlace1 = [String]()
