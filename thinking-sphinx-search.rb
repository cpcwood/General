b = Listing.search(
  :conditions => {:author_id => a.id},
  :populate => true,
  :group_by => :listing_shape_id,
  :max_matches => 1000,
  :page => 1, 
  :per_page => 20,
)


b.each_with_group{|list, group|
  ap list
  ap group
}


# search for listings by author, with specific listing_shape_id

listings = Listing.search(
  :conditions => {:author_id => a.id},
  :with => {:listing_shape_id => [6,7]},
  :populate => true,
  :per_page => 2
)

listings = Listing.search(
  :conditions => {:author_id => a.id},
  :with => {:listing_shape_id => [6]},
  :per_page => 2
).search(
  :conditions => {:author_id => a.id},
  :with => {:listing_shape_id => [7]},
  :per_page => 2
)

listings_by_shape = listings.each_with_object({}) do |item, hash|
  listing_shape = ListingShape.find_by(id: item.listing_shape_id)
  if hash[listing_shape]
    hash[listing_shape].push(item)
  else
    hash[listing_shape] = [item]
  end
end


listings = Listing.search(:conditions => {:author_id => a.id},
  :select => '*, listing_shape_id',
  :with   => {:listing_shape_id => 7}
)





def listings_per_shape
  include_closed = current_user == person && params[:show_closed]
  search_params = {
    author_id: person.id,
    include_closed: include_closed,
    page: 1,
    per_page: 6,
    open: !include_closed
  }
  ap search_params
  listing_shapes = ListingShape.where(deleted: false)
  @listings_by_shape = listing_shapes.each_with_object({}) do |shape, hash|
    search_params[:listing_shape_ids] = [shape.id]
    hash[shape] = listings_search(search_params)
  end
end



INCLUDE_MAP = {
  listing_images: :listing_images,
  author: :author,
  num_of_reviews: {author: :received_testimonials},
  location: :location
}

includes = [:author, :listing_images]

search_params = {
  author_id: 'HyAFZO0xSFpAwICKhNCQQA',
  include_closed: true,
  page: 1,
  per_page: 6,
  listing_shape_ids: [7]
}

DatabaseSearchHelper.fetch_from_db(community_id: @current_community, search: search_params, included_models: includes, includes: includes)

ListingIndexService::Search::DatabaseSearchHelper.fetch_from_db(community_id: 1, search: search_params, included_models: includes, includes: includes)



def search_listings_by_shape(search)
  includes = [:author, :listing_images]
  where_opts = HashUtils.compact(
    {
      community_id: community.id,
      author_id: search[:author_id],
      deleted: 0,
      listing_shape_id: search[:listing_shape_id]
    })

  scope = Listing
  scope = scope.currently_open unless search[:include_closed]
  listings = scope.where(where_opts)
               .includes(includes)
               .order("listings.sort_date DESC")
               .paginate(per_page: search[:per_page], page: search[:page])
end

a = Person.where(id: 'HyAFZO0xSFpAwICKhNCQQA').first


# with conditions and shape and open

listings = Listing.search(
  :conditions => {:author_id => a.id},
  :with => {:listing_shape_id => [7], open: [0,1]},
  :populate => true
)

listings = Listing.search(
  :conditions => {:author_id => ''},
  :with => {:listing_shape_id => [6], open: [0,1]},
  :populate => true
)

listings = Listing.search(
  :conditions => {:author_id => ''},
  :with => {:listing_shape_id => [6], open: [0]},
  :populate => true
)