import numpy as np
import pandas as pd

def get_data():
    """Python function to prepare data."""

    return pd.DataFrame(
        data={
            "int_vals": [1, np.nan, 3],
            "float_vals": [2.6, 6.3, np.nan],
            "str_vals": ["val1", "val2", "val3"],
        },
        index = ["idx1", "idx2", "idx3"]
    )
