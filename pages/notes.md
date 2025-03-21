# Notes

## Themes and config

There are two ways to set the default theme in a standalone app:

### 1. Use the `defaultTheme` property of `App`

```xml
<App defaultTheme="myThemeId">
  <!-- ... -->
</App>
```

### 2. Use the config.json file


```json
{
  "defaultTheme": "cms-theme",
  "themes": [
    "themes/cms-theme.json"
 ]
}
```

The browser cannot check the folder and file structure on the web server, so we must list the available themes in the `themes` property. The app will load all the listed theme files and use the `themeId` to look up the particular theme named in `defaultTheme`.

I have just added a convenience feature to xmlui. If you have a single theme, it is enough to use `defaultTheme`. The engine will fetch the theme from `themes/<themeId>.json`:

```json
{
  "defaultTheme": "cms-theme"
}
```

If you have a `themes` list, managing themes returns to case #1.

## Theme Definition

I have removed `Theme` from Main.xmlui and put it into `themes/cms-theme.json`:

```json
{
  "name": "CMS Theme",
  "id": "cms-theme",
  "themeVars": {
    "backgroundColor-Blockquote": "$backgroundColor",
    "borderRadius-Blockquote": "0",
    "accent-Blockquote": "gray",
    "backgroundColor-Admonition": "#e8e8e8",
    "borderRadius-Admonition": "$space-4",
    "iconSize-Admonition": "2rem",
    "marginTop-Text": "$space-4",
    "marginBottom-Text": "$space-4",
    "color-HtmlAnchor": "#0000EE",
    "color-HtmlAnchor--active": "#FF0000",
    "color-HtmlAnchor--visited": "#551A8B",
    "color-HtmlAnchor--hover": "#0000EE"
  }
}
```

## Using raw markdown files

You can find an example of using a raw markdown file in Main. xmlui. This page uses the `page/notes.md` file.

```xml
<Page url="/notes">
  <DataSource id="notesContent" url="pages/notes.md" />
  <Markdown content="{notesContent.value}" />
</Page>
```

I think there must be a more straightforward way to do it without needing a `DataSource.` I will conceive something.