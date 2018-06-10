class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    comment = @article.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to user_article_path(@article)
    else
      redirect_to user_article_path(@article)
    end
  end

  private

  def comment_params

    params.require(:comment).permit(:body)
  end
end
