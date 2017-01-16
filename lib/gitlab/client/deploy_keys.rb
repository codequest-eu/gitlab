class Gitlab::Client
  module DeployKeys
    def list_deploy_keys(project)
      get("/projects/#{project}/deploy_keys", query: options)
    end

    def create_deploy_key(project, title:, key:, readonly: true)
      body = { title: title, key: key, can_push: !readonly }
      post("/projects/#{project}/deploy_keys", body: body)
    end

    def delete_deploy_key(project, key_id)
      delete("/projects/#{project}/deploy_keys/#{key_id}")
    end
  end # module DeployKeys
end # class Gitlab::Client
