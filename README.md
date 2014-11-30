<h1>animal advent</h1>

<h2>processing puppets;  an animal advent ala ed emberley!</h2>

<p>Background: see the <a href="http://advent.kirk.is/">main website</a>.</p>

<p>Every puppet is made in <a href="https://processing.org/">Processing</a>, 
a great little tool and language for artists and students.</p>

<p>In the <strong>puppets/</strong> folder, each puppet has its own folder and 
.pde file. They all share the puppet.pde which contains a base 
class and some helper classes.</p>

<p>This was my summer and fall "commuter" project, and I was kind of 
making it up as I went along, so some of the code is a bit wonky --
It wasn't always easy to teach a computer to draw like a kid!</p>

<p>(If you are looking for a simpler example, the <strong>bird/</strong> folder has
bird.pde that might be a little easier to get a feel for things. )</p>

<p>For the puppets themselves... the tricky part is going smoothly 
back and forth between the constructed and deconstructed version.
I have a lot code that looks something
like <code>drawCircle(figX(place,BASE*.2),figY(place,BASE*.3),avgd(20,BASE*.4));</code></p>

<p>"place" is an integer reflecting which location the symbol lives at when
the puppet is broken up into pieces. BASE is (more or less) a constant reflecting
the size/scale of the creature. (Every puppet part is placed based on a multiple
of BASE when the puppet is in constructed form.) So "figX" calculates the x position,
at it's "place" if the puppet is deconstructed, at its final location if the puppet
is put together, or somewhere in between during the transition times. </p>

<p>Similarly, "avgd" is the first value when deconstructed, the second value when fully
constructed, or a weighted average during transition times. (Similarly, "zerod" is 
a convenience function that takes the avgd() with zero.)</p>

<p>The "Keeper" has some of these functions, as well as stuff like <strong>k.scaleX</strong>, <strong>k.scaleY</strong>,
and <strong>k.scaleBut</strong> (the bars shown at the top of each button). These represent the mouse
or touch input.</p>

<p>The <strong>web/</strong> folder is what I put at <a href="http://advent.kirk.is/">main website</a>. The page makes 
a use of an animated GIF (for the bird at top), CSS transitions (for the hover and 'today'
flash), localStorage for remembering what has been seen, and jQuery for some of the transitions.</p>

