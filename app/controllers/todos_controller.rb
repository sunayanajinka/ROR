class TodosController < ApplicationController
    before_action :set_todo, only: [:edit, :update, :show, :destroy]
    
    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new (todo_param)
        if @todo.save
            flash[:notice] = "todo has successfully created"
            redirect_to todo_path(@todo)
        else
            render 'new'
        end
    end

    def todo_param
        params.require(:todo).permit(:name,:description)
    end

    def show
       # @todo = Todo.find(params[:id])
    end

    def index
        @todos = Todo.all
    end

    def edit
       # @todo = Todo.find(params[:id])
    end

    def update
       # @todo = Todo.find(params[:id]) #gets the old values in that ID
        
        if @todo.update(todo_param)
            flash[:notice] = "todo has updated successfully"
            redirect_to todo_path(@todo)
        else
            render 'edit'
        end
    end

    def destroy
       # @todo = Todo.find(params[:id]) #gets the old values in that ID
        @todo.destroy
        flash[:notice] = "todo has deleted successfully"
        redirect_to todos_path    
    end

    def set_todo
        @todo = Todo.find(params[:id])
    end


end