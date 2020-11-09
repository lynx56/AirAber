//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by Holyberry on 09.11.2020.
//  Copyright © 2020 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {
  
  @IBOutlet var flightLabel: WKInterfaceLabel!
  @IBOutlet var routeLabel: WKInterfaceLabel!
  @IBOutlet var boardingLabel: WKInterfaceLabel!
  @IBOutlet var boardTimeLabel: WKInterfaceLabel!
  @IBOutlet var statusLabel: WKInterfaceLabel!
  @IBOutlet var gateLabel: WKInterfaceLabel!
  @IBOutlet var seatLabel: WKInterfaceLabel!
  
  var flight: Flight? {
    didSet {
      DispatchQueue.main.async {
        self.renderModel()
      }
    }
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    flight = Flight.allFlights().first
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  private func renderModel() {
    guard let flight = flight else { return }
    
    flightLabel.setText("Flight \(flight.shortNumber)")
    routeLabel.setText(flight.route)
    boardingLabel.setText("\(flight.number) Boards")
    boardTimeLabel.setText(flight.boardsAt)
    gateLabel.setText("Gate \(flight.gate)")
    seatLabel.setText("Seat \(flight.seat)")
    
    if flight.onSchedule {
      statusLabel.setText("On Time")
    } else {
      statusLabel.setText("Delayed")
      statusLabel.setTextColor(.red)
    }
    
  }
  
}
