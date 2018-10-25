class PostController < Sinatra::Base

  configure:development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }

  # find out what a $ means in ruby

  $posts = [
    {
      id: 0,
      title: "Auli'i Cravalho - How Far I'll Go",
      body: "Moana finds herself drawn to the ocean despite the protests of her father and makes the decision to run away.",
      src: "https://www.fillmurray.com/500/400",
      embed_code: "cPAbx5kgCJo"
    },
    {
      id: 1,
      title: "Dwayne Johnson - You're Welcome",
      body: "Moana finds herself stranded on an island, only to discover it is the location of Mauri. ",
      src: "https://www.fillmurray.com/500/300",
      embed_code: "79DijItQXMM"
    },
    {
        id: 2,
        title: "",
        body: "Pommy ipsum rather air one's dirty linen mush scatterbrained bloody mary jammy git ask your mother if, pulled a right corker mush I could reet fancy a it's cracking flags Sonic Screwdriver we'll be 'avin less of that bit of a Jack the lad. Daft cow marvelous wind up and a tad and well fit, odds and sods get away with ya cottage pie nosh by 'eck love, god save the queen teacakes completely starkers off t'pub ey up. ",
        src: "https://www.fillmurray.com/500/360",
        embed_code: "93lrosBEW-Q"
    },
    {
      id: 3,
      title: "Video 4",
      body: " Yorkshire pudding it's the bees knees bit of alright brainbox hard cheese old boy sweets guinness, two weeks on't trot for sooth well fit a cracking apple and pears rambunctious, put me soaps back on done up like a kipper biscuits a reet bobbydazzler crisps. A comely wench every fortnight a tad I bid you good day chav old chap a week on Sunday, chippy bit of a Jack the lad you mean it ain't me noggin' doolally.",
      src: "https://www.fillmurray.com/500/300",
      embed_code: "HEiSF8HpyDg"
    },
    {
      id: 4,
      title: "Video 5",
      body: " Yorkshire pudding it's the bees knees bit of alright brainbox hard cheese old boy sweets guinness, two weeks on't trot for sooth well fit a cracking apple and pears rambunctious, put me soaps back on done up like a kipper biscuits a reet bobbydazzler crisps. A comely wench every fortnight a tad I bid you good day chav old chap a week on Sunday, chippy bit of a Jack the lad you mean it ain't me noggin' doolally.",
      src: "https://www.fillmurray.com/500/300",
      embed_code: "pLw2EfOmE7Y"
    }
  ]

  #Static route - doesn't change
  get "/" do
    @title_for_the_page = "Blog Post"
    @posts = $posts
    erb :'posts/index'
  end

  get "/new" do
    "<h1>Hello new page!</h1>"
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end

  #Dynamic route (:sometext)
  get "/:id_from_URL" do
    id = params[:id_from_URL] #B E A Utiful (:id goes from line above to here, which in turn becomes the id on the left.)
    @post = $posts[id.to_i]
    erb :"posts/show"
  end

  post '/:id/edit' do
    @result = params['orig']
    erb :"posts/edit"
  end
end
