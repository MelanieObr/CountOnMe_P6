//
//  AlertMessage.swift
//  CountOnMe
//
//  Created by Mélanie Obringer on 13/08/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

struct AlertMessage {
    // Mark - Alert
    func alertCanAddOperator(controller: UIViewController) {
        let alertVC = UIAlertController(title: "Erreur", message: "Un operateur est déja mis", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        controller.present(alertVC, animated: true, completion: nil)
    }
    func alertExpressionCorrect(controller: UIViewController) {
        let alertVC = UIAlertController(title: "Erreur", message: "Entrez une expression correcte", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alertVC, animated: true, completion: nil)
    }
    func alertOperationToReduce(controller: UIViewController) {
        let alertVC = UIAlertController(title: "Erreur", message: "Démarrez un nouveau calcul", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alertVC, animated: true, completion: nil)
    }
    func alertDivisionbyZero(controller: UIViewController) {
        let alertVC = UIAlertController(title: "Erreur", message: "Division par 0 impossible", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alertVC, animated: true, completion: nil)
    }
}
