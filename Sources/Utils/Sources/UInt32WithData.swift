//
//  UInt32WithData.swift
//  DarkLightning
//
//  Created by Jens Meder on 18.06.17.
//
//

import Foundation

internal final class UInt32WithData: OOUInt32 {
	private let data: OOData
	
	// MARK: Init
    
    internal required init(data: OOData) {
        self.data = data
    }
    
    // MARK: OOUInt32
	
	var rawValue: UInt32 {
		return data.dataValue.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> UInt32 in
            return bytes.load(as: UInt32.self)
		}
	}
}
