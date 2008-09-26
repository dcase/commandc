$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'modal_overlay_helper'

ActionView::Base.class_eval do
   include ModalOverlayHelper
end
