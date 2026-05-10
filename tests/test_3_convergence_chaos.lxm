domain ChaosManager {
    scope { domain }
    capability { messaging, send_to:ChaosManager }
    state { workers: int }
    
    goal DesireFive {
        priority 100
        target workers >= 5
        strategy { AddWorker }
    }
    
    goal DesireThree {
        priority 50
        target workers <= 5
        strategy { RemoveWorker }
    }
    
    transition Boot {
        capability { messaging, send_to:ChaosManager }
        slice step { workers = workers }
    }

    transition AddWorker {
        capability { messaging, send_to:ChaosManager }
        slice step { workers = workers + 1 }
    }
    
    transition RemoveWorker {
        capability { messaging, send_to:ChaosManager }
        slice step { workers = workers - 1 }
    }
}
