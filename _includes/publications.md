<h2 id="publications" style="margin: 2px 0px -15px;">Publications</h2>

<div class="publications">

{% for section in site.data.publications.sections %}
<h4 style="margin: 18px 0px -12px;">{{ section.heading }}</h4>

<ol class="bibliography">
{% for link in section.items %}
<li style="margin-bottom: 10px;">
  <div class="title">{% if link.pdf %}<a href="{{ link.pdf }}" target="_blank">{{ link.title }}</a>{% else %}{{ link.title }}{% endif %}</div>
  <div class="author">{{ link.authors }}</div>
  <div>
    <em>{{ link.conference }}</em>
    {% if link.pdf %}&nbsp;<a href="{{ link.pdf }}" class="btn btn-sm z-depth-0" role="button" target="_blank" style="font-size:12px;">[PDF]</a>{% endif %}
    {% if link.arxiv %}<a href="{{ link.arxiv }}" class="btn btn-sm z-depth-0" role="button" target="_blank" style="font-size:12px;">[arXiv]</a>{% endif %}
    {% if link.code %}<a href="{{ link.code }}" class="btn btn-sm z-depth-0" role="button" target="_blank" style="font-size:12px;">[Code]</a>{% endif %}
    {% if link.page %}<a href="{{ link.page }}" class="btn btn-sm z-depth-0" role="button" target="_blank" style="font-size:12px;">[Project Page]</a>{% endif %}
    {% if link.bibtex %}<a href="{{ link.bibtex }}" class="btn btn-sm z-depth-0" role="button" target="_blank" style="font-size:12px;">[BibTex]</a>{% endif %}
    {% if link.notes %}<strong><i style="color:#e74d3c">{{ link.notes }}</i></strong>{% endif %}
  </div>
</li>
{% endfor %}
</ol>
{% endfor %}

</div>
