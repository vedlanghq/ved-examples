environment LocalNode {
    host = "localhost"
}

domain Producer {
    state {
        status: string
    }

    goal Initialize {
        target status = "active"
    }

    transition Boot {
        slice step {
            status = "booting"
        }
    }
}

system Main {
    start domain Producer {
        status = "offline"
    }
}

deploy service Producer to LocalNode
