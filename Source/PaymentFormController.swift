//
//  PaymentFormControler.swift
//  FramesIos
//
//  Created by Nazar Revutsky on 7/12/19.
//  Copyright © 2019 Checkout. All rights reserved.
//

import Foundation
import UIKit

public class PaymentFormController: UIViewController, CardViewControllerDelegate {
    public func onTapDone(controller: CardViewController, cardToken: CkoCardTokenResponse?, status: CheckoutTokenStatus) {
        if (cardToken != nil && status == CheckoutTokenStatus.success) {
            self.delegate?.onSuccess(controller: controller)
        } else {
            self.delegate?.onError(controller: controller)
        }
    }
    
    public func onSubmit(controller: CardViewController) {
        self.delegate?.onSubmit(controller: controller)
    }
    
    public var cardViewController: CardViewController
    var checkoutApiClient: CheckoutAPIClient
    var delegate: PaymentFormControllerDelegate?
    
    public init(checkoutApiClient: CheckoutAPIClient, delegate: PaymentFormControllerDelegate) {
        self.checkoutApiClient = checkoutApiClient;
        self.cardViewController = CardViewController(checkoutApiClient: checkoutApiClient, cardHolderNameState: .required, billingDetailsState: .required)
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.checkoutApiClient = CheckoutAPIClient(publicKey: "TEST")
        cardViewController = CardViewController(checkoutApiClient: self.checkoutApiClient, cardHolderNameState: .required, billingDetailsState: .required)
        self.delegate = nil
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // set the card view controller delegate
        cardViewController.delegate = self
        navigationController?.pushViewController(cardViewController, animated: false)
    }
}
