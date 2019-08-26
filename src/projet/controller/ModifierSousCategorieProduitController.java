/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projet.controller;

import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.controlsfx.control.Notifications;
import projet.models.CategorieProduit;
import projet.models.SousCategorieProduit;
import projet.service.CategorieProduitService;
import projet.service.SousCategorieProduitService;

/**
 * FXML Controller class
 *
 * @author yassine
 */
public class ModifierSousCategorieProduitController implements Initializable {

    @FXML
    private JFXTextField libelle;
    @FXML
    private Label errorsLibelle;
    @FXML
    private JFXComboBox<String> categorie;
    @FXML
    private Label errorsCategorie;
    
    private SousCategorieProduit sousCategorieProduit;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        CategorieProduitService categorieproduitservice = new CategorieProduitService();
        HashMap<String,Integer> mapCategorie = categorieproduitservice.getAllCategorie();
      
        for (String s : mapCategorie.keySet()) {
          categorie.getItems().add(s);
        }
    }    

    @FXML
    private void closeDialog(MouseEvent event) {
        Button btn = (Button) event.getSource();
        Stage stage =  (Stage) btn.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void modifierSousCategorie(MouseEvent event) {
       
        if(libelle.getText().equals("")){
            errorsLibelle.setText("Libelle field is required");
        }
        else  if(categorie.getValue()==null){
            errorsCategorie.setText("Category field is required");
        }
        
     else {
            String lib = libelle.getText();
   
            Timestamp date = new Timestamp(System.currentTimeMillis());

            CategorieProduitService cp = new CategorieProduitService();
            HashMap<String,Integer> mapCategorie = cp.getAllCategorie();
            int id_Categorie = mapCategorie.get(categorie.getValue());

            
            SousCategorieProduit souscategorie = new SousCategorieProduit(sousCategorieProduit.getId(),id_Categorie,lib,date);
     
            SousCategorieProduitService service = new SousCategorieProduitService();
            
            if(service.modifierSousCategorie(souscategorie)){
                
                closeDialog(event);
                ObservableList observableList = FXCollections.observableArrayList( service.listSousCateogries());
                GestionSousCategorieController gestion = new GestionSousCategorieController();
                
                gestion.observableList.clear();
                gestion.observableList.addAll(observableList);
                ImageView image = new ImageView("projet/images/success.png");
                image.setFitWidth(70);
                image.setFitHeight(70);
                Notifications notification = Notifications.create()
                        .title("Success")
                        .text("Modifier avec succès")
                        .graphic(image)
                        .hideAfter(Duration.seconds(5))
                        .position(Pos.TOP_RIGHT);
                notification.show();
            }
             
    }
    
    }
    
    public void setData(SousCategorieProduit souscategorie) throws FileNotFoundException {
        
        FileInputStream imageStream;
        Image image;
        
        this.sousCategorieProduit = souscategorie;
        
        CategorieProduitService categorieproduitservice = new CategorieProduitService();

        CategorieProduit cp = categorieproduitservice.getCategorie(souscategorie.getCategorie_id());
      
        categorie.setValue(cp.getLibelle());
 
        libelle.setText(souscategorie.getLibelle());
      
    }

   @FXML
    private void libelleEvent(KeyEvent event) {
         errorsLibelle.setText("");      
       
    }

    @FXML
    private void CategorieEvent(ActionEvent event) {
         errorsCategorie.setText("");      
    }
}
