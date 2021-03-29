### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ c9cd29ea-906d-11eb-390f-87f6b15c1e04
begin
using Images, TestImages
using ImageQualityIndexes

img = testimage("cameraman") .|> float64
noisy_img = img .+ 0.1 .* randn(size(img))
assess_ssim(noisy_img, img) # 0.24112
assess_psnr(noisy_img, img) # 19.9697

kernel = ones(3, 3)./9 # mean filter
denoised_img = imfilter(noisy_img, kernel)
assess_psnr(denoised_img, img) # 28.4249
assess_ssim(denoised_img, img) # 0.6390
assess_msssim(denoised_img, img) # 0.8460

img = testimage("fabio");
colorfulness(img) # 68.5530
end

# ╔═╡ 803452c2-9063-11eb-1aa6-43489226ffa0
begin
# using ImageFeatures, TestImages, Images, ImageDraw, CoordinateTransformations,Rotations
#BRIEF
# img = testimage("lena_gray_512");
# img1 = Gray.(img);
# trans = Translation(-100, -200)
# 	img2 = warp(img1, trans, axes(img1));
# 	keypoints_1 = Keypoints(fastcorners(img1, 12, 0.4))
# 	keypoints_2 = Keypoints(fastcorners(img2, 12, 0.4))
# 	brief_params = BRIEF(size = 256, window = 10, seed = 123)

# desc_1, ret_keypoints_1 = create_descriptor(img1, keypoints_1, brief_params);
# desc_2, ret_keypoints_2 = create_descriptor(img2, keypoints_2, brief_params);

# matches = match_keypoints(ret_keypoints_1, ret_keypoints_2, desc_1, desc_2, 0.1)

# grid = hcat(img1, img2)
# offset = CartesianIndex(0, size(img1, 2))
# data=map(m -> draw!(grid, LineSegment(m[1], m[2] + offset)), matches)
end

# ╔═╡ 5268c78c-9064-11eb-12d5-6d8c1b779872
# #ORB
# begin
# img = testimage("lighthouse")
# img1 = Gray.(img)
# rot = recenter(RotMatrix(5pi/6), [size(img1)...] .÷ 2)  # a rotation around the center
# tform = rot ∘ Translation(-50, -40)
# img2 = warp(img1, tform, axes(img1))
# orb_params = ORB(num_keypoints = 1000)
# desc_1, ret_keypoints_1 = create_descriptor(img1, orb_params)
# desc_2, ret_keypoints_2 = create_descriptor(img2, orb_params)
# matches = match_keypoints(ret_keypoints_1, ret_keypoints_2, desc_1, desc_2, 0.2)
# nothing # hide
# grid = hcat(img1, img2)
# offset = CartesianIndex(0, size(img1, 2))
# map(m -> draw!(grid, LineSegment(m[1], m[2] + offset)), matches)
# end

# ╔═╡ 05b8e934-9065-11eb-02c4-652584ee0c8c
# begin
# #BRISK
# img = testimage("lighthouse")
# img1 = Gray.(img)
# rot = recenter(RotMatrix(5pi/6), [size(img1)...] .÷ 2)  # a rotation around the center
# tform = rot ∘ Translation(-50, -40)
# img2 = warp(img1, tform, axes(img1))

# features_1 = Features(fastcorners(img1, 12, 0.35))
# features_2 = Features(fastcorners(img2, 12, 0.35))

# brisk_params = BRISK()

# desc_1, ret_features_1 = create_descriptor(img1, features_1, brisk_params)
# desc_2, ret_features_2 = create_descriptor(img2, features_2, brisk_params)

# matches = match_keypoints(Keypoints(ret_features_1), Keypoints(ret_features_2), desc_1, desc_2, 0.1)

# grid = hcat(img1, img2)
# offset = CartesianIndex(0, size(img1, 2))
# map(m -> draw!(grid, LineSegment(m[1], m[2] + offset)), matches)
# end

# ╔═╡ b7c4ec72-9065-11eb-3f25-b5008729692a
# begin
# 	#freak
# img = testimage("lighthouse")
# img1 = Gray.(img)
# rot = recenter(RotMatrix(5pi/6), [size(img1)...] .÷ 2)  # a rotation around the center
# tform = rot ∘ Translation(-50, -40)
# img2 = warp(img1, tform, axes(img1))


# keypoints_1 = Keypoints(fastcorners(img1, 12, 0.35))
# keypoints_2 = Keypoints(fastcorners(img2, 12, 0.35))

# freak_params = FREAK()

# desc_1, ret_keypoints_1 = create_descriptor(img1, keypoints_1, freak_params)
# desc_2, ret_keypoints_2 = create_descriptor(img2, keypoints_2, freak_params)

# matches = match_keypoints(ret_keypoints_1, ret_keypoints_2, desc_1, desc_2, 0.1)

# grid = hcat(img1, img2)
# offset = CartesianIndex(0, size(img1, 2))
# map(m -> draw!(grid, LineSegment(m[1], m[2] + offset)), matches)
# end

# ╔═╡ 99a6d316-9067-11eb-3b83-4f467da9f6c9
# begin
# #GLCM
# img = testimage("lighthouse")
# img = Gray.(img)
# glcm1 = glcm(img, 5, pi)
# end

# ╔═╡ 9532fc2e-9067-11eb-2f3f-9bb43fd1d6bb
# Gray.(glcm1/255)

# ╔═╡ 3b2289d8-9068-11eb-17ce-7f5b27f7bb99
# prop = glcm_prop(glcm1, 500, 500, glcm_entropy(zeros(5,5)))

# ╔═╡ Cell order:
# ╠═803452c2-9063-11eb-1aa6-43489226ffa0
# ╠═5268c78c-9064-11eb-12d5-6d8c1b779872
# ╠═05b8e934-9065-11eb-02c4-652584ee0c8c
# ╠═b7c4ec72-9065-11eb-3f25-b5008729692a
# ╠═99a6d316-9067-11eb-3b83-4f467da9f6c9
# ╠═9532fc2e-9067-11eb-2f3f-9bb43fd1d6bb
# ╠═3b2289d8-9068-11eb-17ce-7f5b27f7bb99
# ╠═c9cd29ea-906d-11eb-390f-87f6b15c1e04
