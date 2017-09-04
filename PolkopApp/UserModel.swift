//
//  UserModel.swift
//

import ObjectMapper

class UserModel: Mappable {
    
    var userId: Int?
    var email: String?
    var name: String?
    var surname: String?
    var nick: String?
    var userPhoto: String?
    var apiToken: String?
    var tokenFirebase: String?
    var wallet: Float?
    var productsBoughtCount: Int?
    var productsCartCount: Int?
	var productsLikedCount: Int?
    var inviteLink: String?
    var nameToDisplay: String?
    
    // UserExt
    var phone: String?
    var country: String?
    var region: String?
    var city: String?
    var zipCode: String?
    var addres: String?
    var addres2: String?
    var displayName: Bool?

	// MARK: - Init
	
	required init?(map: Map) {
		if map.JSON["user_id"] == nil {
			return nil
		}
	}
	
	// MARK: - Mappable
	
    func mapping(map: Map) {
        self.userId <- map["user_id"]
        self.email <- map["email"]
        self.name <- map["name"]
        self.surname <- map["surname"]
        self.nick <- map["nick"]
        self.userPhoto <- map["user_photo"]
        self.apiToken <- map["api_token"]
        self.tokenFirebase <- map["token_firebase"]
        self.wallet <- map["eracoin_count"]
        self.productsBoughtCount <- map["products_bought_count"]
        self.inviteLink <- map["invite_link"]
        self.nameToDisplay <- map["display_name"]
        self.displayName <- map["user_ext.display_name"]
        self.phone <- map["user_ext.phone"]
        self.country <- map["user_ext.country"]
        self.region <- map["user_ext.region"]
        self.city <- map["user_ext.city"]
        self.zipCode <- map["user_ext.zip_code"]
        self.addres <- map["user_ext.address"]
        self.addres2 <- map["user_ext.address2"]
		self.productsCartCount <- map["cart_products_count"]
		self.productsLikedCount <- map["products_liked_count"]
	}
}
