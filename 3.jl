### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 09988650-82cc-11eb-33d6-f581c3a7f16d
using FileIO,Images,ImageCore,ImageFeatures,ImageView,ImageDraw,ColorVectorSpace,ImageMorphology,ImageBinarization

# ╔═╡ fed405b6-828d-11eb-2d86-977a78c747ee
md"""
# Correct Nonuniform Illumination and Analyze Foreground Objects
"""

# ╔═╡ c5e83452-8283-11eb-21e5-4d3d301bf70a
begin
img = load("assets/rice.png"); #second way
img_gray = Gray.(img)
end

# ╔═╡ b6c1ef02-8302-11eb-05df-3d28ed8ddf5d
opening(img_gray)

# ╔═╡ baaa035e-8302-11eb-1db8-1be228d4ddfa


# ╔═╡ ba8e5dd4-8302-11eb-073e-f38cb0d923d8


# ╔═╡ ba399810-8302-11eb-3971-23a86794a1f9


# ╔═╡ Cell order:
# ╠═fed405b6-828d-11eb-2d86-977a78c747ee
# ╠═09988650-82cc-11eb-33d6-f581c3a7f16d
# ╠═c5e83452-8283-11eb-21e5-4d3d301bf70a
# ╠═b6c1ef02-8302-11eb-05df-3d28ed8ddf5d
# ╠═baaa035e-8302-11eb-1db8-1be228d4ddfa
# ╠═ba8e5dd4-8302-11eb-073e-f38cb0d923d8
# ╠═ba399810-8302-11eb-3971-23a86794a1f9
