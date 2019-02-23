AlgoliaSearch.configuration = {
    application_id: ENV['ALGOLIA_APPLICATION_ID'],
    api_key: ENV['ALGOLIA_ADMIN_API_KEY'],
    connect_timeout: 2,
    receive_timeout: 30,
    send_timeout: 30,
    batch_timeout: 120,
    search_timeout: 5,
    pagination_backend: :kaminari
}
