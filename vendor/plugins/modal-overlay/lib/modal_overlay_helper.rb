module ModalOverlayHelper
   
   Configuration = {
      :use_onclick => true,
      :show  => {
         :onclick  => ";new Ajax.Request(this.href, {method: 'get', asynchronous: false, onSuccess: function(transport) { ModalOverlay.update(transport.responseText); ModalOverlay.show(); }}); return false;",
         :class    => 'modal-overlay-show'
      },
      :hide  => {
         :onclick  => ';ModalOverlay.hide(); return false;',
         :class    => 'modal-overlay-hide'
      }
   }
   
   def link_to_overlay(type, *args)
      
      options = (args.last.kind_of?(Hash) ? args.pop : {})
      
      type_options = Configuration[type]
      
      options[:onclick] = ((options['onclick'] || '') + type_options[:onclick]).strip  if Configuration[:use_onclick]
      options[:class]   = ((options['class']   || '') + type_options[:class]).strip

      args.push(options)
      link_to(*args)
   end
   
   def link_to_show_overlay(*args)
      link_to_overlay(:show, *args)
   end
   
   def link_to_hide_overlay(*args)
      link_to_overlay(:hide, *args)
   end
end
