module Response
  def json_response(object, status = :ok)
    render json: {success: true, data: object}, status: status
  end

  def json_response_pagination object, page, per_page, total_pages, total_entries
    render json: {
      success: true,
      "#{object.keys[0]}": object[object.keys[0]],
      pagination: {
        page: page.to_i,
        per_page: per_page,
        total_pages: total_pages,
        total_objects: total_entries
      }
    }
  end

  def json_pagination object, page, per_page, total_pages, total_entries
    {
      "#{object.keys[0]}": object[object.keys[0]],
      pagination: {
        page: page.to_i,
        per_page: per_page,
        total_pages: total_pages,
        total_objects: total_entries
      }
    }
  end
end
