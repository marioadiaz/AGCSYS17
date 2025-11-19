// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import SortableController from "controllers/sortable_controller"
import SeleccionController from "controllers/seleccion_controller"


application.register("sortable", SortableController)
application.register("seleccion", SeleccionController)
