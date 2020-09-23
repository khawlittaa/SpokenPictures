//
//  Helper.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit


let home = UIStoryboard(name: "Home", bundle: nil)
let album = UIStoryboard(name: "Album", bundle: nil)
let postcard = UIStoryboard(name: "PostCard", bundle: nil)

func secondsToMinutesSeconds (seconds : Int) -> ( Int, Int) {
  return ((seconds % 3600) / 60, (seconds % 3600) % 60)
}


