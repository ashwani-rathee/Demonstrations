### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 102adb52-8b83-11eb-1876-a52236a70e1f
using Images,MosaicViews

# ╔═╡ 4f027e0c-8b88-11eb-2f3f-237e69a18582
begin
	using TestImages, ImageContrastAdjustment, HistogramThresholding

img = testimage("cameraman")
end

# ╔═╡ 5bd1efe0-8bf2-11eb-3f4c-6d5a43febc6d
begin
edges, counts = build_histogram(img,256)
t = find_threshold(Otsu(), counts[1:end], edges)
# Apply the threshold to img and visualize the result.
img_final = zeros(Gray{Bool}, axes(img))
for i in CartesianIndices(img)
        img_final[i] = img[i] < t ? 0 : 1
end
img_final
end

# ╔═╡ Cell order:
# ╠═102adb52-8b83-11eb-1876-a52236a70e1f
# ╠═4f027e0c-8b88-11eb-2f3f-237e69a18582
# ╠═5bd1efe0-8bf2-11eb-3f4c-6d5a43febc6d
