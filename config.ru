require './config/environment'

use Rack::MethodOverride
run ApplicationController
use LocationsController
use ProductsController
use UsersController
