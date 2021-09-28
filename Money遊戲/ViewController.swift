//
//  ViewController.swift
//  Money遊戲
//
//  Created by 王昱淇 on 2021/9/25.
//

import UIKit

class ViewController: UIViewController {    
    @IBOutlet weak var toySegmentedControl: UISegmentedControl!
    @IBOutlet weak var toyImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var moneyQuantityLabels: [UILabel]!
    @IBOutlet var moneyQuantityStepper: [UIStepper]!
    
    var price = 2999
    var account = 0
    let moneyArray = [1000, 500, 100, 50, 10, 5, 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPriceLabel()
    }
    
    func addPriceLabel() {
        let fomatter = NumberFormatter()
        fomatter.numberStyle = .currencyISOCode
        fomatter.locale = Locale(identifier: "zh_tw")
        fomatter.maximumFractionDigits = 0
        let priceString = fomatter.string(from: NSNumber(value: price))
        let accountString = fomatter.string(from: NSNumber(value: account))
        priceLabel.text = priceString
        resultLabel.text = accountString
    }
    
    func calculateAccount() {
        account = Int(moneyQuantityLabels[0].text!)! * moneyArray[0] + Int(moneyQuantityLabels[1].text!)! * moneyArray[1] + Int(moneyQuantityLabels[2].text!)! * moneyArray[2] + Int(moneyQuantityLabels[3].text!)! * moneyArray[3] + Int(moneyQuantityLabels[4].text!)! * moneyArray[4] + Int(moneyQuantityLabels[5].text!)! * moneyArray[5] + Int(moneyQuantityLabels[6].text!)! * moneyArray[6]
    }

    @IBAction func changeContents(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            toyImageView.image = UIImage(named: "ariplane")
            price = 2999
        } else if sender.selectedSegmentIndex == 1 {
            toyImageView.image = UIImage(named: "boat")
            price = 1777
        } else if sender.selectedSegmentIndex == 2 {
            toyImageView.image = UIImage(named: "motorcycle")
            price = 888
        } else if sender.selectedSegmentIndex == 3{
            toyImageView.image = UIImage(named: "truck")
            price = 1680
        }
        addPriceLabel()
    }
    
    @IBAction func addMoneyQuantity(_ sender: Any) {
        for i in 0...6 {
            moneyQuantityLabels[i].text = String(Int(moneyQuantityStepper[i].value))
        }
        calculateAccount()
        addPriceLabel()
    }
    
    @IBAction func showResult(_ sender: Any) {
        if account == price {
            resultLabel.text = "TWD\(price) is correct!"
        } else if account > price {
            resultLabel.text = "TWD\(account) is too much."
        } else if account < price {
            resultLabel.text = "TWD\(account) is not enough."
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        toySegmentedControl.selectedSegmentIndex = 0
        for i in 0...6 {
            moneyQuantityLabels[i].text = "0"
        }
        account = 0
        addPriceLabel()
    }
    
}

