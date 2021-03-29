begin
    using Luxor, Random, Colors

    Drawing(512, 512, "hello-world.png")
    background("black")
    sethue("white")
    translate(50, 50)
    radius = 30
    grid = GridHex(O, radius, 2)
    t = Table(10, 1)
    for (pt, n) in t
        randomhue()
        setgray(rescale(n, 1, length(t), 0, 1))
        p = nextgridpoint(grid)
        ngon(p, radius - 5, 6, π / 2, :fillstroke)
        sethue("white")
        fontsize(25)
        text(string(n), p, halign = :center)
    end

    translate(100, 0)
    radius = 30
    grid = GridHex(O, radius, 2)
    t = Table(10, 1)
    list = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J"]
    for (pt, n) in t
        randomhue()
        setgray(rescale(n, 1, length(t), 0, 1))
        p = nextgridpoint(grid)
        ngon(p, radius - 5, 6, π / 2, :fillstroke)
        sethue("white")
        fontsize(25)
        text(string(list[n]), p, halign = :center)
    end
    origin()
    translate(40, -150)

    circle(Point(0, 0), 90, :stroke)
    setdash("dot")
    circle(Point(0, 0), 80, :stroke)
    circle(Point(0, 0), 50, :fill)
    circlepath(Point(0, 0), 70, :path)
    newsubpath()
    circlepath(Point(0, 0), 60, :fill, reversepath = true)

    origin()
    translate(0, 70)
    setline(0.5)
    apolygon = star(O, 50, 5, 0.5, 0, vertices = true)
    for n = 1:500
        apoint = randompoint(Point(-50, -50), Point(50, 50))
        isinside(apoint, apolygon) ? circle(apoint, 3, :fill) : circle(apoint, 0.5, :stroke)
    end

    origin()
    sethue("white")
    translate(100, 70)
    box(Point(0, 0), 70, 70, :fill)
    box(Point(0, 0), 90, 90, :stroke)

    origin()
    translate(-50, -30)
    sethue("white")
    fontsize(30)
    text("HELLOWORLD!!")
    translate(0, 40)
    text("1 2 3 4 5 6 7 8 9 0")
    setdash("solid")
    origin()
    translate(150, -150)
    for i = 1:10
        setline(i)
        x = LinRange(1, 100, 10)
        rule(Point(x[i], 0), π / 2, boundingbox = BoundingBox() * 0.3)
    end

    origin()
    translate(200, 375)
    fib = [1, 1, 2, 3, 5, 8, 13, 21, 34]
    tiles = boxmap(fib, BoundingBox()[1], 200, 125)

    for (n, t) in enumerate(tiles)
        randomhue()
        bb = BoundingBox(t)
        sethue("black")
        box(bb - 3, :stroke)
        randomhue()
        box(bb - 5, :fill)

        sethue("white")
       fontsize(boxwidth(bb) > boxheight(bb) ? (boxheight(bb)/4)+20 : (boxwidth(bb)/4)+20)
		text(
            string(sort(fib, rev = true)[n]),
            midpoint(bb[1], bb[2]),
            halign = :center,
            valign = :middle,
        )
    end

    origin()
    translate(150, 100)
    scale(0.3)
    sethue("white")
    box(Point(160, 100), 350, 300, :fill)
    julialogo()

    finish()
    preview()

end
