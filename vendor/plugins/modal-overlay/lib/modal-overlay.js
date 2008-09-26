if(typeof Prototype == 'undefined')
  throw("Datebalks.js requires including the prototype.js library");

var ModalOverlay = {

    DimmerOpacity: 0.75,

    update: function(html) {
        $('modal-overlay').innerHTML = html;
    },

    show: function() {
        if (! $('modal-overlay').visible()) {
            Effect.Appear('modal-overlay-dimmer',  { duration: 0.2, queue: 'overlay', to: ModalOverlay.DimmerOpacity });
            Effect.Appear('modal-overlay',         { duration: 0.2, queue: 'overlay',
                afterFinish: function() {
                    try { Form.focusFirstElement($('modal-overlay').select('FORM').first()); } catch(e) { }
                }
            });
        }
    },

    hide: function() {
        if ($('modal-overlay').visible()) {
            Effect.Fade('modal-overlay-dimmer',  { duration: 0.2, queue: 'overlay' });
            Effect.Fade('modal-overlay',         { duration: 0.2, queue: 'overlay',
                afterFinish: function() {
                    $('modal-overlay').hide();
                    $('modal-overlay-dimmer').hide();
                    ModalOverlay.update('');
                }
            });
        }
    }
}

// ==========================================================================
//
// ModalOverlay: Lowpro behaviours
//
// ==========================================================================

Event.observe(window, 'load', function() {
    Element.insert(document.body, '<div id="modal-overlay" style="position:fixed;top:10em;left:2em;right:2em;bottom:0;z-index:10001;display:none;"></div><div id="modal-overlay-dimmer" style="position:fixed;top:0;left:0;bottom:0;right:0;background-color:black;z-index:10000;display:none;"></div>', {position: 'bottom'}); 
});

if(typeof Event.addBehavior != 'undefined') {

    Event.addBehavior.reassignAfterAjax = true;
    Event.addBehavior({

        '#modal-overlay': function() {
            Event.observe(this, 'keyup', function (e) { 
                if (!e) { e = event; } 
                if (e.keyCode == 27) {
                    ModalOverlay.hide();
                }
            });
        },

        'a.modal-overlay-show': Remote({
            asynchronous: false,
            onSuccess: function(transport) {
                ModalOverlay.update(transport.responseText);
                ModalOverlay.show(); 
            }
        }),

        'a.modal-overlay-hide': function() {
            this.onclick = function() { 
                ModalOverlay.hide(); 
                return false; 
            }
        },

        'form.modal-overlay-form': Remote({method: 'post', asynchronous: false })
    });
}
