The-Break-Down
-----------------------------------

Move_Tutorials
--------------------------------
belongs_to :category  
belongs_to :user  
has_many :comments  
has_many :users, through: :comments  

name:string  
difficulty:string  
learn_time:string  
description:text  
user:belongs_to  
category:belongs_to 


move_tutorials notes
------------------------------
-index of all move tutorials, seperated by categories?  
-will have a youtube tutorial video visible  
-desciption is a step by step guide  
-move history?  
-difficulty(beginner, intermediate, advance)  
-learn_time will display average time on learning move(ex. 2 months - 1 year)  
-description length minimum is ?  
-difficulty validates with beginner, intermediate or advance  
-new page will display a collection_select for categories or option to create a new one  
-comments will be displayed on show page 
-will display user who created tutorial and also there style  
-validate name uniqueness? collection_select if want to create another tutorial for an existing move

Users
---------------------------

has_many :comments  
has_many :move_tutorials  
has_many: :move_tutorials, through: :comments  
has_many :categories, through :move_tutorials  

username:string  
email:string  
password_digest:string  
style:string  

notes for user
--------------------------
-signup  
-login/logout  
-sessions enabled  
-user and email is unique  
-password length minimum is 6  
-style will be displayed on your show page  

Categories
---------------------------
has_many :move_tutorials  

 type:string  

notes for categories
------------------------
-type is unique  
-type examples(toprocks, footword, power, flips)  
-index page for categories showing links to move_tutorials show  

Comments
--------------------------
belongs_to :user  
belongs_to :move_tutorials  

title:string  
content:text  
rating:integer  
user:belongs_to  
move_tutorials:belongs_to  

notes for comments
--------------
-rating is an integer that can only use 1-5  
-collection_select for ratings  

Project Requirements
----------------------------

OmniAuth 

Class level methods 
-user.most_categories, route user/most_categories  
-move_tutories.most_categories route move_tutorials/most_categories  
-move_tutorials.most_comments  
-move_tutorials.most_difficulty  

nested resource users/1/move_tutorials  
nested resource categories/1/move_tutorials  
nested resource categories/1/move_tutorials/new  

display error messages for all models  

DRY  
-limited logic in controllers  
-seperations of concerns  
-views use paritals if needed  
-views use helpers if needed  

Bootstrap for styling  

Read-Me  
https://dev.to/scottydocs/how-to-write-a-kickass-readme-5af9

Create wireframing  

navbar  
home, about, signup, login(if logged out), logout(if logged in), move_tutorials, categories

----------------------------------------

User Story
-----------------------
/home  
-as a guest  
-get a brief summary on the TheBreakDown.com  
-so i can see if its beneficial for me  

/about  
-as a guest or a user  
-i can view indepth information on thebreakdown.com  


/signup  
-as a guest  
-i can signup  
-so i can create move_tutorials  

/login  
-as a user  
-i can login  
-access to move_tutorials  

/logout  
-as a user  
-i can logout of thebreakdown.com  

/profile/:id  
-as a user  
-i can view my profile  
-i can view all my move tutorials  
-i can view move_tutorials i commented on  
-other users can view my profile if logged in  
-i should be able to haves links to edit or delete profile

/move_tutorials/new && categories/:id/move_tutorials/new  
-as a user  
-i can create a new move_tutorial from form provided  
-i can choose a category from drop down select box or create a new category if not provided  
-move_tutorial and category has to be only created here for association purposes  

/move_tutorials && users/:id/move_tutorials && categories/:id/move_tutorials  
-as a guest  
-i can view all links to move_tutorials  
-but i cant view move_tutorial show page unless logged in  
-as a user  
-i can view all move_tutorials  
-i can click on links and be redirected to move_tutorials show page  
-i can click on a link taking me to create my own move_tutorial  
--show nested view mulitple move tutorials with who created it  



/move_tutorials/:id  
-as a user  
-i can view all attributes asscoiated with move_tutorials  
-i can comment on move_tutorials  
-i can view all users who commented  

/categories  
-as a guest  
-i can view all links to move_tutorials  
-but i cant view move_tutorial show page unless logged in  
-as a user  
-i can view all categories  
-i can click on links and be redirected to categories show page  

/categories/:id  
-as a guest  
-i can view all move_tutorials associated with :id  
-as a user  
-i can view all links to move_tutorials  
-i can be redirected to move_tutorial show page when click on link  




    def create
        
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to profile_path(@user)
         
        else 
            flash[:errors] = @user.errors.full_messages
            render :new
        end


    end

1  <% if !!flash[:errors] %>
2  <% flash[:errors].each do |e| %>
3    <p><%= e %></p> <br>
4    <% end %>
5  <% end %>
 
 #code to create category in movetutorial/new
  <div>
      <%= f.fields_for :category do |m| %>
          <%= m.text_field :name %>
      <datalist id="category_name">
          <% Category.all.each do |c| %>
         <option value = "<%= c.name %>"  ></option>
          <% end %>
      </datalist>
      <br>
      <% end %>
  </div>




