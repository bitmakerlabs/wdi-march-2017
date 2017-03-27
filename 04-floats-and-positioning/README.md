# Floats and Positioning

An HTML document will, by default, display from left-to-right, top-to-bottom. We can override this flow by using floats and positioning.

## Agenda
(5 min)

After this lesson, you should have an understanding of:

### Floats

- `left` & `right`
- Wrapping Content
- Clearing Floats
- Containing Floats with `overflow`
- Use Cases


### Positioning

- static
- relative
- absolute
- fixed
- z-index


## Floats
(40 min)


### Lesson Working File

Follow along with the lesson file: [Floats Lesson Working File](floats/lesson/index.html)


### Left & Right

By default, elements are not floated, aka `float: none`

We can float an element by applying `float: left` or `float: right`.

Floated elements are pulled to the inner left or right edge of their containing element, or to the outer edge of a previously floated element.

Floated block level elements, which by default normally have a width set 100% of their containing element, will now only have enough width to hold its content.

When we use float, we usually set the width of the floated element.


### Wrapping Content

If content follows a floated element, and it hasn't been cleared, it will wrap around the floated element.


### Clearing Floats

Use the `clear: both` property on an element to take it out of the previously floated context and restore it back to the regular flow of the document.


### Containing Floats With Overflow

By default, a floated parent element is not aware of its child floated elements, and will set its height accordingly (i.e. ignore the height of its child elements).

To make a parent element aware of its floated child, we need to set its `overflow` property to `auto`, `hidden`, or `scroll`.


### Example Use Cases

- [Two Column Layout](floats/example-use-cases/two-column-layout/index.html)
- [Three Column Layout](floats/example-use-cases/three-column-layout/index.html)
- [Wrap Around An Image](floats/example-use-cases/wrap-around-img/index.html)
- [Grid With Unknown Number of Entities](floats/example-use-cases/grid-with-unknown-number-of-entities/index.html)
- [Large Uppercase First Letter of a Paragraph](floats/example-use-cases/large-uppercase-first-letter-of-a-paragraph/index.html)


---

## Positioning
(30 min)

Follow along with the lesson file: [Positioning Lesson Working File](positioning/lesson/index.html)


### `position: static`:
- by default, all elements are positioned as static
- the `top`, `bottom`, `right`, and `left` properties have no effect on statically positioned elements
- we usually don't explicitly position something as static, as it's the default


### `position: relative`:
- creates a positioning context around the element
- you can see this context using the chrome dev tools
- instructs the element to obey the `top`, `bottom`, `right`, and `left` properties
- the `top`, `bottom`, `right`, and `left` properties accept the various CSS units: `px`, `em`, `%`
- the `top`, `bottom`, `right`, and `left` properties accept negative numbers
- usually we don't specify the `top`, `bottom`, `right`, and `left` for `position: relative`, but rather we use `position: relative` when we want to create a context for inner `absolute` elements to be positioned


### `position: absolute`:
- takes the element out of the regular html flow, and positions according to the nearest parent contained that is positioned as `relative`, `absolute` or `fixed`
- instructs the element to obey the `top`, `bottom`, `right`, and `left` properties


### `position: fixed`:
- like `position: absolute` but context is never parent element but rather is always the browser window
- fixed position elements on the page will remain as other elements scroll by


### `z-index`:
- controls z-axis (front to back)
- used for stacking elements on top of other elements
- natural `z-index` is order of elements in document
- the higher the `z-index`, the closer to the top of the stack it is
- default `z-index` for elements is `0`
- elements with `z-index` set are contained within parent elements that have `z-index` set
- elements must be positioned with `relative`, `absolute` or `fixed` or else a `z-index` property will be ignored
- `z-index` accepts negative numbers, although those can be difficult to work with


### In Class Positioning Exercise: Galaxy Restaurant Menu
(30 minutes)

* [Galaxy Restaurant Menu](positioning/menu-exercise/galaxy-restaurant-menu.pdf)


---

## Recap and Further Resources
(5 min)


### Float Resources

[MDN: float](https://developer.mozilla.org/en-US/docs/Web/CSS/float) (documentation)
[MDN: Floats - learn web development](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats) (tutorial)


### Positioning Resources

[MDN: position] (https://developer.mozilla.org/en/docs/Web/CSS/position) (documentation)
[Learn CSS Layout: Position](http://learnlayout.com/position.html) (tutorial)
[CSS Positioning 101](http://alistapart.com/article/css-positioning-101) (tutorial)
