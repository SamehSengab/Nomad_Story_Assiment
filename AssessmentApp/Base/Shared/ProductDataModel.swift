//
//  ProductDataModel.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import Foundation
struct ProductDataModel : Codable {
    let barcode, productDataDescription, id: String?
    let imageURL: String?
    let name: String?
    let retailPrice: Double?
    let costPrice: Int?

    enum CodingKeys: String, CodingKey {
        case barcode
        case productDataDescription = "description"
        case id
        case imageURL = "image_url"
        case name
        case retailPrice = "retail_price"
        case costPrice = "cost_price"
    }
}
struct ModelKay: Codable {
    var model1: ProductDataModel
    var model2: ProductDataModel
    var model3: ProductDataModel
    var model4: ProductDataModel
    var model5: ProductDataModel

    enum CodingKeys: String, CodingKey {
        case model1 = "35423"
        case model2 = "49201"
        case model3 = "75423"
        case model4 = "95935"
        case model5 = "98508"
    }
}


struct ProductViewModel {
    let imageURL: String
    let name: String
    let costPrice: Double?
    init(model: ProductDataModel) {
        self.imageURL = model.imageURL ?? ""
        self.name = model.name ?? ""
        self.costPrice = model.retailPrice
    }
}

struct DetailsViewModel {
    let imageURL: String
    let name: String
    let costPrice: Double?
    let descreption: String
    init(model: ProductDataModel) {
        self.imageURL = model.imageURL ?? ""
        self.name = model.name ?? ""
        self.costPrice = model.retailPrice
        self.descreption = model.productDataDescription ?? ""
    }
}
