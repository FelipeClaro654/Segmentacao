class AddEstadoRefToHistoricoSegmentacao < ActiveRecord::Migration[5.0]
  def change
    add_reference :historico_segmentacaos, :estado, foreign_key: true
  end
end
