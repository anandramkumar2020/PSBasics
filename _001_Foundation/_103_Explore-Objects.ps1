#Objects (All Varaiables, Inputs , Output , ...)

#$place = 'trivandrum' #--> String Object
#$place.Length
#select-object -InputObject $place -Property *
#Get-Member -InputObject $place #--> Takes an Object and returns all Information ; TypeName, Name, MemberType
#Get-Member -InputObject $place -Name Split #-> More information on the Method
#Get-Member -InputObject $place -Name Substring  
#$place.Substring(3,4)
