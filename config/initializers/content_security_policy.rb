# Be sure to restart your server when you modify this file.

Rails.application.configure do
  config.content_security_policy do |policy|
    # Por defecto solo permite recursos del propio origen
    policy.default_src :self

    # Imágenes: propio origen + data URIs (avatares inline, etc.)
    policy.img_src :self, :data

    # Fuentes: propio origen + jsdelivr (Bootstrap Icons carga sus fuentes desde allí)
    policy.font_src :self, :data, "https://cdn.jsdelivr.net"

    # Scripts: propio origen + jsdelivr (Bootstrap JS)
    # Los scripts del importmap (inline) reciben nonce automáticamente
    policy.script_src :self, "https://cdn.jsdelivr.net"

    # Estilos: propio origen + jsdelivr (Bootstrap CSS + Bootstrap Icons CSS)
    # unsafe-inline necesario porque Bootstrap aplica estilos inline en dropdowns y modales
    policy.style_src :self, "https://cdn.jsdelivr.net", :unsafe_inline

    # Peticiones fetch/XHR: solo al propio origen (Turbo, formularios)
    policy.connect_src :self

    # Sin plugins Flash ni similares
    policy.object_src :none

    # Impide que la app sea embebida en iframes de otros dominios (anti-clickjacking)
    policy.frame_ancestors :none
  end

  # Nonce aleatorio por petición — más seguro que usar el ID de sesión
  config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }

  # Aplica nonce solo a scripts (no a estilos, ya cubiertos por unsafe-inline)
  config.content_security_policy_nonce_directives = %w[script-src]

  # Rails añade el nonce automáticamente a javascript_importmap_tags y javascript_tag
  config.content_security_policy_nonce_auto = true
end
