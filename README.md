# material-xsl
Who said you needed Javascript for modular, reusable Material design web apps?

![Screenshot](https://i.imgur.com/bmWk21O.png)

## What is material-xsl?

Material-xsl is an XSL interpretation of material design. XSL is a well-supported standard and was used before Javascript became mainstream. This has some benefits:

- Browser doesn't need Javascript enabled to render the page
- No need to compile the source code using complicated build tools
- Lightweight
  - Browser can cache the XSL parser - removing the need to duplicate HTML snippets across pages
- HTML is pre-processed by the browsers XML engine
  - All HTML tags can be closed inline.
  - XSL variables can be used inside `<style>` and `<script>` tags.

## Demo

https://samdd.me/material-xsl/

## Example

```html
<?xml-stylesheet type="text/xsl" href="material.xsl" ?>

<root>
  <html>
    <div>
      <md-button color="default">Default</md-button>
      <md-button color="primary">Primary</md-button>
      <md-button color="secondary">Secondary</md-button>
    </div>
  </html>
</root>
```
