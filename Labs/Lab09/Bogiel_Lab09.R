camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

#Problem 1 - convert dates and times into actual objects that represent time
as.Date('19/09/2013 16:29', format = '%d/%m/%Y %H:%M')
#output "2013-09-19" did nothing with time

oneDate <- camData$DateTime[1]
oneDate = strptime('19/09/2013 16:29', format = '%d/%m/%Y %H:%M')
#not too sure what this did
#upon typing "oneDate" into the console, '[1] "2013-09-19 16:29:00 MDT"' was output
#this worked with 1 vector, but it needs to work woth multiples
strptime('19/09/2013 16:29', format = '%d/%m/%Y %H:%M')
#output "2013-09-19 16:29:00 MDT"
smallVec <- camData$DateTime[1:5]
strptime(smallVec, format = '%d/%m/%Y %H:%M')

DateTime <- camData$DateTime[1:14604]
strptime('DateTime', format = '%d/%m/%Y %H:%M')
#this is only returning one DateTime
strptime(camData$DateTime, format = '%d/%m/%Y %H:%M')
#this gives the results I want

#Problem 2 - convert data entries with 2 digit years to 4 digit years
awk()