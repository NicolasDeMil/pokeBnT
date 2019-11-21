class PokemonsController < ApplicationController

  def index
    if params[:query].present?
      @pokemons = policy_scope(Pokemon).global_search(params[:query])
    else
      @pokemons = policy_scope(Pokemon).paginate(page: params[:page]).per_page(8)
    end

    # if params[:query].present?
    #   @pokemons = Pokemon.all.search_attributes_all(params[:query])
    # else
    #   @pokemons = Pokemon.all.paginate(page: params[:page]).per_page(8)
    # end
    authorize @pokemons
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end
end
