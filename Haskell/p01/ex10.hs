imc :: Float -> Float -> String
imc w h = (let i = w / (h**2) in
          if i < 18.5
                then "baixo peso"
            else
                if i < 25
                    then "peso normal"
                else
                    if i < 30
                        then "excesso de peso"
                    else "obesidade")

{-main = print(imc 70 1.70)-}