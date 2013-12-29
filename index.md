---
layout: page
title: Trinker's R Blog
tagline: Experiments & Experiences in R
---
{% include JB/setup %}

<div class="row">
  <div class="span12">
    <div class="row">
      <div class="span9">

        {% for post in site.posts limit:5 %}
        <div class="row">
          <div class="span2">
            <h5 class="post-date" align="right">{{ post.date | date: "%e %B %Y" }}</h5>
          </div>
          <div class="span7">
            <h2><a class="post-title" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
            {% if post.description %}
            <h3> {{ post.description }} </h3>
            {% endif %}
            
              {{ post.content }}
              
              <a href="{{ BASE_PATH }}{{ post.url }}#comments">comments</a>
            <hr>
            <br />
            <br />
          </div>
        </div>
        {% endfor %}

      </div>
    </div>
  </div>
</div>



