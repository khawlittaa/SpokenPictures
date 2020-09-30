//
//  Helper.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

let menu = UIStoryboard(name: "Menu", bundle: nil)
let home = UIStoryboard(name: "Home", bundle: nil)
let editing = UIStoryboard(name: "Editing", bundle: nil)
let album = UIStoryboard(name: "Album", bundle: nil)
let postcard = UIStoryboard(name: "PostCard", bundle: nil)
let payment = UIStoryboard(name: "Payment", bundle: nil)


func secondsToMinutesSeconds (seconds : Int) -> ( Int, Int) {
  return ((seconds % 3600) / 60, (seconds % 3600) % 60)
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}


func getFileURL() -> URL {
     let path = getDocumentsDirectory().appendingPathComponent("recording.m4a")
     return path as URL
 }

