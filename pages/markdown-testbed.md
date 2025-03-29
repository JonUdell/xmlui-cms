# Markdown Test Page

## Blockquotes

> This is a blockquote
>
> > This is a nested blockquote
>
> Back to the first level

## Callout / admonition

Text above

> [!INFO]
> This is INFO

Text below

Text above

> [!WARNING]
> This is WARNING

Text below

## Headers

# H1 Header
## H2 Header
### H3 Header
#### H4 Header
##### H5 Header
###### H6 Header



## Text Formatting

**Bold text** and __also bold text__

*Italic text* and _also italic text_

***Bold and italic text*** and ___also bold and italic___

~~Strikethrough text~~

`Inline code` with backticks

## Links

[Basic link to Google](https://www.google.com)

[Link with title](https://www.google.com "Google's Homepage")

<https://www.example.com> (Automatic link)

## Images

![Alt text for image](resources/xmlui-logo.svg "Image Title")

<img alt="alt text" src="resources/xmlui-logo.svg"/>



## Lists

### Unordered Lists

* Item 1
* Item 2
  * Nested item 2.1
  * Nested item 2.2
* Item 3

- Another item 1
- Another item 2

+ Yet another item 1
+ Yet another item 2

### Ordered Lists

1. First item
2. Second item
   1. Nested item 2.1
   2. Nested item 2.2
3. Third item

### Task Lists

- [x] Completed task
- [ ] Incomplete task
- [x] Another completed task

## Code Blocks

```
// Code block without syntax highlighting
function test() {
  console.log("This is a test");
}
```

```javascript
// Code block with JavaScript syntax highlighting
function test() {
  console.log("This is a JavaScript test");
}
```

```python
# Code block with Python syntax highlighting
def test():
    print("This is a Python test")
```

## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
| Cell 7   | Cell 8   | Cell 9   |

| Left-aligned | Center-aligned | Right-aligned |
|:-------------|:--------------:|---------------:|
| Left         | Center         | Right          |
| Left         | Center         | Right          |

## Horizontal Rule

---

***

___

## Line Breaks and Paragraphs

This is the first paragraph.

This is the second paragraph.

This line has a line break at the end.
And this continues on a new line.

## Escaping Characters

\*This is not italic\*

\`This is not code\`

## HTML in Markdown

<div style="color: darkblue; font-family:serif; font-weight:bold">
  This is HTML inside Markdown, with local styles
</div>

<table>
  <tr>
    <td>HTML Table Cell 1</td>
    <td>HTML Table Cell 2</td>
  </tr>
</table>

## Definition Lists

Term 1
: Definition 1

Term 2
: Definition 2a
: Definition 2b

## Footnotes

Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.


## Comments

[//]: # (This is a comment that won't be rendered)

<!-- This is another comment that won't be rendered -->