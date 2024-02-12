class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })


    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
  
  def update
    # Get the id params out of the hash
    the_id = params.fetch("path_id")
    # Look up existing records
    matching_records= Actor.where(id: the_id)
    @an_actor = matching_records.at(0)

    # Overwrite each column with user inputs
    @an_actor.name = params.fetch("the_name")
    @an_actor.dob = params.fetch("the_date")
    @an_actor.bio = params.fetch("the_bio")
    @an_actor.image = params.fetch("the_image")

    # save 
    @an_actor.save

    # Redirect to actors index page (list of actors)
    redirect_to("/actors")
  end

end
