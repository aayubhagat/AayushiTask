//
//  StringExtension.swift
//  
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

extension String {
func getJsonDataDict() -> NSDictionary {
  
  let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
  
  let dict = [String: String]()
  
  if let jsonData = data {
    // Will return an object or nil if JSON decoding fails
    
    do {
      let jsonData = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
      
      let jsonDataDict = jsonData as! NSDictionary
      
      return jsonDataDict
    }  catch {
      return dict as NSDictionary
    }
    
  } else {
    return dict as NSDictionary
  }
}
  
}

