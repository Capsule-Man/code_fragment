$olApp = New-Object -ComObject Outlook.Application 
$olObj = $olApp.GetNameSpace("MAPI")
 # 名前がTakahashiのフォルダのみ取得 
$olObj = $olObj.Folders | where {$_.Name -eq "Takahashi"} 

$itemPath = ""

foreach ($item in $olObj.Items) {
     # メールアイテムオブジェクトだけ使う 
     if (("{0}" -f $item.Class) -ne "43") { continue } 

     $data = @{ "entryId" = $item.EntryID;
                "conversationId" = $item.ConversationID;
                "conversationTopic" = $item.ConversationTopic;
                "subject" = $item.Subject;
                "senderAddress" = $item.SenderEmailAddress;
                "senderName" = $item.SenderName;
                "senderType" = $item.SenderEmailType;
                "to" = $item.To;
                "cc" = $item.CC;
                "bcc" = $item.BCC;
                "body" = $item.Body;
                "htmlBody" = $item.HTMLBody;
                "received" = "{0}" -f $item.ReceivedTime;
                "modified" = "{0}" -f $item.LastModificationTime;
                "created" = "{0}" -f $item.CreationTime;
                "sent" = "{0}" -f $item.SentOn };

    # メールの題名に文字列が含まれているか 
    if ($data["subject"].Contains("")) { Continue }
    
    #　添付ファイルを扱う
    $item.Attachments | ForEach-Object { 
         $_.SaveAsFile((Join-Path $itemPath $fname)) 
    }

}