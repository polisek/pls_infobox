-------------------------------------------------------------------------------
--------------------------------Events-----------------------------------------
-------------------------------------------------------------------------------

RegisterNetEvent('pls_infobox:client:open')
AddEventHandler('pls_infobox:client:open', function(data)
 
    openInfobox(data)

end)

RegisterNetEvent('pls_infobox:client:openInfoBox')
AddEventHandler('pls_infobox:client:openInfoBox', function(data)
 
    SetNuiFocus(true, true)
    SendNUIMessage(data)

end)


RegisterNetEvent('pls_infobox:client:closing')


RegisterNetEvent('pls_infobox:client:exampleevent')
AddEventHandler('pls_infobox:client:exampleevent', function(data)
 
    print("Polisek made me! Ehm me like a script.. ")

end)




-------------------------------------------------------------------------------
--------------------------------Callbacks--------------------------------------
-------------------------------------------------------------------------------

RegisterNUICallback('closeInfoBox', function(data, cb)
    SetNuiFocus(false,false)
    TriggerEvent("pls_infobox:client:closing")
end)


RegisterNUICallback('confirmbutton', function(data, cb)
    local cldata = data.value
    if cldata.event ~= nil then
        if cldata.args == nil then
            TriggerEvent(cldata.event)
        else
            TriggerEvent(cldata.event,cldata.args)
        end
        
    end
    SetNuiFocus(false,false)
    TriggerEvent("pls_infobox:client:closing")
end)

-------------------------------------------------------------------------------
--------------------------------Functions--------------------------------------
-------------------------------------------------------------------------------


function openInfobox(data)
    if data == nil then
        print("[pls_infobox] - Data in infobox is empty..")
    else
        if data.title == nil then
            data.title=" "
        else
            if data.content == nil then
                print("[pls_infobox] - Data content in infobox is empty..")
            else
                if data.button == nil then
                    data.button={
                        text=Config.DefaultButtonText,
                        event="",
                        args={}
                    }
                end
                data.action = "open"
                TriggerEvent("pls_infobox:client:openInfoBox",data)
            end
        end
    end
end

function closeInfobox()
    SetNuiFocus(false,false)
    SendNUIMessage({action="close"})
    TriggerEvent("pls_infobox:client:closing")
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end


 -------------------------------------------------------------------------------
--------------------------------Commands---------------------------------------
-------------------------------------------------------------------------------

-- #br #/br - Řádek níže
-- #b #/b - Tučný text
-- #clred #/cl - Barva červená u textu
-- #clblue #/cl - Barva modrá u textu
-- #clgreen #/cl - Barva zelená u textu
-- #clwhite #/cl - Barva bílá u textu
-- #clpink #/cl - Barva růžová u textu

RegisterCommand('exampleopeninfobox', function(source, args)
    if Config.AllowExample == true then
        openInfobox({
            title="Welcome in Saint Denis",
            content={
                {
                    uname="mess1",
                    menu="Test 1",
                    heading="Test message 1",
                    content="Lorem ipsum 1",
                },
                {
                    uname="mess2",
                    menu="Test 2",
                    heading="Test message 2",
                    content="Lorem ipsum 2",
                },
                {
                    uname="mess3",
                    menu="Test 3",
                    heading="Test message 3",
                    content=" #clred Lorem #/cl ipsum #clgreen3#/cl #b #br test #/b #br Hello",
                },
            },
            button={
                text="Read it this",
                event="pls_infobox:client:exampleevent",
                args={"test","test"}
            }
        })
    end
end)


RegisterCommand('examplecloseinfobox', function(source, args)
    if Config.AllowExample == true then
        SetNuiFocus(false,false)
        TriggerEvent("pls_infobox:client:closing")
    end
end)
