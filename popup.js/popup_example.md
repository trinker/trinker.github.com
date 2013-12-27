---
title      : popup.js Demonstration
subtitle   : 
author     : Tyler Rinker
job        : 
logo       : beaker.jpg
biglogo    : 
license    : 
framework  : io2012
highlighter: highlight.js
hitheme    : tomorrow
mode       : standalone
widgets    : [mathjax, quiz, bootstrap]
---


<style>
body {
  background-color: #000;
}
.quiz-option label{
  display: inline;
  font-size: 1em;
}
.refs {
  padding-left: 80px;
  text-indent: -35px;
}
ul.nav li::before { content: ""; } 
ul.nav li{ font-size: 18px; line-height: 24px;}
</style>


## Read-And-Delete

<a href="somewhere.html" onmouseover="nhpup.popup('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');">some text</a>    


<a onmouseover="nhpup.popup('Here, a good friend: &lt;br&gt;&lt;/a&gt;&lt;br/&gt; &lt;img src=&quot;http://images4.wikia.nocookie.net/__cb20101015151248/muppet/images/0/05/Beaker.jpg&quot;&gt;', {'width': 140});">a picture</a>


<a href="somewhere.html" onmouseover="nhpup.popup($('#hidden-table').html(), {'width': 400});">a table</a>
</p>

<div style="display:none;" id="hidden-table">
  <table width="400" border="1">
    <tbody>
        <tr>
            <th>Name</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Hans</td>
            <td>22</td>
        </tr>
        <tr>
            <td>Gretchen</td>
            <td>22</td>
        </tr>
    </tbody>
</table>
</div>

   


---

<div class="testpup" onmouseover="nhpup.popup('A default popup ...');">
    hover over me
</div>
<div class="testpup"
     onmouseover="nhpup.popup('This has CSS class pup_class2 ...',
                              {'class': 'pup_class2'});">
    hover over me
</div>
<div class="testpup"
     onmouseover="nhpup.popup('This has CSS class pup_class3 and a distinct width of 400px ...',
                              {'class': 'pup_class3', 'width': 400});">
    hover over me
</div>
<div class="testpup" id="rather_wide"
     onmouseover="nhpup.popup('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut arcu magna. Donec lectus turpis, aliquet ut iaculis quis, dignissim sed lacus. Praesent porta mi a lorem ultricies ac pretium ligula ultricies. Sed vitae libero ut tellus scelerisque posuere eu vitae est. Suspendisse convallis nisl ut erat aliquet id pellentesque diam ullamcorper. Proin dapibus placerat erat, ac porttitor lacus tristique sit amet. Nulla nisl purus, sollicitudin vitae egestas at, ultricies vel elit. Praesent feugiat purus et turpis commodo eget ullamcorper enim rhoncus. Curabitur sed nisl et libero interdum mollis a non odio. Fusce libero mauris, lacinia id viverra eget, malesuada sed risus. Sed ut tempus libero.', {'width': 700});">
    hover over me (this is gonna be big, though)
</div>
<div class="testpup" id="rather_tall"
     onmouseover="nhpup.popup('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut arcu magna. Donec lectus turpis, aliquet ut iaculis quis, dignissim sed lacus. Praesent porta mi a lorem ultricies ac pretium ligula ultricies. Sed vitae libero ut tellus scelerisque posuere eu vitae est. Suspendisse convallis nisl ut erat aliquet id pellentesque diam ullamcorper. Proin dapibus placerat erat, ac porttitor lacus tristique sit amet. Nulla nisl purus, sollicitudin vitae egestas at, ultricies vel elit. Praesent feugiat purus et turpis commodo eget ullamcorper enim rhoncus. Curabitur sed nisl et libero interdum mollis a non odio. Fusce libero mauris, lacinia id viverra eget, malesuada sed risus. Sed ut tempus libero.', {'width': 300});">
    hover over me (this is gonna be big, though)
</div>


---

# Change width (500)

<a href="somewhere.html" onmouseover="nhpup.popup('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', {'width': 500});">some text</a>
 

---

# Wider still...

<a href="somewhere.html" onmouseover="nhpup.popup('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', {'width': 1000});">some text</a>


--- .refs

## References

Work based on Nicolas Honing's [popup.js (https://github.com/nhoening/popup.js)](https://github.com/nhoening/popup.js)
