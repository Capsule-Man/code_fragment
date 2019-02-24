Dim marketcap_order As Integer
Dim esgscore_order As Integer

'--------

Dim order As xlSortOrder

If col_sort = "secode" Then

    With
    End With 

Else If col_sort = "marketcap" Then

    esgscore_order = 0

    If marketcap_order = 0 Then
        order = xlAscending
        marketcap_order = 1
    Else 
        order = xlDescending
        marketcap_order = 0

    With
    End With 

Else If col_sort = "esgscore" Then

    marketcap_order = 0

    If esgscore_order = 0 Then
        order = xlAscending
        esgscore_order = 1
    Else 
        order = xlDescending
        esgscore_order = 0

    With
    End With 