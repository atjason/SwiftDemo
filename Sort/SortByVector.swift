//: Playground - noun: a place where people can play

import Cocoa

func setBit(num: UInt8, index: UInt8, valid: Bool) -> UInt8 {
  let mark = 1 << index
  if valid {
    return num | mark
  } else {
    return num ^ mark
  }
}

func sort(_ arr: [Int]) -> [Int] {
  guard !arr.isEmpty else {
    return [Int]()
  }
  
  var sortedArr = [Int]()
  var maxNum = arr[0]
  let vector = NSMutableData()
  
  // Mark numbers in vector.
  for num in arr {
    if maxNum < num {
      maxNum = num
    }
    
    // Increase length if necessary.
    let diff = (maxNum / 8 + 1) - vector.length
    if diff > 0 {
      vector.increaseLength(by: diff)
    }
    
    // Mark the bit for the number.
    let indexA = num / 8
    let indexB = num % 8
    
    let ptr = vector.mutableBytes.advanced(by: indexA)
    let num = ptr.load(fromByteOffset: 0, as: UInt8.self)
    let newNum = setBit(num: num, index: UInt8(indexB), valid: true)
    ptr.storeBytes(of: newNum, as: UInt8.self)
  }
  
  // Export numbers
  var currentNum = 0
  let unit = 8
  loop: for index in 0...(maxNum / unit) {
    let ptr = vector.mutableBytes.advanced(by: index)
    var num = ptr.load(fromByteOffset: 0, as: UInt8.self)
    
    if num == 0 {
      currentNum += unit
      continue
    }
    
    for _ in 0..<unit {
      if (num & 1) > 0 {
        sortedArr.append(currentNum)
        
        if currentNum > maxNum {
          break loop
        }
      }
      
      currentNum += 1
      num = num >> 1
    }
  }
  
  return sortedArr
}

//let num: UInt8 = 1
//let index: UInt8 = 2
//print(setBit(num: num, index: index, valid: true))

let arr = [55, 1, 123456789]
let sortedArr = sort(arr)
print(sortedArr)

