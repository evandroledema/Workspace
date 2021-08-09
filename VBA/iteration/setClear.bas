Attribute VB_Name = "Module3"
Sub setClear()

Sheet3.Range("B42").Resize(50, 9).Clear
Sheet3.Cells(41, 12) = ""
Sheet3.Cells(34, 6) = 89
Sheet3.Cells(25, 4) = 59.5
MsgBox ("CLEAR & SET")

End Sub


