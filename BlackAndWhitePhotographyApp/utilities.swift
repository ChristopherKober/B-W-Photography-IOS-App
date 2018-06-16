//
//  utilities.swift
//  BlackAndWhitePhotographyApp
//
//  Created by Kent Kober on 6/16/18.
//  Copyright © 2018 Kent Kober. All rights reserved.
//

import Foundation

let DEBUG = true

enum Result<T,E> {
    case Ok(T)
    case Err(E)
}
