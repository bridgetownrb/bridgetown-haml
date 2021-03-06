# bridgetown-haml

A Bridgetown plugin to provide support for [Haml templates](http://haml.info/).

_Requires Bridgetown 0.18 or greater._

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-haml -g bridgetown_plugins
```

## Usage

Simply name your page, layout, or partial with a `.haml` extension. The available features will be fairly analogous to [the ERB support](https://www.bridgetownrb.com/docs/erb-and-beyond#haml-and-slim) in Bridgetown, including support for helpers, partials, and rendering Liquid components. You can even [embed Markdown and other template languages](https://github.com/haml/haml/blob/master/REFERENCE.md#filters-filters) using standard Haml syntax.

You can also add `template_engine: haml` to your file's front matter and use any extension you want. For example, you could add `data.xml` to your source folder and simply make sure the front matter contains `template_engine: haml`.

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/bridgetownrb/bridgetown-haml/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
