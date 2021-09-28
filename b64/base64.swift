//
//  base64.swift
//  b64
//
//  Created by Reaper on 28/09/21.
//

import Foundation


func decodeBase64(toDecode: String)-> String{
    if let base64Decoded = Data(base64Encoded: toDecode, options: Data.Base64DecodingOptions(rawValue: 0))
    .map({ String(data: $0, encoding: .utf8) }) {
        return base64Decoded ?? ""
    }
    return ""
}

func encodeBase64(toEncode:String)->String{
    if let base64Encoded = toEncode.data(using: .utf8)?
        .base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0)) {
            return base64Encoded
        }
    return ""
}
