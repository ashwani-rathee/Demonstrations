### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 1da5ad0e-828f-11eb-3a21-1734f2d7bb36
using TestImages,FileIO,Images,ImageView,MosaicViews

# ╔═╡ b0079f7e-82c4-11eb-0540-ed1b691768e5
using Plots,ImageContrastAdjustment

# ╔═╡ fed405b6-828d-11eb-2d86-977a78c747ee
md"""
# Basic Image Import,Show,Processing and Export
This example shows how to read an image into the workspace, adjust the contrast in the image, and then write the adjusted image to a file
"""

# ╔═╡ c5e83452-8283-11eb-21e5-4d3d301bf70a
begin
	# Read Image
img1 = testimage("chelsea.jpg"); #one way
img2 = load("assets/reference.jpg"); #second way
end

# ╔═╡ d80d7608-8290-11eb-0dcf-53ee481f7193
begin
	imshow(img1); #imported through ImageView.jl
	mosaicview(img1,img2;nrow=1) #imported through MosaiViews.jl
end

# ╔═╡ d3334628-82be-11eb-37b4-a730795b4a8c
begin
 # Apparently no proper documentation on how to find details on a image
	x=typeof(img1);
	y=size(img1);
	z= sizeof(img1);
end

# ╔═╡ 4556d368-82c2-11eb-271e-916cba11f094
x

# ╔═╡ 4b7c750e-82c2-11eb-3846-ff49451b80f5
y

# ╔═╡ 4e4014e4-82c2-11eb-3fc1-971c351e14bb
z

# ╔═╡ 708364d8-82c3-11eb-29ab-619106b39d5a
val=build_histogram(img1)

# ╔═╡ fbed91ae-82c5-11eb-089d-eb27ae7a0a8c
histogram(val[2][0:255])

# ╔═╡ a885205e-82c5-11eb-2a12-17cf529de2eb
img_equalized = adjust_histogram(img1, Equalization(nbins = 256))

# ╔═╡ 2c4f2c18-82c6-11eb-272b-d5c0169ed2c8
begin
	#method to save a image with a particular directory in a specific format froma a loaded image
	save("assets/cat.png",img1)
	save("assets/img_equalised.png",img_equalized)
end

# ╔═╡ Cell order:
# ╠═fed405b6-828d-11eb-2d86-977a78c747ee
# ╠═1da5ad0e-828f-11eb-3a21-1734f2d7bb36
# ╠═c5e83452-8283-11eb-21e5-4d3d301bf70a
# ╠═d80d7608-8290-11eb-0dcf-53ee481f7193
# ╠═d3334628-82be-11eb-37b4-a730795b4a8c
# ╠═4556d368-82c2-11eb-271e-916cba11f094
# ╠═4b7c750e-82c2-11eb-3846-ff49451b80f5
# ╠═4e4014e4-82c2-11eb-3fc1-971c351e14bb
# ╠═b0079f7e-82c4-11eb-0540-ed1b691768e5
# ╠═708364d8-82c3-11eb-29ab-619106b39d5a
# ╠═fbed91ae-82c5-11eb-089d-eb27ae7a0a8c
# ╠═a885205e-82c5-11eb-2a12-17cf529de2eb
# ╠═2c4f2c18-82c6-11eb-272b-d5c0169ed2c8
