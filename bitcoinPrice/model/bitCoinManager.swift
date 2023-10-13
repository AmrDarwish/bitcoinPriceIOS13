//
//  bitCoinAManager.swift
//  bitcoinPrice
//
//  Created by Amr Abdaldayem on 25/09/2022.
//

import UIKit
import Foundation
protocol BitCoinManagerDelegate {
    func didUpdatePrice(price:Double)
}
struct BitCoinManager {
    var delegate : BitCoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let apiUrl = "https://apiv2.bitcoinaverage.com/indices/global/ticker/short?crypto=BTC&fiat="
    var APIkeyVlue = "YzZiMGRmNzFjOTBhNGYyYjhjNjc1MzUzYjE1ZmIwZWM"
    var APIkeyHeader = "x-ba-key"
    
    func getCurrencyTitle(placeH:Int) -> String {
        return self.currencyArray[placeH]
    }
    func contriesNumber() -> Int {
        return self.currencyArray.count
    }
    
    func getCall( cityName: String) {
        let url = URL(string: apiUrl+cityName)!
        var price = 0.0
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue(APIkeyVlue, forHTTPHeaderField: APIkeyHeader)
        
        let session = URLSession.shared
        
        session.dataTask(with: request){ (data : Data? , response : URLResponse? , error : Error? ) in
            
            if ( error == nil){
                
                let string = String(data: data!, encoding: .utf8)
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(BitCoinData.self , from: data)
                        
                        switch cityName {
                        case "AUD":
                            delegate?.didUpdatePrice(price: decodedData.BTCAUD!.last)
                        case "BRL":
                            delegate?.didUpdatePrice(price: decodedData.BTCBRL!.last)
                        case "CAD":
                            delegate?.didUpdatePrice(price: decodedData.BTCCAD!.last)
                        case "CNY":
                            delegate?.didUpdatePrice(price: decodedData.BTCCNY!.last)
                        case "EUR":
                            delegate?.didUpdatePrice(price: decodedData.BTCEUR!.last)
                        case "GBP":
                            delegate?.didUpdatePrice(price: decodedData.BTCGBP!.last)
                        case "HKD":
                            delegate?.didUpdatePrice(price: decodedData.BTCHKD!.last)
                        case "IDR":
                            delegate?.didUpdatePrice(price: decodedData.BTCIDR!.last)
                        case "ILS":
                            delegate?.didUpdatePrice(price: decodedData.BTCILS!.last)
                        case "INR":
                            delegate?.didUpdatePrice(price: decodedData.BTCJPY!.last)
                        case "MXN":
                            delegate?.didUpdatePrice(price: decodedData.BTCMXN!.last)
                        case "NOK":
                            delegate?.didUpdatePrice(price: decodedData.BTCNOK!.last)
                        case "NZD":
                            delegate?.didUpdatePrice(price: decodedData.BTCNZD!.last)
                        case "PLN":
                            delegate?.didUpdatePrice(price: decodedData.BTCPLN!.last)
                        case "RON":
                            delegate?.didUpdatePrice(price: decodedData.BTCRON!.last)
                        case "RUB":
                            delegate?.didUpdatePrice(price: decodedData.BTCRUB!.last)
                        case "SEK":
                            delegate?.didUpdatePrice(price: decodedData.BTCSEK!.last)
                        case "SGD":
                            delegate?.didUpdatePrice(price: decodedData.BTCSGD!.last)
                        case "USD":
                            delegate?.didUpdatePrice(price: decodedData.BTCUSD!.last)
                        case "ZAR":
                            delegate?.didUpdatePrice(price: decodedData.BTCZAR!.last)
                        default:
                            print("error")
                        }
                        
                        
                        
                        
                        
                    }
                    catch {
                        print(error)
                        
                    }
                }
            }
            
            else {
                print(error!)
                
            }
        }.resume()
        
        
    }
    
}



