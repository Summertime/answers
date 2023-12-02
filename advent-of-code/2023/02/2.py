#!/usr/bin/env python
import fileinput
data = {}
for line in fileinput.input():
    line = line.strip()
    game, trials = line.split(': ')
    game = int(game.split(' ')[-1])
    trials = trials.split('; ')
    trials_ = []
    for trial in trials:
        trial = trial.split(', ')
        o = {}
        for grab in trial:
            grab = grab.split(' ')
            o[grab[1]] = int(grab[0])
        trials_.append(o)
    data[game] = trials_

result = 0
for game,trials in data.items():
    result += (
        max(trial.get('blue',0) for trial in trials) *
        max(trial.get('red',0) for trial in trials) *
        max(trial.get('green',0) for trial in trials)
    )
    
print(result)
