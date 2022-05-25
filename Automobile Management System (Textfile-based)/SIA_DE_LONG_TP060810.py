#Sia DE LONG
#TP060810
def generateTable():
    #Declare all the the table needed into data
    #Any new car model and assembly section will be editing from here
    data = """Menu

---------------------------------
|  No.  |  Operation		|
---------------------------------
|  1.   |  Parts Creation	|
|  2.   |  Suppliers Creation	|
|  3.   |  Part Update		|
|  4.   |  Part Tracking	|
|  5.   |  Search Function	|
| -1.   |  Quit Program		|
---------------------------------
END Menu

Part Tracking

---------------------------------
|  No. |  Operation		|
---------------------------------
|  1.  |  Available Quantity	|
|  2.  |  Short Quantity 	|
|  3.  |  Used Quantity		|
| -1.  |  Quit Part Tracking	|
---------------------------------
END Part Tracking

Search

---------------------------------
|  No. |  Operation		|
---------------------------------
|  1.  |  Part Record		|
|  2.  |  Supplier Detail 	|
|  3.  |  Supplier Supplied	|
| -1.  |  Quit Search   	|
---------------------------------
END Search

WBS	WAY	WBR
Warehouse Code

----------------------------------
|  Model		|  Code	 |
----------------------------------
|  Bios			|  WBS	 |
|  Ambry		|  WAY	 |
|  Barrier		|  WBR	 |
----------------------------------
END Warehouse Code

ES	BWS	AS
Assembly Section

----------------------------------
|  Section		|  Code  |
----------------------------------
|  Engine Section	|  ES	 |
|  Body Work Section	|  BWS	 |
|  Air-con Section	|  AS	 |
----------------------------------
END Assembly Section"""
    #Create table.txt file and write the data into it
    fileHandler = open("table.txt", 'w')
    fileHandler.write(data)
    fileHandler.close()
    return
#Assumed this program is only for Bios, Ambry and Barrier
#Assumed all warehouse will have the same assembly sections
#Assumed there will ahve a programmer who can edit this table to add new car model or assembly section


def displayTable(tableName):
    #Open table.txt file and read it to data then close instantly
    fileHandler = open("table.txt", 'r') 
    data = fileHandler.read().split('\n')
    fileHandler.close()
    #Read the data line by line
    for count in range(len(data)):
        if data[count] == tableName:
            #If encounter the desired table name then save the next line in initial range for later
            initialRange = count + 1
        elif data[count] == "END " + tableName:
            #If encounter END of table name then save the line in endRange for later then stop the loop afterward
            endRange = count
            break
    #Print out the desired table    
    for count in range(initialRange, endRange):
        print(data[count])
    return


def verticalDataExtrator(fileName, index, convert):
    #Declare an array to store related data
    dataList = []
    #Declare an array to delete charater in related data
    removeCharacter = ['P', 'S']
    #Open the desired file and read it as data then close instantly
    fileHandler = open(fileName, 'r') 
    data = fileHandler.readlines()
    fileHandler.close()
    #Process the data in smaller list
    for items in data:
        #Abstract out the data
        items = items.rstrip().split('\t')
        #If convert is equal to "true" then replace the character
        #Which exist in removeCharacter with ''
        #Then convert the data to integer
        if convert == "true":
            for character in removeCharacter:
                items[index] = items[index].replace(character, '')
            items[index] = int(items[index])
        #Save the small list into a new array
        dataList.append(items[index])
    #Return the array to function which called it
    return dataList
#Assumed only string that have character 'p' or 's' infront will be proccessed


def horizontalDataExtrator(fileName, target, index, condition, loop):
    #Declare an array to store related data
    targetedDataList = []
    #Open the desired file and read it as data then close instantly
    fileHandler = open(fileName, 'r')
    data = fileHandler.readlines()
    fileHandler.close()
    #Process the data in smaller list
    for items in data:
        items = items.rstrip().split('\t')
        #Abstract out the data
        #Get the result following with the condition
        #The element inside small list will be converted to integer if condition is '<'
        if condition == "==":
            result = items[index] == target
        elif condition == '<':     
            result = int(items[index]) < target
        #If the result id True then the small list will become the targetedData    
        if result:
            targetedData = items
            #If the loop is not equal to "true" then only the one small list will be return
            if loop != "true":
                return targetedData
            #Save the small list into a new array if loop is "false"
            targetedDataList.append(targetedData)
    #Return the array to function which called it
    return targetedDataList
#Assumed only condition of "==" and '<' will exists in the program


def record(fileName, data, mode):
    #Open the desired file and either append or rewrite it
    fileHandler = open(fileName, mode)
    #Process the data in smaller list
    for items in data:
        #Process the smaller list in element 
        for item in items:
            #Write the element one by one with TAB between them
            fileHandler.write(item) 
            fileHandler.write('\t')
        #After all element in a smaller list already write in the file then enter a NEWLINE
        fileHandler.write('\n')
    #After all process has been done then close the file
    fileHandler.close()
    return


def rearrange(fileName):
    #Declare an array to store related data
    newData = []
    #Declare an array to delete charater in related data
    removeCharacter = ['P', 'S']
    #Get all ids that originally exist in desired file and convert it to integer
    idList = verticalDataExtrator(fileName, 0, "true")
    #Arrange the ids in ascending order then store in a new array
    arrangedIdList = sorted(idList)
    #Open the desired file and read it as data then close instantly
    fileHandler = open(fileName, 'r') 
    data = fileHandler.readlines()
    fileHandler.close()
    #To arrange the data in ascending order of part id
    #Process the arrangedIdList in element 
    for item in arrangedIdList:
        #Process the data in smaller list
        for items in data:
            #Abstract out the data
            items = items.rstrip().split('\t')
            #Replace the character in first element of smaller list which exist in removeCharacter with ''
            for character in removeCharacter:
                items[0] = items[0].replace(character, '')
                #If the character successfully replaced then compared it with element in arrangedIdList
                #Else remove the next character
                try:
                    if int(items[0]) == item:
                        #If found the smaller list then put back the character
                        items[0] = character + items[0]
                        #Save the small list into a new array
                        newData.append(items)
                        break
                except ValueError:
                    pass
    #Rewrite the data into desired file to arrange it
    record(fileName, newData, 'w')
    return


def idExistanceChecker(fileName, idNo, creationRequirement):
    #Try to search the id in desired file
    try:
        #Get all ids that originally exist in desired file without convert
        idList = verticalDataExtrator(fileName, 0, "false")
        for count in range(len(idList)):
            if idNo == idList[count]:
                return "exist"
    #If the file havent created yet then proceed to next if statement
    except FileNotFoundError:
        pass
    #If the function which called it want to proceed to desired creation
    #Then call the creation follow with the idNo
    if creationRequirement == "true":
        if fileName == "parts.txt":
            partsCreation(idNo)
        else:
            suppliersCreation(idNo)
    return
#Assumed only part and supplier creation in the entire program


def codeExistanceChecker(tableName, code):
    #Open table.txt file and read it as data then close instantly
    fileHandler = open("table.txt", 'r') 
    data = fileHandler.read().split('\n')
    fileHandler.close()
    #Find out the line which have the code in particular table
    for count in range(len(data)):
        if data[count] == tableName:
            codeList = data[count - 1]
            break
    #Abstact out the code
    codeList = codeList.rstrip().split('\t')
    #Run throught the code in the line
    #If found the same code then return to the function which called it
    for count in range(len(codeList)):
        if code == codeList[count]:
            return code
    #Else Request the user to input the code again
    print("<Invalid Input>")
    code = input("Please enter a valid code: ")
    code = code.upper()
    code = codeExistanceChecker(tableName, code)
    return code


def quantityAvailability(partId, partQuantity):
    #Get all the detail from parts.txt file which have the same part id as data
    data = horizontalDataExtrator("parts.txt", partId, 0, "==", "false")
    #If the quantity assembly secion requested is exceed available quantity
    #Then request the user to input quantity again
    if int(data[2]) < partQuantity:
        print("<Quantity exceed available quantity>")
        #Loop until get a quantity in integer
        while True:
            try:
                partQuantity = int(input("How much quantity wanted to use: "))
                break
            except ValueError:
                pass
        #Call again the same function to check the availability and receive the quantity as partQuantity
        partQuantity = quantityAvailability(partId, partQuantity)
    #Finally return the valid quantity
    return partQuantity
#Assumed no negative integer input


def fileUpdater(fileName, partId, supplierId, partQuantity, operation):
    #Check either the data with same partId already existed or not
    existance = idExistanceChecker(fileName, partId, "false")
    #Declare an array to store related data
    newData = []
    #If existed then just edit the quantity then rewrite to the file
    if existance == "exist":
        #Open the desired file and read it as data then close instantly
        fileHandler = open(fileName, 'r')
        data = fileHandler.readlines()
        fileHandler.close()
        #Process the data in smaller list
        for items in data:
            items = items.rstrip().split('\t')
            #Compared part id smaller by smaller list
            #Calculate it when found it
            if items[0] == partId:
                if operation == '+':
                    items[2] = int(items[2]) + partQuantity
                elif operation == "-":
                    items[2] = int(items[2]) - partQuantity
                #Convert it back to String    
                items[2] = str(items[2])
            #Save the small list into a new array
            newData.append(items)
        #Rewrite the content in the file with data in new array
        record(fileName, newData, 'w')
    else:
        #Get data from parts.txt file which have the same id
        data = horizontalDataExtrator("parts.txt", partId, 0, "==", "false")
        #Calculate it
        if operation == '+':
            data[2] = 0 + partQuantity
        elif operation == "-":
            data[2] = 0 - partQuantity
        #Convert it back to String    
        data[2] = str(data[2])
        #Add supplierId to the data if needed
        if supplierId != "none":
            data.append(supplierId)
        #Save the data into a new array
        newData.append(data)
        #Append the content in the file with data in new array amd rearrange it
        record(fileName, newData, 'a')
        rearrange(fileName)
    return


def partsCreation(partId):
    #If still doesnt have any part id declared yet then read one
    if partId == "none":
        partId = input("Enter a unique part id(-1 to quit parts creation): ")
        #Let it allow to loop
        loop = "true"
    else:
        #If the part id already declared then dont let the function to loop
        loop = "false"
    #"-1" as sentinel value
    while partId != "-1":
        #Declare a small list and a master list
        item = []
        items = []
        #Check the validation of part id
        partId = partId.upper()
        if len(partId) != 5 or partId[0] != 'P':
            print("<Invalid Id>\n<Part Id must start with character 'p' together with 4 number>\n")
            partId = input("Enter a unique part id(-1 to quit suppliers creation): ")
            continue
        existance = idExistanceChecker("parts.txt", partId, "false")
        if existance == "exist":
            print("<ID Existed>\n")
            partId = input("Please enter a UNIQUE part id(-1 to quit parts creation): ")
            continue
        #Store the part id inside small list when it is valid
        item.append(partId)
        #Read part name and store in small list
        partName = input("Enter a new part name: ")
        item.append(partName)
        #Loop until get a quantity in integer
        while True:
            try:
                partQuantity = int(input("Enter the initial quantity for that part: "))
                #Convert it back to String
                partQuantity = str(partQuantity)
                break
            except ValueError:
                print("<Invalid Quantity>\n")
        #Store quantity, warehouseCode and assemblySection inside small list when it is valid
        item.append(partQuantity)
        displayTable("Warehouse Code")
        warehouseCode = input("Please enter the warehouse code: ")
        warehouseCode = warehouseCode.upper()
        #Check the validation of warehouse code
        warehouseCode = codeExistanceChecker("Warehouse Code", warehouseCode)
        item.append(warehouseCode)
        displayTable("Assembly Section")
        assemblySection = input("Please enter the assembly section code they are used: ")
        assemblySection = assemblySection.upper()
        #Check the validation of assembly section
        assemblySection = codeExistanceChecker("Assembly Section", assemblySection)
        item.append(assemblySection)
        #Store the small list to master list then append it to parts.txt file
        #To prevent user input the same id in the same attempt
        items.append(item)
        record("parts.txt", items, 'a')
        #Read supplierId who supplied it
        supplierId = input("Enter a supplier id who supply this part: ")
        supplierId = supplierId.upper()
        existance = idExistanceChecker("suppliers.txt", supplierId, "false")
        #If new id detected then go to suppliersCreation to fill in the detail
        if existance != "exist":
            print("<New Id Detected>\n")
            suppliersCreation(supplierId)
        item.append(supplierId)
        
        #Store the id to small list then append the master list to suppliers.txt file
        record("suppliedParts.txt", items, 'a')
        print("<Part created successfully>\n")
        #Stop the loop if loop is "false"
        if loop == "false":
            break
        #Read a new part id then proceed to next iteration
        partId = input("Enter a unique part id(-1 to quit parts creation): ")
    #Rearrange all the file then return
    rearrange("parts.txt")
    rearrange("suppliedParts.txt")
    return
#Assumed no mistake when input details


def suppliersCreation(supplierId):
    #If still doesnt have any supplier id declared yet then read one
    if supplierId == "none":
        supplierId = input("Enter a unique supplier id(-1 to quit suppliers creation): ")
        #Let it allow to loop
        loop = "true"
    else:
        #If the part id already declared then dont let the function to loop
        loop = "false"
    #"-1" as sentinel value
    while supplierId != "-1":
        #Declare a small list and a master list
        item = []
        items = []
        supplierId = supplierId.upper()
        #Check validation of supplier id
        if len(supplierId) != 5 or supplierId[0] != 'S':
            print("<Invalid Id>\n<Supplier Id must start with character 's' together with 4 number>\n")
            supplierId = input("Enter a unique supplier id(-1 to quit suppliers creation): ")
            continue
        existance = idExistanceChecker("suppliers.txt", supplierId, "false")
        if existance == "exist":
            print("<ID Existed>")
            supplierId = input("\nPlease enter a UNIQUE supplier id(-1 to quit suppliers creation): ")
            continue
        #Store related details into small list
        item.append(supplierId)
        supplierName = input("Enter new supplier name: ")
        item.append(supplierName)
        companyAddress = input("Enter supplier company address: ")
        item.append(companyAddress)
        phoneNumber = input("Enter supplier phone number: ")
        item.append(phoneNumber)
        #Store the small list into master list
        items.append(item)
        #Append master list to suppliers.txt
        record("suppliers.txt", items, 'a')
        print("<Supplier created successfully>\n")
        #Stop the loop if loop is "false"
        if loop == "false":
            break
        #Read a new supplier id then proceed to next iteration
        supplierId = input("Enter a unique supplier id(-1 to quit suppliers creation): ")
    #Rearrange the file then return
    rearrange("suppliers.txt")
    return
#Assumed no mistake when input details


def partUpdate():
    #Read a part id first
    partId = input("Enter a part id to update(-1 to quit part update): ")
    #"-1" as sentinel value
    while partId != "-1":
        partId = partId.upper()
        #Check validation and existance
        if len(partId) != 5 or partId[0] != 'P':
            print("<Invalid Id>\n<Part Id must start with character 'p' together with 4 number>\n")
            partId = input("Enter a part id to update(-1 to quit part update): ")
            continue
        #If doesnt then create it in part creation first
        idExistanceChecker("parts.txt", partId, "true")
        #Let the user choose either to increase or decrease quantity 
        decision = input("Enter any key to supply the part(-1 to use in assembly section): ")
        #Process of using part
        if decision == "-1":
            fileHandler = open("parts.txt", 'r')
            data = fileHandler.readlines()
            fileHandler.close()
            for items in data:
                items = items.rstrip().split('\t')
                if items[0] == partId:
                    print("Available quantity:", items[2])
                    break
            while True:
                try:
                    partQuantity = int(input("How many quantity wanted to use: "))
                    break
                except ValueError:
                    pass
            partQuantity = 0 - quantityAvailability(partId, partQuantity)
            fileUpdater("usedParts.txt", partId, "none", partQuantity, '-')
        #Process of suppling part
        else:
            while True:
                try:
                    partQuantity = int(input("How many quantity supplied: "))
                    break
                except ValueError:
                    pass
            fileUpdater("suppliedParts.txt", partId, "none", partQuantity, '+')
        #Update the available quanyity
        fileUpdater("parts.txt", partId, "none", partQuantity, '+')
        print("<Parts update successfully>\n")
        #Read a new part id then proceed to next iteration
        partId = input("Enter a part id to update(-1 to quit part update): ")
    return
#Assumed no negative integer input


def partTracking():
    #Check either any part recorded or not
    try:
        fileHandler = open("parts.txt", 'r')
        fileHandler.close()
    except FileNotFoundError:
        print("<No part recorded yet>")
        return
    displayTable("Part Tracking")
    operation = input("Choose an operation: ")
    #"-1" as sentinel value
    while operation != "-1":
        #Process of display all available quantity
        if operation == '1':
            fileHandler = open("parts.txt", 'r')
            data = fileHandler.readlines()
            fileHandler.close()
            for items in data:
                items = items.rstrip().split('\t')
                print("ID                :", items[0])
                print("Name              :", items[1])
                print("Quantity Available:", items[2])
                print("Warehouse Code    :", items[3])
                print("Assembly Section  :", items[4], '\n')
        #Process of display all short quantity that less than 10 units
        elif operation == '2':
            data = horizontalDataExtrator("parts.txt", 10, 2, '<', "true")
            if data == []:
                print("<No short quantity yet>")
                displayTable("Part Tracking")
                operation = input("Choose an operation: ")
                continue
            displayTable("Warehouse Code")
            warehouseCode = input("Enter a warehouse code(-1 to quit short quantity tracking): ")
            while warehouseCode != "-1":
                warehouseCode = warehouseCode.upper()
                warehouseCode = codeExistanceChecker("Warehouse Code", warehouseCode)
                newData = []
                for items in data:
                    if items[3] == warehouseCode:
                        newData.append(items)
                        print("ID                :", items[0])
                        print("Name              :", items[1])
                        print("Quantity Available:", items[2])
                        print("Assembly Section  :", items[4], '\n')
                if newData == []:
                    print("<No short quantity in this warehouse>")
                displayTable("Warehouse Code")
                warehouseCode = input("Enter a warehouse code(-1 to quit short quantity tracking): ")
        #Process of display every quantity used in assembly section
        elif operation == '3':
            try:
                fileHandler = open("usedParts.txt", 'r')
                data = fileHandler.readlines()
                fileHandler.close()
                displayTable("Warehouse Code")
                warehouseCode = input("Enter a warehouseCode(-1 to quit used quantity tracking): ")
                while warehouseCode != "-1":
                    warehouseCode = warehouseCode.upper()
                    warehouseCode = codeExistanceChecker("Warehouse Code", warehouseCode)
                    newData = []
                    for items in data:
                        items = items.rstrip().split('\t')
                        if items[3] == warehouseCode:
                            print("ID              :", items[0])
                            print("Name            :", items[1])
                            print("Quantity Used   :", items[2])
                            print("Assembly Section:", items[4], '\n')
                            newData.append(items)
                    if newData == []:
                        print("<No used parts in this warehouse>")
                    displayTable("Warehouse Code")
                    warehouseCode = input("Enter a warehouseCode(-1 to quit used quantity tracking): ")
            except FileNotFoundError:
                print("<No used parts yet>")
        else:
            print("<Invalid Input>")
        displayTable("Part Tracking")
        operation = input("Choose an operation: ")
    return


def search():
    #Check either any part recorded or not
    try:
        fileHandler = open("parts.txt", 'r')
        fileHandler.close()
    except FileNotFoundError:
        print("<No part recorded yet>")
        return
    displayTable("Search")
    operation = input("Choose an operation: ")
    #"-1" as sentinel value
    while operation != "-1":
        #Process of display out all details by a part id
        if operation == '1':
            partId = input("Enter part ID you want to search(-1 to quit current search): ")
            while partId != "-1":
                partId = partId.upper()
                newData = []
                try:
                    dataQuantityAvailable = horizontalDataExtrator("parts.txt", partId, 0, "==", "false")
                    for count in range(3):
                        newData.append(dataQuantityAvailable[count])
                    dataQuantitySupplied = horizontalDataExtrator("suppliedParts.txt", partId, 0, "==", "false")
                    newData.append(dataQuantitySupplied[2])
                    try:
                        dataQuantityUsed = horizontalDataExtrator("usedParts.txt", partId, 0, "==", "false")
                        newData.append(dataQuantityUsed[2])
                    except FileNotFoundError:
                        newData.append(0)
                    for count in range(3,5):
                        newData.append(dataQuantityAvailable[count])
                    print("ID                :", newData[0])
                    print("Name              :", newData[1])
                    print("Quantity Available:", newData[2])
                    print("Quantity Supplied :", newData[3])
                    if newData[4] != 0:
                        print("Quantity Used     :", newData[4])
                    print("Warehouse Code    :", newData[5])
                    print("Assembly Section  :", newData[6], '\n')
                except IndexError:
                    print("<Part id does not exist>\n")
                partId = input("Enter part ID you want to search(-1 to quit current search): ")     
        #Process of display out supplier details by a part id
        elif operation == '2':
            partId = input("Enter part ID you want to search(-1 to quit current search): ")
            while partId != "-1":
                partId = partId.upper()
                fileHandler = open("suppliedParts.txt", 'r') 
                data = fileHandler.readlines()
                fileHandler.close()
                existance = "not exist"
                for items in data:
                    items = items.rstrip().split('\t')
                    if items[0] != partId:
                        continue
                    items = horizontalDataExtrator("suppliers.txt", items[5], 0, "==", "false")
                    print("ID              :", items[0])
                    print("Name            :", items[1])
                    print("Company Address :", items[2])
                    print("Phone Number    :", items[3], '\n')
                    existance = "exist"
                    break
                if existance == "not exist":
                    print("<Part id does not exist>\n")
                partId = input("Enter part ID you want to search(-1 to quit current search): ")
        #Process of display out all part details which supplied by a supplier id
        elif operation == '3':
            supplierId = input("Enter supplier ID you want to search(-1 to quit current search): ")
            while supplierId != "-1":
                supplierId = supplierId.upper()
                data = horizontalDataExtrator("suppliedParts.txt", supplierId, 5, "==", "true")
                if data == []:
                    print("<Supplier id does not exist OR this supplier haven't supply any part yet>\n")
                    supplierId = input("Enter supplier ID you want to search(-1 to quit current search): ")
                    continue
                for items in data:
                    print("ID                :", items[0])
                    print("Name              :", items[1])
                    print("Quantity Supplied :", items[2])
                    print("Warehouse Code    :", items[3])
                    print("Assembly Section  :", items[4], '\n')
                supplierId = input("Enter supplier ID you want to search(-1 to quit current search): ")
        else:
            print("<Invalid Input>")
        displayTable("Search")
        operation = input("Choose an operation: ")
    return


def menu():
    #menu that let user to choose operation
    displayTable("Menu")
    operation = input("Choose an operation: ")
    while operation != "-1":  
        if operation == '1':
            partsCreation("none")
        elif operation == '2': 
            suppliersCreation("none")
        elif operation == '3': 
            partUpdate()
        elif operation == '4': 
            partTracking()
        elif operation == '5':
            search()
        else:
            print("<Invalid Input>")
        displayTable("Menu")
        operation = input("Choose an operation: ")
    return

#Generate table in a file before enter menu
generateTable()
menu()
