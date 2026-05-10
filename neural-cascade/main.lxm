domain Neuron1 {
    scope { domain }
    capability { 
        messaging, 
        send_to:Neuron2, 
        send_to:Neuron3, 
        send_to:Neuron4 
    }

    state {
        potential: int
        spikes: int
        threshold: int
    }

    goal ReachedEquilibrium {
        priority 100
        target potential > threshold
        strategy { FireActionPotential }
    }

    transition Boot {
        capability { 
            messaging, 
            send_to:Neuron2, 
            send_to:Neuron3, 
            send_to:Neuron4 
        }
        slice step {
            potential = 0
            threshold = 10000
        }
    }

    transition FireActionPotential {
        capability { 
            messaging, 
            send_to:Neuron2, 
            send_to:Neuron3, 
            send_to:Neuron4 
        }
        slice step {
            spikes = spikes + 1
            potential = potential + 2000
            send("Neuron2", "ReceiveSynapse")
            send("Neuron3", "ReceiveSynapse")
            send("Neuron4", "ReceiveSynapse")
        }
    }

    transition ReceiveSynapse {
        capability { 
            messaging, 
            send_to:Neuron2, 
            send_to:Neuron3, 
            send_to:Neuron4 
        }
        slice step {
            potential = potential + 500
        }
    }
}

domain Neuron2 {
    scope { domain }
    capability { 
        messaging, 
        send_to:Neuron1, 
        send_to:Neuron3, 
        send_to:Neuron4 
    }
    state {
        potential: int
        spikes: int
        threshold: int
    }

    goal ReachedEquilibrium {
        priority 100
        target potential > threshold
        strategy { FireActionPotential }
    }

    transition Boot {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron3, 
            send_to:Neuron4 
        }
        slice step {
            potential = 0
            threshold = 10000
        }
    }

    transition FireActionPotential {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron3, 
            send_to:Neuron4 
        }
        slice step {
            spikes = spikes + 1
            potential = potential + 2000
            send("Neuron1", "ReceiveSynapse")
            send("Neuron3", "ReceiveSynapse")
            send("Neuron4", "ReceiveSynapse")
        }
    }

    transition ReceiveSynapse {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron3, 
            send_to:Neuron4 
        }
        slice step {
            potential = potential + 500
        }
    }
}

domain Neuron3 {
    scope { domain }
    capability { 
        messaging, 
        send_to:Neuron1, 
        send_to:Neuron2, 
        send_to:Neuron4 
    }

    state {
        potential: int
        spikes: int
        threshold: int
    }

    goal ReachedEquilibrium {
        priority 100
        target potential > threshold
        strategy { FireActionPotential }
    }

    transition Boot {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron2, 
            send_to:Neuron4 
        }
        slice step {
            potential = 0
            threshold = 10000
        }
    }

    transition FireActionPotential {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron2, 
            send_to:Neuron4 
        }
        slice step {
            spikes = spikes + 1
            potential = potential + 2000
            send("Neuron1", "ReceiveSynapse")
            send("Neuron2", "ReceiveSynapse")
            send("Neuron4", "ReceiveSynapse")
        }
    }

    transition ReceiveSynapse {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron2, 
            send_to:Neuron4 
        }
        slice step {
            potential = potential + 500
        }
    }
}

domain Neuron4 {
    scope { domain }
    capability { 
        messaging, 
        send_to:Neuron1, 
        send_to:Neuron2, 
        send_to:Neuron3 
    }

    state {
        potential: int
        spikes: int
        threshold: int
    }

    goal ReachedEquilibrium {
        priority 100
        target potential > threshold
        strategy { FireActionPotential }
    }

    transition Boot {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron2, 
            send_to:Neuron3 
        }
        slice step {
            potential = 0
            threshold = 10000
        }
    }

    transition FireActionPotential {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron2, 
            send_to:Neuron3 
        }
        slice step {
            spikes = spikes + 1
            potential = potential + 2000
            send("Neuron1", "ReceiveSynapse")
            send("Neuron2", "ReceiveSynapse")
            send("Neuron3", "ReceiveSynapse")
        }
    }

    transition ReceiveSynapse {
        capability { 
            messaging, 
            send_to:Neuron1, 
            send_to:Neuron2, 
            send_to:Neuron3 
        }
        slice step {
            potential = potential + 500
        }
    }
}
