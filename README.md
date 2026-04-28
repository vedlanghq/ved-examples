# Lexum Examples

This repository contains small illustrative programs demonstrating how Lexum models deterministic orchestration behaviour for long-running systems.

Lexum programs describe:

- persistent system state
- desired convergence goals
- bounded deterministic transitions
- explicit external effects

These examples are conceptual and may evolve alongside the runtime.

## Running Examples

Example execution workflow:

```bash
Lexum compile main.Lexum
Lexum run bundle.vedx
```
