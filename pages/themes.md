# Themes

XMLUI has a powerful theme system that allows you to change the default theme. XMLUI themes are multi-tone: a single theme file defines color variants for the light and dark tones.

## Theme IDs and Tones

Each theme has an identifier. To apply a particular theme, change the "defaultTheme" property in the app's configuration file to its ID. By default, an app uses the light tone; however, you can change it to dark by setting the "defaultTone" property to "dark".

The following sample uses the default theme (its ID is "xmlui") with the default light tone:

<Playground
    fixedTheme={true}
    name="Theme: xmlui (light)"
    app={`
    <Theme tone="light" themeId="xmlui">
        <ThemeGallery />
      </Theme>
    `}
    components={[galleryBrief]}
    height={280}
/>

Change the following properties in the configuration file:

```json
{
  "defaultTheme": "xmlui-purple",
  "defaultTone": "dark"
}
```

Now, you see the purple-shaded XMLUI theme with a dark tone.

<Playground
    fixedTheme={true}
    name="Theme: xmlui (light)"
    app={`
    <Theme tone="dark" themeId="xmlui-purple">
        <ThemeGallery />
      </Theme>
    `}
    components={[galleryBrief]}
    height={280}
/>

## What a Theme Contains [#what-a-theme-contains]

Themes have a simple structure; they have a few properties and define theme variables and resource items. You can define a theme in a JSON file and add it to an app. A theme's JSON file has the following structure:

```json
{
  "id": "<the unique theme ID>",
  "name": "<the optional theme name>",
  "extends": ["<base theme ID 1>, <base theme ID 2>", "<...>"],
  "themeVars": {
    "<theme variable name>": "<theme variable value>",
    "<...>": "<...>",
    "light": {
      "<light tone specific theme variable name>": "<theme variable value>",
      "<...>": "<...>"
    },
    "dark": {
      "<dark tone specific theme variable name>": "<theme variable value>",
      "<...>": "<...>"
    }
  },
  "resources": {
    "<resource name>": "<resource value>",
    "<...>": "<...>"
  }
}
```

Simply said, a theme is a set of theme variables and resource definitions. Let's discuss the properties within a theme definition:

- **`id`**: This property is the unique identifier of the theme, a string.

- **`name`**: You can optionally provide a descriptive name for a theme; the framework may use it in the UI.

- **`extends`**: You do not have to define each theme from scratch; a theme can extend existing themes by defining only those theme variables and resources it intends to modify.

- **`themeVars`**: The theme variables that constitute the particular theme.

- **`resources`**: The resources defined in the particular theme.

When you define theme variables, you can separate tone-independent values from tone-dependent ones. In most cases, tone-dependent variables are colors or color-including values, such as color, background color, shadow, etc. You can separate the color-dependent theme variables by using the "light" and "dark" property names as the following example shows (using theme variables of a fictional `MyComponent`):

```json
{
  "themeVars": {
    "fontSize-MyComponent": "2rem",
    "borderRadius-MyComponent": "8px",
    "borderStyle-MyComponent": "solid",
    "light": {
      "backgroundColor-MyComponent": "white",
      "textColor-MyComponent": "black"
    },
    "dark": {
      "backgroundColor-MyComponent": "black",
      "textColor-MyComponent": "white"
    }
  }
}
```

## Theme Scopes

You can quickly change an app's theme by configuring a different theme in the app's configuration file. In addition to using the app-level theme, you can apply other themes for a particular part of the app.

Use the `Theme` component to wrap a part of the markup and apply a modified theme. With `Theme`, you can change the theme, modify the tone, or even alter particular theme variables.

Let's see a few samples!

The following markup displays the first button's panel with the default theme and the second panel with the "xmlui-green" theme:

```xmlui copy /themeId="xmlui-green"/
  <App>
    <HStack>
      <Button>Button with default theme</Button>
      <Theme themeId="xmlui-green">
        <Button>Button with xmlui-green theme</Button>
      </Theme>
    </HStack>
  </App>
```

<Playground
    fixedTheme={true}
    name="Theme component with a new theme"
    app={`
    <App>
      <HStack>
        <Button>Button with default theme</Button>
        <Theme themeId="xmlui-green">
          <Button>Button with xmlui-green theme</Button>
        </Theme>
      </HStack>
    </App>
    `}
/>

The next sample demonstrates that you can use the `tone` property of `Theme` to set a different tone for a UI patch.

```xmlui copy /tone="dark"/ /tone="light"/
<App>
  <Theme tone="light">
    <Card title="Card with light tone" />
  </Theme>
  <Theme tone="dark">
    <Card title="Card with dark tone" />
  </Theme>
</App>
```

<Playground
    fixedTheme={true}
    name="Theme component with a new tone"
    app={`
    <App>
      <Theme tone="light">
        <Card title="Card with light tone" />
      </Theme>
      <Theme tone="dark">
        <Card title="Card with dark tone" />
      </Theme>
    </App>
  `}
/>

In addition to theme IDs and tones, you can modify particular theme variables, as the following sample demonstrates:

```xmlui copy /color-primary="orangered"/ /borderRadius-Card="40px"/ /color-primary="mediumpurple"/
<App>
  <Theme color-primary="orangered" borderRadius-Card="40px">
    <Card title="Card with custom text color and border radius" />
  </Theme>
  <Theme tone="dark" color-primary="mediumpurple">
    <Card title="Card with dark tone and custom text color" />
  </Theme>
</App>
```

<Playground
    fixedTheme={true}
    name="Theme component with modified theme variables"
    app={`
    <App>
      <Theme color-primary="orangered" borderRadius-Card="40px">
        <Card title="Card with custom text color and border radius" />
      </Theme>
      <Theme tone="dark" color-primary="mediumpurple">
        <Card title="Card with dark tone and custom text color" />
      </Theme>
    </App>
  `}
/>

## Creating Themes

You can quickly create new themes by adding a theme file (with a `.json` extension and JSON syntax) to the app's `themes` folder. The file name should be the same as the `id` within the theme file.

<Callout type="info" emoji="📔">
    XMLUI fetches theme files automatically using this naming convention and looks for them in the `themes` folder. You
    can change the location and the name of the theme file, but in this case, you need to modify the app's configuration
    file. For more information, see the article.
</Callout>

Earlier, you learned that an XMLUI theme file contains theme variables with their theme-specific values. Though the framework works with several hundred theme variables, creating a new theme does not require defining each of them!

When you create a new theme, XMLUI automatically inherits from the default theme, and thus, you need to list only the altered theme variable values.

Let's assume you run this app with the default theme:

```xmlui copy
<App>
  <H1>AcmeUI App</H1>
  <Text>Welcome to the AcmeUI intranet home page!</Text>
  <Button label="Search for more information" />
</App>
```

<Playground
    fixedTheme={true}
    name="Simple app with the default theme"
    horizontal
    app={myThemedApp}
/>

Create a new theme named "my-brand" and save it into the `themes/my-brand.json` file within the app's folder:

```json filename="themes/my-brand.json"
{
  "id": "my-brand",
  "name": "My Brand Theme",
  "themeVars": {
    "fontFamily": "serif",
    "fontSize": "1.2rem",
    "fontFamily-Heading": "sans-serif",
    "fontWeight-H1": "fontWeight-medium",
    "borderRadius": "8px",
    "light": {
      "color-primary": "purple",
      "color": "black"
    },
    "dark": {
      "color-primary": "mediumpurple",
      "color": "white"
    }
  }
}
```

<Callout type="info" emoji="📔">
    This theme definition declares color variants for the light and dark tones. Do not worry if you miss the exact
    meaning of theme variable values. Later in this article, you will learn about how to understand them.
</Callout>

Set this new theme as the default in your app's configuration file:

```json
{
  "defaultTheme": "my-brand"
}
```

Now, your new theme displays the app in a light tone like this:

<Playground
    fixedTheme={true}
    name="Simple app with the default theme"
    horizontal
    app={`
    <Theme tone="light">
      <App>
        <H1>AcmeUI App</H1>
        <Text>Welcome to the AcmeUI intranet home page!</Text>
        <Button label="Search for more information" />
      </App>
    </Theme>
  `}
    defaultTheme="my-brand"
    defaultTone="light"
    themes={[
        {
            name: "My Brand Theme",
            id: "my-brand",
            themeVars: {
                "space-base": "0.35rem",
                "fontFamily": "serif",
                "fontSize": "1.2rem",
                "fontFamily-Heading": "sans-serif",
                "fontWeight-H1": "fontWeight-medium",
                borderRadius: "8px",
                "color": "black",
                "color-primary": "purple",
            },
        }
    ]}
/>

It also handles the dark tone:

<Playground
    fixedTheme={true}
    name="Simple app with the default theme"
    horizontal
    app={`
    <Theme tone="dark">
      <App>
        <H1>AcmeUI App</H1>
        <Text>Welcome to the AcmeUI intranet home page!</Text>
        <Button label="Search for more information" />
      </App>
    </Theme>
  `}
    defaultTheme="my-brand"
    themes={[
        {
            name: "My Brand Theme",
            id: "my-brand",
            themeVars: {
                "space-base": "0.35rem",
                "fontFamily": "serif",
                "fontSize": "1.2rem",
                "fontFamily-Heading": "sans-serif",
                "fontWeight-H1": "fontWeight-medium",
                borderRadius: "8px",
                "color": "white",
                "color-primary": "mediumpurple",
            },
        }
    ]}
/>

## Theme Variable Semantics

The concept of theme variables is pivotal in XMLUI. When you style an app, a component, or a particular part of the app, you do it with theme variables.

<Callout type="info" emoji="💡">
    XMLUI allows the creation of new themes and the customizing of existing ones with the least amount of effort. To
    support this, theme variables have a unique naming convention that the engine leverages when rendering visual
    components.
</Callout>

Each theme variable name follows a naming convention to leverage the arsenal of features the theming engine provides:

```text
<propertyName>-<ComponentId>-<trait1>-<trait2>--<state1>--<state2>--<stateN>
```

In this convention, the `<ComponentId>` part is optional.

- Those theme variables that do not use the `<ComponentId>` segment are _app-bound_ variables, so they define visuals that can be applied to the entire application, including multiple types of components.
- Variables with a `<ComponentId>` segment are _component-bound_ variables, which influence only the component's appearance defined by the corresponding ID.

<Callout type="warning" emoji="💡">
    You can define theme variables that do not follow this convention; we call them _unbound_ variables. You can still
    use them; however, the theming engine simply replaces their occurrences with their values without utilizing
    intelligent feaures provided for app-bound and component-bound variables.
</Callout>

### Properties, Traits, and States

<Callout type="info" emoji="💡">
    Each theme variable is used to define the value of a property influencing the visual appearance of a particular part
    of the UI. The `
    <propertyName>` segment defines such a visual property.
</Callout>

Here are a few examples:

- `color`: text color (or forecolor)
- `backgroundColor`: background color
- `text-size`: the size of the text
- `lineHeight`: the height of a text line
- `paddingHorizontal`: The value declaring the horizontal padding space

The `<propertyName>` segment should use lowercase letters and dashes.

    For the complete list of available `
<propertyName>` values, see the <SmartLink href={THEME_VARIABLES_PROPERTY_NAMES}>Theme Property
    Names</SmartLink> article under "Theme Variables".

    The `
<trait1>` and `
<trait2>` segments describe one or two traits regarding a particular component.

    For example, the `Button` component has two traits that define its appearance. The `themeColor` trait defines theset
    of colors to use with the button; its available values are `primary`, `secondary`, and `attention`. The`variant`
    trait specifies the general appearance of the button (whether it has a border at all, etc.) with thevalues of
    `solid`, `outlined`, or `ghost`. The `themeColor` is the first trait, and `variant` is the second. So, wecan use
    (among others) these theme variables to modify button colors:

    - `backgroundColor-Button-primary-solid`: Defines the background color of a button that is set up to use the `primary`theme
    color, displayed with the `solid` variant.
    - `borderColor-Button-attention-ghost`: Specifies the border color of a ghost button displayed with the `attention`
    theme color.

    See the <SmartLink href={THEME_VARIABLES_APP_BOUND_TRAITS}>App-Bount Traits</SmartLink> article under "Theme
    Variables" for the complete list of app-bound traits. You can check the traits of a particular component on its
    reference page.

    The `
<state1>`, ..., `
<stateN>` values define visual states that may modify the appearance of a particular UI element or component (regardinga
    specific trait). Here are a few examples:

    - `hover`: The mouse is hovered over the component
    - `active`: The particular component is being activated by the user (for example, a user presses down the mouse
    button while over a button element)
    - `focus`: The particular element (e.g., a textbox) currently has the focus

    When defining a theme variable, you can define multiple state values (in any order). Let's see a few examples:

    - `backgroundColor-Button-primary-solid--hover`: The background color to use with a `solid` button and with the `primary`
    theme color while the mouse hovers over it.
    - `borderColor-Button-attention-ghost--focus`: Specifies the border color of a focused ghost button displayed with
    the `attention` theme color.

    For the complete list of available `
<state>` values, see the <SmartLink href={THEME_VARIABLES_VISUAL_STATES}>Visual States</SmartLink> article in the "Theme
    Variables" reference.

    ### Theme Variable Chaining

    Earlier, you have learned that theme variables following the naming conventions above are either app- or
    component-bound. When the name contains a `<ComponentId>` section, it is bound to the component with that ID. The
    component ID is always the name of the component (with the exact case) as you use them in the markup. For example,
    `Button` for the `<Button>` component, `Card` for the `<Card>` component, and so on.

    <Callout type="info" emoji="📔">
        The individual XMLUI components are built to leverage as many app-bound theme properties as possible. Their
        design ensures that you can change their visual appearance by modifying only a few theme variables and also
        allows you to fine-tune component styles.
    </Callout>

    The theming engine uses several techniques to achieve this behavior. One of them is _theme variable chaining_.

    This approach means that theme variables compose a chain and most fall back to a previous variable on that chain
    that is more generic. For example, here is a chain that sets the border color of a solid button using the primary
    color when the mouse hovers over it:

    ```text
    color-primary
    textColor-Button
    backgroundColor-Button
    backgroundColor-Button-solid
    backgroundColor-Button-primary
    backgroundColor-Button-primary-solid
    backgroundColor-Button-primary-solid--hover
    ```

    Theme variable chaining has two significant behaviors:

    - **Traversal from the chain's last (bottom) element toward the first (top).** When the engine looks for a
    particular theme variable value, it searches it from the bottom toward the top until it finds the particular
    variable value to use.
    - **Tail pruning**. When you set the value of a theme variable somewhere in the chain, the other variables toward
    the bottom of the chain get cleared (they lose their values).

    <Callout type="info" emoji="📔">
        Components may add logic to generate undefined lower-level theme variable values from upper-level values. For
        example, the `Button` component automaticaly creates fallback colors when the `textColor-Button` theme variable is
        set.
    </Callout>

    ### Changing App-Bound Variables

    Let's examine these behaviors with examples! Here, you see a gallery of assorted buttons, a badge, and a few text
    components using the default theme (light):

    <Playground
        fixedTheme={true}
        name="Gallery with the default theme"
        app={gallery}/>

    Let's update the value of `color-primary`. This theme variable is at the top of the theme variable chain.

    ```json
    {
        "color-primary": "orangered"
    }
    ```

    Due to the theme variable chaining, all components using the primary color (`Button` instances with their theme
    color property set to `primary` and `Badge` leverage the primary color) immediately change their appearance:

    <Playground
        fixedTheme={true}
        name="Changing 'color-primary'"
        app={gallery}
        defaultTheme="sample"
        themes={[
            {
                name: "Sample",
                id: "sample",
                tone: "light",
                themeVars: {
                    "color-primary": "orangered",
                },
            },
        ]}
    />

    Try moving the mouse over the buttons labeled as primary and click them! You can see that the change in the
    `color-primary` theme variable affects other button colors, like the one used to indicate the hovered and pressed
    states. The theming engine ensures that the changes in `color-primary` update the related visual properties
    automatically. Besides the hover color, the border color changes, too.

    ### Changing Component-Bound Variables

    Changing `color-primary` updated the primary color of all components, including the `Badge`. Suppose you want to
    keep the `Badge` component intact, because you intend to change only button colors. In that case, you should use the
    more specific `textColor-Button` theme variable, which (as it is a component-bound theme variable), affects only the
    `Button` component:

    ```json
    {
        "color-Button": "orangered"
    }
    ```

    The result demonstrates that the `Badge` component remained intact. However, all buttons, independently of their
    color theme (`primary`, `secondary`, or `attention`) and variant (`solid`, `outlined`, or `ghost`) use the same
    colors.

    <Callout type="info" emoji="📔">
        The `Button` component responds to the changes of the `textColor-Button` and updates the background, text, and
        border colors accordingly. It also updates the colors to use with the hover and active states.
    </Callout>

    <Playground
        fixedTheme={true}
        name="Changing 'textColor-Button'"
        horizontal={true}
        app={gallery}
        defaultTheme="sample"
        themes={[
            {
                name: "Sample",
                id: "sample",
                tone: "light",
                themeVars: {
                    "textColor-Button": "orangered",
                },
            },
        ]}
    />

    ### More Specific Variable Changes

    The single change of `textColor-Button` redefined all button colors, which goes against the intention of having several
    theme colors. If you intend to change only the solid button using the primary color, the best theme variable to
    modify is `textColor-Button-primary-solid`:

    ```json
    {
        "textColor-Button-primary-solid": "orangered"
    }
    ```

    The name of the property tells everything about its effect. Here, you can check that it affects only one of the
    buttons, as expected. Buttons with secondary and attention colors or using the outlined and ghost variants are
    intact.

    <Playground
        fixedTheme={true}
        name="Changing 'textColor-Button-primary-solid'"
        horizontal={true}
        app={gallery}
        defaultTheme="sample"
        themes={[
            {
                name: "Sample",
                id: "sample",
                tone: "light",
                themeVars: {
                    "textColor-Button-primary-solid": "orangered",
                },
            },
        ]}
    />

    Sometimes, you want to override a single visual property of a component, like the background color of the button
    when it is hovered:

    ```json
    {
        "backgroundColor-Button--hover": "orangered"
    }
    ```

    This theme variable works as you expect! Move the mouse over any button to test the hover effect:

    <Playground
        fixedTheme={true}
        name="Changing 'backgroundColor-Button--hover'"
        horizontal={true}
        app={gallery}
        defaultTheme="sample"
        themes={[
            {
                name: "Sample",
                id: "sample",
                tone: "light",
                themeVars: {
                    "backgroundColor-Button--hover": "orangered",
                },
            },
        ]}
    />

    Following this pattern, you can tighten the theme variable to affect only a single button type's hover color, like
    in this sample:

    ```json
    {
        "backgroundColor-Button-primary-solid--hover": "orangered"
    }
    ```

    Try the hover effect now! You can see now it affects only the top-left button (using the primary color theme with
    the solid variant):

    <Playground
        fixedTheme={true}
        name="Changing 'backgroundColor-Button-primary-solid--hover'"
        horizontal={true}
        app={gallery}
        defaultTheme="sample"
        themes={[
            {
                name: "Sample",
                id: "sample",
                tone: "light",
                themeVars: {
                    "backgroundColor-Button-primary-solid--hover": "orangered",
                },
            },
        ]}
    />

    ### Component Theme Classes

    Components can form a theming hierarchy. For example, many components represent some input fields, as the following
    example shows:

    ```xmlui {3,4}
    <Form id="driveForm" data="{{car: 'Toyota Celica', year: '1999'}}" padding=1em>
      <FlowLayout paddingBottom=1em gap=1em>
        <FormItem width="50%" label="Car Type" bindTo="car" autoFocus="true" type="text"/>
        <FormItem width="50%" label="Year" bindTo="year" autoFocus="true" type="integer"/>
      </FlowLayout>
    </Form>
    ```

    <Playground fixedTheme={true} name="Input components" horizontal={true} app={inputs}/>

    If you want to change their border rounding while keeping other components, such as the buttons intact, you could
    create a derived theme like this:

    ```json
    {
        "id": "rounded",
        "name": "Rounded theme",
        "themeVars": {
          "borderRadius-TextBox": "160px",
          "borderRadius-NumberBox": "160px"
      }
    }
    ```

    The new theme works as you expect:

    <Playground
        fixedTheme={true}
        name="Input components with theme #1"
        horizontal={true}
        app={inputs}
        defaultTheme="rounded"
        themes={[
            {
                name: "Rounded",
                id: "rounded",
                themeVars: {
                    "borderRadius-TextBox": "160px",
                    "borderRadius-NumberBox": "160px",
                },
            },
        ]}
    />

    Many components function as inputs. When you change some of their more generic visual attributes, such as the
    rounding of borders, you will likely change the same attribute of multiple component types. For example, you changed
    the border rounding of two components in the previous sample.

    What if you intend to change the rounding of ten input component types? Following the pattern above, you would endup
    with a theme with different `borderRadius-
<component-name>` theme variables.

    XMLUI provides a faster way to do this. Define the theme like this:

    ```json
    {
        "id": "rounded",
        "name": "Rounded theme",
        "themeVars": {
          "borderRadius-Input": "160px",
          "backgroundColor-Input": "papayawhip"
        }
    }
    ```

    This theme changes the rounding and the background color of **all** input components:

    <Playground
        fixedTheme={true}
        name="Input components with theme #2"
        horizontal={true}
        app={inputs}
        defaultTheme="rounded"
        themes={[
            {
                name: "Rounded",
                id: "rounded",
                themeVars: {
                    "borderRadius-Input": "160px",
                    "backgroundColor-Input": "papayawhip",
                },
            },
        ]}
    />

    The key to this behavior is the `Input` component name within the `borderRadius-Input` and `backgroundColor-Input` variable
    names.

    There is no `Input` component. `Input` is just an abstract *theme class name* used from theming. The `TextBox`,
    `NumberBox`, and other input components inherit visual attributes from this abstraction. This abstraction adds new
    theme variables to the theme variable chain of input components.

    For example, the border rounding-related theme variable chain is the following for the `TextBox`:

    ```text
    borderRadius
    borderRadius-Input
    borderRadius-TextBox
    ```

    <Callout type="info" emoji="📔">
        The reference information of components describes the theme classes a particular component inherits from.
    </Callout>
