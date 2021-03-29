### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 17deace8-9071-11eb-3ff4-e70cf05a1bcb
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

# ╔═╡ Cell order:
# ╠═17deace8-9071-11eb-3ff4-e70cf05a1bcb
