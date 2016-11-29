ActiveAdmin.register User do

  permit_params :blocked


  index do
    column :email
    column :password_encryptable
    column :current_sing_in_at
    column :last_sing_in_at
    column :blocked
    column :created_at
    column :updated_at
    column :failed_attempts
    actions
  end


  form do |f|
   f.inputs 'Details' do
     f.input :blocked
   end

   f.actions
 end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
