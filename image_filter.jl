### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ e44af6da-9045-11eb-15ab-ad339f35ca21
using ImageFiltering,FileIO,ImageShow,TestImages,Images

# ╔═╡ 002e63da-9046-11eb-20b5-4f1bf8ff7260
img = load("../hello-world.png");

# ╔═╡ 03a23ec6-9046-11eb-035c-ffb12919833f
imgg = imfilter(img, Kernel.gaussian(3));

# ╔═╡ 09e7aea6-9046-11eb-3d06-c3980898c7bb
imgl = imfilter(img, Kernel.Laplacian());

# ╔═╡ 3ffbb60e-9048-11eb-1b5e-57ef5a52c22d
# imgs = imfilter(img, Kernel.sobel())

# ╔═╡ 54499d7c-9048-11eb-0b1b-13f6373e402c
img_coins = load("../1.jpg")

# ╔═╡ 9d38abe4-905d-11eb-1ba2-958ed4d9e9af
img_gray = Gray.(img_coins)

# ╔═╡ da50f694-905d-11eb-29dd-d160c78bc260
kernel = [1 0 -1; 2 0 -2;1 0 -1];

# ╔═╡ e082aeb8-905d-11eb-047c-5bb3725816ab
sobel_x = imfilter(img_gray, kernel);

# ╔═╡ e42883f6-905d-11eb-07bf-a9f6acecf1a1
grad = imfilter(sobel_x, kernel')

# ╔═╡ acceb0e8-905e-11eb-027a-a1c08f28641c


# ╔═╡ 02069d1a-905e-11eb-3471-9f3545ac23f4
grad .^ 4

# ╔═╡ 10460d34-905e-11eb-15ab-57d2dd4b66ef
begin
	kernel_1 = [1 2 1]';
kernel_2 = [1 0 -1];
grad_sep = imfilter(img_gray, (kernel_1, kernel_2, kernel_2', kernel_1'))
end

# ╔═╡ Cell order:
# ╠═e44af6da-9045-11eb-15ab-ad339f35ca21
# ╠═002e63da-9046-11eb-20b5-4f1bf8ff7260
# ╠═03a23ec6-9046-11eb-035c-ffb12919833f
# ╠═09e7aea6-9046-11eb-3d06-c3980898c7bb
# ╠═3ffbb60e-9048-11eb-1b5e-57ef5a52c22d
# ╠═54499d7c-9048-11eb-0b1b-13f6373e402c
# ╠═9d38abe4-905d-11eb-1ba2-958ed4d9e9af
# ╠═da50f694-905d-11eb-29dd-d160c78bc260
# ╠═e082aeb8-905d-11eb-047c-5bb3725816ab
# ╠═e42883f6-905d-11eb-07bf-a9f6acecf1a1
# ╠═acceb0e8-905e-11eb-027a-a1c08f28641c
# ╠═02069d1a-905e-11eb-3471-9f3545ac23f4
# ╠═10460d34-905e-11eb-15ab-57d2dd4b66ef
