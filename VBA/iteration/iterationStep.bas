Attribute VB_Name = "Module2"
Sub iteracaoStep()

'Quando houver um erro irá saltar para errorHandler
On Error GoTo errorhandler

'Declaração das Variáveis
'delta é a aproximação de cada iteração
'r é o demarcador de iteração utilizado para escolher a linha e numerar a interação
Dim delta As Variant
Dim r As Variant
Dim count1 As Variant
Dim ws As Worksheet

Set ws = Sheet3
r = Application.WorksheetFunction.CountA(ws.Range("B42:B200"))

'delta inicia recebendo o valor da primeira iteração
'em outras lógicas poderia usar-se um do-while
delta = Abs(Sheet3.Cells(37, 3))

'If delta < 0.001 Then GoTo jump


'Loop onde as iterações entrarão os dadose criarão a memória de cálculo
'para cada iteração até que convirja.
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
    Sheet3.Cells(41, 12) = Sheet3.Cells(34, 6)
If delta < 0.001 Then GoTo jump

GoTo endFunc
errorhandler:
MsgBox ("Erro verificar código - alt+F11")

GoTo endFunc
jump:
MsgBox ("Convergiu")

endFunc:
End Sub
