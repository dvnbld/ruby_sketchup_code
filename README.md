# ruby_sketchup_code
Sketchup Ruby code source. Simple scripts for Sketchup
 
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
