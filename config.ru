require './config/environment'

use Rack::MethodOverride ###medium
run ApplicationController
use LocationsController
use ProductsController
use UsersController
