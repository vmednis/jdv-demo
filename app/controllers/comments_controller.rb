class CommentsController < ApplicationController
  def index
    comments = Array.new

    Comment.all.sort_by{|comment| comment.created_at}.each do |comment|
      comments << {
        id: comment.id,
        author: comment.author,
        content: comment.content
      }
    end

    render json: { success: true, comments: comments}, status: 200
  end

  def show
    comment = Comment.find params.require :id

    render json: {
      success: true, 
      comment: {
        id: comment.id,
        author: comment.author,
        content: comment.content
        }
      },
      status: 200
  rescue
    render json: { success: false }, status: 500
  end

  def create
    comment = Comment.new params.permit :author, :content
    comment.save!
    render json: { success: true }, status: 201
  rescue
    render json: { success: false }, status: 500
  end

  def update
    comment = Comment.find params.require :id
    comment.update_attributes params.permit :author, :content
    render json: { success: true }, status: 200
  rescue
    render json: { success: false }, status: 500
  end

  def delete
    comment = Comment.find params.require :id
    comment.delete
    render json: { success: true }, status: 200
  rescue
    render json: { success: false }, status: 500
  end

end
