### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ b0f0ff46-903b-11eb-3a2f-31e7f1f1ab7a
using ImageDraw, ColorTypes, BenchmarkTools,ColorVectorSpace,ImageMorphology

# ╔═╡ 837217b6-903c-11eb-180f-f14a7e934ff7
begin
	using HistogramThresholding
using TestImages # For the moonsurface image.  
using ImageContrastAdjustment # For the build_histogram() function.

img = testimage("moonsurface")
edges, counts = build_histogram(img,256)
t = find_threshold(UnimodalRosin(), counts[1:end], edges)
img_final = zeros(Bool, axes(img))
for i in CartesianIndices(img)
        img_final[i] = img[i] < t ? 0 : 1
end
img_final
end

# ╔═╡ 5bbb0dd4-903e-11eb-0098-9b83c4f34379
using FileIO


# ╔═╡ 5f8fe6da-9040-11eb-086f-53680b92c269
using Noise,ImageShow

# ╔═╡ bb2be408-903b-11eb-3232-99614dda4abc
 begin
vert=CartesianIndex{2}[]
	push!(vert, CartesianIndex(2,2))
	push!(vert, CartesianIndex(3,2))
    push!(vert, CartesianIndex(4,2))
	push!(vert, CartesianIndex(5,2))
    push!(vert, CartesianIndex(6,3))
	push!(vert, CartesianIndex(7,4))
	push!(vert, CartesianIndex(8,4))
	push!(vert, CartesianIndex(9,3))
	push!(vert, CartesianIndex(10,2))
	push!(vert, CartesianIndex(11,3))
	push!(vert, CartesianIndex(12,4))
	push!(vert, CartesianIndex(13,5))
	push!(vert, CartesianIndex(12,6))
	push!(vert, CartesianIndex(11,7))
	push!(vert, CartesianIndex(10,6))#u
	push!(vert, CartesianIndex(9,7))
	push!(vert, CartesianIndex(8,8))
	push!(vert, CartesianIndex(8,9))
	push!(vert, CartesianIndex(8,10))
	push!(vert, CartesianIndex(8,11))
	push!(vert, CartesianIndex(9,11))
	push!(vert, CartesianIndex(10,11))
	push!(vert, CartesianIndex(11,11))
	push!(vert, CartesianIndex(12,11))
	push!(vert, CartesianIndex(13,11))
	push!(vert, CartesianIndex(13,12))
	push!(vert, CartesianIndex(13,13))
	push!(vert, CartesianIndex(12,13))
	push!(vert, CartesianIndex(11,13))
	push!(vert, CartesianIndex(10,13))
	push!(vert, CartesianIndex(9,13))
	push!(vert, CartesianIndex(8,13))
	push!(vert, CartesianIndex(7,13))
	push!(vert, CartesianIndex(6,13))
	push!(vert, CartesianIndex(6,12))
	push!(vert, CartesianIndex(6,11))
	push!(vert, CartesianIndex(5,11))
	push!(vert, CartesianIndex(4,11))
	push!(vert, CartesianIndex(3,11))
	push!(vert, CartesianIndex(2,11))
	push!(vert, CartesianIndex(3,10))
	push!(vert, CartesianIndex(4,9))
	push!(vert, CartesianIndex(5,8))
	push!(vert, CartesianIndex(4,7))
	push!(vert, CartesianIndex(4,6))
	push!(vert, CartesianIndex(5,5))
	push!(vert, CartesianIndex(4,4))
    push!(vert, CartesianIndex(3,3)) 
	push!(vert, CartesianIndex(2,2))
end

# ╔═╡ a6e92884-903b-11eb-3830-0191de19b831
# begin
# img = zeros(Bool,14,14)
# img[1,1] = 1
# img[13,13] =1
# img[1,13] =1
# img[13,1] =1
# end

# ╔═╡ 8554a5be-903d-11eb-069c-11673c9c9356
img

# ╔═╡ e67457e4-903b-11eb-3b1b-89259950a651
convex_hull_test = convexhull(img_final)

# ╔═╡ 926e9572-903d-11eb-2ec2-e15a01a9524a
# begin
# 	img_final1 = zeros(Gray{Bool}, axes(img))
# for i in CartesianIndices(convex_hull_test)
#         img_final1[i] = convex_hull_test[i][1] < 1 ? 0 : 1
# end
# img_final1
# Gray.(img_final1)
# end

# ╔═╡ 47fe6612-903e-11eb-280d-7f745e6c0612
begin
img_coins = load("../1.jpg")
end

# ╔═╡ a60870b6-903e-11eb-263c-05a406696259
begin
edges1, counts1 = build_histogram(Gray.(img_coins),256)
t1 = find_threshold(UnimodalRosin(), counts1[1:end], edges1)
img_final_coins = zeros(Bool, axes(Gray.(img_coins)))
for i in CartesianIndices(img_coins)
        img_final_coins[i] = Gray.(img_coins[i]) < t1 ? 0 : 1
end
img_final_coins
end

# ╔═╡ 9cd44928-9040-11eb-1f50-8fdfbdb00ab8
Gray.(img_final_coins)

# ╔═╡ 6b951ff6-9040-11eb-287e-6dec9dc1d7fa
img_final_coins1 = salt_pepper(img_final_coins, 0.5)

# ╔═╡ d903f85e-903f-11eb-36ef-d5435d6ed4c6
Gray.(img_final_coins1)

# ╔═╡ 865d4368-903e-11eb-36fc-3745cdadf810
begin
fill_image=imfill(img_final_coins, (1,2))
Gray.(fill_image)
end

# ╔═╡ 24ebf4fa-9041-11eb-245a-31e91bd0f2ee
img_thinning=thinning(img_final_coins,algo=GuoAlgo())

# ╔═╡ 34e54dc0-9041-11eb-325e-43f60e27a486
Gray.(img_thinning)

# ╔═╡ 7236322a-9041-11eb-13f2-1153e9fe7571
Gray.([img_final_coins img_thinning])

# ╔═╡ 007b900c-9042-11eb-27da-611a1b40a7a8
cleared_img = clearborder(img_final_coins, 20)

# ╔═╡ 0b500786-9042-11eb-2b74-79c766338419
Gray.([img_final_coins cleared_img])

# ╔═╡ Cell order:
# ╠═b0f0ff46-903b-11eb-3a2f-31e7f1f1ab7a
# ╠═bb2be408-903b-11eb-3232-99614dda4abc
# ╠═a6e92884-903b-11eb-3830-0191de19b831
# ╠═8554a5be-903d-11eb-069c-11673c9c9356
# ╠═837217b6-903c-11eb-180f-f14a7e934ff7
# ╠═e67457e4-903b-11eb-3b1b-89259950a651
# ╠═926e9572-903d-11eb-2ec2-e15a01a9524a
# ╠═5bbb0dd4-903e-11eb-0098-9b83c4f34379
# ╠═5f8fe6da-9040-11eb-086f-53680b92c269
# ╠═47fe6612-903e-11eb-280d-7f745e6c0612
# ╠═a60870b6-903e-11eb-263c-05a406696259
# ╠═9cd44928-9040-11eb-1f50-8fdfbdb00ab8
# ╠═6b951ff6-9040-11eb-287e-6dec9dc1d7fa
# ╠═d903f85e-903f-11eb-36ef-d5435d6ed4c6
# ╠═865d4368-903e-11eb-36fc-3745cdadf810
# ╠═24ebf4fa-9041-11eb-245a-31e91bd0f2ee
# ╠═34e54dc0-9041-11eb-325e-43f60e27a486
# ╠═7236322a-9041-11eb-13f2-1153e9fe7571
# ╠═007b900c-9042-11eb-27da-611a1b40a7a8
# ╠═0b500786-9042-11eb-2b74-79c766338419
