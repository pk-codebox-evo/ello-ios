//
//  BasicIcon.swift
//  Ello
//
//  Created by Sean on 4/29/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Foundation

public class BasicIcon: UIView {

    private var _selected = false
    private var _highlighted = false

    private let normalIconView: UIView
    private let selectedIconView: UIView

    // MARK: Initializers

    public init(normalIconView: UIView, selectedIconView: UIView) {
        self.normalIconView = normalIconView
        self.selectedIconView = selectedIconView
        let frame =
        CGRect(
            x: 0,
            y: 0,
            width: normalIconView.frame.size.width,
            height: normalIconView.frame.size.height
        )
        super.init(frame: frame)
        addSubview(self.normalIconView)
        addSubview(self.selectedIconView)
        self.selectedIconView.hidden = true
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private
    func updateIcon(selected: Bool) {
        normalIconView.hidden = selected
        selectedIconView.hidden = !selected
    }
}

extension BasicIcon: ImageLabelAnimatable {

    public var selected: Bool {
        get { return _selected }
        set {
            _selected = newValue
            updateIcon(newValue)
        }
    }

    public var highlighted: Bool {
        get { return _highlighted }
        set {
            _highlighted = newValue
            if selected { return }
            updateIcon(newValue)
        }
    }

    public var view: UIView { return self }
}
