clear

python:

# Import Stata 16 Python API library
import sfi

# Import Python data function
from python_preparation import get_data

# Get data
df = get_data()

# Store variables to Stata instance.
# At least following Python types can be converted: strings, floats, ints.
str_vals = []
float_vals = []
int_vals = []
for idx, val in df.dtypes.iteritems():

    if val in ["object"]:
        str_vals.append(idx)

    if val in ["float64"]:
        float_vals.append(idx)

    if val in ["int64"]:
        int_vals.append(idx)

sfi.Data.setObsTotal(len(df))

for el in str_vals:
    # At maximum 128 characters allowed now
    sfi.Data.addVarStr(el, 128)

for el in float_vals:
    sfi.Data.addVarDouble(el)

for el in int_vals:
    sfi.Data.addVarInt(el)

for el in str_vals:
    # Strings many not contain missing values, convert them to "NA"
    df[el] = df[el].fillna("NA")
    sfi.Data.store(el, None, df[el], None)

for el in float_vals + int_vals:
    sfi.Data.store(el, None, df[el], None)

end
