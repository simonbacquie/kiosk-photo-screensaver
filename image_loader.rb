class ImageLoader

  IMAGES_PATH = File.dirname(__FILE__) + '/public/img/'
  DEFAULT_METHOD  = 'by_name'
  DEFAULT_SORT    = 'asc'
  DEFAULT_STRETCH = 'fit'

  attr_accessor :method, :sort, :stretch

  def initialize(mode, sort, stretch)
    if respond_to?("by_#{mode}")
      @method = "by_#{mode}"
    else
      # default
      @method = DEFAULT_METHOD
    end

    if ['asc', 'desc'].include?(sort.downcase)
      @sort = sort.downcase
    else
      @sort = DEFAULT_SORT
    end

    if ['fill', 'fit'].include?(stretch.downcase)
      @stretch = stretch.downcase
    else
      @stretch = DEFAULT_STRETCH
    end
  end

  def by_name
    files = Dir["#{IMAGES_PATH}*"].sort.map{|x| '/img/' + File.basename(x) }
    files.reverse! if @sort == 'desc'
    files
  end

  def by_created
    files = Dir["#{IMAGES_PATH}*"].sort_by{ |f| File.mtime(f) }.map{|x| '/img/' + File.basename(x) }
    files.reverse! if @sort == 'desc'
    files
  end

  def by_random
    files = Dir["#{IMAGES_PATH}*"].sort.map{|x| '/img/' + File.basename(x) }.shuffle
  end

  def load
    send(@method)
  end

end
