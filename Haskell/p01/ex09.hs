evaluate :: Int -> String 
evaluate x =  if x <= 9
                then "reprovado"
            else
                if x <= 12
                    then "suficiente"
                else
                    if x <= 15
                        then "bom"
                    else
                        if x <= 18
                            then "muito bom"
                        else "muito bom com distinção"

{-main = print(evaluate 15)-}