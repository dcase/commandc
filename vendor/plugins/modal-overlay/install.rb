require 'fileutils'

this_dir   = File.dirname(__FILE__)
asset_dir  = this_dir + '/lib'
root_dir   = this_dir + '/../../..'
helper_dir = root_dir + '/app/helpers'
js_dir     = root_dir + '/public/javascripts'

FileUtils.cp(asset_dir + '/modal-overlay.js', js_dir)
