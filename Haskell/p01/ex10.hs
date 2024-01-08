imc :: Float -> Float -> String
imc w h = if i < 18.5
            then "baixo peso"
          else if i >= 18.5 && i < 25
            then "peso normal"
          else if i >= 25 && i < 30
            then "excesso de peso"
          else
            "obesidade"
          where i = w / (h^2)

{-main = print(imc 70 1.70)-}