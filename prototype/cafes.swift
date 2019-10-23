//
//  cafes.swift
//  prototype
//
//  Created by Julia Pagnucco on 10/23/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class Cafe
{
  // MARK: - Public API
  var id = ""
  var title = ""
  var description = ""
  var featuredImage: UIImage!
  
  init(id: String, title: String, description: String, featuredImage: UIImage!)
  {
    self.id = id
    self.title = title
    self.description = description
    self.featuredImage = featuredImage
  }
  
  // MARK: - Private
  
  static func createCafes() -> [Cafe]
  {
    return [
      Cafe(id: "r1", title: "Starbucks", description: "Coffee and Pastries", featuredImage: UIImage(named: "starbucks")!),
      Cafe(id: "r2", title: "Einstein Bros. Bagels", description: "Bagels, Coffee, Sandwiches", featuredImage: UIImage(named: "einstein")!),
      Cafe(id: "r3", title: "Subway", description: "Make your own sandwiches", featuredImage: UIImage(named: "subway")!),

      
    ]
  }
}
