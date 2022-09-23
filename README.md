# pls_infobox

Simple infoboxes for RedM!


# Code example

Client
```
exports["pls_infobox"]:openInfobox({
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
```

Server
```

TriggerClientEvent("pls_infobox:client:open", src,{
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
```

# Text visual example
```
-- #br #/br - Line down
-- #b #/b - Bold text
-- #clred #/cl - Text color red
-- #clblue #/cl -Text color blue
-- #clgreen #/cl - Text color green
-- #clwhite #/cl - Text color white
-- #clpink #/cl - Text color ping

        {
            uname="mess3",
            menu="Test 3",
            heading="Test message 3",
            content=" #clred Lorem #/cl ipsum #clgreen3#/cl #b #br test #/b #br Hello",
        },


```
![image](https://user-images.githubusercontent.com/107623238/192042111-412309af-b4c3-4943-a2a9-fe8c4ed35077.png)




# Instalation

add pls_infobox to your resource folder

ensure pls_infobox

# Easy settings
![image](https://user-images.githubusercontent.com/107623238/192040452-35244ddc-00f7-4589-b7ed-4f7ef0c3516d.png)


# Preview

![image](https://user-images.githubusercontent.com/107623238/192040539-04f53f09-a8b0-4f59-8648-35b6607fc040.png)

https://youtu.be/p73ldJJ8E5I

# Support
- discord : https://discord.gg/VvRGG6rPCc
- email : polismanovicp@gmail.com
- support: https://paypal.me/Polisek?country.x=CZ&locale.x=cs_CZ
