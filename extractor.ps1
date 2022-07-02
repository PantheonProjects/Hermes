$target = "target dir , ex --> K:\Movies\Hollywood"
$output = "output dir , ex --> A:\test1.csv"

$colItems = (Get-ChildItem $target | Where-Object {$_.PSIsContainer -eq $True} | Sort-Object)
$results = @()
foreach ($i in $colItems)
    {
        $i.FullName
        $subFolderItems = (Get-ChildItem $i.FullName -recurse | Measure-Object -property length -sum)
        $results += '"' +$i.Name + '"' + "," + '"' + "{0:N2}" -f ($subFolderItems.sum / 1MB) + '"'
    }
$results > $output
