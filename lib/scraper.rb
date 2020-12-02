require 'nokogiri'
require 'open-uri'
require 'pry'


require_relative './course.rb'


class Scraper
  	
  def print_courses
    self.make_courses	
    Course.all.each do |course|	

      end
    end
  end	


  def get_page

    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text.strip
      course.schedule = post.css(".date").text.strip
      course.description = post.css("p").text.strip
    end
  end

end


Scraper.new.print_courses