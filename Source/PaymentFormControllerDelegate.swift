//
//  PaymentFormControllerDelegate.swift
//  FramesIos
//
//  Created by Nazar Revutsky on 7/12/19.
//  Copyright © 2019 Checkout. All rights reserved.
//

import Foundation

@objc public protocol PaymentFormControllerDelegate {
    func onError(controller: CardViewController)
    func onSuccess(controller: CardViewController)
    func onSubmit(controller: CardViewController)
}
