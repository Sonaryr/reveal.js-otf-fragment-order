# reveal.js - On-the-fly fragment order
This is a plugin make the order in which the fragments trigger dynamic.

An ideal situation where this can be used is with a question you ask your audience and they don't answer in the order you programmed your list.

An example: you are giving a presention about Snow White. Off course you like to tell them about the dwarves too.
You put them in the following order: Doc, Grumpy, Happy, Sleepy, Bashful, Sneezy, Dopey.
And you want some interaction with your audience so you ask them if they know any of them already. Offcourse the first one they mention is Grumpy.
But you can't display him just yet because you will already show them one they haven't said yet... How can you solve this issue?

**With this plugin offcourse!**

##Installation
First of all download the code, It's available in CoffeeScript and plain JavaScript, and place it in `plugin/otf-fragment-order`

The second thing to do, is include it as a dependency in your initialization. And enable it.
```javascript
Reveal.initialize({
    ...
    otfFragmentOrder: true,
    ...
    dependencies: [
        ...
        { src: 'plugin/otf-fragment-order/otf-fragment-order.js', async: true, condition: function() { return !!document.body.classList; } }
    ]
});
```
And the last thing to do is to add a data attribute to your slide.
```html
<section data-otf-fragment-order-slide>
	<h2>The seven dwarf</h2>
	<p>Do you know them all?</p>
	<ul>
	  <li class="fragment">Doc<li>
	  <li class="fragment">Grumpy<li>
	  <li class="fragment">Happy<li>
	  <li class="fragment">Sleepy<li>
	  <li class="fragment">Bashful<li>
	  <li class="fragment">Sneezy<li>
	  <li class="fragment">Dopey<li>
	</ul>
</section>
```
That all for installation

##Usage in presentation
On this slide when they tell you Grumpy now, you are prepared!

Just use the numerical keys on the top of your keyboard for the number you want to show, so for Grumpy you type 2.
This way you can be completly interactive with your audience.
