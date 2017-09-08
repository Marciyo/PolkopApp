//
//  ProductModel.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski on 08.02.2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import ObjectMapper

class ProductModel: Mappable {
    
    var productId: Int?
    var userId: Int?
    var name: String?
    var description: String?
    var productKeywords: [String]?
    var avgRating: Float?
    var sku: String?
    var price: Float?
    var photo: String?
    var favourite: Bool = false
    var vendorName: String?
    var vendorPhoto: String?
    var vendorIsFavorite: Bool = false
    
    // MARK: - Init
    
    required init?(map: Map) {
        if map.JSON["product_id"] == nil {
            return nil
        }
    }
    
    // MARK: - Mappable
    
    func mapping(map: Map) {
        self.productId <- map["product_id"]
        self.userId <- map["user_id"]
        self.name <- map["name"]
        self.description <- map["description"]
        self.productKeywords <- map["product_keywords"]
        self.avgRating <- map["rate"]
        self.sku <- map["sku"]
        self.price <- map["price"]
        self.photo <- map["photo"]
        self.favourite <- map["is_favourite"]
        self.vendorName <- map["vendor_name"]
        self.vendorPhoto <- map["vendor_photo"]
    }
}
