generate_js_routes = lambda do
  JsRoutes.assert_usable_configuration! && JsRoutes.generate!(Rails.root.join('app/assets/javascripts/routes.js'))
end

ActionDispatch::Reloader.to_prepare(&generate_js_routes)