require './config/environment'

use Rack::MethodOverride
use LocationsController
use ProductsController
use UsersController
run ApplicationController