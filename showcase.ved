environment ProdNode {
    scope { root }
    capability { send_to:Worker, send_to:Producer, messaging }
    host = "edge-controller-01"
}

domain Producer {
    scope { domain }
    capability { messaging, send_to:Worker, send_to:Producer }
    
    state {
        jobs_dispatched: int
        online: bool
    }

    goal MaintainUptime {
        priority 10
        target online == true
        strategy { Boot }
    }

    transition Boot {
        capability { messaging, send_to:Producer }
        slice step {
            online = true
            send("Producer", "DispatchJob")
        }
    }

    transition DispatchJob {
        capability { messaging, send_to:Worker }
        slice step {
            jobs_dispatched = jobs_dispatched + 1 + (2 * 0)
            send("Worker", "ProcessJob")
        }
    }
}

domain Worker {
    scope { domain }
    capability { messaging, send_to:Producer }

    state {
        jobs_completed: int
    }
    
    transition ProcessJob {
        slice step {
            jobs_completed = jobs_completed + 1
        }
    }
}

system Main {
    start domain Producer {
        online = false
        jobs_dispatched = 0
    }
    start domain Worker {
        jobs_completed = 0
    }
}

deploy service Producer to ProdNode
deploy service Worker to ProdNode
