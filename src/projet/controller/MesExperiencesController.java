/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projet.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.control.Dialog;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.StageStyle;
import projet.models.Experience;
import projet.service.ExperienceService;

/**
 * FXML Controller class
 *
 * @author houba
 */
public class MesExperiencesController implements Initializable {

    @FXML
    private BorderPane borderpane;
    @FXML
    private VBox home;

    int id = WorldfriendshipController.recupererUtilisateurConnecte.getId_Utilisateur();

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        afficher();

    }

    private void afficher() {

        ExperienceService experienceService = new ExperienceService();
        ArrayList<Experience> arrayList = experienceService.MesExperiences(id);
        int i = 0;
        HBox hbox = new HBox();
        for (Experience exp : arrayList) {

            try {
                if (i % 1 == 0) {
                    hbox = new HBox();
                    hbox.getStyleClass().add("row");
                    home.getChildren().add(hbox);
                }
                Image image = new Image(new FileInputStream("C:\\xampp\\htdocs\\worldfriendship\\web\\assets\\img\\experience\\" + exp.getImage_exp()));
                ImageView img = new ImageView(image);
                img.setFitWidth(250);
                img.setFitHeight(125);
                Label label = new Label(exp.getNom());
                Label label2 = new Label(exp.getLieu());
                
                Button deleteButton = new Button("Supprimer");
                deleteButton.setOnAction(event -> {
                    experienceService.supprimer(exp.getId());
                });

                HBox detail = new HBox(label, label2);
                detail.getStyleClass().add("detail_btn");
                         
                VBox vb = new VBox(img, detail);
                
                HBox suppBox = new HBox(deleteButton);
                suppBox.getStyleClass().add("supp_Box");
                
                Button btn = new Button("", vb);
                btn.setOnAction(event -> {
                    detailExperience(exp);
                });
                hbox.getChildren().add(btn);
                hbox.getChildren().add(suppBox);
                i++;
            } catch (FileNotFoundException ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void detailExperience(Experience exp) {
        try {

            FXMLLoader Loader = new FXMLLoader();
            Loader.setLocation(getClass().getResource("/projet/presentation/DetailExperiencee.fxml"));
            Parent p = Loader.load();

            DetailExperienceeController display = Loader.getController();
            display.setExperience(exp);

            Dialog dialog = new Dialog();
            dialog.getDialogPane().setContent(p);
            dialog.initStyle(StageStyle.UNDECORATED);
            dialog.show();
        } catch (IOException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void loadUI(String ui) {
        Parent root = null;
        try {
            root = FXMLLoader.load(getClass().getResource("/projet/presentation/" + ui + ".fxml"));
        } catch (IOException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
        borderpane.setCenter(root);
    }

    private void ajouterExp(MouseEvent event) {
        loadUI("AjouterExperience");
    }


}
