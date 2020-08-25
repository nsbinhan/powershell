cls
$button = $dirproperties = $form = 0
[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
$dirproperties = new-object system.windows.Forms.FolderBrowserDialog
$dirproperties.RootFolder = [System.Environment+SpecialFolder]'MyComputer'
$dirproperties.ShowNewFolderButton = $false
$dirproperties.selectedPath = "C:\"
$dirproperties.Description = "Choose a directory"

$browsebt = New-Object system.Windows.Forms.Button
$browsebt.Text = "Browse"
$browsebt.Add_Click({$dirproperties.ShowDialog()})
$browsebt.left = 20
$browsebt.top = 20

$form = New-Object system.windows.forms.Form
$form.controls.add($browsebt)
$form.ShowDialog()
$form.Dispose()

$filelist = Get-ChildItem -Path $dirproperties.SelectedPath -Filter *.py -Recurse -ErrorAction SilentlyContinue -Force | %{$_.FullName}
For ($i=0; $i -lt $A.Length; $i++)
{
    $parentPath = Split-Path -parent $filelist[$i]
    echo $parentPath >> D:\log.txt
}
