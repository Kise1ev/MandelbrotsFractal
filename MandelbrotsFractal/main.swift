//
//  main.swift
//  MandelbrotsFractal
//
//  Created by Роман Киселев on 25.04.2024.
//

import Foundation

func mandelbrotIterations(cx: Double, cy: Double, maxIterations: Int) -> Int {
    var zx = 0.0
    var zy = 0.0
    var i = 0
    while zx * zx + zy * zy < 4 && i < maxIterations {
        let temp = zx * zx - zy * zy + cx
        zy = 2 * zx * zy + cy
        zx = temp
        i += 1
    }
    return i
}

func printMandelbrot(width: Int, height: Int, maxIterations: Int) {
    let aspectRatio = Double(width) / Double(height)
    let scale = 3.0 / Double(width)
    for y in 0..<height {
        for x in 0..<width {
            let cx = Double(x) * scale - 2.0
            let cy = Double(y) * scale / aspectRatio - 1.0
            let iterations = mandelbrotIterations(cx: cx, cy: cy, maxIterations: maxIterations)
            let char: Character
            if iterations == maxIterations {
                char = "*"
            } else {
                let gradient = Double(iterations) / Double(maxIterations)
                let gradientChars = " .:-=+*#%@"
                let gradientIndex = Int(gradient * Double(gradientChars.count - 1))
                char = gradientChars[gradientChars.index(gradientChars.startIndex, offsetBy: gradientIndex)]
            }
            print(char, terminator: "")
        }
        print()
    }
}

let width = 100
let height = 50
let maxIterations = 100
printMandelbrot(width: width, height: height, maxIterations: maxIterations)
