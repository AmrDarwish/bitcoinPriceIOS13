//
//  ViewController.swift
//  bitcoinPrice
//
//  Created by Amr Abdaldayem on 12/09/2022.
//

import UIKit

class ViewController: UIViewController {
   
    var bitCoinManager = BitCoinManager()
    var cityName = ""
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var priceLable: UILabel!
    var elemnts = [UILabel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bitCoinManager.delegate = self
        for i in 0..<bitCoinManager.contriesNumber() {
            let button = UIButton(frame: CGRect(x: 0, y: i*26, width: Int(scrollView.frame.size.width), height: 25))
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            button.setTitle(bitCoinManager.getCurrencyTitle(placeH: i), for: .normal)
        
            scrollView.addSubview(button)
        }
    }
    
    @objc func buttonAction(sender: UIButton){
        print(sender.titleLabel!.text!)
        cityName = sender.titleLabel!.text!
        bitCoinManager.getCall(cityName: cityName)
        
    }
    
}
//MARK: -BicCoinManager
extension ViewController:  BitCoinManagerDelegate {
    
    func didUpdatePrice(price:Double) {
        DispatchQueue.main.async { [self] in
            self.priceLable.text = String(format: "%.2f", price)
        }
    }
    
}

