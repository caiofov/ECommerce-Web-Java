-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projetopw` DEFAULT CHARACTER SET utf8 ;
USE `projetopw` ;

-- -----------------------------------------------------
-- Table `projetopw`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `login` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `dataNascimento` DATE NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`TelefoneCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`TelefoneCliente` (
  `idTelefoneCliente` INT NOT NULL,
  `ddd` INT NOT NULL,
  `numero` INT NOT NULL,
  `principal` TINYINT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefoneCliente`),
  INDEX `fk_TelefoneCliente_Cliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_TelefoneCliente_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `projetopw`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`EnderecoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`EnderecoCliente` (
  `idEnderecoCliente` INT NOT NULL,
  `endereco` VARCHAR(50) NOT NULL,
  `complemento` VARCHAR(50) NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `uf` VARCHAR(50) NOT NULL,
  `cep` INT NOT NULL,
  `principal` TINYINT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idEnderecoCliente`),
  INDEX `fk_TelefoneCliente_Cliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_TelefoneCliente_Cliente0`
    FOREIGN KEY (`idCliente`)
    REFERENCES `projetopw`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`Pedido` (
  `idPedido` INT NOT NULL,
  `dataCompra` DATETIME NOT NULL,
  `qtdeTotal` INT NOT NULL,
  `valorTotal` FLOAT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `projetopw`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`Admnistrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `login` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `dataNascimento` DATE NULL,
  `cargo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`Produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  `valor` FLOAT NOT NULL,
  `qtdeEstoque` INT NOT NULL,
  `idCategoria` INT NOT NULL,
  `idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_Categoria1_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Produto_Funcionario1_idx` (`idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `projetopw`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Funcionario1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `projetopw`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetopw`.`Produto_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopw`.`Produto_Pedido` (
  `idProduto_Pedido` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `idProduto` INT NOT NULL,
  PRIMARY KEY (`idProduto_Pedido`),
  INDEX `fk_Produto_Pedido_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_Pedido_Produto1_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Pedido_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `projetopw`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Pedido_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `projetopw`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
