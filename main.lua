MainLang = "en_us.json" -- The main one, that will be duplicated.
Langs = { -- Make sure to put the ones you want.
    "en_au",
    "en_ca",
    "en_gb",
    "en_nz",
    "en_pt",
    "en_ud",
    "fr_ca",
    "fr_fr",
    "lol_us",
    "pl_pl",
    "pt_br",
    "pt_pt"
}

local file, ext = MainLang:match("^(.+)%.(.+)$")

function duplicate(new)
    local primary = io.open(MainLang, "r")
    if not primary then
        print("Error: File " .. MainLang .. " not found!")
        return
    end
    local stuff = primary:read("*all")
    if not stuff then
        print("Error: Failed to read " .. MainLang .. "!")
        return
    end
    primary:close()
    local newFile = io.open(new, "w")
    newFile:write(stuff)
    newFile:close()
    print("Success! " .. new .. " has been created.")
end

print("\n\n\n")
print("Lukiiy's Language Duplicator | v1.0")
print("\nConfiguration:")
print("Main language: " .. file .. "\nMain extension type: " .. ext)
print("\n\n\n")

for i, newFile in ipairs(Langs) do
    duplicate(newFile .. "." .. ext)
end
