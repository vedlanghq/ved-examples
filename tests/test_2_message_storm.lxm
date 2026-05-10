domain Producer {
    scope { domain }
    capability { messaging, send_to:ConsumerOne, send_to:ConsumerTwo }
    state { 
        generated: int 
        digested_total: int 
    }
    
    goal Flood { 
        priority 100 
        target generated == 4 
        strategy { Blast } 
    }

    transition Boot { 
        capability { messaging, send_to:ConsumerOne, send_to:ConsumerTwo } 
        slice step { 
        } 
    }

    transition Blast {
        capability { messaging, send_to:ConsumerOne, send_to:ConsumerTwo }
        slice step {
            generated = generated + 2
            send("ConsumerOne", "Consume")
            send("ConsumerTwo", "Consume")
        }
    }

    transition Ack {
        capability { messaging }
        slice step {
            digested_total = digested_total + 1
        }
    }
}

domain ConsumerOne {
    scope { domain }
    capability { messaging, send_to:Producer }
    state { digested: int }
    goal Idle { priority 10 target digested == 2 strategy { WaitMessage } }
    transition WaitMessage { capability { messaging, send_to:Producer } slice step { digested = digested } }
    transition Consume { capability { messaging, send_to:Producer } slice step { digested = digested + 1 send("Producer", "Ack") } }
}

domain ConsumerTwo {
    scope { domain }
    capability { messaging, send_to:Producer }
    state { digested: int }
    goal Idle { priority 10 target digested == 2 strategy { WaitMessage } }
    transition WaitMessage { capability { messaging, send_to:Producer } slice step { digested = digested } }
    transition Consume { capability { messaging, send_to:Producer } slice step { digested = digested + 1 send("Producer", "Ack") } }
}
