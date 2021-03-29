### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ e913d16a-8ddd-11eb-094f-3705b4bd1222
begin
using ColorTypes, FileIO, ImageDraw, BenchmarkTools
img = load("test2.png")
fill_color = RGB(0);

function floodfillcolor(img, x, y, current_color, fill_color)
    if (img[y, x] != current_color || img[y, x] == fill_color) return end
    if checkbounds(Bool, img, y, x) img[y, x] = fill_color end
    floodfillcolor(img , x + 1, y, current_color, fill_color)
    floodfillcolor(img , x - 1, y, current_color, fill_color)
    floodfillcolor( img, x, y + 1, current_color, fill_color)
    floodfillcolor( img, x, y - 1, current_color, fill_color)
end
function floodfill(img, x, y, fill_color)
    current_color = img[y,x]
    floodfillcolor(img, x, y, current_color, fill_color)
	img
end
img_new = floodfill(img, 10,100, fill_color); # rectangle boundary
img_case2 = floodfill(img, 51,200, fill_color); # circle boundary
img_case3 = floodfill(img, 350,200, fill_color); # circle fill
img_case4 = floodfill(img, 550,200, fill_color) ;# square fill
end

# ╔═╡ fc39f9d6-8de5-11eb-01f5-ad97913d8b7e


# ╔═╡ Cell order:
# ╠═e913d16a-8ddd-11eb-094f-3705b4bd1222
# ╠═fc39f9d6-8de5-11eb-01f5-ad97913d8b7e
