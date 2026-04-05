# Colin PDDL Planning Test

## Test Files Created

### Domain File: examples/pddl/test-domain.pddl
A classic Blocks World planning domain with 4 objects and actions to manipulate them.

**Objects**: 3 blocks (a, b, c)
**Predicates**:
- `on(x, y)` - block x is on block y
- `ontable(x)` - block x is on the table  
- `clear(x)` - block x has no other blocks on top
- `holding(x)` - robot is holding block x
- `handempty` - robot's hand is empty

**Actions**:
- `pick-up` - pick up a block from the table
- `put-down` - put down a block from the hand
- `stack` - stack one block on another
- `unstack` - remove a block from another block

### Problem File: examples/pddl/test-problem.pddl
A planning problem instance in the Blocks World domain.

**Initial State**:
- All 3 blocks on the table
- All blocks are clear
- Robot hand is empty

**Goal**:
- Block a on block b
- Block b on block c
- Block c on the table
- This forms a tower: a-b-c

## Test Commands

### Validate PDDL files with the VAL parser:
```bash
./build-modernized/VALfiles/parser examples/pddl/test-domain.pddl examples/pddl/test-problem.pddl
```

Expected output (truncated — the parser prints a full AST dump):
```
File: examples/pddl/test-domain.pddl

(domain)
name: blocks
req: 6
:strips :typing
...
Errors: 0, warnings: 0
```

The last line `Errors: 0, warnings: 0` confirms both files are syntactically valid.

### Solve with colin-planner:
```bash
./build-modernized/colin/colin-planner examples/pddl/test-domain.pddl examples/pddl/test-problem.pddl
```

Expected output:
```
Number of literals: 16
Constructing lookup tables: [10%] [20%] ... [180%]
Post filtering unreachable actions:  [10%] [20%] ... [180%]
No semaphore facts found, returning
No analytic limits found, not considering limit effects of goal-only operators
Not looking for earlier-is-better time-dependent rewards: no goal limits
Initial heuristic = 4.000
b (2.000 | 0.001)b (1.000 | 0.002);;;; Solution Found
; States evaluated: 6
; Cost: 0.003
; Time 0.01
0.000: (pick-up b)  [0.001]
0.001: (stack b c)  [0.001]
0.002: (pick-up a)  [0.001]
0.003: (stack a b)  [0.001]
```

The plan builds the tower a→b→c in 4 actions with a total cost of 0.003.

## Validation Results

✓ **PDDL Syntax Validation**: Both files parsed successfully — `Errors: 0, warnings: 0`
✓ **Domain Structure**: All predicates and actions correctly recognized
✓ **Problem Structure**: Initial state and goal conditions properly parsed
✓ **Plan Found**: Colin-planner finds the 4-step optimal plan

## Build Artifacts

- VAL parser: `build-modernized/VALfiles/parser`
- Colin planner: `build-modernized/colin/colin-planner`
- Colin static library: `build-modernized/colin/libcolin.a`
- Inst library: `build-modernized/VALfiles/libInst.a`
