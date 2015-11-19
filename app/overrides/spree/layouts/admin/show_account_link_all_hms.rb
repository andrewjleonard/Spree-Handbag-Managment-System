Deface::Override.new(:virtual_path => 'spree/admin/users/_form',
                     :name         => 'header_modification',
                     :replace      => 'erb[loud]:contains("spree/shared/header")',
                     :partial      => 'spree/shared/spree_application'
                    )