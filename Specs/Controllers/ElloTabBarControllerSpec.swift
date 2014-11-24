//
//  ElloTabBarControllerSpec.swift
//  Ello
//
//  Created by Sean Dougherty on 11/22/14.
//  Copyright (c) 2014 Ello. All rights reserved.
//

import Quick
import Nimble


class ElloTabBarControllerSpec: QuickSpec {
    override func spec() {

        let storyboard = UIStoryboard.iPhone()
        var controller = ElloTabBarController.instantiateFromStoryboard(storyboard)
        describe("initialization", {

            beforeEach({
                controller = ElloTabBarController.instantiateFromStoryboard(storyboard)
            })

            it("can be instatiated from storyboard") {
                expect(controller).notTo(beNil())
            }

            it("is a ElloTabBarController", {
                expect(controller).to(beAKindOf(ElloTabBarController.self))
            })

        })

        describe("-viewDidLoad", {

            beforeEach({
                controller = ElloTabBarController.instantiateFromStoryboard(storyboard)
            })

            it("sets friends as the selected tab", {
                controller.viewDidLoad()

                expect(controller.selectedIndex).to(equal(2))
            })

        });
    }
}