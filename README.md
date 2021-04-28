# ruby_sketchup_code
Sketchup Ruby code source. Simple scripts for Sketchup. Tools for Sketchup
 
## To start:
1. Open Ruby Console in Sketchup
2. Type and hit Enter:

```ruby
### put your path to file with script
load "dev_ruby_sketchup/test.rb" 
### here you adding item in Plugin menu in Sketchup
UI.menu("Plugins").add_item("Reload My Script"){ load("dev_ruby_sketchup/test.rb") }
```
## List of scripts:
- extract points position from sketchup model [rb_skp_extr_allpts_pos.rb](rb_skp_extr_allpts_pos.rb)
- count connected entities(incl. components and groups) recursively [rb_skp_count_entities.rb](rb_skp_count_entities.rb)


## Performance
Test scene - [Emirates-Stadium 3d model](https://3dwarehouse.sketchup.com/model/d3366f5a29c0868bc275347e4b192d7c/)

- rb_skp_count_entities.rb: 1249.713s
- rb_skp_extr_allpts_pos.rb: 12.136s
