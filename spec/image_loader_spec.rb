require File.expand_path("../../image_loader.rb", __FILE__)
require 'spec_helper'
require 'fakefs/spec_helpers'

describe ImageLoader do
  before :each do
    FakeFS.activate!
    FileUtils.mkdir_p(ImageLoader::IMAGES_PATH)
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'e.jpg')
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'g.jpg')
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'f.jpg')
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'd.jpg')
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'c.jpg')
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'a.jpg')
    FileUtils.touch(ImageLoader::IMAGES_PATH + 'b.jpg')
  end

  after :each do
    FakeFS.deactivate!
  end

  context 'variables passed in' do
    it 'chooses default values when no values are passed in' do
      @loader = ImageLoader.new('', '', '')
      expect(@loader.method).to eq ImageLoader::DEFAULT_METHOD
      expect(@loader.sort).to eq ImageLoader::DEFAULT_SORT
      expect(@loader.stretch).to eq ImageLoader::DEFAULT_STRETCH
    end

    it 'chooses default values when invalid values are passed in' do
      @loader = ImageLoader.new('badvalue1', 'badvalue2', 'badvalue3')
      expect(@loader.method).to eq ImageLoader::DEFAULT_METHOD
      expect(@loader.sort).to eq ImageLoader::DEFAULT_SORT
      expect(@loader.stretch).to eq ImageLoader::DEFAULT_STRETCH
    end
  end

  context 'ascending order' do
    it 'sorts by name' do
      @loader = ImageLoader.new('name', 'asc', '')
      expect(@loader.load.map{|x| File.basename(x)}).to eq([
        'a.jpg',
        'b.jpg',
        'c.jpg',
        'd.jpg',
        'e.jpg',
        'f.jpg',
        'g.jpg'
      ])
    end

    it 'sorts by created timestamp' do
      @loader = ImageLoader.new('created', 'asc', '')
      expect(@loader.load.map{|x| File.basename(x)}).to eq([
        'e.jpg',
        'g.jpg',
        'f.jpg',
        'd.jpg',
        'c.jpg',
        'a.jpg',
        'b.jpg'
      ])
    end
  end

  context 'descending order' do
    it 'sorts by name' do
      @loader = ImageLoader.new('name', 'desc', '')
      expect(@loader.load.map{|x| File.basename(x)}).to eq([
        'g.jpg',
        'f.jpg',
        'e.jpg',
        'd.jpg',
        'c.jpg',
        'b.jpg',
        'a.jpg'
      ])
    end

    it 'sorts by created timestamp' do
      @loader = ImageLoader.new('created', 'desc', '')
      expect(@loader.load.map{|x| File.basename(x)}).to eq([
        'b.jpg',
        'a.jpg',
        'c.jpg',
        'd.jpg',
        'f.jpg',
        'g.jpg',
        'e.jpg'
      ])
    end
  end
end
