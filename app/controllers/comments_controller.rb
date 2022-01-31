class CommentsController < ApplicationController
  def create
    #Comments need to be linked to an Article, so get the ID
    @article = Article.find(params[:article_id])
    #Create a comment linked to the Article
    @comment = @article.comments.create(comment_params)
    #Reload the Article to display the new comment
    redirect_to article_path(@article)
  end

  #Strong params for security
  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
