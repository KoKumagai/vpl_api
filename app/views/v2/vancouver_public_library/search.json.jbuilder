json.status @contents['status']
if @contents['status'] == 'OK'
  json.info @contents['info'] do |content|
    json.title content['title']
    json.author content['author']
    json.format content['format']
    json.callNumber content['callNumber']
    json.availability content['availability']
  end
end
