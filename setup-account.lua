term.clear()
term.setCursorPos(1, 1)
if fs.exists(".settings") then
    settings.load(".settings")
    print("Settings already found!")
    print("Name:")
    Name = settings.get("RedChat.Name")
    Server = settings.get("RedChat.Server")
    print(Name)
    print("Server:")
    print(Server)
    print("Press 'y' to Reset Settings, or Press 'n' to exit!")
    print("Enter to Confirm!")
    settingset = read()
    if settingset ~= "y" then
        print("Exiting...")
        sleep(3)
        os.reboot()
        end
    end
sleep(4)
print("Welcome to the interactive RedChat Account Setup!")
modem = peripheral.find("modem")
if modem == nil then
    print("Error!")
    print("No Modem Found!")
    print("Shutting Down in 5 seconds")
    sleep(5)
    os.shutdown()
    end
print("Testing Modem...")
sleep(6)
peripheral.find("modem", rednet.open)
print("Connected to Modem Successfully!")
sleep(3)
term.clear()
term.setCursorPos(1, 1)
print("Ready to begin setup!")
print("Press Any Key to begin!")
os.pullEvent("key")
sleep(1)
term.clear()
term.setCursorPos(1, 1)
print("Please Enter the Server Name you wish to connect to!")
print("Public is the default Server.")
Server = read()
print("Using " .. Server)
settings.define("RedChat.Server", {
    description = "The Server Name",
    default = "Public",
    type = "string",
})
settings.set("RedChat.Server", Server)
sleep(1)
term.clear()
term.setCursorPos(1, 1)
print("Please Enter the Client Name (Your Name), you wish to use!")
Name = read()
print("Your name is " .. Server)
os.setComputerLabel(Name)
settings.define("RedChat.Name", {
    description = "The Client Name",
    default = "Guest",
    type = "string",
})
settings.set("RedChat.Name", Name)
sleep(1)
print("All Settings Confimed!")
print("Press Any Key to Save!")
os.pullEvent("key")
success = settings.save(".settings")
if success then
    print("Success!")
    print("Ready to Download RedChat!")
    print("Press Any Key to Save!")
    os.pullEvent("key")
    shell.run("wget", "https://raw.githubusercontent.com/ROBOGUYONLIN/RedChat/refs/heads/main/RedChat.lua", "starup.lua")
    print("Download Complete!")
    print("Press Any Key to Shutdown!")
    os.pullEvent("key")
    os.shutdown()
else
print("An Error Occured")
    print("Press Any Key to Shutdown")
    os.pullEvent("key")
    os.shutdown()
end

