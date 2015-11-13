Deface::Override.new(:virtual_path => "spree/admin/users/_form",
                     :name => "add_hidden_key_to_user_admin_creation",
                    :insert_bottom => "[data-hook='admin_user_form_password_fields']",
                     :text => "<%= hidden_field_tag 'tagmin' %>")