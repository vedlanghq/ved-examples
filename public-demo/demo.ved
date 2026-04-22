domain Deployer {
  capability { 
    messaging, 
    send_to:Deployer 
  }
  
  state {
    nodes_running: int
  }
  
  goal HighlyAvailable {
    predicate nodes_running == 3
  }

  transition ensure_capacity {
    capability { 
      messaging, 
      send_to:Deployer
    }
    
    step {
      if nodes_running < 3 {
        nodes_running = nodes_running + 1
        send("Deployer", "ensure_capacity")
      }
    }
  }
}
