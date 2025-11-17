Rails.application.routes.draw do
  # 🏠 Página principal: lista de órdenes de trabajo
  root to: "orden_trabajos#index"

  # =========================================================
  # 📦 ÓRDENES DE TRABAJO
  # =========================================================
  resources :orden_trabajos do
    collection do

      get  :seleccion
      # 🔁 Reordenamiento con drag & drop
      get  :index_reorder
      post :reorder

      # 📅 Vistas específicas
      get :proximo_vencer
      get :planificacion_taller
      get :planificacion_tallerPDF
      get :nueva_ot

      # 🖨️ Vistas de procesos post (1–7)
      get :listado
      get :offset1
      get :offset2
      get :digital
      get :post1
      get :post2
      get :post3
      get :post4
      get :post5
      get :post6
      get :post7
    end
    
    member do
      post :copy     # 👈 DEBE ser POST  
    end
  end
  
    # =========================================================
  # 📥 IMPORTACIÓN DESDE EXCEL
  # =========================================================
  resources :orden_trabajos_imports, only: [:new, :create]

  # =========================================================
  # 🧭 RUTAS “CORTAS” (alias legibles)
  # =========================================================
  # 🔸 Estas rutas son alias que apuntan a las acciones del mismo controlador
  # 🔸 No generan conflictos porque tienen nombres distintos de los helpers Rails estándar
  
  get "seleccion",                 to: "orden_trabajos#seleccion",              as: :seleccion

  #post "/orden_trabajos/:id/copy", to: "orden_trabajos#copy",                   as: :copy_orden_trabajo

  get 'listado',                   to: 'orden_trabajos#listado',                as: :listado
  get 'offset1',                   to: 'orden_trabajos#offset1',                as: :offset1
  get 'offset2',                   to: 'orden_trabajos#offset2',                as: :offset2
  get 'digital',                   to: 'orden_trabajos#digital',                as: :digital
  
  get 'post1',                     to: 'orden_trabajos#post1',                  as: :post1
  get 'post2',                     to: 'orden_trabajos#post2',                  as: :post2
  get 'post3',                     to: 'orden_trabajos#post3',                  as: :post3
  get 'post4',                     to: 'orden_trabajos#post4',                  as: :post4
  get 'post5',                     to: 'orden_trabajos#post5',                  as: :post5
  get 'post6',                     to: 'orden_trabajos#post6',                  as: :post6
  get 'post7',                     to: 'orden_trabajos#post7',                  as: :post7
  
  get "proximo_vencer",            to: "orden_trabajos#proximo_vencer",         as: :proximo_vencer
  get "planificacion_taller",      to: "orden_trabajos#planificacion_taller",   as: :planificacion_taller
  get "planificacion_tallerPDF",   to: "orden_trabajos#planificacion_tallerPDF",as: :planificacion_tallerPDF
  get "nueva_ot",                  to: "orden_trabajos#nueva_ot",               as: :nueva_ot

end
