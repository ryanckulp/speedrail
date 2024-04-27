# frozen_string_literal: true

module SeedSupport
  class Rewardful
    class << self
      # Rewardful JS snippets (optional customer referral program)
      # save $$ by registering with link: https://www.rewardful.com/?via=speedrail
      def run
        st = ScriptTag.find_by("code ILIKE ?", '%rewardful%') || ScriptTag.new
        st.update(name: 'Rewardful', enabled:, code:) unless st.persisted?
      end

      def code
        "<script>(function(w,r){w._rwq=r;w[r]=w[r]||function(){(w[r].q=w[r].q||[]).push(arguments)}})(window,'rewardful');</script>
        <script async src='https://r.wdfl.co/rw.js' data-rewardful='YOUR-API-KEY'></script>"
      end

      def enabled
        false
      end
    end
  end
end
