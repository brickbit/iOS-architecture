//
//  Extension.swift
//  Base
//
//  Created by Roberto on 22/8/21.
//

import UIKit

extension String {
    var htmlString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlString?.string ?? ""
    }
}
