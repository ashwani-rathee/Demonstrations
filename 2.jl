### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 09988650-82cc-11eb-33d6-f581c3a7f16d
using FileIO,Images,ImageCore,ImageFeatures,ImageView,ImageDraw,ColorVectorSpace

# ╔═╡ b0079f7e-82c4-11eb-0540-ed1b691768e5
using Plots,ImageContrastAdjustment

# ╔═╡ 15ebf86a-82d9-11eb-1370-8b2a9a4dbb08
using Colors

# ╔═╡ fed405b6-828d-11eb-2d86-977a78c747ee
md"""
# Detect and Measure Circular Objects in a image
"""

# ╔═╡ c5e83452-8283-11eb-21e5-4d3d301bf70a
begin
img = load("assets/roundchips.png"); #second way

#mosaicview(img;nrow=1) ; end
end

# ╔═╡ 8a1957a4-82cd-11eb-112b-5d4875423627
img_gray=Gray.(img)

# ╔═╡ 8f5ea0e8-82d2-11eb-34b0-9b2816d00c0e
img_edges = canny(img_gray, (Percentile(95),Percentile(85)),15);

# ╔═╡ 9bd89c70-82d2-11eb-3d98-0d6579f2e0a0
dx, dy=imgradients(img, KernelFactors.ando5);

# ╔═╡ a2dfe866-82d2-11eb-229f-1b4ede7e026e
img_phase = phase(dx, dy);

# ╔═╡ a6965ab0-82d2-11eb-0e08-9f328cd01b11
centers, radii = hough_circle_gradient(img_edges, img_phase, 20:30);

# ╔═╡ acaa46c0-82d2-11eb-127e-83565c9705e3
img_demo = Float64.(img_edges); for c in centers img_demo[c] = 2; end

# ╔═╡ 07d03f68-82d4-11eb-3c77-fd52f234cacb
img_demo

# ╔═╡ 1ab4e7e6-82d9-11eb-0bf6-ef28ff652424
Gray.(img_demo)

# ╔═╡ e8252d72-82d8-11eb-0e0c-ef29d4feeb44
radii

# ╔═╡ ee865394-82d8-11eb-00f7-d5b033515a48
centers

# ╔═╡ ed202162-82f4-11eb-15ec-93ed76002a51
length(radii)

# ╔═╡ dc03bb2e-82f3-11eb-2a4b-6364691df800
begin
img_gray;
for i in 1:length(radii)
    img_gray= draw!(img_gray, Ellipse(CirclePointRadius(centers[i],radii[i])))
end
img_gray
end

# ╔═╡ 2c4f2c18-82c6-11eb-272b-d5c0169ed2c8
begin
	#method to save a image with a particular directory in a specific format froma a loaded image
	save("assets/resuult-roundchips.png",img_edges)
end

# ╔═╡ Cell order:
# ╠═fed405b6-828d-11eb-2d86-977a78c747ee
# ╠═09988650-82cc-11eb-33d6-f581c3a7f16d
# ╠═b0079f7e-82c4-11eb-0540-ed1b691768e5
# ╠═c5e83452-8283-11eb-21e5-4d3d301bf70a
# ╠═8a1957a4-82cd-11eb-112b-5d4875423627
# ╠═8f5ea0e8-82d2-11eb-34b0-9b2816d00c0e
# ╠═9bd89c70-82d2-11eb-3d98-0d6579f2e0a0
# ╠═a2dfe866-82d2-11eb-229f-1b4ede7e026e
# ╠═a6965ab0-82d2-11eb-0e08-9f328cd01b11
# ╠═acaa46c0-82d2-11eb-127e-83565c9705e3
# ╠═07d03f68-82d4-11eb-3c77-fd52f234cacb
# ╠═15ebf86a-82d9-11eb-1370-8b2a9a4dbb08
# ╠═1ab4e7e6-82d9-11eb-0bf6-ef28ff652424
# ╠═e8252d72-82d8-11eb-0e0c-ef29d4feeb44
# ╠═ee865394-82d8-11eb-00f7-d5b033515a48
# ╠═ed202162-82f4-11eb-15ec-93ed76002a51
# ╠═dc03bb2e-82f3-11eb-2a4b-6364691df800
# ╠═2c4f2c18-82c6-11eb-272b-d5c0169ed2c8
