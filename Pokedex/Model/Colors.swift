//
//  Colors.swift
//  Pokedex
//
//  Created by Fabio Pereira on 30/01/22.
//
import UIKit

private let colors: [PokemonType: UIColor] = [
    .Bug: ColorUtils.hexStringToUIColor(hex: "#8CB230"),
    .Dark: ColorUtils.hexStringToUIColor(hex: "#58575F"),
    .Dragon: ColorUtils.hexStringToUIColor(hex: "#0F6AC0"),
    .Electric: ColorUtils.hexStringToUIColor(hex: "#EED535"),
    .Fairy: ColorUtils.hexStringToUIColor(hex: "#ED6EC7"),
    .Fighting: ColorUtils.hexStringToUIColor(hex: "#D04164"),
    .Fire: ColorUtils.hexStringToUIColor(hex: "#FD7D24"),
    .Flying: ColorUtils.hexStringToUIColor(hex: "#748FC9"),
    .Ghost: ColorUtils.hexStringToUIColor(hex: "#556AAE"),
    .Grass: ColorUtils.hexStringToUIColor(hex: "#62B957"),
    .Ground: ColorUtils.hexStringToUIColor(hex: "#DD7748"),
    .Ice: ColorUtils.hexStringToUIColor(hex: "#61CEC0"),
    .Normal: ColorUtils.hexStringToUIColor(hex: "#9DA0AA"),
    .Poison: ColorUtils.hexStringToUIColor(hex: "#A552CC"),
    .Psychic: ColorUtils.hexStringToUIColor(hex: "#EA5D60"),
    .Rock: ColorUtils.hexStringToUIColor(hex: "#BAAB82"),
    .Steel: ColorUtils.hexStringToUIColor(hex: "#417D9A"),
    .Water: ColorUtils.hexStringToUIColor(hex: "#4A90DA"),
]

struct Colors {
     static func getColor(type: PokemonType) -> UIColor {
         if let c = colors[type] {
            return c
        } else {
            return ColorUtils.hexStringToUIColor(hex: "#000000")
        }
    }
}
