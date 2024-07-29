# Samurais-Scripts
A base for a Lua script centered around roleplaying and having fun in a game full of ad bots and toxic cheaters.

> [!NOTE]
> This is a basic template and only a few test features are present. More will be added in the future.

## Contributing To Translations
#### Editing a pre-existing language:
1. Fork the repo then open `/lib/Translations.lua`
2. Find each entry for the language you want to modify/correct and edit the `text = ` field.
   
   **Example:**
     ```lua
     ["Self"] = {
        {iso = "fr-FR", text = "Traduction du mot 'Self' en Français."},
     },
     ```
3. Open a PR.
#### Adding a new language:
1. Follow the same structure by adding a new table under each field containing your language's iso code and the translated text. So let's suppose you want to add Portuguese support:

   **Example:**
     ```lua
     ["Self"] = {
       {iso = "fr-FR", text = "Traduction du mot 'Self' en Français."},
     -- leave the other tables as they are and add yours below the last one:
       {iso = "pt-BR", text = "Tradução da palavra 'Self' em Português."},
     },
     ```
2. Open a PR. Your language will be added to the main script's language list under '**Settings**' if it doesn't already exist. Alternatively you can add it yourself by editing the `lang_T` table and following the same structure.

## Contributing To The Main Script
- If you have any feature you want to add to the script, feel free to open a PR. If the feature code is not yours, make sure you have permission from the author before contributing it.

## TODO:

- [x] Merge YimActions. ✔️ Done but still missing a lot of translations.
- [ ] Add new features.

## Credits

| Awesome Person                                | Contribution                                                |
|     :---:                                     | :---:                                                       |
| [rxi](https://github.com/rxi)                 | [json.lua](https://github.com/rxi/json.lua)                 |
| [Harmless](https://github.com/harmless05)     | Config system & Shift-Drift                                 |
| [NiiV3AU](https://github.com/NiiV3AU)         | German translations                                         |
| [xiaoxiao](https://github.com/xiaoxiao921)    | Wrote YimMenu's Lua API                                     |
| [YimMenu](https://github.com/YimMenu/YimMenu) | I was never fond of any other project. It's just beautiful! |
| [lua-users.org](http://lua-users.org/)        | [LuaXml](http://lua-users.org/wiki/LuaXml)                  |
