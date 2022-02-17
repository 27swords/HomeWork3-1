//
//  main.swift
//  HomeWork 3 #1
//
//  Created by Alexander Chervoncev on 15.02.22.
//

import Foundation


enum CarEngineStatus {
    case launched, turnedOff
}
enum CarWindowsStatus {
    case open, close
}
enum CarTrunkStatus {
    case putInTrunk, takeFromTrunk
}

struct Car {
    let nameCar: String
    let yearRelease: UInt
    var carEngine: Bool
    var carWindows: Bool
    var carTrunkFulness: UInt
    var carTrunkCondition: UInt {
        didSet {
            if carTrunkCondition > carTrunkFulness {
                carTrunkCondition = oldValue
                print("Багажник полон")
            } else if carTrunkCondition == 0 {
                carTrunkCondition = oldValue
                print("Багажник пуст")
            } else {
                print("осталось в багажнике \(carTrunkCondition) / \(carTrunkFulness)")
            }
        }
    }
    
    
    init(nameCar: String,
         yearRelease: UInt,
         carEngine: Bool,
         carWindows: Bool,
         carTrunkFulness: UInt,
         carTrunkCondition: UInt) {
        
        self.nameCar = nameCar
        self.yearRelease = yearRelease
        self.carEngine = carEngine
        self.carWindows = carWindows
        self.carTrunkFulness = carTrunkFulness
        self.carTrunkCondition = carTrunkCondition
        
    }

    mutating func trunkAction(type: CarTrunkStatus) {
        switch type {
        
        case .putInTrunk:
            carTrunkCondition += 15
        case .takeFromTrunk:
            carTrunkCondition += 15
        }
    }
    
    mutating func windowsAction(type: CarWindowsStatus) {
        switch type {
        
        case .open:
            carWindows = true
        print("окно открыто")
        case .close:
            carWindows = false
        print("окно закрыто")
        }
    }

    mutating func engineAction(type: CarEngineStatus) {
        switch type {
        
        case .launched:
            carEngine = true
        print("двигатель запущен")
        case .turnedOff:
            carEngine = false
        print("двигатель выключен")
        }
    }
    func status()  {
        print("""
              марка автомобиля: \(nameCar),
              год выпуска: \(yearRelease),
              объем багажника: \(carTrunkFulness)
              """)
    }
}

var sportCar = Car(nameCar: "Mazda",
                   yearRelease: 2002,
                   carEngine: false,
                   carWindows: true,
                   carTrunkFulness: 160,
                   carTrunkCondition: 20)

sportCar.status()
print("_")

sportCar.trunkAction(type: .putInTrunk)
sportCar.windowsAction(type: .close)
sportCar.engineAction(type: .launched)


print("_")

var truckCar = Car(nameCar: "volvo",
                   yearRelease: 2021,
                   carEngine: false,
                   carWindows: true,
                   carTrunkFulness: 600,
                   carTrunkCondition: 204)

truckCar.status()

print("_")

truckCar.trunkAction(type: .takeFromTrunk)
truckCar.windowsAction(type: .open)
truckCar.engineAction(type: .launched)

print("_")

