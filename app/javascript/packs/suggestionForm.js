const algoliasearch = require('algoliasearch');
const autocomplete = require('autocomplete.js');
const algolia_application_id = 'E9YV946T42';
const algolia_search_only_api_key = 'b0d29c1cdc21cfbfe79c2e5c788b1337';

const client = algoliasearch(algolia_application_id, algolia_search_only_api_key);
const index = client.initIndex('Trash');
autocomplete('#query', {hint: false}, [
  {
    source: autocomplete.sources.hits(index, {hitsPerPage: 5}),
    displayKey: function (suggestion) {
      return suggestion.name
    },
    templates: {
      suggestion: function (suggestion) {
        return `${suggestion._highlightResult.name.value} / ${suggestion._highlightResult.name_furi.value}`;
      },
      empty: '検索キーワードを見直してください'
    }
  }
]).on('autocomplete:selected', function (event, suggestion, dataset, context) {
  console.log(event, suggestion, dataset, context);
  if (context.selectionMethod === 'click') {
    window.location.assign(`/?query=${suggestion.name}`);
    return;
  }
});
