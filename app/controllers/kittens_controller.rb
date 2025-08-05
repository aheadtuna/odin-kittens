class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: "Succesfully created #{@kitten.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice]  = "Sucessfully (and with grief) deleted #{@kitten.name}"
    redirect_to kittens_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def index
    @kittens = Kitten.all
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Updated #{@kitten.name} succesfully"
    else
      render :new, :unprocessable_entity
    end
  end

  private

  def kitten_params
    params.expect(kitten: [ :name, :age, :cuteness, :softness ])
  end
end
