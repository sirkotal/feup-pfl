classify :: Int -> String
classify n | (n <= 9) = "reprovado"
           | n >= 10 && n <= 12 = "suficiente"
           | n >= 13 && n <= 15 = "bom"
           | n >= 16 && n <= 18 = "muito bom"
           | n >= 19 && n <= 20 = "excelente"