#  == Synopsis
#
# Simple citation model
#
#  == Author
#
#  Liam Magee
#
#  == Copyright
#
#  Copyright (c) 2008, Liam Magee.
#  Licensed under the same terms as Ruby - see http://www.ruby-lang.org/en/LICENSE.txt.
#
#

module CSL

  # ---------- Classes -----------


  # Defines the Citation class
  class Citation

    def self.transform_variable(var)
      tvar = var.gsub(/-/, '_')
      if Citeproc::VARIABLES.include?(var)
        tvar
      elsif Citeproc::DATE_TOKENS.include?(var)
        var =~ /date/ ? tvar : "date_#{tvar}"
      else
        # just give the variable back unmodified
        tvar
      end
    end

    Citeproc::VARIABLES.each do |var|
      attr_accessor transform_variable(var).to_sym
    end

    Citeproc::DATE_TOKENS.each do |var|
      attr_accessor transform_variable(var).to_sym
    end

    attr_accessor :type

    def initialize
      @contributors = []
    end

    def method_missing(name, *args)
      case name.to_s
      when "locator"
        return resolve_locator
      else
        ""
      end
    end

    def authors=(authors)
      add_contributors(authors, "author")
    end

    def authors
      contributors("author")
    end

    def editors=(editors)
      add_contributors(editors, "editor")
    end

    def editors
      contributors("editor")
    end

    def translators=(translators)
      add_contributors(translators, "translator")
    end

    def translators
      translators("translator")
    end

    def contributors(role = nil, sort_key = nil)
      results = @contributors.collect{|c| c if c.role and c.role == role }.compact
      if sort_key
        if sort_key == "first"
          results.sort!{ |a, b| a.given_name <=> b.given_name }
        else
          results.sort!{ |a, b| a.name <=> b.name }
        end
      end
      results
    end

    def add_contributor_name(name, role = "author")
      c = ContributingAgent.new
      c.name = name
      c.role = role
      add_contributor(c)
    end

    def add_contributor(contributor)
      @contributors << contributor if contributor.is_a?(ContributingAgent)
    end

    def add_contributors(contribs, role = "author")
      contribs.each do |contrib|  
        c = ContributingAgent.new
        c.role = role
        contrib.each do |key, value|
          c.send("#{key}=", value)
        end
        @contributors << c
      end
    end

    def resolve_locator
      result = nil
      result ||= self.issue
      result ||= self.volume
      result ||= self.url
      result
    end
  end

  # Defines the Citation class
  class ContributingAgent
    attr_accessor :name, :role

    def initialize(role = "author", name = nil)
      @role = role
      @name = name
    end

    def given_name
      o = name =~ /,/ ? {:index => 1} : {:index => 0}
      get_name(name, o)
    end

    def family_name
      o = name =~ /,/ ? {:index => 0} : {:index => -1}
      get_name(name, o)
    end

  private
    def get_name(name, o = {})
      o = {:split_char => (name =~ /,/ ? ', ' : ' ')}.merge(o)
      name.split(o[:split_char])[o[:index]] || ''
    end
  end

end
