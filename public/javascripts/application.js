// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/**
 * Creates a delicious style tagging UI
 */
var TagList = Class.create({      
  initialize: function(line, list) {
    this.line = $(line);      
    this.list = $(list);
    var tagNodes = this.allTagNodes();
    this.line.observe('keyup', this.onTagLineChange.bind(this));
    this.allTagNodes().invoke('observe', 'click', this.onTagClick.bind(this));
    this.updateTagLine(this.fetchCurrentTags());
  },

  onTagLineChange: function(event) {
    this.updateActiveTags();  
  },

  allTagNodes: function() {
    if(this.tagNodes == null) { this.tagNodes = this.list.select('a'); }
    return this.tagNodes;
  },

  onTagClick: function(event) {
    event.stop();
    this.toggleTag(event.findElement('a').innerHTML);
  },

  toggleTag: function(tag) {
    tags = this.fetchCurrentTags();
    if(tags.include(tag)) tags = tags.reject(function(elem){ return elem == tag});
    else tags.push(tag);
    this.updateTagLine(tags);
  },

  tagWords: function() {
    return this.allTagNodes().collect(function(item) { return item.innerHTML; });
  },

  fetchCurrentTags: function() {
    var tags = []
    var tagString = $F(this.line).gsub(/\"(.*?)\"\s*/, function(s) {
      tags.push(s[1]);
      return '';
    })
    return tagString.split(' ').collect(function(tag) {
      return tag;
    }).reject(function(str){
      return str == '';
    }).concat(tags);
  },
  
  tagName: function(s) {
    s = s.strip().toLowerCase().gsub(/[^a-z0-9 \-_@\!\.'\:]/, '')
    return s.indexOf(' ') != -1 ? ('"' + s + '"') : s
  },

  updateTagLine: function(tags) {
    tagList = this;
    this.line.setValue(tags.collect(function(t) { return tagList.tagName(t) }).join(" "));
    this.updateActiveTags(tags);
  },

  updateActiveTags: function(tags) {
    if(!tags) tags = this.fetchCurrentTags();
    this.allTagNodes().each(function(a) {
      if(tags.include(a.innerHTML)) {
        a.addClassName("active"); 
      }
      else  { 
        a.removeClassName("active"); 
      }
    });        
  }  
});
