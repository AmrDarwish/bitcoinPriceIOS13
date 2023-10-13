//
//  bitConinmanager.swift
//  bitcoinPrice
//
//  Created by Amr Abdaldayem on 25/09/2022.
//
import UIKit
import Foundation
struct BitCoinData: Codable {
    var BTCAUD : Coin?
    var BTCBRL : Coin?
    var BTCCAD : Coin?
    var BTCCNY : Coin?
    var BTCEUR : Coin?
    var BTCGBP : Coin?
    var BTCHKD : Coin?
    var BTCIDR : Coin?
    var BTCILS : Coin?
    var BTCINR : Coin?
    var BTCJPY : Coin?
    var BTCMXN : Coin?
    var BTCNOK : Coin?
    var BTCNZD : Coin?
    var BTCPLN : Coin?
    var BTCRON : Coin?
    var BTCRUB : Coin?
    var BTCSEK : Coin?
    var BTCSGD : Coin?
    var BTCUSD : Coin?
    var BTCZAR : Coin?
}

struct Coin: Codable {
    var last : Double
}

