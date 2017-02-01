#!/usr/bin/env python3.6
import time
import numpy as np
import pygal
from os import path

list_sizes = [2**x for x in range(1, 11)]
seconds = 60


def test(size_array):
    pyarray = [float(x) for x in range(size_array)]

    # fromiter
    start = time.time()
    iterations = 0
    while time.time() - start <= seconds:
        np.fromiter(pyarray, dtype=np.float32, count=size_array)
        iterations += 1
    fromiter_count = iterations

    # array
    start = time.time()
    iterations = 0
    while time.time() - start <= seconds:
        np.array(pyarray, dtype=np.float32)
        iterations += 1
    array_count = iterations

    return array_count, fromiter_count


results = {}

for size_array in list_sizes:
    res = test(size_array)
    results[str(size_array)] = res
    print(f"Result for size {size_array} in {seconds} seconds: {res}")

out_folder = path.dirname(path.realpath(__file__))
print(f"Create diagrams in {out_folder}")

chart = pygal.Line()
chart.title = f"Performance in {seconds} seconds"
chart.x_title = "Array size"
chart.y_title = "Iterations"
chart.x_labels = list(results.keys())
chart.add('np.array', [x[0] for x in results.values()])
chart.add('np.fromiter', [x[1] for x in results.values()])
chart.render_to_png(path.join(out_folder, f'result_{seconds}.png'))
