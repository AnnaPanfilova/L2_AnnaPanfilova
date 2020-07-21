//
//  main.swift
//  L2_AnnaPanfilova
//
//  Created by Anna on 21.07.2020.
//  Copyright © 2020 Anna. All rights reserved.
//

import Foundation



// Задача 1

func isEven(num: Int) -> Bool {
    return num % 2 == 0
}


print ("Задача 1. Проверка четности целого числа. Введите целое число:")

var num = Int(readLine() ?? "0") ?? 0

if !isEven(num: num) {
    print("Вы ввели нечетное число")
} else {
    print("Вы ввели четное число")
}



// Задача 2

func isMultipleOf(multiplier: Int, num: Int) -> Bool {
    return num % multiplier == 0
}

print ("Задача 2. Проверка кратности числа трем. Введите целое число:")

num = Int(readLine() ?? "0") ?? 0

if isMultipleOf(multiplier: 3, num: num) {
    print("Вы ввели число кратное трем")
} else {
    print("Вы ввели число некратное трем")
}



// Задача 3

func buildGrowingArray(count: Int) -> [Int] {
    var resultArray = [Int]()
    
    for i in 1...count {
        resultArray.append(i)
    }
    
    return resultArray
}

var growingArray = buildGrowingArray(count: 100)

print ("Задача 3. Создание возрастающего массива из 100 чисел:\n\(growingArray)")



// Задача 4

func removeEvenFromArray(array: [Int]) -> [Int] {
    var resultArray = array
    
    var i = 0
    while i < resultArray.count {
        if isEven(num: resultArray[i]) {
            resultArray.remove(at: i) // если удаляем элемент, то увеличивать i не нужно, т.к. элементы сдвигаются в массиве влево
            continue
        }
        
        i += 1 // увеличиваем индекс только если не удалили элемент
    }
    
    return resultArray
}

func removeNotMultipleOfFromArray(multiplier: Int, array: [Int]) -> [Int] {
    var resultArray = array
    
    var i = 0
    while i < resultArray.count {
        if !isMultipleOf(multiplier: multiplier, num: resultArray[i]) {
            resultArray.remove(at: i) // если удаляем элемент, то увеличивать i не нужно, т.к. элементы сдвигаются в массиве влево
            continue
        }
        
        i += 1 // увеличиваем индекс только если не удалили элемент
    }
    
    return resultArray
}

growingArray = removeEvenFromArray(array: growingArray)
growingArray = removeNotMultipleOfFromArray(multiplier: 3, array: growingArray)

print ("Задача 4. Удаление из массива четных чисел и чисел, не делящихся на 3:\n\(growingArray)")



// Задача 5

func calculateFibonacci(array: [Int]) -> Int {
    if array.count < 3 {
        return 1
    }

    return array[array.count - 1] + array[array.count - 2]
}

func appendArrayWithFibonacci(array: [Int], count: Int) -> [Int] {
    var resultArray = array

    for _ in 0..<count {
        resultArray.append(calculateFibonacci(array: resultArray))
    }

    return resultArray
}

growingArray = appendArrayWithFibonacci(array: growingArray, count: 20)

// добавляем 20 чисел, т.к. 100 чисел выходят за диапазон типа Int
print ("Задача 5. Добавить в массив 20 чисел Фибоначчи:\n\(growingArray)")



// Задача 6

func removeMultipleOfFromArray(multiplier: Int, array: [Int]) -> [Int] {
    var resultArray = array

    var i = 0
    while i < resultArray.count {
        if array[i] != multiplier && isMultipleOf(multiplier: multiplier, num: resultArray[i]) {
            resultArray.remove(at: i) // если удаляем элемент, то увеличивать i не нужно, т.к. элементы сдвигаются в массиве влево
            continue
        }

        i += 1 // увеличиваем индекс только если не удалили элемент
    }

    return resultArray
}

func buildArrayWithErathosphen(count: Int) -> [Int] {
    var resultArray = buildGrowingArray(count: 100)
    resultArray.remove(at: 0)

    var pIndex = 0

    while pIndex < resultArray.count {
        let p = resultArray[pIndex]
        resultArray = removeMultipleOfFromArray(multiplier: p, array: resultArray)
        pIndex += 1
    }

    return resultArray
}

let erathosphenNumbers = buildArrayWithErathosphen(count: 100)

print ("Задача 6. Заполнить массив элементов различными простыми числами, следуя методу Эратосфена:\n\(erathosphenNumbers)")
