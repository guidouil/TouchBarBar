//
//  WindowController.swift
//  TouchBarBar
//
//  Created by Guidouil on 10/29/16.
//  Copyright © 2016 Guidouil. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("com.guidouil.touchbarbar")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let champagne = NSTouchBarItemIdentifier("champagne")
    static let cocktail = NSTouchBarItemIdentifier("cocktail")
    static let beer = NSTouchBarItemIdentifier("beer")
    static let martini = NSTouchBarItemIdentifier("martini")
}

class WindowController: NSWindowController, NSTouchBarDelegate {
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    func Isaac(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }
        sound.play()
    }

    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        touchBar.defaultItemIdentifiers = [.champagne, .cocktail, .beer, .martini]
        
        return touchBar
    }
    
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
        case NSTouchBarItemIdentifier.champagne:
            let button = NSButton(title: "🍾", target: self, action: #selector(Isaac))
            touchBarItem.view = button
            return touchBarItem
            
        case NSTouchBarItemIdentifier.beer:
            let button = NSButton(title: "🍺", target: self, action: #selector(Isaac))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.cocktail:
            let button = NSButton(title: "🍹", target: self, action: #selector(Isaac))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.martini:
            let button = NSButton(title: "🍸", target: self, action: #selector(Isaac))
            touchBarItem.view = button
            return touchBarItem
        default:
            let button = NSButton(title: "🍹", target: self, action: #selector(Isaac))
            touchBarItem.view = button
            return touchBarItem
        }
    }
}
