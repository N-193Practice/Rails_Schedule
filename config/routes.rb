Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # スケジュールのCRUDアクション及び全体のアクションを一括で設定
   resources :schedules
end
