### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ f8eb6a38-8b98-11eb-1b3f-73fb0325650f
using Images, ImageView, ImageMorphology, TestImages,MosaicViews


# ╔═╡ 36955aa4-8b99-11eb-073c-1d9d54369888
	img = load("hello-world.png")


# ╔═╡ 954f2008-8b98-11eb-25d0-25bf34030eef
begin

img_erode = Gray.(Gray.(img) .< 0.8); # keeps white objects white
img_erosion1 = erode(img_erode)
img_erosion2 = erode(erode(img_erode))
img_erosion3 = erode(erode(erode(img_erode)))
mosaicview(img_erode, img_erosion1, img_erosion2, img_erosion3; nrow=1)

end

# ╔═╡ abc35624-8b98-11eb-29ce-b33cad8c7338
begin
img_dilate = Gray.(1 * Gray.(img) .> 0.9);
img_dilate1 = dilate(img_dilate)
img_dilate2 = dilate(dilate(img_dilate))
img_dilate3 = dilate(dilate(dilate(img_dilate)))
mosaicview(img_dilate, img_dilate1, img_dilate2, img_dilate3; nrow=1)
end

# ╔═╡ af9519e0-8b98-11eb-1a78-d1757da9252f
begin
img_opening = Gray.(1 * Gray.(img) .> 0.5);
img_opening1 = opening(img_opening)
img_opening2 = opening(opening(img_opening))
img_opening3 = opening(opening(opening(img_opening)))
mosaicview(img_opening, img_opening1, img_opening2, img_opening3; nrow=1)
end

# ╔═╡ b3218a1c-8b98-11eb-0e4c-a58efefb1950
begin
img_closing = Gray.(1 * Gray.(img) .> 0.5);
img_closing1 = closing(img_closing)
img_closing2 = closing(closing(img_closing))
img_closing3 = closing(closing(closing(img_closing)))
mosaicview(img_closing1, img_closing1, img_closing2, img_closing3; nrow=1)
end


# ╔═╡ b69f2e06-8b98-11eb-1776-ebd6d564b297
begin
img_tophat = Gray.(1 * Gray.(img) .> 0.2);
img_tophat1 = tophat(img_tophat)
img_tophat2 = tophat(tophat(img_tophat))
# img_tophat3 = tophat(tophat(tophat(img_tophat)))
mosaicview(img_tophat, img_tophat1, img_tophat2; nrow=1)
end


# ╔═╡ b9c3cf40-8b98-11eb-1896-5bef68754153
begin
img_bothat = Gray.(1 * Gray.(img) .> 0.5);
img_bothat1 = bothat(img_tophat)
img_bothat2 = bothat(bothat(img_tophat))
img_bothat3 = bothat(bothat(bothat(img_tophat)))
mosaicview(img_bothat, img_bothat1, img_bothat2; nrow=1)
end

# ╔═╡ bea4a6ee-8b98-11eb-1a7e-17cb2dd9aa9d
begin	
img_gray = Gray.(0.8 * Gray.(img) .> 0.7);
img_morphograd = morphogradient(Gray.(0.8 * Gray.(img) .> 0.4))
img_morpholap = morpholaplace(img_gray)
mosaicview(img_gray, img_morphograd, img_morpholap; nrow=1)
end

# ╔═╡ Cell order:
# ╠═f8eb6a38-8b98-11eb-1b3f-73fb0325650f
# ╠═36955aa4-8b99-11eb-073c-1d9d54369888
# ╠═954f2008-8b98-11eb-25d0-25bf34030eef
# ╠═abc35624-8b98-11eb-29ce-b33cad8c7338
# ╠═af9519e0-8b98-11eb-1a78-d1757da9252f
# ╠═b3218a1c-8b98-11eb-0e4c-a58efefb1950
# ╠═b69f2e06-8b98-11eb-1776-ebd6d564b297
# ╠═b9c3cf40-8b98-11eb-1896-5bef68754153
# ╠═bea4a6ee-8b98-11eb-1a7e-17cb2dd9aa9d
