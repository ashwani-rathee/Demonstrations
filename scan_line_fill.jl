### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 62405c38-8dfb-11eb-0dfe-b7545eb40047
using ImageDraw, ColorTypes, BenchmarkTools,ColorVectorSpace

# ╔═╡ 0a8bbcd6-8df2-11eb-1010-9fa5c200e91b
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
	push!(vert, CartesianIndex(6,11))#u
	push!(vert, CartesianIndex(5,11))
	push!(vert, CartesianIndex(4,11))
	push!(vert, CartesianIndex(3,11))
	push!(vert, CartesianIndex(2,11))#u
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

# ╔═╡ 76b68af4-8dfb-11eb-11df-3f5ecff30aef
img = draw(zeros(Gray{Bool},14,14), Polygon(vert));

# ╔═╡ c037b994-8e39-11eb-308c-db84d51ff35c
struct edgetabletuple
	initial::CartesianIndex
	final::CartesianIndex
end

# ╔═╡ e728998c-8e03-11eb-383c-63adbbb0a9a7
begin
function createedgetable()
edgetable= []
push!(edgetable, edgetabletuple(CartesianIndex(2,2),CartesianIndex(5,2)))
push!(edgetable, edgetabletuple(CartesianIndex(5,2),CartesianIndex(7,4)))		
push!(edgetable, edgetabletuple(CartesianIndex(7,4),CartesianIndex(8,4)))
push!(edgetable, edgetabletuple(CartesianIndex(8,4),CartesianIndex(10,2)))
push!(edgetable, edgetabletuple(CartesianIndex(10,2),CartesianIndex(13,5)))
push!(edgetable, edgetabletuple(CartesianIndex(13,5),CartesianIndex(11,7)))
push!(edgetable, edgetabletuple(CartesianIndex(11,7),CartesianIndex(10,6)))
push!(edgetable, edgetabletuple(CartesianIndex(10,6),CartesianIndex(8,8)))
push!(edgetable, edgetabletuple(CartesianIndex(8,8),CartesianIndex(8,11)))
push!(edgetable, edgetabletuple(CartesianIndex(8,11),CartesianIndex(13,11)))
push!(edgetable, edgetabletuple(CartesianIndex(13,11),CartesianIndex(13,13)))
push!(edgetable, edgetabletuple(CartesianIndex(13,13),CartesianIndex(6,13)))
push!(edgetable, edgetabletuple(CartesianIndex(6,13),CartesianIndex(6,11)))
push!(edgetable, edgetabletuple(CartesianIndex(6,11),CartesianIndex(2,11)))
push!(edgetable, edgetabletuple(CartesianIndex(2,11),CartesianIndex(5,8)))		
push!(edgetable, edgetabletuple(CartesianIndex(5,8),CartesianIndex(4,8)))
push!(edgetable, edgetabletuple(CartesianIndex(4,8),CartesianIndex(4,7)))
push!(edgetable, edgetabletuple(CartesianIndex(4,7),CartesianIndex(4,6)))		
push!(edgetable, edgetabletuple(CartesianIndex(4,6),CartesianIndex(5,5)))		
push!(edgetable, edgetabletuple(CartesianIndex(5,5),CartesianIndex(2,2)))		
return edgetable
end
end

# ╔═╡ cce6a1e6-8e39-11eb-024f-7bd13f877a7a
#find ymin and ymax
function yminmax(vert)
	ymax = vert[1][1];
	ymin = vert[1][1];
	for i in 1:length(vert)
	   if(vert[i][2] > ymax)
		 ymax = vert[i][2]
	   elseif(vert[i][2] < ymin)
		 ymax = vert[i][2]
	   end
	end
	return ymin, ymax
end


# ╔═╡ f81db174-8e39-11eb-03d0-addb3b5b039c
function findintersections(edgetable, yvalue)
	points =[]
    for i in 1:length(edgetable)
		if(edgetable[i].final[2] > yvalue && edgetable[i].initial[2] > yvalue)
			continue 
		end
		if(edgetable[i].final[2] <= yvalue && edgetable[i].initial[2] <= yvalue)
			continue 
		end
		x=1
		deltay = edgetable[i].final[1]-edgetable[i].initial[1]
		deltax = edgetable[i].final[2]-edgetable[i].initial[2]
		alpha = deltay/deltax
		constant = edgetable[i].initial[1]
		x = alpha * (yvalue - edgetable[i].initial[2]) + constant
		if (x == -Inf || isnan(x) || x == Inf) continue end
		push!(points,CartesianIndex(ceil(Int,x),yvalue))
	end
	return points
end


# ╔═╡ fc3e886a-8dfc-11eb-28e2-a56245654c9a
function timetocolor(points, fill_color::T)where T<:Colorant
   for i in 1:2:length(points)-1
	  draw!(img, LineSegment(points[i], points[i+1]),fill_color)
   end
end

# ╔═╡ da3d93c2-8e39-11eb-0850-93179bd9e20c
function scanline(vert, fill_color::T) where T<:Colorant
	ymin, ymax = yminmax(vert)
	edgetable = createedgetable() 
	pyramid = []
	for i in ymin:ymax
		points = findintersections(edgetable, i) 
		points = sort!(points, by = x -> x[1])
		timetocolor(points, fill_color)
		push!(pyramid,img[:,:])
	end
	pyramid
end

# ╔═╡ 7f369560-8e01-11eb-214b-83d8210ca559
#with_terminal() do 
begin
	fill_color = Gray{Bool}(1.0)
    pyramid = scanline(vert, fill_color) 
end

# ╔═╡ Cell order:
# ╠═62405c38-8dfb-11eb-0dfe-b7545eb40047
# ╠═0a8bbcd6-8df2-11eb-1010-9fa5c200e91b
# ╠═76b68af4-8dfb-11eb-11df-3f5ecff30aef
# ╠═e728998c-8e03-11eb-383c-63adbbb0a9a7
# ╠═c037b994-8e39-11eb-308c-db84d51ff35c
# ╠═cce6a1e6-8e39-11eb-024f-7bd13f877a7a
# ╠═f81db174-8e39-11eb-03d0-addb3b5b039c
# ╠═fc3e886a-8dfc-11eb-28e2-a56245654c9a
# ╠═da3d93c2-8e39-11eb-0850-93179bd9e20c
# ╠═7f369560-8e01-11eb-214b-83d8210ca559
