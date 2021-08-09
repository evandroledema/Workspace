Attribute VB_Name = "Module1"
Sub iteracao()
Sheet3.Range("B42").Resize(50, 9).Clear
Sheet3.Cells(41, 12) = ""
'Quando houver um erro irá saltar para errorHandler
On Error GoTo errorhandler

'Declaração das Variáveis
'delta é a aproximação de cada iteração
'r é o demarcador de iteração utilizado para escolher a linha e numerar a interação
Dim delta As Variant
Dim r As Variant

'nesta lógica r deve começar como zero, pois será utilizado junto ao Offset()
r = 0

'delta inicia recebendo o valor da primeira iteração
'em outras lógicas poderia usar-se um do-while
delta = Abs(Sheet3.Cells(37, 3))

'Loop onde as iterações entrarão os dadose criarão a memória de cálculo
'para cada iteração até que convirja.
While delta > 0.001
    'linha r da iteração
    Sheet3.Range("B42").Offset(r, 0) = r + 1
    Sheet3.Range("B42").Offset(r, 1) = Sheet3.Range("D25")
    Sheet3.Range("B42").Offset(r, 2) = Sheet3.Range("E27")
    Sheet3.Range("B42").Offset(r, 3) = Sheet3.Range("E28")
    Sheet3.Range("B42").Offset(r, 4) = Sheet3.Range("C31")
    Sheet3.Range("B42").Offset(r, 5) = Sheet3.Range("C32")
    Sheet3.Range("B42").Offset(r, 6) = Sheet3.Range("C33")
    Sheet3.Range("B42").Offset(r, 7) = Sheet3.Range("C36")
    Sheet3.Range("B42").Offset(r, 8) = Sheet3.Range("C37")
    
    'formatação da linha da iteração número r.
    Sheet3.Range("B42").Offset(r, 0).Resize(1, 9).Select
    With Selection
        .HorizontalAlignment = xlCenter
        .NumberFormat = "0.0000"
    End With
    
    'delta recebe novo valor
    delta = Abs(Sheet3.Cells(37, 3))
    'a nova temperatura entra para o cálculo
    Sheet3.Cells(25, 4) = Sheet3.Cells(37, 6)
    Sheet3.Cells(34, 6) = Sheet3.Cells(38, 3)
    'iteração recebe + 1
    r = r + 1
    
    
    
Wend

GoTo endFunc
'Sheet3.Cells(42, 2)


errorhandler:
MsgBox ("Erro verificar código - alt+F11")

endFunc:
Sheet3.Cells(41, 12) = Sheet3.Cells(34, 6)
Sheet3.Cells(34, 6) = 89
Sheet3.Cells(25, 4) = 59.5
MsgBox ("Iteração finalizada")
End Sub

