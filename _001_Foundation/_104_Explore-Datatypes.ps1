#String extrapolation
#$name = 'Harry'
#$place = 'Kerala'
#$Sentance = 'My name is $name and I live in $place' #--> Change Single quotes to double quotes


#Other datatypes
#Boolean #--> $true and $false
#Get-Variable -Name true, false

#Numbers
#[Int32]::MaxValue / MinValue
#[Int64]::MaxValue / MinValue
#get-help about_Numeric_Literals

#Scriptblock (Grouping expressions)
#Test-Path $filename
#$myscriptblock = {Test-Path $filename}
# & $myscriptblock #--> Add & infront to run the scriptblock

#Collection of Objects ; Arrays 
#$location = @('Trivandrum','Cochin','Bangalore') #--> Array
#$location[0]
#$location[1..3]
#$location += 'Japan' #--> Add an element

#Hashtable - Collection of Key Value Pair
# $offices = @{
#     tvm = 'Trivandrum';
#     cok = 'Cochin';
#     blr = 'Bangalore'
#     }
# $offices['cok'] #--> Read by providing the key
# $offices.cok   #--> Read by providing the key
# Select-object -InputObject $offices -Property * #--> Formatted
# $offices['jp'] = 'Japan' #--> Adding to hashtable