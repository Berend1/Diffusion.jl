using Plots
using CSV
using DataFrames
using CSV, DataFrames, Plots

# Set default font settings (similar to matplotlib.rc in Python)
#default(fontfamily="Helvetica", fontsize=18)

# Expected grid size
nx = 2048
ny = 2048
fname = "output2048.dat"

# Read the tab-delimited file without headers.
# In Python, you extracted the first row; here we assume the file has one row with (nx+2)*(ny+2) entries.
data_matrix = CSV.File(fname; delim='\t', header=false) |> Tables.matrix

# Extract the first (and only) row as a 1D array
data_array = data_matrix[1, :]

# Reshape the 1D array into a (nx+2) x (ny+2) matrix.
reshaped_data = reshape(data_array, (nx+2, ny+2))

# Create a heatmap with no interpolation, scaling the color limits from -10 to 10.
custom_map = cgrad([:black, :blue, :yellow, :red], rev=false) #Dark red at max
p = heatmap(reshaped_data,
            interpolation = :none,
            clims = (-10, 10),
            color = custom_map, 
            aspect_ratio = :equal,
            title = "Heatmap")

# Save the plot to a file
savefig(p, "output.png")

# Display the plot
display(p)
