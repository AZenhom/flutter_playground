is = {500, 500};

bg = ImageRotate[
  LinearGradientImage[{RGBColor["#3F12BBF5"], RGBColor["#3874FF99"]}, is], -90 Degree]

mask = RadialGradientImage[{
    RGBColor[0, 0, 0, 0],
    RGBColor[0.09, 0.07, 0.196, 0.3],
    RGBColor[0.09, 0.07, 0.196, 0.9],
    RGBColor[0.023, 0.05, 0.125, 1]},
   is];

grid[j_ : 5] := 
 Module[{g3d, b}, 
  Overlay[{Image[bg, ImageSize -> All], 
    g3d = Graphics3D[{Thickness[0.003], RGBColor["#FFFFFF"],
        Sequence @@ 
        Table[InfiniteLine[{{0, i + j, 0}, {1, i + j, 0}}], {i, -10, 
          20}], Table[
        InfiniteLine[{{i, 0, 0}, {i, 1, 0}}], {i, -10,   10}]}, 
      Boxed -> False, ViewAngle -> Pi/3, 
      ViewVector -> {{0, -5, 6}, {0, -1, 2}}, Background -> None, 
      PlotRange -> All, ImageSize -> is], 
    b = Blur[Rasterize[g3d, RasterSize -> is], {20, 20}];
    Image[SetAlphaChannel[b, ColorNegate@ColorConvert[b, "Grayscale"]],
      ImageSize -> is]}, {1, 3, 2}]]

frames = 
  Table[Overlay[{grid[j], Image[mask, ImageSize -> All]}, All], {j, 5,
     6, .02}];
Export["~/grid.gif", frames, AnimationRepetitions -> \[Infinity]]