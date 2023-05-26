# README

## AnimalsController/SightingsController
- before_action: sets the instance variable before the others are executed
    - sets @animal instance before the show, update, and destroy are executed
    - set_animal method finds the corresponding animal record based on its id
    - setting this in advance avoids repeating the same code in multiple actions
    - directly uses @animal instance var instead of repeating Animal.find(params[:id]) when using show, update, destroy
- rendering
    - unprocessable_entity: convention used to rep a validation error; indicates server understands the request but can't process it due to the client's error
- animal params
    - .permit specifies parameters allowed to be mass-assigned
- private
    - defines what's accessible within the current class and not from outside
    - private defines set_sighting and sighting_params to hbe used internally within the controller, but not accessible as controller actions

## Database
- associations
    - wolf = Animal.find_or_create_by(common_name: "Wolf")
    - wolf_sighting = wolf.sightings.create(latitude: 12.345,longitude: 67.905,date: "2022-12-15")